planeon = true; publicVariable "planeon";

private _westAircraft = [
    "B_Plane_CAS_01_dynamicLoadout_F",
    "B_Plane_Fighter_01_Stealth_F"
    ];

private _eastAircraft = [
    "O_Plane_CAS_02_dynamicLoadout_F",
    "O_Plane_Fighter_02_Stealth_F"
	];

private _restAircraft = [
    "I_Plane_Fighter_03_dynamicLoadout_F",
    "I_Plane_Fighter_04_F"
	];

private _model = "C_Plane_Civil_01_F";
private _Sides = [west,east,resistance];
private _side = selectRandom _Sides;
private _Timeout = 60*20;

if (_side == west) Then {_model = selectRandom _westAircraft};
if (_side == east) Then {_model = selectRandom _eastAircraft};
if (_side == resistance) Then {_model = selectRandom _restAircraft};

private _centerWorld = [5515.61,6277.11,0];
private _allPlaces = nearestLocations [_centerWorld, ["NameVillage"], 5000];
private _places = [];
{_nl = locationPosition _x;_places = _places + [_nl];} Foreach _allPlaces;
private _spawnplane = [[12532.8,212.272,0], 0, _model, _side] call bis_fnc_spawnvehicle;
private _plane = _spawnplane select 0;
private _Group = group _plane;

{ 
 _way = _Group addWaypoint [_x, 0];
 _way setWaypointType "MOVE";
 _way setWaypointBehaviour "COMBAT";
 _way setWaypointCombatMode "RED";
 _way setWaypointSpeed "NORMAL";
 _way setWaypointCompletionRadius 50;
}Foreach _places;

_count = count _places;
_way = _Group addWaypoint [(_places Select _count-1), 0];
_way setWaypointType "MOVE";
_way setWaypointBehaviour "COMBAT";
_way setWaypointCombatMode "RED";
_way setWaypointSpeed "NORMAL";
_way setWaypointCompletionRadius 50;
_way setWaypointStatements ["true", "_veh = Vehicle this; _veh landAt 0;"];

[_plane] Spawn { _plane = _this select 0;
    _grp = group _plane;
	_leader = leader _grp;
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
      if (speed _plane < 10) then { {deleteVehicle _x} Foreach crew _plane; _plane engineOn false;};
      _leader = leader _grp;
  	_lv = vehicle _leader;
  	_type = Typeof _lv;
      _pos = Getpos _leader;
  	_txt = Format["%1",_type];
      _marker SetMarkerPos _pos;
  	_marker setMarkerText _txt;
  	sleep 1;
  	};
  deleteMarker _marker;
  planeon = false; publicVariable "planeon";
};

[_plane,_Timeout] Spawn {
    _plane = _this Select 0; 
	_Timeout = _this select 1; 
	_crew = crew _plane;
	_grp = group _plane;
    Sleep _Timeout;
	{deleteVehicle _x;} foreach units _grp;
    {deleteVehicle _x;} foreach _crew;
	{deleteVehicle _x;} forEach allDeadMen;
	{deleteVehicle _x;} forEach allDead;
	_Signal = "SmokeShellOrange" createVehicle Getpos _plane;
	sleep 60;
    If ((count (crew _plane)) == 0) Then {deleteVehicle _plane;};
	deleteVehicle _Signal;
};