// _Barraks_00 = [_SpawnPos,_PatrolPos,_MinUnitsPerSide,_RespawnTime,_Side,_TroopModels,_Direction,_Timeout,_Blacklist,_BarraksType] Call GPF_fnc_barraks;
 private ["_SpawnPos","_PatrolPos","_MinUnitsPerSide","_RespawnTime","_UnitSide","_Model","_dir","_Timeout","_blackList","_Count","_units","_BarraksGroup"];
_SpawnPos  = param[0];
_PatrolPos = param[1];
_MinUnitsPerSide = param[2];
_RespawnTime = param[3];
_UnitSide = param[4];
_Model = param[5];
_dir = param[6];
_Timeout = param[7];
_blackList = param[8];
_BarraksType = param[9];
_Count = 0;
_units = [];

_SafePos = [_SpawnPos,20,300, 5, 1, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
_BarraksGroup = createGroup [_UnitSide, false];
_Barraks = createVehicle [_BarraksType, _SpawnPos, [], 0, "FORM"];
_unit = _BarraksGroup createUnit [(selectRandom _Model), _SafePos,[], 0,"FORM"];
// [_unit]execVM "gpf_zombieloot.sqf";
[_BarraksGroup, _PatrolPos, 50,_blacklist] call BIS_fnc_taskPatrol;

[_SpawnPos,_PatrolPos,_MinUnitsPerSide,_RespawnTime,_UnitSide,_Model,_dir,_Timeout,_blackList,_Count,_BarraksGroup,_Barraks] Spawn { 
        _SpawnPos = _this Select 0;
        _PatrolPos = _this Select 1;
		_MinUnitsPerSide = _this Select 2;
		_RespawnTime = _this Select 3;
		_UnitSide = _this Select 4;
		_Model = _this Select 5;
		_dir = _this Select 6;
		_Timeout = _this Select 7;
		_blackList = _this Select 8;
		_Count = _this Select 9;
		_BarraksGroup = _this Select 10;
		_Barraks = _this Select 11;
		_BarraksAlive = alive _Barraks;
							   
// while {_Count < _Timeout} do {
If (_Timeout > 0 ) Then {
	[_Barraks,_Timeout] Spawn {_Barraks = _this Select 0; _Timeout = _this Select 1;Sleep _Timeout; deleteVehicle _Barraks;};
};

_gpf_fn_PlayerCount = compile preprocessFile "gpf_fn_PlayerCount.sqf";
while {_BarraksAlive} do {
   _groupcount = {alive _x} count units _BarraksGroup;
   IF (_groupcount < _MinUnitsPerSide) THEN {
		_returned = [_SpawnPos,_dir] call _gpf_fn_PlayerCount;
		_PlayerCount = _returned select 0;
		_Players = _returned select 1;
		if (_PlayerCount > 0) Then {
		_player = selectRandom _Players;
	    _SafePos = [(GetPos _player),1,100, 5, 1, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
	    _unit = _BarraksGroup createUnit [(selectRandom _Model), _SafePos,[], 0,"FORM"];
	    // [_unit]execVM "gpf_zombieloot.sqf";
		};
	 };
   _Count = _Count+_RespawnTime;
   sleep _RespawnTime;  
   _returned = [_SpawnPos,_dir] call _gpf_fn_PlayerCount;
   _PlayerCount = _returned select 0;
   if ( _PlayerCount <= 0) Then {{deleteVehicle _x;} foreach units _BarraksGroup; deleteVehicle _Barraks;};
   _BarraksAlive = alive _Barraks;
  };
  {deleteVehicle _x;} foreach units _BarraksGroup; deleteVehicle _Barraks;
};
_output = [_BarraksGroup,_Barraks];
_output;