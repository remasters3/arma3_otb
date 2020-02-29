private _SidePos = _this select 0;
private _params = [
	[(_SidePos Select 0),"\a3\air_f\heli_light_01\data\skins\heli_light_01_ext_jeans_co.paa"], 
	[(_SidePos Select 1),"\a3\air_f\heli_light_01\data\skins\heli_light_01_ext_shadow_co.paa"], 
	[(_SidePos Select 2),"\a3\air_f\heli_light_01\data\skins\heli_light_01_ext_sheriff_co.paa"]    
];

_CivLightVeh = ["I_Heli_light_03_dynamicLoadout_F"];
				 	 
_Timeout = 60;
//_txt = FORMAT ["%1",_SidePos];
//hint _txt;
			 
[_params,_Timeout] Spawn { 
 private _params = _this Select 0;
 private _Timeout = _this select 1;
 private _models = ['B_Heli_Light_01_F','B_Heli_Light_01_dynamicLoadout_F','B_Heli_Light_01_F'];
 private _index = 0;
 private _div = 360/(count _models);
 private _allbfveh = [[[8038.26,10266,0.0514412],0.00597825,"B_T_VTOL_01_armed_F",10],[[8176.27,10327.7,-0.096283],0.0284146,"B_MBT_01_mlrs_F",10],[[8191.77,10272.2,-0.0830936],0.00212396,"B_MBT_01_arty_F",10],[[8016.34,10564.7,0.0411606],359.999,"B_Heli_Attack_01_dynamicLoadout_F",10],[[8064.72,10148.1,0],270.001,"B_Plane_Fighter_01_Stealth_F",10],[[8009.93,10624.2,0.0541077],0.00071029,"B_Heli_Transport_01_F",10],[[8062.66,10109,0],270.003,"B_Plane_Fighter_01_F",10],[[8062.82,10062.2,0],269.998,"B_Plane_CAS_01_dynamicLoadout_F",10],[[7963.75,10401.9,-0.0232811],267.643,"B_Truck_01_fuel_F",10],[[7966.94,10300.2,0.171928],267.967,"B_Truck_01_medical_F",10],[[7964.79,10353.7,0.141438],267.681,"B_Truck_01_Repair_F",10],[[8004.32,10684.7,-0.164192],0.00579833,"B_Heli_Transport_03_F",10],[[8244.1,10383.2,0.049078],254.254,"B_APC_Wheeled_01_cannon_F",10],[[8235.74,10413.6,-0.0151291],253.96,"B_APC_Tracked_01_CRV_F",10],[[8227.9,10343.7,-0.09515],254.214,"B_APC_Tracked_01_rcws_F",10],[[8181.62,10509.1,0.0121765],270.001,"B_AFV_Wheeled_01_cannon_F",10],[[8182.92,10489.1,0.0125961],269.999,"B_AFV_Wheeled_01_up_cannon_F",10],[[8184.52,10466.4,-0.0977402],270.001,"B_APC_Tracked_01_AA_F",10],[[8218.14,10374,-0.0947037],259.051,"B_MBT_01_cannon_F",10],[[8202.94,10408.1,-0.0890579],259.151,"B_MBT_01_TUSK_F",10],[[7968.38,10249.8,0.0366631],270.212,"B_Truck_01_ammo_F",10],[[8146.84,10263.3,0.0981407],270.007,"B_LSV_01_unarmed_F",10],[[8129.49,10289.1,0.0428429],269.743,"B_LSV_01_armed_F",10],[[8143.39,10313.3,0.0963783],270.252,"B_LSV_01_AT_F",10],[[8038.55,10312.9,0.00601006],0.00198751,"B_Heli_Light_01_F",10],[[8126.28,10335.7,0.219765],269.82,"B_MRAP_01_gmg_F",10],[[8141.86,10358.3,0.0867424],269.825,"B_MRAP_01_F",10],[[8037.85,10366.8,0.00519943],0.00141989,"B_Heli_Light_01_dynamicLoadout_F",10],[[8125.83,10380.5,0.0743713],269.908,"B_MRAP_01_hmg_F",10],[[8154.05,10454.5,0.0236511],353.077,"B_Truck_01_transport_F",10]];
 while {true} Do {
 
 
	{
		private _fpos = _x select 0;
		private _txtr = _x select 1;
		private _index = 0;
		private _dir = 0;
		private _pCount = 0;
		private _rad = 25;
		private _OuterCentrePos = [];
		while {_pCount < 360} Do {
		private _apos = [_fpos, 20*2, _pCount] call BIS_fnc_relPos;
		private _dir = _pCount;
		_pCount = _pCount+_div;
		_aveh = [_apos,_dir,(_models select _index),_rad,_txtr] call GPF_fnc_SpawnVehicle;
		_index = _index+1;
		};

	} foreach [];//_params;
	
	
	{_x call GPF_fnc_SpawnVehicle;} foreach _allbfveh;
	


 Sleep _Timeout;};
};

/*[_Timeout] Spawn {_Timeout = _this select 0;

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
};*/

//{clearWeaponCargoGlobal _x;} forEach _vehs; {clearMagazineCargoGlobal _x;} forEach _vehs;
