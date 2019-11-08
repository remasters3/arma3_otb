_SidePos = _this Select 0;

_EastLightVeh = [
               "O_G_Van_02_transport_F",
               "O_MRAP_02_F",
               "O_Heli_Transport_04_covered_F",
               "O_G_Offroad_01_F",
               "O_Heli_Light_02_unarmed_F",
               "O_LSV_02_unarmed_F",
               "O_G_Van_01_transport_F"
                ];
				 
_WestLightVeh = [
                 "B_Heli_Light_01_F",
                 "B_G_Offroad_01_F",
                 "B_LSV_01_unarmed_F",
                 "B_G_Van_01_transport_F",
                 "B_G_Van_02_transport_F",
                 "B_MRAP_01_F"
				 ];

_ResLightVeh = [
                "I_C_Offroad_02_unarmed_F",
                "I_G_Offroad_01_F",
                "I_MRAP_03_F",
                "I_G_Van_01_transport_F",
                "I_G_Van_02_transport_F",
                "I_Heli_light_03_unarmed_F"
				];


_CivLightVeh = [
                "O_Heli_Light_02_unarmed_F",
				"B_Heli_Light_01_F",
				"O_Heli_Transport_04_bench_F",
				"O_Heli_Transport_04_covered_F",
				"I_Heli_light_03_unarmed_F"
				];
				 
_Models = [_WestLightVeh,_EastLightVeh,_ResLightVeh,_CivLightVeh];		 
_Timeout = 600;
//_txt = FORMAT ["%1",_SidePos];
//hint _txt;
			 
[_SidePos,_Models,_Timeout] Spawn { 
 _SidePos = _this Select 0;
 _Models = _this Select 1;
 _Timeout = _this select 2;
 _rad = 100;
 while {true} Do { 
    [10,(_Models Select 0),(_SidePos Select 0),_rad,_Timeout-1 ] Call GPF_fnc_EmptyVehicles;
	[10,(_Models Select 1),(_SidePos Select 1),_rad,_Timeout-1 ] Call GPF_fnc_EmptyVehicles;
	[10,(_Models Select 2),(_SidePos Select 2),_rad,_Timeout-1 ] Call GPF_fnc_EmptyVehicles;
	[10,(_Models Select 3),(_SidePos Select 3),_rad,_Timeout-1 ] Call GPF_fnc_EmptyVehicles;
 Sleep _Timeout;};
};


