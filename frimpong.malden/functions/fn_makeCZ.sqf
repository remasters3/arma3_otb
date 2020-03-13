// [_pos,_targetRadias,_name] call GPF_fnc_makeCZ;
private _pos = param [0];
private _targetRadias = param [1];
private _name = param [2];
private _list = [];
 _txt = Format["%1",_name];
 _smc = "colorwhite";
 _marker = createMarker [_txt,_pos]; 
 _marker setMarkerShape "ELLIPSE";
 _marker setMarkerText _txt;
 _marker setMarkerColor _smc;
 _marker setMarkerSize [_targetRadias, _targetRadias];
 _marker setMarkerBrush "DIAGGRID";
 _marker setMarkerAlpha 0.7;

[_marker,_targetRadias] Spawn {_marker = _this select 0; _targetRadias = _this Select 1; _czp = true;
  while {_czp} do {
    if (getMarkerColor _marker == "") then {_czp = false;} Else {
       _pos = GetMarkerPos _marker;
       _scores = [];
       _AllNear = [];
       _westcount = 0;
       _eastcount = 0;
       _restcount = 0;
       _civicount = 0;
      _list = _pos nearEntities [["Man"], _targetRadias];
      if ((count _list) > 0) Then {{_near = _x;_AllNear = _AllNear + [_near];} foreach _list;};
      _westcount = {side _x == west && alive _x} count _AllNear; 
      _eastcount = {side _x == east && alive _x} count _AllNear; 
      _restcount = {side _x == resistance && alive _x} count _AllNear;
      _civicount = {side _x == civilian && alive _x} count _AllNear; 
       
      if ((count _AllNear) > 0) Then {
       if (_westcount > _eastcount && _westcount > _restcount && _westcount > _civicount) Then { _side = west;_marker setMarkerColor "ColorWEST";};
       if (_eastcount > _westcount && _eastcount > _restcount && _eastcount > _civicount) Then {_side = east;_marker setMarkerColor "ColorEAST";};
       if (_restcount > _westcount && _restcount > _eastcount && _restcount > _civicount) Then {_side = resistance; _marker setMarkerColor "ColorGUER";};
       if (_civicount > _westcount && _civicount > _eastcount && _civicount > _restcount) Then {_side = civilian; _marker setMarkerColor "ColorCIV";};
       } Else {_marker setMarkerColor "colorwhite";};
    };
	sleep 1;
 };
};
_marker;