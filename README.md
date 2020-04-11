# WasteLands Survival

## downloading
When cloning first add "--recursive" option to clone including all submodules:  
If you forget use the command below.
```
git clone --recursive https://github.com/Gerold55/WasteLands_Survival.git
```
The submodule folders will be empty if you don't.

If one of the submodule folders is empty use:
```
git submodule update --init
```
This will clone all missing submodules.

To pull all changes in the repo including changes in the submodules use:
```
git pull --recurse-submodules
```

If you develop on projects with submodules like wls
I recommend configuring your git to warn you if you have changes in submodules that are not on their remote.
```
git config --global push.recurseSubmodules check
```
