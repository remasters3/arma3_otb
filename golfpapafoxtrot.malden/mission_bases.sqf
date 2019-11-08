//player setpos [7693.16,4216.78,0];

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
				  
				  
				  
private _westAircraft = [
    "B_Plane_CAS_01_dynamicLoadout_F",
    "B_Plane_Fighter_01_Stealth_F",
    "B_T_VTOL_01_armed_F"
];
private _westHelo = [
    "B_Heli_Transport_01_F",
	"B_Heli_Light_01_dynamicLoadout_F",
    "B_Heli_Attack_01_dynamicLoadout_F",
    "B_Heli_Transport_03_F"
];

private _eastAircraft = [
    "O_Plane_CAS_02_dynamicLoadout_F",
    "O_Plane_Fighter_02_Stealth_F",
    "O_T_VTOL_02_infantry_dynamicLoadout_F"
];
private _eastHelo = [
    "O_Heli_Attack_02_dynamicLoadout_F",
    "O_Heli_Light_02_dynamicLoadout_F"
];

private _restAircraft = [
    "I_Plane_Fighter_03_dynamicLoadout_F",
    "I_Plane_Fighter_04_F",
    "I_Heli_light_03_dynamicLoadout_F"
];

private _restHelo = [
    "I_Heli_light_03_dynamicLoadout_F"
];

private _westArmor = [
"B_APC_Wheeled_01_cannon_F",
"B_APC_Tracked_01_CRV_F",
"B_MRAP_01_gmg_F",
"B_MRAP_01_hmg_F",
"B_APC_Tracked_01_AA_F",
"B_APC_Tracked_01_rcws_F",
"B_MBT_01_TUSK_F",
"B_MBT_01_arty_F",
"B_MBT_01_mlrs_F",
"B_LSV_01_AT_F",
"B_LSV_01_armed_F",
"B_AFV_Wheeled_01_up_cannon_F"
];

private _eastArmor = [
"O_APC_Tracked_02_cannon_F",
"O_APC_Wheeled_02_rcws_v2_F",
"O_MBT_02_cannon_F",
"O_MBT_04_command_F",
"O_MBT_02_arty_F",
"O_MRAP_02_gmg_F",
"O_MRAP_02_hmg_F",
"O_LSV_02_AT_F",
"O_LSV_02_armed_F"
];

private _restArmor = [
"I_LT_01_AT_F",
"I_LT_01_scout_F",
"I_LT_01_cannon_F",
"I_APC_tracked_03_cannon_F",
"I_MBT_03_cannon_F",
"I_MRAP_03_gmg_F",
"I_MRAP_03_hmg_F",
"I_Truck_02_MRL_F",
"I_APC_Wheeled_03_cannon_F"
];

private _towermodels = ["Land_Cargo_Patrol_V3_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F"];_towermodel = "Land_Cargo_Patrol_V3_derelict_F";
private _BarraksTypes = ["B_Truck_01_covered_F","O_Truck_03_covered_F","I_Truck_02_ammo_F"];_BarraksType = "Land_Cargo_HQ_V3_derelict_F";
private _BoatTypes = [["B_Boat_Armed_01_minigun_F"],["O_Boat_Armed_01_hmg_F"],["I_Boat_Armed_01_minigun_F"]];
				  
//AirPort Positions//
private _Location0_BoatPos = [];
private _Airport_TowerPos = [
  [[8123.83,10254,0],90],
  [[8123.1,10386.5,0],60],
  [[8080.9,10602.2,0],90],
  [[8086.7,10540.7,0],90],
  [[8071.39,10662.9,0],90],
  [[7971.5,10665.9,0],260],
  [[7978.73,10340.3,0],260],
  [[8211.2,10492.8,0],90],
  [[8126.23,10316.4,0],90] 
];

private _Airport_HQPos = [
  [[8113.96,10639.9,0],[8039.51,10314.4,0],0],
  [[8177.08,10330.4,0],[8011.05,10625.8,0],0]
];

private _Airport_AirCraftPos = [
  [[8004.79,10684.2,0],90],
  [[8011.2,10625.6,0],90],
  [[8015.78,10564.6,0],90],
  [[8036.89,10365.8,0],90],
  [[8038.76,10311.9,0],90],
  [[8040.13,10266.1,0],90]
];

private _Airport_ArmorPos = [
[[8127.38,10493.8,0],260],
[[8127.55,10484.8,0],260],
[[8127.36,10476,0],260],
[[8179.07,10505.9,0],260],
[[8179.87,10496.4,0],260],
[[8181.01,10488.1,0],260],
[[8180.57,10478.9,0],260],
[[8180.81,10471.3,0],260],
[[8151.99,10464.3,0],90],
[[8154.23,10447.3,0],90],
[[8163.13,10556.8,0],0],
[[8152.72,10563.4,0],0]
];

//Location1 Positions//
private _Location1_BoatPos = [];

private _Location1_TowerPos = [
  [[7769.79,4236.22,0],220],
  [[7754.02,4093.19,0],0],
  [[7786.27,4116.4,0],315],
  [[7692.45,4110.39,0],40],
  [[7676.28,4206.19,0],315],
  [[7722.28,4239.68,0],315],
  [[7712.2,4269.13,0],315]
];

private _Location1_HQPos = [
  [[7673.32,4230.95,0],[7735.54,4152.55,0],140]
];

private _Location1_AirCraftPos = [
  [[7699.79,4238.72,0],45],
  [[7689.75,4160.61,0],0]
];

private _Location1_ArmorPos = [
[[7718.44,4113.01,0],90],
[[7718.18,4121.04,0],90],
[[7717.93,4129.21,0],90],
[[7708.36,4183.99,0],90],
[[7707.84,4193.67,0],90],
[[7768.15,4132.89,0],90],
[[7767.52,4141.68,0],90],
[[7765.38,4169.6,0],90],
[[7764.75,4178.39,0],90],
[[7742.96,4128.02,0],0],
[[7739.25,4166.9,0],0],
[[7737.28,4181.95,0],0]
];
/////////////////////////////////////////////////////
//Location2 Positions//
private _Location2_BoatPos = [
  [[454.085,12238.9,0],270],
  [[483.993,12148.3,0],270],
  [[685.589,11910.6,0],270],
  [[894.795,11855.1,0],270],
  [[918.927,11826,0],270],
  [[673.157,11943.8,0],270]
];

private _Location2_TowerPos = [
  [[727.773,12106.7,0],0],
  [[960.342,12136.9,0],342],
  [[1166.7,12192.9,0],342],
  [[1203.69,12360.2,0],175],
  [[995.695,12375.5,0],175],
  [[470.252,12397.5,0],125],
  [[798.817,12342.9,0],175],
  [[608.315,12196.2,0],90]
];

private _Location2_HQPos = [
  [[671.864,12120.6,0],[1122.4,12199.3,0],0],
  [[996.682,12352.1,0],[698.606,12163.8,0],90]
];

private _Location2_AirCraftPos = [
  [[698.606,12163.8,0],320],
  [[765.782,12139.7,0],320],
  [[826.942,12124.3,0],320],
  [[881.663,12138.9,0],320],
  [[928.862,12149.1,0],320],
  [[976.666,12162,0],320],
  [[1027.53,12173.5,0],320],
  [[1075.63,12187.8,0],320],
  [[1122.4,12199.3,0],320]
];

private _Location2_ArmorPos = [];
/////////////////////////////////////////////////////

//Location3 Positions//
private _Location3_BoatPos = [
  [[9287.16,3789.18,0],0],
  [[9286.59,3832.36,0],0],
  [[10055.1,4309.7,0],0],
  [[10035.1,4333.99,0],0]
];

private _Location3_TowerPos = [
  [[10068.4,4047.42,0],180],
  [[10145.9,3988.4,0],270],
  [[9476.75,4141.77,0],0],
  [[9502.21,4234.54,0],180],
  [[9332.94,3825.16,0],90],
  [[9340.09,3734.48,0],90],
  [[9753.99,3998.98,0],180],
  [[9662.39,3869.41,0],180],
  [[9681.03,3996.14,0],90]
];

private _Location3_HQPos = [
  [[9346.14,3839.42,0],[9529.16,4226.68,0],0],
  [[9529.16,4226.68,0],[10102.2,4035.93,0],0],
  [[10102.2,4035.93,0],[9346.14,3839.42,0],90]
];

private _Location3_AirCraftPos = [
  [[9358.78,3770.49,0],0],
  [[9465.54,4178.56,0],0],
  [[9704.51,3962.93,0],0],
  [[9704.74,3867.96,0],0],
  [[10114.9,4000.14,0],0],
  [[10090,4002.06,0],0],
  [[9491.13,4166.46,0],0]
];

private _Location3_ArmorPos = [];
/////////////////////////////////////////////////////


private _towerpos = [];
private _hqpos = [];
private _acpos = [];
private _arpos = [];
private _btpos = [];
private _aircraft = [];
private _Side = selectRandom [west,east,resistance];
private _troops = [];
private _active = [];
private _vehs = [];
private _helos = [];
private _planes = [];
private _boats = [];
private _armor = [];
private _BarraksGroups = [];
private _timeout = 60*60;
private _location = SelectRandom [0,1,2,3];
//private _location = 3;

Count_AliveUnits = {
 _Groups = _this select 0;
 _units = _this select 1;

 {_grp = _x;
  { _units = _units + [_x] } Foreach units _grp; 
 } ForEach _Groups; 
 
 _WeeBastardsAlive = {alive _x} count _units;
 _WeeBastardsAlive;
};

if (_Side == west) then{
                        _towermodel = _towermodels select 0;
                        _troops = _WestTroopModels;
						_BarraksType = _BarraksTypes select 0;
						_planes = _westAircraft;
						_helos = _westHelo;
						_armor = _westArmor;
						_boats = _BoatTypes select 0;
						};
if (_Side == east) then{
                        _towermodel = _towermodels select 1;
						_troops = _EastTroopModels;
						_BarraksType = _BarraksTypes select 1;
						_planes = _eastAircraft;
						_helos = _eastHelo;
						_armor = _eastArmor;
						_boats = _BoatTypes select 1;
					    };
if (_Side == resistance) then {
                               _towermodel = _towermodels select 2;
                               _troops = _ResTroopModels;
							   _BarraksType = _BarraksTypes select 2;
							   _planes = _restAircraft;
							   _helos = _restHelo;
							   _armor = _restArmor;
							   _boats = _BoatTypes select 2;
							   };

if (_location == 0) then {_aircraft = _planes + _helos;
                          _towerpos = _Airport_TowerPos;
                          _hqpos = _Airport_HQPos;
						  _acpos = _Airport_AirCraftPos;
						  _arpos = _Airport_ArmorPos;
						  _btpos = _Location0_BoatPos;
						  };
						  
if (_location == 1) then {_aircraft = _helos;
                          _towerpos = _Location1_TowerPos;
                          _hqpos = _Location1_HQPos;
						  _acpos = _Location1_AirCraftPos;
						  _arpos = _Location1_ArmorPos;
						  _btpos = _Location1_BoatPos;
						  };
						  
if (_location == 2) then {_aircraft = _planes + _helos;
                          _towerpos = _Location2_TowerPos;
                          _hqpos = _Location2_HQPos;
						  _acpos = _Location2_AirCraftPos;
						  _arpos = _Location2_ArmorPos;
						  _btpos = _Location2_BoatPos;
						  };
						  
if (_location == 3) then {_aircraft = _helos;
                          _towerpos = _Location3_TowerPos;
                          _hqpos = _Location3_HQPos;
						  _acpos = _Location3_AirCraftPos;
						  _arpos = _Location3_ArmorPos;
						  _btpos = _Location3_BoatPos;
						  };
					  
baseson = true; publicVariable "baseson";
{
_hq = [(_x select 0),(_x select 1),5,60,_Side,_troops,(_x select 2),_timeout,[],_BarraksType] Call GPF_fnc_barraks;
_BarraksGroup = _hq select 0;
_Barraks = _hq select 1;
_vehs = _vehs + [_Barraks];
_BarraksGroups = _BarraksGroups + [_BarraksGroup];
} forEach _hqpos;

{
 _tower = [[(_x Select 0)],_Side,_troops,(_x Select 1),_timeout,_towermodel] Call GPF_fnc_GuardTowers;
 _units = _tower Select 0;
 _towers = _tower Select 1;
 _active = _active + _units;
 _vehs = _vehs + _towers;
 
} foreach _towerpos;

{
_pos = _x select 0;
_dir = _x select 1;
_actype = selectrandom _aircraft;
_acft = _actype createVehicle _pos; _vehs = _vehs + [_acft];
_acft setDir _dir;
} foreach _acpos;

{
_pos = _x select 0;
_dir = _x select 1;
_artype = selectrandom _armor;
_armr = _artype createVehicle _pos; _vehs = _vehs + [_armr];
_armr setDir _dir;
} foreach _arpos;

{
_pos = _x select 0;
_dir = _x select 1;
_bttype = selectrandom _boats;
_boat = _bttype createVehicle _pos; _vehs = _vehs + [_boat];
_boat setDir _dir;
} foreach _btpos;

[_hqpos,_Side] Spawn { 
  _hqpos = _this select 0; 
  _Side = _this select 1;
  _markers = [];
  {
    _txt = Format["%1 Supply-0%2",_Side,(count _markers)];
    _smc = "colorwhite";
    _pos = _x Select 0;
    if (_Side == west ) Then {_smc = "ColorWEST";};
    if (_Side == east ) Then {_smc = "ColorEAST";};
    if (_Side == resistance ) Then {_smc = "ColorGUER";};
    _marker = createMarker [_txt,_pos]; 
    _marker setMarkerType "hd_flag";
    _marker setMarkerText _txt;
    _marker setMarkerColor _smc;
    _marker setMarkerAlpha 0.5;
	_markers = _markers + [_marker];
    
  } Foreach _hqpos;
  waitUntil {!baseson};
  {deleteMarker _x} Foreach _markers;
  
};

[_vehs] Spawn {_vehs = _this select 0;
waitUntil {!baseson};
_smokers = [];
{_Vehpos = GetPos _x; _Signal = "SmokeShellOrange" createVehicle _Vehpos;_smokers = _smokers + [_Signal]; } ForEach _vehs;
Sleep 55;
{deleteVehicle _x;} Foreach _smokers;
sleep 5;
{If ((count (crew _x)) == 0) Then {deleteVehicle _x;};} forEach _vehs;
};


[ _BarraksGroups,_active] Spawn { 
  _BarraksGroups = _this select 0;
  _active = _this select 1;
  while {baseson} Do {
    _cnt = [_BarraksGroups,_active] Call Count_AliveUnits;
   // _cnt = {alive _x} count _active;
   if (_cnt < 1) Then {baseson = false; publicVariable "baseson";};
   sleep 1;
   };
};



[_vehs,_active,_timeout,_BarraksGroups] Spawn { 
 _vehs = _this select 0;
 _active = _this select 1;
 _timeout = _this select 2;
 _BarraksGroups = _this select 3;
 
 sleep _timeout; 
 {_grp = _x;
  { deleteVehicle _x; } Foreach units _grp;
 } ForEach _BarraksGroups; 
 {deleteVehicle _x;} forEach _active;
 //baseson = false; publicVariable "baseson";
};