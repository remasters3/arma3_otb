
private _westpos =_this select 0;
private _eastpos =_this select 1;
private _guerrilapos =_this select 2;
private _civilianpos =_this select 3;
private _markers = [];
private _helopads = [];
private _offset = 0;
private _WestRespawn = createMarker ["respawn_west",[(_westpos Select 0)-_offset,(_westpos Select 1),0]];_markers = _markers + [_WestRespawn];_WestRespawn setMarkerColor "colorWest";_WestRespawn setMarkerText "WEST HQ";
private _EastRespawn = createMarker ["respawn_east",[(_eastpos Select 0)-_offset,(_eastpos Select 1),0]];_markers = _markers + [_EastRespawn];_EastRespawn setMarkerColor "colorEast";_EastRespawn setMarkerText "EAST HQ";
private _guerrilaRespawn = createMarker ["respawn_guerrila",[(_guerrilapos Select 0)-_offset,(_guerrilapos Select 1),0]];_markers = _markers + [_guerrilaRespawn];_guerrilaRespawn setMarkerColor "ColorGUER";_guerrilaRespawn setMarkerText "GUER HQ";
private _civilianRespawn = createMarker ["respawn_civilian",[(_civilianpos Select 0)-_offset,(_civilianpos Select 1),0]];_markers = _markers + [_civilianRespawn];_civilianRespawn setMarkerColor "ColorCIV";_civilianRespawn setMarkerText "CIVI HQ";

{_x setMarkerType "hd_flag";_x setMarkerAlpha 0.5; } Foreach _markers;
{_helopad = "Land_HelipadRescue_F" createVehicle _x; _helopads = _helopads + [_helopad];} Foreach [_westpos,_eastpos,_guerrilapos,_civilianpos];
MarkersDone = True;
publicVariable "MarkersDone";