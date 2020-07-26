//_centerWorld =  _this Select 0;
private _timeout = 300;
private _maxunits = 60;
// private _allPlaces = nearestLocations [_centerWorld, ["NameLocal"], 1010];
_places = _this Select 0;

// {_nl = locationPosition _x;_places = _places + [_nl];} Foreach _allPlaces;

//{SystemChat Format ["%1",_x];player SetPos _x;sleep 2;} Foreach _places;
//_places = _places + [[(_centerWorld Select 0),(_centerWorld Select 1),0]];

_EastTroopModels = ["O_SoldierU_SL_F","O_soldierU_repair_F","O_soldierU_medic_F",
                    "O_sniper_F","O_Soldier_A_F","O_Soldier_AA_F","O_Soldier_AAA_F",
					"O_Soldier_AAR_F","O_Soldier_AAT_F","O_Soldier_AR_F","O_Soldier_AT_F",
					"O_soldier_exp_F","O_Soldier_F","O_engineer_F","O_engineer_U_F",
					"O_medic_F","O_recon_exp_F","O_recon_F","O_recon_JTAC_F",
					"O_recon_LAT_F","O_recon_M_F","O_recon_medic_F","O_recon_TL_F"];
					
_WestTroopModels = ["B_sniper_F","B_Soldier_A_F","B_Soldier_AA_F","B_Soldier_AAA_F",
                    "B_Soldier_AAR_F","B_Soldier_AAT_F","B_Soldier_AR_F","B_Soldier_AT_F",
					"B_soldier_exp_F","B_Soldier_F","B_engineer_F","B_medic_F","B_recon_exp_F",
					"B_recon_F","B_recon_JTAC_F","B_recon_LAT_F","B_recon_M_F","B_recon_medic_F","B_recon_TL_F"];
					
_ResTroopModels = ["I_G_Soldier_TL_F","I_G_Soldier_SL_F","I_G_Soldier_A_F","I_G_Soldier_AR_F",
                 "I_G_medic_F","I_G_engineer_F","I_G_Soldier_exp_F","I_G_Soldier_GL_F","I_G_Soldier_M_F",
                  "I_G_officer_F","I_G_Soldier_F","I_G_Soldier_LAT_F","I_G_Soldier_lite_F","I_G_Sharpshooter_F"];
				  
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

_WestHelo = ["B_Heli_Light_01_F"];
_EastHelo = ["O_Heli_Light_02_F"];
_ResHelo = ["I_Heli_light_03_dynamicLoadout_F"];

_WestPlane = ["B_Plane_CAS_01_dynamicLoadout_F","B_Plane_Fighter_01_F","B_Plane_Fighter_01_Stealth_F","B_T_VTOL_01_armed_F"];
_EastPlane = ["O_Plane_CAS_02_dynamicLoadout_F","O_Plane_Fighter_02_F","O_Plane_Fighter_02_Stealth_F","O_T_VTOL_02_infantry_dynamicLoadout_F","O_T_VTOL_02_vehicle_dynamicLoadout_F"];
_ResPlane = ["I_Plane_Fighter_03_dynamicLoadout_F","I_Plane_Fighter_04_F","I_C_Plane_Civil_01_F"];


private _Side = SelectRandom [west,east,resistance];
private _vehs = [];
private _troops = [];
private _HeliModel = [];
private _PlaneModel = [];
private _transport = [];

if (_Side == west) Then {_vehs = _WestLightVeh;
                         _troops = _WestTroopModels;
						 _HeliModel = SelectRandom _WestHelo;
						 _PlaneModel = _WestPlane;
						 _transport = "B_Truck_01_covered_F";
						 };
if (_Side == east) Then {_vehs = _EastLightVeh;
                         _troops = _EastTroopModels;
						 _HeliModel = SelectRandom _EastHelo;
						 _PlaneModel = _EastPlane;
						 _transport = "O_Truck_03_covered_F";
						 };						 
if (_Side == resistance) Then {_vehs = _ResLightVeh;
                               _troops = _ResTroopModels;
							   _HeliModel = SelectRandom _ResHelo;
							   _PlaneModel = _ResPlane;
							   _transport = "I_Truck_02_covered_F";
							   };
							   
if ((count Allunits) < _maxunits) Then {				   
    private _pos = SelectRandom _places;
    private _exec = SelectRandom [4,5];
    private _safePos =  [_pos,10,110, 10, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
    _sourceObjectT = createVehicle ["VR_Area_01_square_4x4_grey_F", [(_pos Select 0),(_pos Select 1),0], [], 0, "FORM"];
	//if (_exec == 0) Then {_evac = [["C_man_polo_5_F", "C_man_polo_5_F_afro", "C_man_polo_5_F_afro", "C_man_polo_5_F_afro", "C_man_polo_5_F_afro"],civilian,_pos,(GetMarkerPos "respawn_civilian"),40] call GPF_fnc_rescueEvac;[_evac,_timeout]Spawn {_evac = _this Select 0; _timeout = _this Select 1;Sleep _timeout+60;{deleteVehicle _x;} foreach units _evac;};};
    if (_exec == 1) Then {[_pos ,100,45,360,_Side ,(SelectRandom _vehs),30] Call GPF_fnc_patrol;};
    if (_exec == 2) Then {[[_safePos],_Side,_troops,0,_timeout] Call GPF_fnc_GuardTowers;};
    if (_exec == 3) Then {[_safePos,_pos,5,10,_Side,_troops,0,_timeout,[],_transport] Call GPF_fnc_barraks;};
    if (_exec == 4) Then {[_pos,_HeliModel,_Side,_troops,_timeout,false] Call GPF_fnc_TroopDrop;};
    if (_exec == 5) Then {_sourceObjectT SetPos _pos;_ewu = [_sourceObjectT,150,45,360,_Side,_troops] call GPF_fnc_enemyWave;[_ewu,_timeout]Spawn {_ewu = _this Select 0; _timeout = _this Select 1;Sleep _timeout;{deleteVehicle _x;} foreach _ewu;};};
    if (_exec == 6) Then {_sourceObjectT SetPos _pos;_ewu = [_sourceObjectT,500,45,360,_Side,_vehs] call GPF_fnc_enemyWaveVeh;[_ewu,_timeout]Spawn {_ewu = _this Select 0; _timeout = _this Select 1;Sleep _timeout;{_veh = _x; {deleteVehicle _x;} Foreach Crew _veh; deleteVehicle _veh;} foreach _ewu;};};
    if (_exec == 7) Then {[_pos ,1500,90,360,_Side ,( SelectRandom _PlaneModel),30] Call GPF_fnc_patrol;};
	deleteVehicle _sourceObjectT;
};

