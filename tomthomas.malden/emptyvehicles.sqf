private _SidePos = _this select 0;

private _WestLightVeh = ["B_Heli_Light_01_F"/*,"B_Heli_Transport_01_F","B_Heli_Transport_03_F"*/];
private _EastLightVeh = ["B_Heli_Light_01_F" /*"O_Heli_Transport_04_bench_F"*/];
private _ResLightVeh = ["B_Heli_Light_01_F"/*"I_Heli_light_03_unarmed_F"*/];
private _globalheli = ["B_Heli_Light_01_F"/*,"B_Heli_Light_01_F","I_Heli_light_03_unarmed_F","O_Heli_Light_02_unarmed_F","I_Heli_Transport_02_F"*/];
private _vehs = [];
private _params = [
	[(_SidePos Select 0),"images\bc1.jpg"], 
	[(_SidePos Select 1),"images\rc1.jpg"], 
	[(_SidePos Select 2),"images\gc1.jpg"]    
];

_CivLightVeh = ["I_Heli_light_03_dynamicLoadout_F"];
				 
_Models = [_WestLightVeh,_EastLightVeh,_ResLightVeh,_CivLightVeh,_globalheli];		 
_Timeout = 10*60;
//_txt = FORMAT ["%1",_SidePos];
//hint _txt;
			 
[_params,_Timeout] Spawn { 
 private _params = _this Select 0;
 private _Timeout = _this select 1;
 private _models = ['B_Heli_Light_01_F','O_Heli_Light_02_unarmed_F','I_Heli_light_03_unarmed_F'];
 private _index = 0;
 private _div = 360/(count _models);
 while {true} Do {
 
 
	{
		private _fpos = _x select 0;
		private _txtr = _x select 1;
		private _index = 0;
		private _dir = 0;
		private _pCount = 0;
		private _rad = 20;
		private _OuterCentrePos = [];
		while {_pCount < 360} Do {
		private _apos = [_fpos, 20*2, _pCount] call BIS_fnc_relPos;
		private _dir = _pCount;
		_pCount = _pCount+_div;
		_aveh = [_apos,_dir,(_models select _index),_rad,_txtr] call GPF_fnc_SpawnVehicle;
		_index = _index+1;
		};

	} foreach _params;
	


 Sleep _Timeout;};
};

[_Timeout] Spawn {_Timeout = _this select 0;

 while {true} Do {
	{
	_veh = _x call GPF_fnc_SpawnVehicle;
	} forEach [
		[[814.195,12123,0],0,"B_Heli_Light_01_F",10,"images\cc.jpg"],
		[[781.714,12139.7,0],0,"C_Plane_Civil_01_racing_F",10],
		[[757.087,12141.1,0],0,"C_Plane_Civil_01_F",10],
		[[700.482,12169.2,0],0,"C_Plane_Civil_01_F",10],
		[[857.926,12130.7,0],0,"C_Heli_Light_01_civil_F",10],
		[[929.143,12151.3,0],0,"C_Heli_Light_01_civil_F",10]
	];
 Sleep _Timeout;};
};

//{clearWeaponCargoGlobal _x;} forEach _vehs; {clearMagazineCargoGlobal _x;} forEach _vehs;
