// [_EvacPos,_TargetPos,_Side,_Model,_Wait] call GPF_fnc_LogiLoop;
private _EvacPos = _this Select 0;
private _TargetPos = _this Select 1;
private _Side = _this Select 2;
private _Model = _this Select 3;
private _Wait = _this Select 4;
private _smoke = 'SmokeShellPurple';
if (_Side == west) Then {_smoke = 'SmokeShellBlue';};
if (_Side == east) Then {_smoke = 'SmokeShellRed';};
if (_Side == resistance) Then {_smoke = 'SmokeShellGreen'};
if (_Side == civilian) Then {_smoke = 'SmokeShellPurple'};

_helodirs =[0,90,180,270];
_heloSpawn = [_EvacPos,1000,(selectRandom _helodirs)] call BIS_fnc_relPos;
_EvacHeliSpawn = [_EvacPos,1000,1100, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
_EvacHeli = [_heloSpawn, 0, _Model, _Side] call bis_fnc_spawnvehicle;
_EvacHeliV = _EvacHeli select 0;
_EvacHeliGroup = group _EvacHeliV;
// _HeliPadE = "Land_HelipadEmpty_F" createVehicle _EvacPos;
// _HeliPadT = "Land_HelipadEmpty_F" createVehicle _TargetPos;
_Signal = _smoke createVehicle _EvacPos;

_way1 = _EvacHeliGroup addWaypoint [_EvacPos, 0];
_way1 setWaypointType "TR UNLOAD";
_way1 setWaypointBehaviour "CARELESS";
_way1 setWaypointCombatMode "GREEN";
_way1 setWaypointSpeed "FULL";
_way1 setWaypointCompletionRadius 1;
_way1 setWaypointTimeout _Wait;
_way1 setWaypointStatements ["true", "_veh = vehicle this; [_veh] spawn {_veh = _this select 0; _veh setfuel 0; sleep 60;_veh setdamage 0;_veh setfuel 1;}"];

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
// _HeliPads = [_HeliPadE,_HeliPadT];
[_EvacHeliGroup] Spawn {_EvacHeliGroup = _this select 0;
	while {_cnt = count units _EvacHeliGroup;_cnt != 0} Do {Sleep 1;};
};