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
 
_Timeout = 600;
//_txt = FORMAT ["%1",_SidePos];
//hint _txt;

		 
[_SidePos,_Models,_Timeout] Spawn { 
 _SidePos = _this Select 0;
 _Models = _this Select 1;
 _Timeout = _this select 2;
 while {true} Do { 
    [10,(_Models Select 0),(_SidePos Select 0),200,_Timeout-1 ] Call GPF_fnc_EmptyVehicles;
	[10,(_Models Select 1),(_SidePos Select 1),200,_Timeout-1 ] Call GPF_fnc_EmptyVehicles;
	[10,(_Models Select 2),(_SidePos Select 2),200,_Timeout-1 ] Call GPF_fnc_EmptyVehicles;
	
	//Blue AirCraft Carrier
	[(getposASL plane_blue_00),(getDir plane_blue_00),"B_Plane_CAS_01_dynamicLoadout_F",10] call GPF_fnc_SpawnVehicle;
	
	//Red AirCraft Carrier
	[(getposASL plane_red_00),(getDir plane_red_00),"O_Plane_CAS_02_dynamicLoadout_F",10] call GPF_fnc_SpawnVehicle;
	
	//Green AirCraft Carrier
	[(getposASL plane_green_00),(getDir plane_green_00),"I_Plane_Fighter_03_dynamicLoadout_F",10] call GPF_fnc_SpawnVehicle;
	
	//[10,(_Models Select 3),(_SidePos Select 3),100,_Timeout-1 ] Call GPF_fnc_EmptyVehicles;
 Sleep _Timeout;};
};