_EvacPos = _this Select 0;
_TargetPos = _this Select 1;
_Side = _this Select 2;
_Model = _this Select 3;
_Wait = _this Select 4;

_EvacHeliSpawn = [_EvacPos,1000,1100, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
_EvacHeli = [_EvacHeliSpawn, 0, _Model, _Side] call bis_fnc_spawnvehicle;
_EvacHeliV = _EvacHeli select 0;
_EvacHeliGroup = group _EvacHeliV;
_HeliPadE = "Land_HelipadEmpty_F" createVehicle _EvacPos;
_HeliPadT = "Land_HelipadEmpty_F" createVehicle _TargetPos;
_Signal = "SmokeShellPurple" createVehicle _EvacPos;

_way1 = _EvacHeliGroup addWaypoint [_EvacPos, 0];
_way1 setWaypointType "TR UNLOAD";
_way1 setWaypointBehaviour "CARELESS";
_way1 setWaypointCombatMode "GREEN";
_way1 setWaypointSpeed "FULL";
_way1 setWaypointCompletionRadius 1;
_way1 setWaypointTimeout _Wait;

_way2 = _EvacHeliGroup addWaypoint [_TargetPos, 0];
_way2 setWaypointType "TR UNLOAD";
_way2 setWaypointBehaviour "CARELESS";
_way2 setWaypointCombatMode "GREEN";
_way2 setWaypointSpeed "FULL";
_way2 setWaypointCompletionRadius 1;

_way3Pos = [_TargetPos,3000,4000, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
_way3 = _EvacHeliGroup addWaypoint [_way3Pos, 0];
_way3 setWaypointType "MOVE";
_way3 setWaypointBehaviour "CARELESS";
_way3 setWaypointCombatMode "GREEN";
_way3 setWaypointSpeed "FULL";
_way3 setWaypointCompletionRadius 10;
_way3 setWaypointTimeout _Wait;
_way3 setWaypointStatements ["true", "_veh = vehicle this; _veh SetDamage 1; _grp = group this;{deleteVehicle _x;} forEach units _grp"];

waitUntil {!alive _EvacHeliV};
{deleteVehicle _x;} forEach [_HeliPadE,_HeliPadT,_Signal];

// [(GetMarkerPos "Marker_06"),(GetMarkerPos "marker_05"),west,"B_Heli_Transport_01_camo_F",[30,31,32]] execVM "fnc_evac.sqf";
// [(GetPos player),(GetMarkerPos "marker_06"),west,"B_Heli_Transport_01_camo_F",[30,31,32]] execVM "fnc_evac.sqf";
