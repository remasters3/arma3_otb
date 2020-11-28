_centerWorld = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
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
private _name = "ShitStorm";
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