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
_WestTroopModels = ["B_sniper_F","B_Soldier_A_F","B_Soldier_AA_F","B_Soldier_AAA_F",
                    "B_Soldier_AAR_F","B_Soldier_AAT_F","B_Soldier_AR_F","B_Soldier_AT_F",
					"B_soldier_exp_F","B_Soldier_F","B_engineer_F","B_medic_F","B_recon_exp_F",
					"B_recon_F","B_recon_JTAC_F","B_recon_LAT_F","B_recon_M_F","B_recon_medic_F","B_recon_TL_F"];
_pos = getPos player;
_side = west;
[_pos,_pos,5,10,_side,_WestTroopModels,0,300,[],"B_Truck_01_covered_F"] Call GPF_fnc_barraks;

// [_safePos,_pos,5,10,_Side,_WestTroopModels,0,_timeout,[],_transport] Call GPF_fnc_barraks;