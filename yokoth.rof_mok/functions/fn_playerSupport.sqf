// [player,'B_Heli_Transport_01_camo_F','O_soldier_PG_F'] Call GPF_fnc_playerSupport;
private ["_player"];
_player = param[0];
_HeliModel = param[1];
_Model = param[2];

_Side = side _player;
_DropPos = GetPos _player;
_heloSpawn = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_Group = group _player;
{ deleteVehicle _x } forEach units _Group;
_DropHeliSpawn = [_heloSpawn,900,1000, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
_DropHeli = [_DropHeliSpawn, 0, _HeliModel, _Side] call bis_fnc_spawnvehicle;
_DropHeliV = _DropHeli select 0;
_DropHeliGroup = group _DropHeliV;
_DropTroopsGroup = [_DropHeliSpawn, _Side,_Model] call BIS_fnc_spawnGroup;
{_x moveInCargo _DropHeliV;[_x] join _Group;} Foreach units _DropTroopsGroup;
_DropHeliV flyInHeight 100;
_DropHeliV limitSpeed 100;

_way1 = _DropHeliGroup addWaypoint [_DropPos, 0];
_way1 setWaypointType "MOVE";
_way1 setWaypointBehaviour "CARELESS";
_way1 setWaypointCombatMode "GREEN";
_way1 setWaypointSpeed "FULL";
_way1 setWaypointCompletionRadius 1;
_way1 setWaypointTimeout [8, 9, 10];
//_way1 setWaypointStatements ["true","_veh = vehicle this;_veh limitSpeed 900; _list = (crew _veh) select {(assignedVehicleRole _x) select 0 isEqualTo 'cargo'};{unassignVehicle _x; _x action ['GetOut', vehicle _x];} forEach _list;"];
_way1 setWaypointStatements ["true","_veh = vehicle this;_list = (crew _veh) select {(assignedVehicleRole _x) select 0 isEqualTo 'cargo'};{doGetOut _x;} forEach _list;"];


_way2Pos = [_DropPos,2000,2500, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
_way2 = _DropHeliGroup addWaypoint [_way2Pos, 0];
_way2 setWaypointType "MOVE";
_way2 setWaypointBehaviour "CARELESS";
_way2 setWaypointCombatMode "GREEN";
_way2 setWaypointSpeed "FULL";
_way2 setWaypointCompletionRadius 1000;
_way2 setWaypointStatements ["true", "_veh = vehicle this; _grp = group this;{deleteVehicle _x;} forEach units _grp; deleteVehicle _veh;"];