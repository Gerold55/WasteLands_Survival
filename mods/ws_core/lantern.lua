-- default/lantern.lua

-- Function to create particles for the lantern
local function add_lantern_particles(pos)
    minetest.add_particlespawner({
        amount = 8,  -- Reduced number of particles
        time = 0.1,  -- Shorter particle lifetime
        minpos = {x=pos.x-0.5, y=pos.y+1.0, z=pos.z-0.5},
        maxpos = {x=pos.x+0.5, y=pos.y+1.5, z=pos.z+0.5},
        minvel = {x=0, y=0.05, z=0},
        maxvel = {x=0, y=0.1, z=0},
        minacc = {x=0, y=0, z=0},
        maxacc = {x=0, y=0, z=0},
        minexptime = 0.5,
        maxexptime = 1.0,
        minsize = 1,
        maxsize = 2,
        collisiondetection = false,
        texture = "ws_lantern.png",  -- Ensure this texture exists
    })
end

-- Light emission when carrying the torch
minetest.register_globalstep(function(dtime)
    for _, player in ipairs(minetest.get_connected_players()) do
        local wielded_item = player:get_wielded_item():get_name()
        if wielded_item == "ws_core:lantern" then
            local pos = player:get_pos()
            if pos then  -- Ensure pos is not nil
                -- Adjust particle position and properties
                minetest.add_particlespawner({
                    amount = 10,
                    time = 0.25,
                    minpos = {x=pos.x-0.5, y=pos.y+1.5, z=pos.z-0.5},
                    maxpos = {x=pos.x+0.5, y=pos.y+2, z=pos.z+0.5},
                    minvel = {x=0, y=0.1, z=0},
                    maxvel = {x=0, y=0.2, z=0},
                    minacc = {x=0, y=0, z=0},
                    maxacc = {x=0, y=0.01, z=0},
                    minexptime = 0.5,
                    maxexptime = 1.0,
                    minsize = 1,
                    maxsize = 2,
                    collisiondetection = false,
                    vertical = true,
                    texture = "ws_lantern.png",  -- Ensure this texture exists
                })
                -- Simulate light by setting a glowing node near the player
                -- Use a temporary light source node to simulate torch light without placing actual torches
                minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z}, {name="ws_core:temporary_light", param2=0})
            end
        end
    end
end)

-- Lantern node definition
minetest.register_node('ws_core:lantern', {
    description = 'Lantern',
    drawtype = 'nodebox',
    tiles = {
        {name="ws_lantern_top.png"},
        {name="ws_lantern_top.png"},
        {name="ws_lantern.png", animation={type='vertical_frames', aspect_w=16, aspect_h=16, length=3.0}},
        {name="ws_lantern.png", animation={type='vertical_frames', aspect_w=16, aspect_h=16, length=3.0}},
        {name="ws_lantern.png", animation={type='vertical_frames', aspect_w=16, aspect_h=16, length=3.0}},
        {name="ws_lantern.png", animation={type='vertical_frames', aspect_w=16, aspect_h=16, length=3.0}}
    },
    inventory_image = "ws_lantern_inv.png",
    groups = {cracky=2, oddly_breakable_by_hand=2},
    paramtype = 'light',
    light_source = 14,
    node_box = {
        type = "fixed",
        fixed = {
            {-0.1875, -0.5, -0.1875, 0.1875, -0.0625, 0.1875}, -- NodeBox1
            {-0.125, -0.0625, -0.125, 0.125, 0.0625, 0.125}, -- NodeBox2
        }
    },
    on_construct = function(pos)
        minetest.get_node_timer(pos):start(0.1)
    end,
    on_timer = function(pos, elapsed)
        add_lantern_particles(pos)
        return true
    end,
})

-- Crafting recipe for lantern
minetest.register_craft({
    output = "ws_core:lantern",
    recipe = {
        {"default:glass"},
        {"default:torch"},
        {"default:iron_ingot"}
    }
})

-- Fuel type for lantern
minetest.register_craft({
    type = "fuel",
    recipe = "ws_core:lantern",
    burntime = 10,
})

-- Lantern particle texture
minetest.register_lbm({
    name = "ws_core:lantern_particle_texture",
    nodenames = {"ws_core:lantern"},
    action = function(pos, node)
        minetest.add_particlespawner({
            amount = 8,
            time = 0.1,
            minpos = {x=pos.x-0.5, y=pos.y+1.0, z=pos.z-0.5},
            maxpos = {x=pos.x+0.5, y=pos.y+1.5, z=pos.z+0.5},
            minvel = {x=0, y=0.05, z=0},
            maxvel = {x=0, y=0.1, z=0},
            minacc = {x=0, y=0, z=0},
            maxacc = {x=0, y=0, z=0},
            minexptime = 0.5,
            maxexptime = 1.0,
            minsize = 1,
            maxsize = 2,
            collisiondetection = false,
            texture = "ws_lantern_flame.png",
        })
    end
})
