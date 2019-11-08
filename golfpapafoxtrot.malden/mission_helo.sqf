_EastLightVeh = [
   "O_Heli_Attack_02_dynamicLoadout_F",
   "O_Heli_Light_02_dynamicLoadout_F"
];
				 
_WestLightVeh = [
    "B_Heli_Light_01_dynamicLoadout_F",
    "B_Heli_Attack_01_dynamicLoadout_F"
];

_ResLightVeh = ["I_Heli_light_03_dynamicLoadout_F"];


private _startpos = [7921.2,4094.34,0];
private _Path = [
[1178.36,607.852,0],
[2497.2,3674.78,0],
[4914.38,8657.88,0],
[7034.06,7181.01,0],
[7777.81,4062.59,0],
[11637.7,4483.52,0]
];



heloOn = true; publicVariable "heloOn";
private _Side = SelectRandom [west,east,resistance];
private _Model = [];
private _Timeout = 60*30;

if (_Side == west) Then {_Model = SelectRandom _WestLightVeh;};
if (_Side == east) Then {_Model = SelectRandom _EastLightVeh;}; 
if (_Side == resistance) Then {_Model = SelectRandom _ResLightVeh;};  


private _count = count _Path;


private _Safepos = _Path select 0; //[_startpos,10,200, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
private _Helo = [_Safepos, 0, _Model, _Side] call bis_fnc_spawnvehicle; 
private _HeloV = _Helo select 0;
private _HeloGroup = group _HeloV;
private _crew = crew _HeloV;

{
  _way = _HeloGroup addWaypoint [_x, 0];
  _way setWaypointType "MOVE";
  _way setWaypointBehaviour "COMBAT";
  _way setWaypointCombatMode "RED";
  _way setWaypointSpeed "NORMAL";
  _way setWaypointCompletionRadius 50;
} foreach _Path;

  _way = _HeloGroup addWaypoint [(_Path Select _count-1), 0];
  _way setWaypointType "MOVE";
  _way setWaypointBehaviour "COMBAT";
  _way setWaypointCombatMode "RED";
  _way setWaypointSpeed "NORMAL";
  _way setWaypointCompletionRadius 50;
  _way setWaypointStatements ["true", "_veh = Vehicle this; {deleteVehicle _x;} ForEach crew _veh; _veh setDamage 1;heloOn = false; publicVariable 'heloOn';"];

[_HeloV] Spawn {
    _HeloV = _this select 0;
	_HeloGroup = group _HeloV;
	_leader = leader _HeloGroup;
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
    _leader = leader _HeloGroup;
	_lv = vehicle _leader;
    _pos = Getpos _leader;
	_type = Typeof _lv;
	_txt = Format["%1",_type];
	_marker setMarkerText _txt;
    _marker SetMarkerPos _pos;
	sleep 1;
  };
  deleteMarker _marker;
  heloOn = false; publicVariable "heloOn";
  _vehs = [1,[_type],_pos,100,120] Call GPF_fnc_EmptyVehicles;
  {_Vehpos = GetPos _x; _Signal = "SmokeShellOrange" createVehicle _Vehpos;} ForEach _vehs;
};



[_HeloV,_Timeout,_crew] Spawn {
    _HeloV = _this Select 0; 
	_Timeout = _this select 1; 
	_crew = _this select 2;
	_grp = group _HeloV;
    Sleep _Timeout;
	{deleteVehicle _x;} foreach units _grp;
    {deleteVehicle _x;} foreach _crew;
	{deleteVehicle _x;} forEach allDeadMen;
	{deleteVehicle _x;} forEach allDead;
    If ((count (crew _HeloV)) == 0) Then {deleteVehicle _HeloV;};	
};

//_output = [_crew,_HeloV];
//_output;