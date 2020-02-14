_SidePos = _this select 0;

_WestLightVeh = ["B_Heli_Light_01_F"/*,"B_Heli_Transport_01_F","B_Heli_Transport_03_F"*/];
_EastLightVeh = ["B_Heli_Light_01_F" /*"O_Heli_Transport_04_bench_F"*/];
_ResLightVeh = ["B_Heli_Light_01_F"/*"I_Heli_light_03_unarmed_F"*/];
_globalheli = ["B_Heli_Light_01_F"/*,"B_Heli_Light_01_F","I_Heli_light_03_unarmed_F","O_Heli_Light_02_unarmed_F","I_Heli_Transport_02_F"*/];
_vehs = [];
_params = [
	[(_SidePos Select 0),"images\bigblackblue.jpg"],
	[(_SidePos Select 1),"images\bigblackred.jpg"],
	[(_SidePos Select 2),"images\bigblackgreen.jpg"]
];

_CivLightVeh = ["I_Heli_light_03_dynamicLoadout_F"];
				 
_Models = [_WestLightVeh,_EastLightVeh,_ResLightVeh,_CivLightVeh,_globalheli];		 
_Timeout = 10*60;
//_txt = FORMAT ["%1",_SidePos];
//hint _txt;
			 
[_params,_Timeout] Spawn { 
 _params = _this Select 0;
 _Timeout = _this select 1;
 _model = 'B_Heli_Light_01_F';
 while {true} Do {
 
 
	{
		private _fpos = _x select 0;
		private _txtr = _x select 1;
		private _dir = 0;
		private _pCount = 0;
		private _rad = 20;
		private _OuterCentrePos = [];
		while {_pCount < 360} Do {
		private _pos = [_fpos, 20*2, _pCount] call BIS_fnc_relPos;
		private _dir = _pCount;
		_pCount = _pCount+45;
		_veh = [_pos,_dir,_model,_rad,_txtr] call GPF_fnc_SpawnVehicle;
		};

	} foreach _params;
	


 Sleep _Timeout;};
};



{clearWeaponCargoGlobal _x;} forEach _vehs; {clearMagazineCargoGlobal _x;} forEach _vehs;
