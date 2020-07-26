 private ["_Count"];
_SafePos = param[0];
_timeout = param[1];

private _Dist = 20;
private _Incr = 45;
private _FullRound = 360;
private _Count = 0;
private _towers = [];
private _sourceObject = createVehicle ["Land_Cargo_HQ_V3_F", _SafePos, [], 0, "FORM"];
private _towers = _towers + [_sourceObject];
while {_Count < _FullRound} Do {
 _pos = [_sourceObject, _Dist, _Count] call BIS_fnc_relPos;
 _posh = [_sourceObject, _Dist+5, _Count+20] call BIS_fnc_relPos;
 _dir = _Count;
 _tower = createVehicle ["Land_Cargo_Patrol_V3_F", _pos, [], 0, "FORM"]; _tower setDir _dir+180;
 _towers = _towers + [_tower];
 _hbar = createVehicle ["Land_HBarrierWall6_F", _posh, [], 0, "FORM"]; _hbar setDir _dir+35; _hbar SetPos _posh;
 _towers = _towers + [_hbar];
 _Count = _Count+_Incr;
};
if (_timeout > 0 ) Then {
                            hint Format ["%1",_timeout];
						    [_towers,_timeout] Spawn {_towers = _this select 0; _timeout = _this select 1;
						    Sleep _timeout;
						    {_towerpos = GetPos _x; _Signal = "SmokeShellOrange" createVehicle _towerpos;} Foreach _towers;
						    Sleep 30;
						    {deleteVehicle _x;} Foreach _towers;};				  
						 };               
_towers 