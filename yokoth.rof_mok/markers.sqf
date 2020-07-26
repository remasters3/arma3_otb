_westpos =_this select 0;
_eastpos =_this select 1;
_guerrilapos =_this select 2;
_civilianpos =_this select 3;
_centre = _this select 4;
_markers = [];
_offset = 10;
_WestRespawn = createMarker ["respawn_west",[(_westpos Select 0)-_offset,(_westpos Select 1),0]];_markers = _markers + [_WestRespawn];
_EastRespawn = createMarker ["respawn_east",[(_eastpos Select 0)-_offset,(_eastpos Select 1),0]];_markers = _markers + [_EastRespawn];
_guerrilaRespawn = createMarker ["respawn_guerrila",[(_guerrilapos Select 0)-_offset,(_guerrilapos Select 1),0]];_markers = _markers + [_guerrilaRespawn];
_civilianRespawn = createMarker ["respawn_civilian",[(_civilianpos Select 0)-_offset,(_civilianpos Select 1),0]];_markers = _markers + [_civilianRespawn];

{_x setMarkerType "Empty"; } Foreach _markers;

// {
//  _sz = 375+_x;
//  _txt = Format["CZ%1",_sz];
//  _smc = "colorwhite";
//  _marker = createMarker [_txt,_centre]; 
//  _marker setMarkerShape "ELLIPSE";
//  _marker setMarkerText _txt;
//  _marker setMarkerColor _smc;
//  _marker setMarkerSize [_sz,_sz];
//  _marker setMarkerBrush "Border";
//  _marker setMarkerAlpha 0.7;
//  _markers = _markers + [_marker];
// } foreach [0,250];

MarkersDone = True;
publicVariable "MarkersDone";