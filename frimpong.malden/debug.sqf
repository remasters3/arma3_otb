private _centerWorld = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
copyToClipboard format ["%1",(markerType 'WPMarker_0')];
_allPlaces = nearestLocations [_centerWorld, ["NameVillage","NameCity","Mount","NameCityCapital","NameLocal"],10000];
_nl = SelectRandom _allPlaces;
_cpos = locationPosition _nl;
_roads = _cpos nearRoads 1000;
_road = selectrandom _roads;
_pos = [6290.04,10830,0];//GetPos _road;
_WaveGroup = createGroup [east, false];
_veh = createVehicle ["I_MRAP_03_F",_pos, [], 0, "FORM"];
_unit = _WaveGroup createUnit ["C_Man_ConstructionWorker_01_Red_F", _pos,[], 0,"FORM"];
_unit setVariable["gpf_wploop_veh",_veh,true];
_unit addEventHandler ["GetOutMan", {_unit = _this select 0;_veh = _this select 2;_veh SetDamage 0;_veh SetFuel 1;}];
_unit moveindriver _veh;
_posistions=[];
_markers = [];

systemchat format ["%1",_posistions];
_nbr = selectRandom [0,1];
_posistions = [_nbr] Call GPF_fnc_MaldenRoute;
_params = [_unit,_posistions,_nbr];
_way = _params call GPF_fnc_WPLoop;
sleep 1;
_veh SetDir 270;
_veh SetPos [6290.04,10830,0];
_veh SetDamage 0.6;
_veh SetFuel 0.3;
//player SetPos (_posistions select 0);
//{player setpos _x;sleep 2;}foreach _posistions;
//systemchat format ["%1",_rv];
// ["WPMarker_0","WPMarker_1","WPMarker_2","WPMarker_3","WPMarker_4","respawn_west","marker_b_helipad","respawn_east","marker_r_helipad","respawn_guerrila","marker_g_helipad","respawn_civilian"]

// private _accmodel = "Land_Carrier_01_base_F";
// private _accpos = [559.729,1423.49,80];
// _acc = createVehicle [_accmodel, _accpos, [], 0, 'FORM'];
// _acc SetPos _accpos;
// _acc setVectorDirAndUp [[1,0,0],[0,0,1]];
// SLEEP 5;
// deletevehicle _acc;
//["helloWorld",player,0] remoteExecCall ["GPF_fnc_playerMSG",0, false];
/*
private _centerWorld = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
private _AllClss = (configfile >> "CfgVehicles") call BIS_fnc_getCfgSubClasses;
private _SideTag = "I_";
private _VehTag = "_MRAP_";
private _WepTag = "_hmg_";
private _startPos = GetPos player;
private _start_dir = GetDir player;
private _inc = 20;
private _dist = 20;
private _SideClss = [];
private _VehClss = [];
private _wepClss = [];
private _cb = [];
//private _isBenifit = _uid in _benifits;

{
	if (_SideTag in _x) Then { 
		//systemchat Format ["%1",_x];
		_SideClss = _SideClss + [_x];
	};
} foreach _AllClss;

{
	if (_VehTag in _x) Then { 
		//systemchat Format ["%1",_x];
		_VehClss = _VehClss + [_x];
	};
} foreach _SideClss;

{
	if (_WepTag in _x) Then { 
		_wepClss = _wepClss + [_x];
	};
} foreach _VehClss;

{
	if (_VehTag in _x) Then { 
		
		_cb = _cb + [_x];
	};
} foreach _wepClss;




{
 _pos = [_startPos, _dist, _start_dir] call BIS_fnc_relPos;
 _veh = [_pos,(_start_dir+90),_x,(_inc-1)] call GPF_fnc_SpawnVehicle;
 _dist = _dist+_inc;
 systemchat Format ["%1",_x];
} Foreach _cb;
*/

/*
_Allvehparams = [];
// _veh = [_pos,_dir,_model,10] call GPF_fnc_SpawnVehicle;
{	
	_tvehparams = [];
	_pos = GetPos _x;
	_dir = GetDir _x;
	_model = typeOf _x;
	_tvehparams = [_pos,_dir,_model,10];
	_Allvehparams = _Allvehparams + [_tvehparams];
} foreach vehicles;

copyToClipboard format ["%1",_Allvehparams];
*/



//_WaveGroup = createGroup [west, false];
//_unit = _WaveGroup createUnit ["B_recon_LAT_F", (getPos player),[], 0,"FORM"];
//_allPlaces = nearestLocations [(getpos player), ["NameVillage","NameCity","Mount","NameCityCapital","NameLocal"],500];
//_nl = _allPlaces select 0;
//_cpos = locationPosition _nl;
//_pos = [(_cpos select 0),(_cpos select 1),0];
//_way1 = group player addWaypoint [_pos, 0];
//_way1 setWaypointCompletionRadius 10;
//_way1 setWaypointStatements ["true","[this] call GPF_fnc_WPLocation"];
//_way1 setWaypointType "MOVE";
//_way1 setWaypointBehaviour "COMBAT";
//_way1 setWaypointCombatMode "RED";
//_way1 setWaypointSpeed "FULL";
// [player] call GPF_fnc_WPLoop;

//cutText ["Hello World!","PLAIN",2];

/*
private _rad = 500;
	private _grp = group _unit;
	private _centerWorld = GetPos _unit;
	private _allPlaces = [];
	private _pCount = count _allPlaces;
	private _trad = _rad;
	while {(_pCount < 1)}do {
		_allPlaces = nearestLocations [_centerWorld, ["NameVillage","NameCity","NameCityCapital"],_trad];
		_trad = _trad+1000;
		_pCount = count _allPlaces;
		sleep 1;
	};
	private _pIndex = _pCount-1;
	private _nl = _allPlaces select _pIndex;
	private _lpos = locationPosition _nl;
	private _roads = _lpos nearRoads _rad;
	private _rCount = count _roads;
	_trad = _rad;
	while {(_rCount < 1)}do {
		_roads = _lpos nearRoads _trad;
		_trad = _trad+1000;
		_rCount = count _roads;
		sleep 1;
	};
	systemchat format ["%1",_rCount];
//systemchat format ["%1",_allPlaces];
*/

