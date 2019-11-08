private _centerWorld = _this select 0;
private _NameCity = nearestLocations [_centerWorld, ["NameCity"], 10000];
private _NameCityCapital = nearestLocations [_centerWorld, ["NameCityCapital"], 10000];
//private _NameVillage = nearestLocations [_centerWorld, ["NameVillage"], 10000];
private _allPlaces = _NameCity + _NameCityCapital ;//+ _NameVillage;
_places = [];
_CustomPlaces = [
 [7731.67,4168.48,0],
 [5557.3,7022.23,0],
 [3585.43,8517.99,0],
 [4480.33,4277.63,0]
];
{_nl = locationPosition _x;_places = _places + [_nl];} Foreach _allPlaces;
private _targetRadias = 250;
private _name = "CZ";
private _cnt = 0;

//_places = _places + _CustomPlaces;

[_places] Spawn { _places = _this select 0;
         while {true} Do {
           [_places] execVM "randomai.sqf";
		   sleep 60;
        };		   
};
_CZmarkers = [];
{
 _txt = Format ["%1_%2",_name,_cnt];
 _marker = [_x,_targetRadias,_txt] call GPF_fnc_makeCZ;
 _cnt = _cnt+1;
 _CZmarkers = _CZmarkers + [_marker];
 sleep 1;
} foreach _places;

RefreshTroops = {
  _Pos = _this select 0;
  _side = _this select 1;
  _rad = _this select 2;
  _troops = _this select 3;
  _heliModel = _this select 4;
 _sideUnitsTtle = []; 
 {if ((side _x) isEqualTo _side && _x distance _Pos < _rad) then {_sideUnitsTtle pushBack _x; }; } forEach (allUnits - _sideUnitsTtle);
 if ((count _sideUnitsTtle) < 2) Then {_output = [_Pos,_heliModel,_side,_troops,0,FALSE] Call GPF_fnc_TroopDrop;};
 };
 
 
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

_on = true;
while {_on} Do {
   _winner = nil;;
  _WestScore = 0;
  _EastScore = 0;
  _RestScore = 0;
  _CiviScore = 0;
  _DeadMarkers = 0;
  _TotalScore = count _CZmarkers;
  _towers = [];
  
  {_marker = _x; 
  if (getMarkerColor _marker == "ColorWEST") then {_WestScore = _WestScore+1;west addScoreSide 10;[(GetMarkerPos _marker),west,_targetRadias,_WestTroopModels,"B_Heli_Transport_01_camo_F"] Call RefreshTroops;};
  if (getMarkerColor _marker == "ColorEAST") then {_EastScore = _EastScore+1;east addScoreSide 10;[(GetMarkerPos _marker),east,_targetRadias,_EastTroopModels,"O_Heli_Light_02_dynamicLoadout_F"] Call RefreshTroops;};
  if (getMarkerColor _marker == "ColorGUER") then {_RestScore = _RestScore+1;resistance addScoreSide 10;[(GetMarkerPos _marker),resistance,_targetRadias,_ResTroopModels,"I_Heli_light_03_unarmed_F"] Call RefreshTroops;};
  if (getMarkerColor _marker == "ColorCIV") then { _CiviScore = _CiviScore+1;civilian addScoreSide 10;};
  if (getMarkerColor _marker == "") then {_DeadMarkers = _DeadMarkers+1;};
  } Foreach _CZmarkers;
  
  if (_WestScore == _TotalScore) then {/*_on = false;*/_winner = west;};
  if (_EastScore == _TotalScore) then {/*_on = false;*/_winner = east;};
  if (_RestScore == _TotalScore) then {/*_on = false;*/_winner = resistance;};
  if (_CiviScore == _TotalScore) then {/*_on = true;*/};
  if (_DeadMarkers == _TotalScore) then {/*_on = false;*/};
  if (!isNil "_winner") Then {_winner addScoreSide 40;};
  _txt = Format ["| W %1/%6 | E %2/%6 | R %3/%6 | C %4/%6 | D %5/%6 |",_WestScore,_EastScore,_RestScore,_CiviScore,_DeadMarkers,_TotalScore];
  //hint _txt;
  Sleep 30;
  
};
publicVariable "winner";
//winner addScoreSide 1000000;
"SideScore" call BIS_fnc_endMissionServer;
winner = nil; publicVariable "winner";
missionon = false; publicVariable "missionon";
if (!missionon) then {forceEnd};


{
 deleteMarker _x;
} foreach _CZmarkers;