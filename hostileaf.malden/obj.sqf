if (isDedicated) then { //START OF SERVERSIDE
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_EastVeh = ["O_Heli_Light_02_F",
            "O_Heli_Transport_04_bench_F",
			"O_Truck_02_transport_F",
            "O_G_Van_01_transport_F",
			"O_APC_Wheeled_02_rcws_F",
            "O_G_Offroad_01_armed_F",
			"O_Truck_03_covered_F",
			"O_Heli_Transport_04_covered_F",
			"O_Truck_03_fuel_F"];
						
_EastTroopModels = ["O_SoldierU_SL_F","O_soldierU_repair_F","O_soldierU_medic_F",
                    "O_sniper_F","O_Soldier_A_F","O_Soldier_AA_F","O_Soldier_AAA_F",
					"O_Soldier_AAR_F","O_Soldier_AAT_F","O_Soldier_AR_F","O_Soldier_AT_F",
					"O_soldier_exp_F","O_Soldier_F","O_engineer_F","O_engineer_U_F",
					"O_medic_F","O_recon_exp_F","O_recon_F","O_recon_JTAC_F",
					"O_recon_LAT_F","O_recon_M_F","O_recon_medic_F","O_recon_TL_F"];
				
_WestVeh = ["B_Quadbike_01_F",
            "B_G_Offroad_01_F",
			"C_Quadbike_01_F",
            "C_Offroad_01_F",
            "C_SUV_01_F",
			"B_CTRG_LSV_01_light_F",
			"C_Offroad_02_unarmed_F",
			"C_Hatchback_01_sport_F"];		

_WestEvacVeh = ["B_Heli_Transport_01_camo_F",
                "B_G_Van_01_transport_F",
                "B_Truck_01_transport_F",
				"B_Heli_Light_01_F"];
				
_mbox = [medicbox_00,medicbox_01,medicbox_02,medicbox_03,medicbox_04];
_bbox = [boombox_00,boombox_01];
_rbox = [ResupplyBoxBlue_0,ResupplyBoxBlue_1];
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/// MISSION ZERO					
_towerPos1 = [[1231.56,12341,-1.90735e-006],
              [986.94,12343.1,-1.90735e-006],
			  [1025.01,12156.5,-1.90735e-006],
              [709.561,12240,0],
			  [851.979,12247.6,-1.90735e-006],
			  [727.824,12107.8,0]];
			  
_barraksPos = [[1211.92,12351,0.917667],
               [803.195,12233.3,1.02022]];

_blacklist0 = ["blacklist_01","blacklist_02","blacklist_03","blacklist_04"];
			  
_objpos = [[649.942,12181.6],
           [676.188,12194.7],
		   [696.539,12225.8],
		   [724.888,12225.5],
		   [775.368,12212.8],
           [791.898,12190.6]];

_patrolPos = [[588.431,12300.2],
              [851.395,11933.9],
              [792.025,12163.1],
              [1200.95,12285.4]];

_ReSpawnPos = [698.822,12101.1,0.00143814];

_BBoxPos0 = [8067.3,9692.67,0];
_BBoxPos1 = [8131.08,10157.7,0];
_MBoxPos1 = [8075.22,9693.55,0];
_MBoxPos2 = [8130.82,10150.4,0];

_HeliEvacSource = [7561.34,10496.9,0.00143814];
_HeliEvacTarget = [8091.22,9672.62,0.00147438];

[_HeliEvacSource,_HeliEvacTarget,west,"B_Heli_Transport_01_camo_F",[40,41,42]] execVM "fnc_evac.sqf";

SPAWNVEH = true; publicVariable "SPAWNVEH";
[20,_WestVeh,_ReSpawnPos,600] execVM "fnc_spawnveh.sqf";

SPAWNTOWERS = true; publicVariable "SPAWNTOWERS";
[_towerPos1,east,_EastTroopModels,0] execVM "fnc_GuardTowers.sqf";

SPAWNBARRAKS = true; publicVariable "SPAWNBARRAKS";
[(_barraksPos Select 0),(_towerPos1 Select 0),5,60,east,_EastTroopModels,_blacklist0,270] execVM "fnc_barraks.sqf";
[(_barraksPos Select 1),(_towerPos1 Select 5),5,60,east,_EastTroopModels,_blacklist0,180] execVM "fnc_barraks.sqf";

OBJUP = true; publicVariable "OBJUP";
[_objpos,(_EastVeh  Select 7)] execVM "fnc_obj.sqf";

SPAWNPATROL = true; publicVariable "SPAWNPATROL";
[_patrolPos,(_patrolPos Select 3),east,(_EastVeh Select 5),60] execVM "fnc_patrol.sqf";

[_towerPos1,_EastTroopModels,_EastVeh] Spawn {_towerPos1 = _this select 0;_EastTroopModels = _this select 1; _EastVeh = _this select 2;
  Sleep 60;
  while {OBJUP && true} Do {
    _EastCount = east countSide AllUnits;
    IF (_EastCount < 3) THEN {
     _DropPos = [selectRandom _towerPos1,1,50, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos; 
     [_DropPos,(_EastVeh  Select 1),east,"O_soldier_PG_F"] execVM "fnc_airdrop.sqf";
	 SLEEP 30;
	 } Else {SLEEP 30;};
 };
 hint FORMAT ["OBJUP is %1",OBJUP];
};

Sleep 10;
waitUntil {!OBJUP};
OBJUP = false; publicVariable "OBJUP";
SPAWNBARRAKS = false; publicVariable "SPAWNBARRAKS";
SPAWNPATROL = false; publicVariable "SPAWNPATROL";
SPAWNTOWERS = false; publicVariable "SPAWNTOWERS";
SPAWNVEH = false; publicVariable "SPAWNVEH";
CLEANUP = true; publicVariable "CLEANUP";

"respawn_marker" SetMarkerPos _ReSpawnPos;
respawn_west_trigger SetPos _ReSpawnPos;

Sleep 60;
While {CLEANUP && true} Do {
_EastCount = east countSide AllUnits;
 IF (_EastCount < 1) THEN {CLEANUP = false; publicVariable "CLEANUP";} Else {hint "kill em all"; {if (side _x == EAST) then {deleteVehicle _x;};} Foreach AllUnits;};
Sleep 3;
};
hint FORMAT ["CLEANUP is %1",CLEANUP];
_HeliEvacSource = [714.435,12181.3,0];
_HeliEvacTarget = [6999.09,9987.54,0];
[_HeliEvacSource,_HeliEvacTarget,west,"B_Heli_Transport_01_camo_F",[40,41,42]] execVM "fnc_evac.sqf";



// FIRST FUNC BASED MISSION

_towerPos1 = [[7519.62,10532.5,0],
              [7550.07,10615,0],
			  [7483.29,10613.2,0],
              [7489.55,10533.4,0]];
			  
_barraksPos = [7689.56,10632.8,0];

_blacklist0 =["blacklist_05",
              "blacklist_06",
			  "blacklist_07",
			  "blacklist_08"];
			  
_objpos = [[7455.06,10557.3,0],
           [7484.28,10550.7,0],
		   [7556.92,10542.1,0],
		   [7539.17,10546.9,0],
		   [7518.83,10599.8,0],
           [7534.33,10598.2,0]];
		  
_ReSpawnPos = [7018.48,9990.25,0];

"respawn_marker" SetMarkerPos _ReSpawnPos;
respawn_west_trigger SetPos _ReSpawnPos;
ResupplyBoxBlue_0 SetPos [7453.61,10537.7,0.00143814];
ResupplyBoxBlue_1 SetPos [7043.84,9992.65];
medicbox_01 SetPos [7453.08,10532.9,0.00143814];
medicbox_04 SetPos [7042.47,10021.3];

SPAWNVEH = true; publicVariable "SPAWNVEH";
[20,_WestVeh,_ReSpawnPos,500] execVM "fnc_spawnveh.sqf";

SPAWNTOWERS = true; publicVariable "SPAWNTOWERS";
[_towerPos1,east,_EastTroopModels,0] execVM "fnc_GuardTowers.sqf";

SPAWNBARRAKS = true; publicVariable "SPAWNBARRAKS";
[_barraksPos,(selectRandom _towerPos1),10,60,east,_EastTroopModels,_blacklist0,0] execVM "fnc_barraks.sqf";

OBJUP = true; publicVariable "OBJUP";
[_objpos,(_EastVeh  Select 2)] execVM "fnc_obj.sqf";

[_towerPos1,_EastTroopModels,_EastVeh] Spawn {_towerPos1 = _this select 0;_EastTroopModels = _this select 1; _EastVeh = _this select 2;
  Sleep 60;
  while {OBJUP && true} Do {
    _EastCount = east countSide AllUnits;
    IF (_EastCount < 3) THEN {
     _DropPos = [selectRandom _towerPos1,1,50, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos; 
     [_DropPos,(_EastVeh  Select 1),east,"O_soldier_PG_F"] execVM "fnc_airdrop.sqf";
	 SLEEP 30;
	 } Else {SLEEP 30;};
 };
 hint FORMAT ["OBJUP is %1",OBJUP];
};

Sleep 10;
waitUntil {!OBJUP};
OBJUP = false; publicVariable "OBJUP";
SPAWNBARRAKS = false; publicVariable "SPAWNBARRAKS";
SPAWNPATROL = false; publicVariable "SPAWNPATROL";
SPAWNTOWERS = false; publicVariable "SPAWNTOWERS";
SPAWNVEH = false; publicVariable "SPAWNVEH";
CLEANUP = true; publicVariable "CLEANUP";

Sleep 60;
While {CLEANUP && true} Do {
_EastCount = east countSide AllUnits;
 IF (_EastCount < 1) THEN {CLEANUP = false; publicVariable "CLEANUP";} Else {hint "kill em all"; {if (side _x == EAST) then {deleteVehicle _x;};} Foreach AllUnits;};
Sleep 3;
};
hint FORMAT ["CLEANUP is %1",CLEANUP];

// SECOOND FNC BASED MISSION
					
_towerPos1 = [[8046.23,10445.7,0.0014534],
              [8007.62,10437.1,0.00143623],
			  [8000.53,10487.5,0.00141716],
              [8042.71,10493.6,0.00143051]];
			  
_barraksPos = [8024.68,10465.8,0.00142097];

_blacklist0 =["blacklist_09",
              "blacklist_10",
			  "blacklist_11",
			  "blacklist_12"];
			  
_objpos = [[8010.36,10684.1,0.00144577],
           [8013.88,10629.1,0.900026],
		   [8018.32,10568.9,0.900179],
		   [8038.7,10369.8,0.900032],
		   [8039.94,10314.6,0.900255],
           [8040.27,10268,0.900198]];

_patrolPos = [[8038.23,10189.5,0.900219],
              [8088.49,10471.4,0.9002],
              [7935.49,10798.5,0.900227],
              [7927.29,10459.8,0.900152]];

_ReSpawnPos = [8074.64,9702.08,0.00148964];

_BBoxPos0 = [8067.3,9692.67,0];
_BBoxPos1 = [8131.08,10157.7,0];
_MBoxPos1 = [8075.22,9693.55,0];
_MBoxPos2 = [8130.82,10150.4,0];

_HeliEvacSource = [7561.34,10496.9,0.00143814];
_HeliEvacTarget = [8091.22,9672.62,0.00147438];

[_HeliEvacSource,_HeliEvacTarget,west,"B_Heli_Transport_01_camo_F",[40,41,42]] execVM "fnc_evac.sqf";
"respawn_marker" SetMarkerPos _ReSpawnPos;
respawn_west_trigger SetPos _ReSpawnPos;
ResupplyBoxBlue_0 SetPos _BBoxPos0;
ResupplyBoxBlue_1 SetPos _BBoxPos1;
medicbox_01 SetPos _MBoxPos1;
medicbox_04 SetPos _MBoxPos2;

SPAWNVEH = true; publicVariable "SPAWNVEH";
[20,_WestVeh,_ReSpawnPos,500] execVM "fnc_spawnveh.sqf";

SPAWNTOWERS = true; publicVariable "SPAWNTOWERS";
[_towerPos1,east,_EastTroopModels,0] execVM "fnc_GuardTowers.sqf";

SPAWNBARRAKS = true; publicVariable "SPAWNBARRAKS";
[_barraksPos,(selectRandom _towerPos1),10,60,east,_EastTroopModels,_blacklist0,0] execVM "fnc_barraks.sqf";

OBJUP = true; publicVariable "OBJUP";
[_objpos,(_EastVeh  Select 0)] execVM "fnc_obj.sqf";

SPAWNPATROL = true; publicVariable "SPAWNPATROL";
[_patrolPos,(_patrolPos Select 3),east,(_EastVeh Select 4),60] execVM "fnc_patrol.sqf";

[_objpos,_EastTroopModels,_EastVeh] Spawn {_Pos = _this select 0;_EastTroopModels = _this select 1; _EastVeh = _this select 2;
  Sleep 60;
  while {OBJUP && true} Do {
    _EastCount = east countSide AllUnits;
    IF (_EastCount < 3) THEN {
     _DropPos = [selectRandom _Pos,1,50, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos; 
     [_DropPos,(_EastVeh  Select 1),east,"O_soldier_PG_F"] execVM "fnc_airdrop.sqf";
	 SLEEP 30;
	 } Else {SLEEP 30;};
 };
 hint FORMAT ["OBJUP is %1",OBJUP];
};

Sleep 10;
waitUntil {!OBJUP};
OBJUP = false; publicVariable "OBJUP";
SPAWNBARRAKS = false; publicVariable "SPAWNBARRAKS";
SPAWNPATROL = false; publicVariable "SPAWNPATROL";
SPAWNTOWERS = false; publicVariable "SPAWNTOWERS";
SPAWNVEH = false; publicVariable "SPAWNVEH";
CLEANUP = true; publicVariable "CLEANUP";

Sleep 60;
While {CLEANUP && true} Do {
_EastCount = east countSide AllUnits;
 IF (_EastCount < 1) THEN {CLEANUP = false; publicVariable "CLEANUP";} Else {hint "kill em all"; {if (side _x == EAST) then {deleteVehicle _x;};} Foreach AllUnits;};
Sleep 3;
};
hint FORMAT ["CLEANUP is %1",CLEANUP];



/// THIRD FNC MISSION				
_towerPos1 = [[9688.26,3852.82,0],
              [9790.66,3866.76,0],
			  [9758.71,4008.54,0],
              [9672.39,3998.14,0],
			  [9473.78,4136.68,0],
			  [9524.32,4183.71,0],
			  [9486,4216.1,0],
			  [10129,4036.85,0],
			  [10057.5,3978.05,0]];
			  
_barraksPos = [[9657.21,3898,0],
               [9800.45,3928.84,0]];

_blacklist0 = ["blacklist_13","blacklist_14","blacklist_15","blacklist_16","blacklist_17","blacklist_18"];
			  
_objpos = [[9471.86,4191.99,0],
           [9476.13,4162.04,0],
		   [10125,3997.7,0],
		   [10084.7,4037.35,0],
		   [9767.34,3901.1,0],
           [9704.33,3867.08,0]];

_patrolPos = [[9362.81,3238.46,0],
              [9486.52,4183.69,0],
              [10084.9,4022.93,0],
              [9729.31,3896.6,0]];

_ReSpawnPos = [9632.38,3310.56,0];

_BBoxPos0 = [9628.35,3327.89,0.00143814];
_BBoxPos1 = [9687.72,3954.7,0.00143814];
_MBoxPos1 = [9626.25,3323.5,0.00143814];
_MBoxPos2 = [9690.5,3971.78,0.00143814];

_HeliEvacSource = [8067.23,10195.8,0.00143814];
_HeliEvacTarget = [9643.55,3332.45,0.00143814];

[_HeliEvacSource,_HeliEvacTarget,west,"B_Heli_Transport_01_camo_F",[40,41,42]] execVM "fnc_evac.sqf";
"respawn_marker" SetMarkerPos _ReSpawnPos;
respawn_west_trigger SetPos _ReSpawnPos;
ResupplyBoxBlue_0 SetPos _BBoxPos0;
ResupplyBoxBlue_1 SetPos _BBoxPos1;
medicbox_01 SetPos _MBoxPos1;
medicbox_04 SetPos _MBoxPos2;

SPAWNVEH = true; publicVariable "SPAWNVEH";
//[20,["B_Quadbike_01_F","B_CTRG_LSV_01_light_F"],_ReSpawnPos,500] execVM "fnc_spawnveh.sqf";
[20,_WestVeh,_ReSpawnPos,500] execVM "fnc_spawnveh.sqf";

SPAWNTOWERS = true; publicVariable "SPAWNTOWERS";
[_towerPos1,east,_EastTroopModels,0] execVM "fnc_GuardTowers.sqf";

SPAWNBARRAKS = true; publicVariable "SPAWNBARRAKS";
[(_barraksPos Select 0),(selectRandom _objpos),5,60,east,_EastTroopModels,_blacklist0,180] execVM "fnc_barraks.sqf";
[(_barraksPos Select 1),(selectRandom _objpos),5,60,east,_EastTroopModels,_blacklist0,0] execVM "fnc_barraks.sqf";

OBJUP = true; publicVariable "OBJUP";
[_objpos,(_EastVeh  Select 7)] execVM "fnc_obj.sqf";

SPAWNPATROL = true; publicVariable "SPAWNPATROL";
[_patrolPos,(_patrolPos Select 3),east,(_EastVeh Select 0),30] execVM "fnc_patrol.sqf";

[_barraksPos,_EastTroopModels,_EastVeh] Spawn {_Pos = _this select 0;_EastTroopModels = _this select 1; _EastVeh = _this select 2;
  Sleep 60;
  while {OBJUP && true} Do {
    _EastCount = east countSide AllUnits;
    IF (_EastCount < 3) THEN {
     _DropPos = [selectRandom _Pos,1,50, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos; 
     [_DropPos,(_EastVeh  Select 1),east,"O_soldier_PG_F"] execVM "fnc_airdrop.sqf";
	 SLEEP 30;
	 } Else {SLEEP 30;};
 };
 hint FORMAT ["OBJUP is %1",OBJUP];
};

Sleep 10;
waitUntil {!OBJUP};
OBJUP = false; publicVariable "OBJUP";
SPAWNBARRAKS = false; publicVariable "SPAWNBARRAKS";
SPAWNPATROL = false; publicVariable "SPAWNPATROL";
SPAWNTOWERS = false; publicVariable "SPAWNTOWERS";
SPAWNVEH = false; publicVariable "SPAWNVEH";
CLEANUP = true; publicVariable "CLEANUP";

Sleep 60;
While {CLEANUP && true} Do {
_EastCount = east countSide AllUnits;
 IF (_EastCount < 1) THEN {CLEANUP = false; publicVariable "CLEANUP";} Else {hint "kill em all"; {if (side _x == EAST) then {deleteVehicle _x;};} Foreach AllUnits;};
Sleep 3;
};
hint FORMAT ["CLEANUP is %1",CLEANUP];


/// FORTH FNC MISSION				
_towerPos1 = [[7876.28,3101.47,0],
              [7803.44,3288.06,0],
			  [7661.17,3374.88,0],
              [7716.69,3301.45,0],
			  [7754.42,3161.09,0],
			  [7929.12,4100.28,0],
			  [8055.3,3976.68,0],
			  [8156.55,3904.15,0],
			  [7688.33,4107.07,0],
			  [7855.31,4047.31,0]];
			  
_barraksPos = [[7987.77,3999.58,0],
               [7744.03,3337.09,0]];

_blacklist0 = ["blacklist_19","blacklist_20","blacklist_21","blacklist_22","blacklist_23"];
			  
_objpos = [[8033.61,4044.37,0],
           [7950.42,4039.03,0],
		   [8190.88,3899.59,0],
		   [7684.38,3355.79,0],
		   [7792.05,3176.28,0],
           [7851.47,3104.25,0]];

_patrolPos = [[7720.48,3331.72,0],
              [8066.86,3988.59,0]];

_ReSpawnPos = [8443.74,3867.14,0];

_MBoxPos = [[8448.59,3878.08,0],
            [7763.77,3142.85,0],
			[7690.73,3367.05,0],
			[7989.56,4083.31,0],
			[8106.81,3447.71,0]];
			
_RboxPos = [[8102.14,3434.54,0],
            [8441.8,3882.62,0]];
	
_BBoxPos = [[7760.01,3210.66,0],
            [7945.28,4021.44,0]];

_HeliEvacSource = [9705.74,3963.4,0];
_HeliEvacTarget = [8461.64,3900.17,0];

[_HeliEvacSource,_HeliEvacTarget,west,"B_Heli_Transport_01_camo_F",[40,41,42]] execVM "fnc_evac.sqf";
"respawn_marker" SetMarkerPos _ReSpawnPos;
respawn_west_trigger SetPos _ReSpawnPos;
{(_rbox Select _x) SetPos (_RboxPos Select _x)} Foreach [0,1];
{(_bbox Select _x) SetPos (_BBoxPos Select _x)} Foreach [0,1];
{(_mbox Select _x) SetPos (_MBoxPos Select _x)} Foreach [0,1,2,3,4,5];

SPAWNVEH = true; publicVariable "SPAWNVEH";
//[10,["B_Quadbike_01_F","B_CTRG_LSV_01_light_F"],_ReSpawnPos,100] execVM "fnc_spawnveh.sqf";
[20,_WestVeh,_ReSpawnPos,500] execVM "fnc_spawnveh.sqf";

SPAWNTOWERS = true; publicVariable "SPAWNTOWERS";
[_towerPos1,east,_EastTroopModels,45] execVM "fnc_GuardTowers.sqf";

SPAWNBARRAKS = true; publicVariable "SPAWNBARRAKS";
[(_barraksPos Select 0),(_barraksPos Select 0),5,60,east,_EastTroopModels,_blacklist0,180] execVM "fnc_barraks.sqf";
[(_barraksPos Select 1),(_barraksPos Select 1),5,60,east,_EastTroopModels,_blacklist0,0] execVM "fnc_barraks.sqf";

OBJUP = true; publicVariable "OBJUP";
[_objpos,(_EastVeh  Select 8)] execVM "fnc_obj.sqf";

SPAWNPATROL = true; publicVariable "SPAWNPATROL";
[_patrolPos,(_patrolPos Select 0),east,(_EastVeh Select 0),30] execVM "fnc_patrol.sqf";
[_patrolPos,(_patrolPos Select 1),east,(_EastVeh Select 4),30] execVM "fnc_patrol.sqf";

[_barraksPos,_EastTroopModels,_EastVeh] Spawn {_Pos = _this select 0;_EastTroopModels = _this select 1; _EastVeh = _this select 2;
  Sleep 60;
  while {OBJUP && true} Do {
    _EastCount = east countSide AllUnits;
    IF (_EastCount < 3) THEN {
     [(selectRandom _Pos),(_EastVeh  Select 1),east,"O_soldier_PG_F"] execVM "fnc_airdrop.sqf";
	 SLEEP 30;
	 } Else {SLEEP 30;};
 };
 hint FORMAT ["OBJUP is %1",OBJUP];
};

Sleep 10;
waitUntil {!OBJUP};
OBJUP = false; publicVariable "OBJUP";
SPAWNBARRAKS = false; publicVariable "SPAWNBARRAKS";
SPAWNPATROL = false; publicVariable "SPAWNPATROL";
SPAWNTOWERS = false; publicVariable "SPAWNTOWERS";
SPAWNVEH = false; publicVariable "SPAWNVEH";
CLEANUP = true; publicVariable "CLEANUP";

Sleep 60;
While {CLEANUP && true} Do {
_EastCount = east countSide AllUnits;
 IF (_EastCount < 1) THEN {CLEANUP = false; publicVariable "CLEANUP";} Else {hint "kill em all"; {if (side _x == EAST) then {deleteVehicle _x;};} Foreach AllUnits;};
Sleep 3;
};
hint FORMAT ["CLEANUP is %1",CLEANUP];

/// End Game
"EveryoneWon" call BIS_fnc_endMissionServer;
}; //END OF SERVERSIDE

[] Spawn { 
    while {true} Do {
	 systemChat Format ["%1 enemy alive",east countSide AllUnits]; 
     Sleep 60;
	   };
};

