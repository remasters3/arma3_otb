// [_DropPos,_HeliModel,_Side,_Model,_timeout,_patrol] Call GPF_fnc_TroopDrop;
private ["_DropPos","_HeliModel","_Side","_Model","_DropHeliSpawn","_DropHeli","_DropHeliV","_DropHeliGroup","_DropTroopsGroup","_way1","_way2","_way2Pos","_models"];

_DropPos = param[0];
_HeliModel = param[1];
_Side = param[2];
_Model = param[3];
_Timeout = param[4];
_patrol = param[5];
_models = [(SelectRandom _Model),(SelectRandom _Model),(SelectRandom _Model),(SelectRandom _Model),(SelectRandom _Model),(SelectRandom _Model)];
_DropHeliSpawn = [_DropPos,900,1000, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
_DropHeli = [_DropHeliSpawn, 0, _HeliModel,_Side] call bis_fnc_spawnvehicle;
_DropHeliV = _DropHeli select 0;
_DropHeliGroup = group _DropHeliV;
_DropTroopsGroup = [_DropHeliSpawn, _Side,_models] call BIS_fnc_spawnGroup;
{removeBackpack _x;_x addBackpack "B_Parachute";} foreach units _DropTroopsGroup;

if (_patrol) then {[_DropTroopsGroup, _DropPos, 50,[]] call BIS_fnc_taskPatrol;} else {
  _way = _DropTroopsGroup addWaypoint [_DropPos, 0];
  _way setWaypointType "HOLD";
};
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

if (_Timeout > 0) Then {
   [_Timeout,_DropTroopsGroup,_DropHeliGroup,_DropHeliV]Spawn { _Timeout = _this select 0;_DropTroopsGroup = _this select 1;_DropHeliGroup = _this	select 2; _DropHeliV = _this select 3;
   Sleep _Timeout; 
   {deleteVehicle _x;}foreach units _DropTroopsGroup;
   {deleteVehicle _x;}foreach units _DropHeliGroup;
   deleteVehicle _DropHeliV;
   };
};
_DropTroopsGroup 