_SidePos = _this Select 0;

_EastLightVeh = ["O_MRAP_02_gmg_F",
                 "O_T_MRAP_02_gmg_ghex_F",
                 "O_MRAP_02_hmg_F",
                 "O_T_MRAP_02_hmg_ghex_F",
                 "O_G_Offroad_01_armed_F",
                 "O_LSV_02_armed_F"];
				 
_WestLightVeh = ["B_MRAP_01_gmg_F",
                 "B_T_MRAP_01_gmg_F",
                 "B_MRAP_01_hmg_F",
                 "B_T_MRAP_01_hmg_F",
                 "B_G_Offroad_01_armed_F",
                 "B_T_LSV_01_armed_F"];

_ResLightVeh = ["I_G_Offroad_01_armed_F",
                 "I_MRAP_03_hmg_F",
                 "I_MRAP_03_gmg_F",
                 "I_APC_Wheeled_03_cannon_F",
                 "B_G_Offroad_01_armed_F",
                 "B_T_LSV_01_armed_F"];


_CivLightVeh = ["C_Hatchback_01_F2",
                 "C_Hatchback_01_sport_F",
                 "C_Offroad_02_unarmed_F",
                 "C_Offroad_01_F",
                 "C_Quadbike_01_F",
                 "C_SUV_01_F",
                 "C_Van_02_transport_F",
                 "C_Truck_02_transport_F"];
				 
_Models = [_WestLightVeh,_EastLightVeh,_ResLightVeh,_CivLightVeh];
 
_Timeout = 10;
//_txt = FORMAT ["%1",_SidePos];
//hint _txt;

		 
[_SidePos,_Models,_Timeout] Spawn { 
 _SidePos = _this Select 0;
 _Models = _this Select 1;
 _Timeout = _this select 2;
 while {true} Do { 
    //[10,(_Models Select 0),(_SidePos Select 0),200,_Timeout-1 ] Call GPF_fnc_EmptyVehicles;
	//[10,(_Models Select 1),(_SidePos Select 1),200,_Timeout-1 ] Call GPF_fnc_EmptyVehicles;
	//[10,(_Models Select 2),(_SidePos Select 2),200,_Timeout-1 ] Call GPF_fnc_EmptyVehicles;
	
	//Blue AirCraft Carrier
	{
		private _ph = _x select 0;
		private _model = _x select 1;
		[(getposASL _ph),(getDir _ph),(selectRandom _model),20] call GPF_fnc_SpawnVehicle;
	} foreach[
	[plane_blue_00,["B_Plane_CAS_01_dynamicLoadout_F"]],
	[plane_blue_01,["B_Plane_Fighter_01_Stealth_F"]],
	[plane_blue_02,["B_Heli_Transport_01_F","B_Heli_Light_01_F"]],
	[plane_blue_03,["B_Heli_Attack_01_dynamicLoadout_F","B_Heli_Light_01_dynamicLoadout_F"]]
	];
	
	//Red AirCraft Carrier
			{
		private _ph = _x select 0;
		private _model = _x select 1;
		[(getposASL _ph),(getDir _ph),(selectRandom _model),10] call GPF_fnc_SpawnVehicle;
	} foreach[
	[plane_red_00,["O_Plane_Fighter_02_Stealth_F"]],
	[plane_red_01,["O_Plane_CAS_02_dynamicLoadout_F"]],
	[plane_red_02,["O_Heli_Attack_02_dynamicLoadout_F","O_Heli_Light_02_dynamicLoadout_F"]],
	[plane_red_03,["O_Heli_Transport_04_bench_F","O_Heli_Transport_04_covered_F","o_heli_light_02_unarmed_f"]]
	];
	
	//Green AirCraft Carrier
		{
		private _ph = _x select 0;
		private _model = _x select 1;
		[(getposASL _ph),(getDir _ph),(selectRandom _model),10] call GPF_fnc_SpawnVehicle;
	} foreach[
	[plane_green_00,["I_Plane_Fighter_04_F"]],
	[plane_green_01,["I_Plane_Fighter_03_dynamicLoadout_F"]],
	[plane_green_02,["I_Heli_light_03_unarmed_F"]],
	[plane_green_03,["I_Heli_light_03_dynamicLoadout_F"]]
	];
	
	{
		private _ms = _x select 0;
		private _cent = _x select 1;
		private _count = 0;
		private _div = 360/8; //count _ms;
		private _select = 0;
		private _pos = [];
		while {_count < 360} Do {
		_pos = [_cent, 50, _count] call BIS_fnc_relPos;
		private _tmp = createVehicle ["HeliHEmpty", _pos, [], 0, "FORM"];
		[(getposASL _tmp),_count,(selectrandom _ms),10] call GPF_fnc_SpawnVehicle;
		deleteVehicle _tmp;
		_count = _count+_div;
		_select = _select+1;
			
		}; 
	
	} foreach [[(_Models Select 0),(_SidePos Select 0)],[(_Models Select 1),(_SidePos Select 1)],[(_Models Select 2),(_SidePos Select 2)]];	

	
	
	
	//[10,(_Models Select 3),(_SidePos Select 3),100,_Timeout-1 ] Call GPF_fnc_EmptyVehicles;
 Sleep _Timeout;};
};


