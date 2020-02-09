_SidePos = _this select 0;

_WestLightVeh = ["B_Heli_Light_01_F"/*,"B_Heli_Transport_01_F","B_Heli_Transport_03_F"*/];
_EastLightVeh = ["B_Heli_Light_01_F" /*"O_Heli_Transport_04_bench_F"*/];
_ResLightVeh = ["B_Heli_Light_01_F"/*"I_Heli_light_03_unarmed_F"*/];
_vehs = [];


_CivLightVeh = ["I_Heli_light_03_dynamicLoadout_F"];
				 
_Models = [_WestLightVeh,_EastLightVeh,_ResLightVeh,_CivLightVeh];		 
_Timeout = 600;
//_txt = FORMAT ["%1",_SidePos];
//hint _txt;
			 
[_SidePos,_Models,_Timeout] Spawn { 
 _SidePos = _this Select 0;
 _Models = _this Select 1;
 _Timeout = _this select 2;
 while {true} Do { 
    _vehs = [10,(_Models Select 0),(_SidePos Select 0),200,_Timeout-1 ] Call GPF_fnc_EmptyVehicles;{clearWeaponCargoGlobal _x;clearMagazineCargoGlobal _x;_x setObjectTextureGlobal [0, "images\bluec1.jpg"];} forEach _vehs;
	_vehs = [10,(_Models Select 1),(_SidePos Select 1),200,_Timeout-1 ] Call GPF_fnc_EmptyVehicles;{clearWeaponCargoGlobal _x;clearMagazineCargoGlobal _x;_x setObjectTextureGlobal [0, "images\redc.jpg"];} forEach _vehs;
	_vehs = [10,(_Models Select 2),(_SidePos Select 2),200,_Timeout-1 ] Call GPF_fnc_EmptyVehicles;{clearWeaponCargoGlobal _x;clearMagazineCargoGlobal _x;_x setObjectTextureGlobal [0, "images\greenc1.jpg"];} forEach _vehs;
	//[10,(_Models Select 3),(_SidePos Select 3),100,_Timeout-1 ] Call GPF_fnc_EmptyVehicles;
 Sleep _Timeout;};
};



{clearWeaponCargoGlobal _x;} forEach _vehs; {clearMagazineCargoGlobal _x;} forEach _vehs;
