_westpos =_this select 0;
_eastpos =_this select 1;
_guerrilapos =_this select 2;
_civilianpos =_this select 3;
_markers = [];
_offset = 10;
_WestRespawn = createMarker ["respawn_west",[(_westpos Select 0)-_offset,(_westpos Select 1),0]];_markers = _markers + [_WestRespawn];
_EastRespawn = createMarker ["respawn_east",[(_eastpos Select 0)-_offset,(_eastpos Select 1),0]];_markers = _markers + [_EastRespawn];
_guerrilaRespawn = createMarker ["respawn_guerrila",[(_guerrilapos Select 0)-_offset,(_guerrilapos Select 1),0]];_markers = _markers + [_guerrilaRespawn];
//_civilianRespawn = createMarker ["respawn_civilian",[(_civilianpos Select 0)-_offset,(_civilianpos Select 1),0]];_markers = _markers + [_civilianRespawn];

{_x setMarkerType "Empty"; } Foreach _markers;

MarkersDone = True;
publicVariable "MarkersDone";