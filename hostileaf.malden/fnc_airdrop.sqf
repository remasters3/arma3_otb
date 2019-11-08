_DropPos = _this Select 0;
_HeliModel = _this Select 1;
_Side = _this Select 2;
_Model = _this Select 3;

_DropHeliSpawn = [_DropPos,900,1000, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
_DropHeli = [_DropHeliSpawn, 0, _HeliModel, _Side] call bis_fnc_spawnvehicle;
_DropHeliV = _DropHeli select 0;
_DropHeliGroup = group _DropHeliV;
_DropTroopsGroup = [_DropHeliSpawn, _Side,[_Model,_Model,_Model,_Model,_Model,_Model]] call BIS_fnc_spawnGroup;
[_DropTroopsGroup, _DropPos, 50,[]] call BIS_fnc_taskPatrol;
{_x moveInCargo _DropHeliV;} Foreach units _DropTroopsGroup;
_DropHeliV flyInHeight 100;

_way1 = _DropHeliGroup addWaypoint [_DropPos, 0];
_way1 setWaypointType "MOVE";
_way1 setWaypointBehaviour "CARELESS";
_way1 setWaypointCombatMode "GREEN";
_way1 setWaypointSpeed "FULL";
_way1 setWaypointCompletionRadius 100;
_way1 setWaypointStatements ["true","_veh = vehicle this;_list = (crew _veh) select {(assignedVehicleRole _x) select 0 isEqualTo 'cargo'};{unassignVehicle _x; _x action ['GetOut', vehicle _x]} forEach _list;"];

_way2Pos = [_DropPos,2000,2500, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
_way2 = _DropHeliGroup addWaypoint [_way2Pos, 0];
_way2 setWaypointType "MOVE";
_way2 setWaypointBehaviour "CARELESS";
_way2 setWaypointCombatMode "GREEN";
_way2 setWaypointSpeed "FULL";
_way2 setWaypointCompletionRadius 100;
_way2 setWaypointStatements ["true", "_veh = vehicle this; _veh SetDamage 1; _grp = group this;{deleteVehicle _x;} forEach units _grp"];