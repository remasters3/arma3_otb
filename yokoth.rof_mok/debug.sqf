_posASL = (GetPosASL thing);
_veh = [[(_posASL select 0),(_posASL select 1),(_posASL select 2)+20],0,"Land_Destroyer_01_base_F"/*"Land_Carrier_01_base_F"*/,10] call GPF_fnc_SpawnVehicleASL;
player SetPosASL [(_posASL select 0),(_posASL select 1),(_posASL select 2)+100];

/*_centerWorld = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
private _timeout = 600;
private _maxunits = 60;
private _allPlaces = nearestLocations [_centerWorld, ["NameLocal"], 1010];
private _places = [];
{_nl = locationPosition _x;_places = _places + [_nl];} Foreach _allPlaces;
///////////////////////////////////////////////////////////////////////////
_ppos = GetPos player;
//passed vars


private _pos = [(_centerWorld select 0),(_centerWorld select 1),0];
private _targetRadias = 100;
private _name = "ShitStorm",
private _cnt = 0;

_CZmarkers = [];
{
 _txt = Format ["%1_%2",_name,_cnt];
 _marker = [_x,_targetRadias,_txt] call GPF_fnc_makeCZ;
 _cnt = _cnt+1;
 _CZmarkers = _CZmarkers + [_marker];
 sleep 1;
} foreach _places;

sleep 60;

{
 deleteMarker _x;
} foreach _CZmarkers;

*/

/*
_WestTroopModels = ["B_sniper_F","B_Soldier_A_F","B_Soldier_AA_F","B_Soldier_AAA_F",
                    "B_Soldier_AAR_F","B_Soldier_AAT_F","B_Soldier_AR_F","B_Soldier_AT_F",
					"B_soldier_exp_F","B_Soldier_F","B_engineer_F","B_medic_F","B_recon_exp_F",
					"B_recon_F","B_recon_JTAC_F","B_recon_LAT_F","B_recon_M_F","B_recon_medic_F","B_recon_TL_F"
];

_Mrkpos = GetMarkerPos "respawn_civilian";
// OuterCentre Zone
_pCount = 0;
_OuterCentrePos = [];

while {_pCount < 360} Do {
 _pos = [_Mrkpos, 500, _pCount] call BIS_fnc_relPos;
 _pCount = _pCount+45;
 _OuterCentrePos = _OuterCentrePos + [_pos];
};

//_OuterCentrePos = [(GetPos player)];
{
_pos = _x;
_side = west;
[_pos,_pos,5,10,_side,_WestTroopModels,0,300,[],"B_Truck_01_covered_F"] Call GPF_fnc_barraks;
systemchat "away";
sleep 1;
} Foreach _OuterCentrePos;
// [_safePos,_pos,5,10,_Side,_WestTroopModels,0,_timeout,[],_transport] Call GPF_fnc_barraks;

*/