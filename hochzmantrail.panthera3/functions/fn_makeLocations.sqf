
 private ["_NewLocations","_location","_ltype","_lpos","_lString"];
_NewLocations = param[0];

{
_ltype = _x Select 0;
_lpos = _x Select 1;
_lString = _x Select 2;

_location = createLocation [ _ltype , _lpos, 30, 30];
_location setText _lString;
} Foreach _NewLocations;