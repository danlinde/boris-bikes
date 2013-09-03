Boris Bikes

Excercise to practive OOP.

Here's a quick recap of the Boris Bikes system

- People can rent and return bikes (from bike stations) 
---> one station (done)
---> Add a second station
- Bikes don't have to be dropped off at the same station as they were rented from
---> dropped off at station rented from (done)
---> dropped off at a different station
- Bikes can be broken
---> broken state (done)
- Broken bikes cannot be rented
---> 
- Vans pick up broken bikes from stations
---> 
- Vans drop off broken bikes to garages
--->
- Garages repair broken bikes
--->
- Vans can pick up repaired bikes
--->
- Repaired bikes are taken back to stations
---> for now lets do back to original station
---> then we need to figure a more efficient solution
- Stations have a maximum number of bikes they can hold
---> max is going to include broken bikes awaiting fix
---> if garage says unrepairable bike gets removed from station 
-----> bike gets updated