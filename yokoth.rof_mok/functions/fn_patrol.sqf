// [(GetPos Player),50,90,360,west,"C_Offroad_02_unarmed_F",10] Call GPF_fnc_patrol;

 private ["_Count"];
_sourcePos = param[0];
_Dist = param[1];
_Incr = param[2];
_FullRound = param[3];
_Side = param[4];
_Model = param[5];
_Timeout = param[6];

_Count = 0;
_Safepos = [_sourcePos,10,200, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
_PatrolCar = [_Safepos, 0, _Model, _Side] call bis_fnc_spawnvehicle; 
_PatrolCarV = _PatrolCar select 0;
_PatrolCarGroup = group _PatrolCarV;
_crew = crew _PatrolCarV;

while {_Count < _FullRound} Do {
 
 _ppos = [_PatrolCarV, _Dist, _Count] call BIS_fnc_relPos;
 _Safepos = [_ppos,10,100, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
 _way1 = _PatrolCarGroup addWaypoint [_Safepos, 0];
 _way1 setWaypointType "MOVE";
 _way1 setWaypointBehaviour "COMBAT";
 _way1 setWaypointCombatMode "RED";
 _way1 setWaypointSpeed "NORMAL";
 _way1 setWaypointCompletionRadius 50;
 _Count = _Count+_Incr;
};

_Safepos = [_sourcePos,10,100, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
_way2 = _PatrolCarGroup addWaypoint [_sourcePos, 0];
_way2 setWaypointType "MOVE";
_way2 setWaypointBehaviour "COMBAT";
_way2 setWaypointCombatMode "RED";
_way2 setWaypointSpeed "NORMAL";
_way2 setWaypointCompletionRadius 50;
_way2 setWaypointStatements ["true", "_veh = Vehicle this; {deleteVehicle _x;} ForEach crew _veh; deleteVehicle _veh;"];

[_PatrolCarV,_Timeout,_crew] Spawn {
    _PatrolCarV = _this Select 0; 
	_Timeout = _this select 1; 
	_crew = _this select 2;
    Sleep _Timeout; 
    {deleteVehicle _x;} foreach _crew;
	{deleteVehicle _x;} forEach allDeadMen;
	{deleteVehicle _x;} forEach allDead;
    If ((count (crew _PatrolCarV)) == 0) Then {deleteVehicle _PatrolCarV;};
};
_PatrolCarGroup 