_SpawnPos = _this Select 0;
_PatrolPos = _this Select 1;
_MinUnitsPerSide = _this Select 2;
_RespawnTime = _this Select 3;
_UnitSide = _this Select 4;
_Model = _this Select 5;
_blackList = _this Select 6;
_dir = _this Select 7;

_BarraksGroup = createGroup [_UnitSide, false];
_Barraks = createVehicle ["Land_Cargo_HQ_V3_F", _SpawnPos, [], 0, "FORM"]; _Barraks setDir _dir;
_unit = _BarraksGroup createUnit [(selectRandom _Model), _SpawnPos,[], 0,"FORM"];
[_BarraksGroup, _PatrolPos, 50,_blacklist] call BIS_fnc_taskPatrol;

while {SPAWNBARRAKS && true} do {
   _groupcount = {alive _x} count units _BarraksGroup;
   IF (_groupcount < _MinUnitsPerSide) THEN {_unit = _BarraksGroup createUnit [(selectRandom _Model), _SpawnPos,[], 0,"FORM"];};
   sleep _RespawnTime;  
};
{deleteVehicle _x;} foreach units _BarraksGroup; deleteVehicle _Barraks;