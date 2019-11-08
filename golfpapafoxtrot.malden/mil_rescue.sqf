private _centerWorld = _this select 0;
//private _NameCity = nearestLocations [_centerWorld, ["NameCity"], 10000];
//private _NameCityCapital = nearestLocations [_centerWorld, ["NameCityCapital"], 10000];
//private _NameVillage = nearestLocations [_centerWorld, ["NameVillage"], 10000];
private _NameLocal = nearestLocations [_centerWorld, ["NameLocal"], 10000];
private _allpos = _NameLocal;

private _EastTroopModels = ["O_SoldierU_SL_F","O_soldierU_repair_F","O_soldierU_medic_F",
                            "O_sniper_F","O_Soldier_A_F","O_Soldier_AA_F","O_Soldier_AAA_F",
					        "O_Soldier_AAR_F","O_Soldier_AAT_F","O_Soldier_AR_F","O_Soldier_AT_F",
					        "O_soldier_exp_F","O_Soldier_F","O_engineer_F","O_engineer_U_F",
					        "O_medic_F","O_recon_exp_F","O_recon_F","O_recon_JTAC_F",
					        "O_recon_LAT_F","O_recon_M_F","O_recon_medic_F","O_recon_TL_F"];
					
private _WestTroopModels = ["B_sniper_F","B_Soldier_A_F","B_Soldier_AA_F","B_Soldier_AAA_F",
                            "B_Soldier_AAR_F","B_Soldier_AAT_F","B_Soldier_AR_F","B_Soldier_AT_F",
					        "B_soldier_exp_F","B_Soldier_F","B_engineer_F","B_medic_F","B_recon_exp_F",
					        "B_recon_F","B_recon_JTAC_F","B_recon_LAT_F","B_recon_M_F","B_recon_medic_F","B_recon_TL_F"];
					
private _ResTroopModels = ["I_G_Soldier_TL_F","I_G_Soldier_SL_F","I_G_Soldier_A_F","I_G_Soldier_AR_F",
                           "I_G_medic_F","I_G_engineer_F","I_G_Soldier_exp_F","I_G_Soldier_GL_F","I_G_Soldier_M_F",
                           "I_G_officer_F","I_G_Soldier_F","I_G_Soldier_LAT_F","I_G_Soldier_lite_F","I_G_Sharpshooter_F"];




private _side = selectRandom [west,east,resistance];

_places = [];
{_nl = locationPosition _x;_places = _places + [_nl];} Foreach _allpos;

private _timeout = 60*30;
private _pos = [(selectRandom _places),10,300, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
private _troops = [];
private _target = GetMarkerPos "respawn_civilian";

if (_side == west) Then {
 _troops = _WestTroopModels;
 _target = GetMarkerPos "respawn_west";
};

if (_side == east) Then {
 _troops = _EastTroopModels;
 _target = GetMarkerPos "respawn_east";
};

if (_side == resistance) Then {
 _troops = _ResTroopModels;
 _target = GetMarkerPos "respawn_guerrila";
};

Sleep 60;
_evac = [[(SelectRandom _troops), (SelectRandom _troops), (SelectRandom _troops),(SelectRandom _troops),(SelectRandom _troops)],_side,_pos,_target,40,20] call GPF_fnc_rescueEvac;
//[_pos,(GetMarkerPos "respawn_civilian"),civilian,"B_Heli_Light_01_F",[40,41,42]] Call GPF_fnc_playerEvac;
[_evac,_target] Spawn {_evac = _this select 0; _target = _this select 1;
           
		   while {_cnt = count units _evac;_cnt > 0} Do {
            _firesmoke = false;
            {if ((_x distance _target) < 1000 ) Then {_firesmoke = true;};} Foreach units _evac;
            if (_firesmoke) Then { _Signal = 'SmokeShellPurple' createVehicle _target;};
            Sleep 10;
            };
		};



while {true} do {
  _pos = [(selectRandom _places),10,300, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
  _cnt = {alive _x} count units _evac;
  if (_cnt == 0) Then {
		_side = selectRandom [west,east,resistance];
        if (_side == west) Then {
         _troops = _WestTroopModels;
         _target = GetMarkerPos "respawn_west";
        };
        
        if (_side == east) Then {
         _troops = _EastTroopModels;
         _target = GetMarkerPos "respawn_east";
        };
        
        if (_side == resistance) Then {
         _troops = _ResTroopModels;
         _target = GetMarkerPos "respawn_guerrila";
        };
         	   
	   
	   
        _evac = [[(SelectRandom _troops), (SelectRandom _troops), (SelectRandom _troops),(SelectRandom _troops),(SelectRandom _troops)],_side,_pos,_target,40,20] call GPF_fnc_rescueEvac;
		//[_pos,(GetMarkerPos "respawn_civilian"),civilian,"B_Heli_Light_01_F",[40,41,42]] Call GPF_fnc_playerEvac;
		[_evac,_target] Spawn {_evac = _this select 0;_target = _this select 1;

		   while {_cnt = {alive _x} count units _evac;_cnt > 0} Do {
            _firesmoke = false;
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