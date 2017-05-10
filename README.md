# Capture & Evolve
This mission is based on the player capturing zones.
## Compability
* Vanilla
* ACE3 + CBA
* TFAR
* NIArsenal


## Modules

### Guide
* A modules folder name begins with `smm_` and is lowercase without numbers
* Each module has a `init.sqf` which is called on mission start in [non-scheduled](https://community.bistudio.com/wiki/Code_Optimisation#Threads) environment
by the main `init.sqf`.
* Each module should have a `function` folder container a `modulename_functions.hpp`
* The `modulename_functions.hpp` needs to be included in the main `functions.hpp` in the following manner:
```
    class modulename{
		file = "smm_modulename\functions";
		#include "smm_modulename\functions\modulename_functions.hpp"
	};
```

### Summary
In here, each module has a short summary of how it works, and what it does.
This should be sorted in an alphabetic order.

#### smm_config
Responsible for setting all values that are used in the mission.
The most important ones are:

| Variable | Usage |
|----------|-------|
|`ai_infantry`| Specifies for each faction, which units should be spawned to defend the zone|
|`buy_units`| Array of `["vehicletype",price]` tuples specifying, which vehicles the user can buy|
|`rand_weapons`,`rand_backpacks`,...|Array of `["itemtype",price]` tuples which the user can buy |

#### smm_garbage_collector
Used for deleting vehicles and weapons, that were not used for some time.

#### smm_gear
Responsible for allowing the user to equip at the Virtual Arsenal and store gear over sessions.
 
#### smm_helpers
Several small usefull snippets.

#### smm_macros
Set of functions to get specific items from vanilla/mod configFiles.

#### smm_marker_tracker
Can track a vehicle/unit with a marker.

#### smm_medic
Used for dealing with different medic/revive systems.

#### smm_money
Responsible for handling players wallets.

#### smm_save
Minor framework for keeping the game state over a server restart.

#### smm_shop
Shop for buying vehicles and gear.

#### smm_spawner
Does all the zone generation, unit spawning and zone owner switching stuff.
Needs more documentation.
All zones are stored in `spawnLocs`. Be carefull using this variable.

#### smm_thermal_blocker
Disables thermal scopes in vehicles.

#### smm_tickets
Keeps track of how many tickets a team has left.

#### smm_time
Synchronizes time over players.