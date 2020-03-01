_westpos =_this select 0;
_eastpos =_this select 1;
_guerrilapos =_this select 2;
_civilianpos =_this select 3;
//_centre = _this select 4;
_markers = [];
_offset = 10;
// West Markers
_westspawnpos = [_westpos, 15,270] call BIS_fnc_relPos;
_WestRespawn = createMarker ["respawn_west",_westspawnpos];_markers = _markers + [_WestRespawn];
_WestEvacMarker = createMarker ["marker_b_helipad",[(_westpos Select 0),(_westpos Select 1),0]];
/*_WestEvacMarker setMarkerColor "ColorWEST";
_WestEvacMarker setMarkerType "mil_flag";*/

//------------
//East Markers
_EastRespawn = createMarker ["respawn_east",[(_eastpos Select 0)-_offset,(_eastpos Select 1),0]];_markers = _markers + [_EastRespawn];
_EastEvacMarker = createMarker ["marker_r_helipad",[(_eastpos Select 0),(_eastpos Select 1),0]];
/*_EastEvacMarker setMarkerColor "ColorEast";
_EastEvacMarker setMarkerType "mil_flag";*/
//------------
// Resistance Markers
_guerrilaRespawn = createMarker ["respawn_guerrila",[(_guerrilapos Select 0)-_offset,(_guerrilapos Select 1),0]];_markers = _markers + [_guerrilaRespawn];
_GuerrilaEvacMarker = createMarker ["marker_g_helipad",[(_guerrilapos Select 0),(_guerrilapos Select 1),0]];
/*_GuerrilaEvacMarker setMarkerColor "ColorGUER";
_GuerrilaEvacMarker setMarkerType "mil_flag";*/
//------------
// Civ Markers
_civilianRespawn = createMarker ["respawn_civilian",[(_civilianpos Select 0)-_offset,(_civilianpos Select 1),0]];_markers = _markers + [_civilianRespawn];
//------------

{_x setMarkerType "Empty"; } Foreach _markers;
{
_pad = createVehicle ["Land_HelipadCivil_F", (GetMarkerPos _x), [], 0, "FORM"];
} Foreach [_WestEvacMarker,_EastEvacMarker,_GuerrilaEvacMarker];




//{
// _sz = 375+_x;
// _txt = Format["CZ%1",_sz];
// _smc = "colorwhite";
// _marker = createMarker [_txt,_centre]; 
// _marker setMarkerShape "ELLIPSE";
// _marker setMarkerText _txt;
// _marker setMarkerColor _smc;
// _marker setMarkerSize [_sz,_sz];
// _marker setMarkerBrush "Border";
// _marker setMarkerAlpha 0.7;
// _markers = _markers + [_marker];
//} foreach [0,250];

MarkersDone = True;
publicVariable "MarkersDone";