private _sourceObject = param[0];
private _Dist = param[1];
private _Incr = param[2];
private _FullRound = param[3];
private _Side = param[4];
private _Model = param[5];
private _Count = 0;
private _units = [];

while {_Count < _FullRound} Do {
 _WaveVehGroup = createGroup [_Side, false];
 _pos = [_sourceObject, _Dist, _Count] call BIS_fnc_relPos;
 _unit = [_pos, 0, (selectRandom _Model), _WaveVehGroup] call bis_fnc_spawnvehicle;
 _unit = _unit Select 0;
 _way1 = _WaveVehGroup addWaypoint [GetPos _sourceObject, 0];
 _way1 setWaypointType "MOVE";
 _way1 setWaypointBehaviour "COMBAT";
 _way1 setWaypointCombatMode "RED";
 _way1 setWaypointSpeed "FULL";
 _way1 setWaypointCompletionRadius 50;
 _way1 setWaypointStatements ["true", "_veh = Vehicle this; {deleteVehicle _x;} ForEach crew _veh; deleteVehicle _veh;"];
 _Count = _Count+_Incr;
 _units = _units + [_unit];
 sleep 1;
 
};
_units;