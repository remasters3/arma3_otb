_EastLightVeh = ["O_APC_Tracked_02_AA_F",
                 "O_APC_Tracked_02_cannon_F",
                 "O_APC_Wheeled_02_rcws_v2_F",
                 "O_MBT_02_cannon_F",
                 "O_MBT_04_cannon_F",
                 "O_MBT_04_command_F",
                 "O_MRAP_02_F",
                 "O_MRAP_02_hmg_F",
                 "O_LSV_02_AT_F",
                 "O_LSV_02_armed_F"];
				 
_WestLightVeh = ["B_APC_Wheeled_01_cannon_F",
                 "B_APC_Tracked_01_CRV_F",
                 "B_MRAP_01_gmg_F",
                 "B_MRAP_01_hmg_F",
                 "B_APC_Tracked_01_AA_F",
                 "B_APC_Tracked_01_rcws_F",
                 "B_MBT_01_TUSK_F",
                 "B_LSV_01_AT_F",
                 "B_LSV_01_armed_F",
                 "B_Quadbike_01_F",
                 "B_AFV_Wheeled_01_up_cannon_F"];

_ResLightVeh = [
                "I_APC_Wheeled_03_cannon_F",
                "I_LT_01_AT_F",
                "I_LT_01_scout_F",
                "I_LT_01_cannon_F",
                "I_APC_tracked_03_cannon_F",
                "I_MBT_03_cannon_F",
                "I_G_Offroad_01_armed_F",
                "I_MRAP_03_gmg_F",
                "I_MRAP_03_hmg_F"];


private _startpos = [7921.2,4094.34,0];
private _Path = [
[7131.79,8963.67,0],
[5730.94,9374.4,0],
[4842.28,8109.35,0],
[2996.8,6056.06,0],
[5791.8,3539.89,0],
[7921.02,4094.8,0],
[8264.06,2870.03,0]
];



patrolon = true; publicVariable "patrolon";
private _Side = SelectRandom [west,east,resistance];
private _Model = [];
private _Timeout = 60*30;

if (_Side == west) Then {_Model = SelectRandom _WestLightVeh;};
if (_Side == east) Then {_Model = SelectRandom _EastLightVeh;}; 
if (_Side == resistance) Then {_Model = SelectRandom _ResLightVeh;};  


private _count = count _Path;


_Safepos = [8195.01,3895.79,0]; //[_startpos,10,200, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
_PatrolCar = [_Safepos, 0, _Model, _Side] call bis_fnc_spawnvehicle; 
_PatrolCarV = _PatrolCar select 0;
_PatrolCarGroup = group _PatrolCarV;
_crew = crew _PatrolCarV;
//player moveInCargo _PatrolCarV;
{
  _way = _PatrolCarGroup addWaypoint [_x, 0];
  _way setWaypointType "MOVE";
  _way setWaypointBehaviour "COMBAT";
  _way setWaypointCombatMode "RED";
  _way setWaypointSpeed "NORMAL";
  _way setWaypointCompletionRadius 50;
} foreach _Path;

_way = _PatrolCarGroup addWaypoint [(_Path Select _count-1), 0];
_way setWaypointType "MOVE";
_way setWaypointBehaviour "COMBAT";
_way setWaypointCombatMode "RED";
_way setWaypointSpeed "NORMAL";
_way setWaypointCompletionRadius 50;
_way setWaypointStatements ["true", "_veh = Vehicle this; {deleteVehicle _x;} ForEach crew _veh; _veh setDamage 1;patrolon = false; publicVariable 'patrolon';"];

[_PatrolCarV] Spawn {
    _PatrolCarV = _this select 0;
	_PatrolCarGroup = group _PatrolCarV;
	_leader = leader _PatrolCarGroup;
	_lv = vehicle _leader;
	_side = side _leader;
	_pos = Getpos _leader;
	_type = Typeof _lv;
    _txt = Format["%1",_type];
    _smc = "colorwhite";
	_pos = Getpos _leader;
	if (_Side == west ) Then {_smc = "ColorWEST";};
	if (_Side == east ) Then {_smc = "ColorEAST";};
	if (_Side == resistance ) Then {_smc = "ColorGUER";};
    _marker = createMarker [_txt,_pos]; 
    _marker setMarkerType "hd_destroy";
    _marker setMarkerText _txt;
    _marker setMarkerColor _smc;
    _marker setMarkerAlpha 0.5;	
 while {alive _leader} Do {
    _leader = leader _PatrolCarGroup;
	_lv = vehicle _leader;
    _pos = Getpos _leader;
	_type = Typeof _lv;
	_txt = Format["%1",_type];
	_marker setMarkerText _txt;
    _marker SetMarkerPos _pos;
	sleep 1;
  };
  deleteMarker _marker;
  patrolon = false; publicVariable "patrolon";
  _vehs = [1,[_type],_pos,100,120] Call GPF_fnc_EmptyVehicles;
  {_Vehpos = GetPos _x; _Signal = "SmokeShellOrange" createVehicle _Vehpos;} ForEach _vehs;
};



[_PatrolCarV,_Timeout,_crew] Spawn {
    _PatrolCarV = _this Select 0; 
	_Timeout = _this select 1; 
	_crew = _this select 2;
	_grp = group _PatrolCarV;
    Sleep _Timeout;
	{deleteVehicle _x;} foreach units _grp;
    {deleteVehicle _x;} foreach _crew;
	{deleteVehicle _x;} forEach allDeadMen;
	{deleteVehicle _x;} forEach allDead;
    If ((count (crew _PatrolCarV)) == 0) Then {deleteVehicle _PatrolCarV;};	
};

//_output = [_crew,_PatrolCarV];
//_output;