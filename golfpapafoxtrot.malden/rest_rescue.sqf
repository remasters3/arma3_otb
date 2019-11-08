private _centerWorld = _this select 0;
//private _NameCity = nearestLocations [_centerWorld, ["NameCity"], 10000];
//private _NameCityCapital = nearestLocations [_centerWorld, ["NameCityCapital"], 10000];
//private _NameVillage = nearestLocations [_centerWorld, ["NameVillage"], 10000];
private _NameLocal = nearestLocations [_centerWorld, ["NameLocal"], 10000];
private _allpos = _NameLocal;

_places = [];
{_nl = locationPosition _x;_places = _places + [_nl];} Foreach _allpos;

private _timeout = 60*30;
private _pos = [(selectRandom _places),10,200, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;

Sleep 60;
_evac = [["I_G_Soldier_TL_F","I_G_Soldier_SL_F","I_G_Soldier_A_F","I_G_Soldier_AR_F","I_G_medic_F"],resistance,_pos,(GetMarkerPos "respawn_guerrila"),40,20] call GPF_fnc_rescueEvac;
//[_pos,(GetMarkerPos "respawn_guerrila"),resistance,"B_Heli_Light_01_F",[40,41,42]] Call GPF_fnc_playerEvac;
[_evac] Spawn {_evac = _this select 0;
		   while {_cnt = count units _evac;_cnt > 0} Do {
            _firesmoke = false;
			_target = GetMarkerPos "respawn_guerrila";
            {if ((_x distance _target) < 1000 ) Then {_firesmoke = true;};} Foreach units _evac;
            if (_firesmoke) Then { _Signal = 'SmokeShellPurple' createVehicle _target;};
            Sleep 10;
            };
		};



while {true} do {
  _pos = [(selectRandom _places),10,200, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
  _cnt = {alive _x} count units _evac;
  if (_cnt == 0) Then {
        _evac = [["I_G_Soldier_TL_F","I_G_Soldier_SL_F","I_G_Soldier_A_F","I_G_Soldier_AR_F","I_G_medic_F"],resistance,_pos,(GetMarkerPos "respawn_guerrila"),40,20] call GPF_fnc_rescueEvac;
		//[_pos,(GetMarkerPos "respawn_guerrila"),resistance,"B_Heli_Light_01_F",[40,41,42]] Call GPF_fnc_playerEvac;
		[_evac] Spawn {_evac = _this select 0;
		   while {_cnt = {alive _x} count units _evac;_cnt > 0} Do {
            _firesmoke = false;
			_target = GetMarkerPos "respawn_guerrila";
            {if ((_x distance _target) < 1000 ) Then {_firesmoke = true;};} Foreach units _evac;
            if (_firesmoke) Then { _Signal = 'SmokeShellPurple' createVehicle _target;};
            Sleep 10;
            };
		};
        [_evac,_timeout]Spawn {
                                _evac = _this Select 0; 
        						_timeout = _this Select 1;
        						Sleep _timeout+60;
        						{deleteVehicle _x;} foreach units _evac;
        					  };
 };
 sleep 1;
};
