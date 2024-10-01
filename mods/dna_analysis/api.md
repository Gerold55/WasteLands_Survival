# how to load

```lua
local dnapi = dna_analysis.require("api")
```

# registration

## life forms

In order to make it possible for the player gain knowledge about a life form via DNA analysis
you first need to register the life form in the DNA analyis api.

```lua
dnapi.register_life_form("mymod:bunny", {
  description = "bunny",
})
```

Give an ID for the life form as first argument.
The ID has to follow the same naming conventions as items in minetest:  
the modname, followed by a `:`, followed by the item name  
Put a `:` at the start to indicate that you would like to override the conventions.  

The second argument is a table containing additional information about the life form.  
Keys used by the api:
* description
  * the displayed name of the life form
  * if it is not given it will default to "[unnamed life form]"

## DNA deposits

If a player wants to find out about a life form samples will have to be collected.  
They could be collected in varous ways.
Right now the api only provides filtering for the location that samples are taken from.  
To configure the amount of DNA/data from a certain life form the player can get from a sample you can register deposits.  

```lua
dnapi.register_dna_deposit({
  life_form = "mymod:blackbird",
  place_filter = {
    nodenames = {"default:leaves", "default:dirt_with_grass"}
  },
  average_amount = 2,
  amount_variance = 1,
  average_corruption = 0.5,
  corruption_variance = 0.5
})
```
If the player took a sample from leaves the extreme scenarios would look like this:  
best case: the player gets 3 units of DNA/data and 0 of them are corrupted  
worst case: the player gets 1 unit of DNA/data and 1 is corrupted

The deposit table has the following keys:
* life_form
  * the ID of a previously registered life form
  * the life form the DNA will provide information about
* place_filter
  * a filter that determines where the DNA can be found
  * this can be a string
    * to indicate that this deposit is only found on one single type of nodes
  * this can be a boolean
    * true to indicate that this deposit can be found in any sample
    * false to deactivate finding this deposit
  * this can be a function
    * the function will be taken as predicate of the deposit filter
    * more information below
  * this can be a table with one or more of the following keys
    * predicate
      * a function that gets the node name, position and node where the sample was found
      * it's return value should indicate whether or not the deposit can be found in the given location
    * everywhere
      * if this field is truthy the deposit is found in any sample
    * nodenames
      * a table containing the names of the nodes where the deposit can be found
      * it is recommended use the nodenames as keys and set the value to true
      * for programming convienience it is also possible to give the nodenames as keyless/normal list values
  * if the nodenames match and a predicate is given then both have to match
  * if everywhere is truthy no further checks will be run
  * the place_filter will be conventred to a table if it is registered with a different type
* average_amount
  * the amount of DNA/data a player gets on average
  * this also determines the time a player needs to analyse the sample
  * the DNA/data does not nessecarily have to be new to the player
* amount_variance
  * how much the amount can vary randomly, can be a floating point number
  * when set to 0 the amount will always be the average amount
  * when set to 2 the amount can increase by 2 or decrease by 2
  * if the amount of DNA/data drops below 0 it is adjusted to 0
  * the resulting amount of DNA/data can be a floating point number
* average_corruption
  * how much of the DNA/data will be useless after analysis
  * badly corrupted samples consume time to be analyzed but they barely provide information
* corruption_variance
  * the random variance for the corruption value
  * negative corruption is not adjusted by the api

## cloning recipes

If the player should be able to clone a life form
you have to register a cloning recipe.

```lua
dnapi.register_cloning_recipe({
  life_form = "mymod:bunny",
  needed_data_amount = 25,
  base_nutrients = "mymod:nutrient_solution 10",
  time = 100,
  result_item = "mymod:baby_bunny"
})
```

The cloning recipe table has the following keys:
* life_form
  * the ID of a previously registered life form
  * the life form that is created
* needed_data_amount
  * the amount of data about the life form needed to unlock the recipe
  * the (amount of) collected data won't be changed by the cloning process
* base_nutrients
  * a string, table or ItemStack specifying the nutrient stack needed to clone the life_form
  * will be converted to a table
* time
  * the amount of time needed to clone the life form
* result_item
  * a string, table or ItemStack specifying the spawn item the player gets from the cloning process
  * will be converted to an ItemStack
  * the spawn item should make it possible for the player to spawn the animal somewhere within the world
  * could be a spawn egg, an egg that needs to hatch, a baby creature, etc.

# getting data

## information about a life form

`dnapi.get_life_form_name(id)`
gets the display name of a registered life form

`registered_life_forms[id]`
gives acess to the raw registered data of the life_forms

## generating samples

`dnapi.get_dna_from(nodename,pos,node)`
returns a table that represents one taken sample from a certain position  
The function randomly generates samples from the deposits that can be found at the given location.  
The samples are then listed in the return table.  
The arguments are:
* nodename
  * the itemstring of the node that the sample was taken from
* pos
  * the position the sample was taken from
* node
  * the node found under the position the sample are taken from
The api only needs the nodename argument the others are just passed on to the predicates of the deposit registrations.

`dnapi.can_be_found(pf, nodename, pos, node)`
checks whether the given place_filter matches for the given location  
returns true, false or the return value of the predicate  
The first argument is the place_filter the others determine the location in the same way as the arguments for `dnapi.get_dna_from(nodename,pos,node)`

`dnapi.get_sample_from(deposit)`
generates one random sample from the given deposit
The sample table has the following keys:
* life_form
  * the life form the DNA will provide information about
* amount
  * the amount of DNA/data within this sample
  * it does not nessecarily have to be new to the player
* corruption
  * how much of the DNA/data will be useless after analysis

## cloning life forms

`dnapi.get_researched_recipes(life_form, data_amount)`
returns all cloning recipes that are available with the given amount of data

`dnapi.find_cheapest_possible_recipe(recipes, item_index)`
Finds a recipe from the list that can be made with the given items and needs the fewest of them.
If two recipes require the same amount of items the first one will be taken.
* recipes
  * a table containing the cloning recipes to choose from
* item_index
  * a table with the item names as key and the count as value
  * you can create such a table from an inventory list using the "count_index" function from the "invutil" module from the "modutil" mod

`registered_cloning_recipes[life_form]`
gives acess to the raw registered cloning recipes of the life_form
