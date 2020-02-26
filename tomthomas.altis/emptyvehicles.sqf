private _SidePos = _this select 0;
private _params = [
	[(_SidePos Select 0),"\a3\air_f\heli_light_01\data\skins\heli_light_01_ext_jeans_co.paa"], 
	[(_SidePos Select 1),"\a3\air_f\heli_light_01\data\skins\heli_light_01_ext_shadow_co.paa"], 
	[(_SidePos Select 2),"\a3\air_f\heli_light_01\data\skins\heli_light_01_ext_sheriff_co.paa"]    
];

_CivLightVeh = ["I_Heli_light_03_dynamicLoadout_F"];
				 	 
_Timeout = 10;
//_txt = FORMAT ["%1",_SidePos];
//hint _txt;
			 
[_params,_Timeout] Spawn { 
 private _params = _this Select 0;
 private _Timeout = _this select 1;
 private _models = ['B_Heli_Light_01_F','B_Heli_Light_01_dynamicLoadout_F','B_Heli_Light_01_F'];
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
		[[14768.3,16631.4,0],0,"B_Heli_Light_01_F",10,"images\cc1.jpg"],
		[[14715.6,16636.2,0],0,"C_Plane_Civil_01_racing_F",10],
		[[14747.4,16668,0],0,"C_Plane_Civil_01_F",10],
		[[14776.2,16694.6,0],0,"C_Plane_Civil_01_F",10],
		[[14807,16724.6,0],0,"C_Plane_Civil_01_racing_F",10],
		[[14636.4,16756.8,0],90,"C_Plane_Civil_01_racing_F",10],
		[[26742.1,24619.3,0],128,"B_Plane_CAS_01_dynamicLoadout_F",10],
		[[20798.7,7227.86,0],0,"O_Plane_CAS_02_dynamicLoadout_F",10],
		[[9193.1,21641.7,0],195,"I_Plane_Fighter_03_dynamicLoadout_F",10]
	];
 Sleep _Timeout;};
};

//{clearWeaponCargoGlobal _x;} forEach _vehs; {clearMagazineCargoGlobal _x;} forEach _vehs;
