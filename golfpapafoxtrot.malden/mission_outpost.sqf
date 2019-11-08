_pos = _this select 0;

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


private _WestBoxes = [
"Box_NATO_Ammo_F",
"Box_NATO_Wps_F",
"Box_NATO_Equip_F",
"Box_NATO_AmmoOrd_F",
"Box_NATO_Grenades_F",
"Box_NATO_WpsLaunch_F",
"Box_NATO_WpsSpecial_F",
"Box_NATO_Support_F",
"Box_NATO_Uniforms_F",
"B_CargoNet_01_ammo_F"
];

private _EastBoxes = [
"Box_East_Ammo_F",
"Box_East_Wps_F",
"Box_CSAT_Equip_F",
"Box_East_AmmoOrd_F",
"Box_East_Grenades_F",
"Box_East_WpsLaunch_F",
"Box_East_WpsSpecial_F",
"O_supplyCrate_F",
"Box_East_Support_F",
"Box_CSAT_Uniforms_F"
];

private _RestBoxes = [
"Box_IND_Ammo_F",
"Box_IND_Wps_F",
"Box_AAF_Equip_F",
"Box_IND_AmmoOrd_F",
"Box_IND_Grenades_F",
"Box_IND_WpsLaunch_F",
"Box_IND_WpsSpecial_F",
"I_supplyCrate_F",
"Box_IND_Support_F",
"Box_AAF_Uniforms_F",
"I_CargoNet_01_ammo_F"
];

private _BarraksTypes = ["B_Truck_01_covered_F","O_Truck_03_covered_F","I_Truck_02_ammo_F"];_BarraksType = "Land_Cargo_HQ_V3_derelict_F";
private _sides = [west,east,resistance];
private _side = selectRandom _sides;
private _boxes = [];
private _things = [];
private _troops = [];

If (_side == west) Then {_boxes = _WestBoxes;_BarraksType = _BarraksTypes select 0;_troops = _WestTroopModels;};
If (_side == east) Then {_boxes = _EastBoxes;_BarraksType = _BarraksTypes select 1;_troops = _EastTroopModels;};
If (_side == resistance) Then {_boxes = _RestBoxes;_BarraksType = _BarraksTypes select 2;_troops = _ResTroopModels;};
If (_side == civilian) Then {};


// _Barraks_00 = [_SpawnPos,_PatrolPos,_MinUnitsPerSide,_RespawnTime,_Side,_TroopModels,_Direction,_Timeout,_Blacklist,_BarraksType] Call GPF_fnc_barraks;
_bPos = [_pos,2,50, 10, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
_hq = [_bPos,_bPos,5,60,_side,_troops,0,9999,[],_BarraksType] Call GPF_fnc_barraks;
_BarraksGroup = _hq select 0;
_Barraks = _hq select 1;
_things = _things + [_Barraks];


{
 _sPos = [_bPos,0,10,1, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
 _box = createVehicle [_x, _sPos, [], 0, "FORM"];
 _things = _things + [_box];
} Foreach _boxes;
sleep 10;
{deleteVehicle _x} foreach _things;
{deleteVehicle _x} foreach units _BarraksGroup;