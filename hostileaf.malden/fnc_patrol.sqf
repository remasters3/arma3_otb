_positions = _this Select 0;
_SpawnPos = _this Select 1;
_Side = _this Select 2;
_Model = _this Select 3;
_Wait = _this Select 4;

_PatrolCar = [_SpawnPos, 0, _Model, _Side] call bis_fnc_spawnvehicle; 
_PatrolCarV = _PatrolCar select 0;
_PatrolCarGroup = group _PatrolCarV;
 while {SPAWNPATROL && true} do {
  {
   way = _PatrolCarGroup addWaypoint [_x, 0];
   way setWaypointType "MOVE";
   way setWaypointBehaviour "COMBAT";
   way setWaypointCombatMode "RED";
   way setWaypointSpeed "LIMITED";
   Sleep _Wait;
    } foreach _positions;
};
_crew = crew _PatrolCarV; 
{deleteVehicle _x;} foreach _crew;
deleteVehicle _PatrolCarV;
