//[unit] call GPF_fnc_WPLocation
private _unit = _this select 0;
private _locs = _this select 1;
private _rloop = _this select 2;
private _grp = group _unit;
private _pos = [0,0,0];
private _lCount = count _locs;
private _index = _lCount-1;
private _rv = [];
{_rv = _rv+[_x]} foreach _locs;

_allwps = waypoints _unit; {deleteWaypoint [_grp, 0]} foreach _allwps;

{
_pos = _x;
_way = _grp addWaypoint [[(_pos select 0),(_pos select 1),0], 0];
_way setWaypointType "MOVE";
_way setWaypointCompletionRadius 5;
_way setWaypointBehaviour "COMBAT";
_way setWaypointCombatMode "RED";
_way setWaypointSpeed "FULL";
_way setWaypointStatements ["true","if ((vehicle this) != this)then {_veh = vehicle this;_veh SetFuel 1;_veh setdamage 0;};"];
} foreach _locs;

_epos = _locs select _index;
_Finalway = _grp addWaypoint [[(_epos select 0),(_epos select 1),0], 0];
_Finalway setWaypointType "MOVE";
_Finalway setWaypointCompletionRadius 5;
_Finalway setWaypointBehaviour "COMBAT";
_Finalway setWaypointCombatMode "RED";
_Finalway setWaypointSpeed "FULL";
_Finalway setWaypointStatements ["true","if ((vehicle this) != this)then {_veh = vehicle this;_veh SetFuel 1;_veh setdamage 0;};_params = this getVariable 'gpf_wploop';[this,(_params select 0),(_params select 1)] call GPF_fnc_WPLoop;"];

if (_rloop == 1) Then {reverse _rv;};

_unit setVariable["gpf_wploop",[_rv,_rloop],false];
systemchat format ["This - %1",_locs];
systemchat format ["Next - %1",_rv]; 





//"NameVillage","NameCity","Mount","NameCityCapital","NameLocal"
// _list = (position _unit) nearRoads 50;
/*private _unit = _this select 0;
private _rad = _this select 1;
private _defaultPos = _this select 2;
[_unit,_rad]spawn{_unit = _this select 0;_rad = _this select 1;
	
	private _grp = group _unit;
	private _centerWorld = GetPos _unit;
	private _allPlaces = [];
	private _pCount = count _allPlaces;
	private _pIndex = _pCount-1;
	private _trad = _rad;
	while {(_pCount < 1)}do {
		_allPlaces = nearestLocations [_centerWorld, ["NameVillage","NameCity","NameCityCapital"],_trad];
		if ((count _allPlaces) > 0) Then {
			_pIndex = (count _allPlaces)-1;
			_nl = _allPlaces select _pIndex;
			_lpos = locationPosition _nl;
				if ((_unit distance _lpos) < _rad) Then {
				_pCount = 0;	
				} Else {
				_pCount = count _allPlaces;
				};
			};
		_trad = _trad+_rad;
		sleep 1;
	};
	private _nl = _allPlaces select _pIndex;
	private _lpos = locationPosition _nl;
	private _roads = _lpos nearRoads _rad;
	private _rCount = count _roads;
	_trad = _rad;
	_pos = GetPos _unit;
	_retry = 0;
	while {((_pos distance _unit) < _rad)}do {
		if (_retry > 10) Then {
		_pos = _defaultPos;
		} Else {
		_roads = _lpos nearRoads _trad;
		_trad = _trad+_rad;
		_rCount = count _roads;
		_rIndex = _rCount-1;
		_road = _roads select _rIndex;
		_pos = GetPos _road;
		};
		_retry = _retry+1;
		systemchat format ["%1",_unit distance _pos];
		sleep 1;
	};
	_unit setVariable["gpf_wploop",_rad,false];
	_unit setVariable["gpf_wpDPos",_defaultPos,false];
	_allwps = waypoints _unit; {deleteWaypoint [(group _unit), 0]} foreach _allwps;
	_way = _grp addWaypoint [[(_pos select 0),(_pos select 1),0], 0];
	_way setWaypointType "MOVE";
	_way setWaypointCompletionRadius 5;
	_way setWaypointBehaviour "COMBAT";
	_way setWaypointCombatMode "RED";
	_way setWaypointSpeed "FULL";
	_way setWaypointStatements ["true","if ((vehicle this) != this)then {_veh = vehicle this;_veh SetFuel 1;_veh setdamage 0;};[this,(this getVariable 'gpf_wploop'),(this getVariable 'gpf_wpDPos')] call GPF_fnc_WPLoop"];	
};
*/

/*
private _nl = _allPlaces select _pIndex;
private _lpos = locationPosition _nl;
private _roads = _lpos nearRoads _rad;
private _count = count _roads;
private _index = _count-1;
private _road = _roads select _index;
private _pos = GetPos _road;

_unit setVariable["gpf_wploop",_rad,false];
_allwps = waypoints _unit; {deleteWaypoint [(group _unit), 0]} foreach _allwps;
_way = _grp addWaypoint [[(_pos select 0),(_pos select 1),0], 0];
_way setWaypointType "MOVE";
_way setWaypointCompletionRadius 5;
_way setWaypointBehaviour "COMBAT";
_way setWaypointCombatMode "RED";
_way setWaypointSpeed "FULL";
_way setWaypointStatements ["true","if ((vehicle this) != this)then {vehicle this setfuel 1;vehicle this setdamage 0;};[this,(this getVariable 'gpf_wploop')] call GPF_fnc_WPLoop"];
systemchat format ["%1",_unit distance _road];
_way
/*
_grp = group _unit;
_roads = _unit nearRoads _rad;
_count = count _roads;
_index = _count-1;
_road = _roads select _index;
_way = "";
_pos = GetPos _road;
_trad = _rad;
while {((_unit distance _pos) < 200)} Do {
_roads = _unit nearRoads _trad;
_count = count _roads;
_index = _count-1;
_road = _roads select _index;
_pos = GetPos _road;
_trad = _trad+200;
systemchat format ["%1",_trad];
};
_unit setVariable["gpf_wploop",_rad,false];
_allwps = waypoints _unit; {deleteWaypoint [(group _unit), 0]} foreach _allwps;
_way = _grp addWaypoint [[(_pos select 0),(_pos select 1),0], 0];
_way setWaypointType "MOVE";
_way setWaypointCompletionRadius 5;
_way setWaypointBehaviour "COMBAT";
_way setWaypointCombatMode "RED";
_way setWaypointSpeed "FULL";
_way setWaypointStatements ["true","if ((vehicle this) != this)then {vehicle this setfuel 1;vehicle this setdamage 0;};[this,(this getVariable 'gpf_wploop')] call GPF_fnc_WPLoop"];
systemchat format ["%1",_unit distance _road];
_way
*/
// if (isOnRoad _unit) Then {_road = roadAt _unit; } Else {_road = selectRandom _roads;};
/*
if (isOnRoad _unit) Then {_road = roadAt _unit; } Else {_road = selectRandom _roads;};
_unit setVariable["gpf_wploop",_rad,false];
_allwps = waypoints _unit; {deleteWaypoint [(group _unit), 0]} foreach _allwps;
//if (isNull _road) then {
//	while {(isNull _road)} Do {_road = selectRandom _roads;};
//};
_connectedRoads = roadsConnectedTo _road;
systemchat format ["%1",_connectedRoads];
if ((count _connectedRoads) > 0) then {
_index = count _connectedRoads;
_croad = _connectedRoads select _index-1;
_pos = GetPos _croad;
if ((_unit distance _pos) < 10) Then {_pos = GetPos _road;};
_way = _grp addWaypoint [[(_pos select 0),(_pos select 1),0], 0];
} Else {
_pos = GetPos _road;
_way = _grp addWaypoint [[(_pos select 0),(_pos select 1),0], 0];

};
_way setWaypointType "MOVE";
_way setWaypointCompletionRadius 5;
_way setWaypointBehaviour "COMBAT";
_way setWaypointCombatMode "RED";
_way setWaypointSpeed "FULL";
_way setWaypointStatements ["true","[this,(this getVariable 'gpf_wploop')] call GPF_fnc_WPLoop"];
_way 

*/