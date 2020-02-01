private _places = _this select 0;
private _targetRadias = 100;
private _name = "ShitStorm",
private _cnt = 0;
    
_CZmarkers = [];
{
 _txt = Format ["%1_%2",_name,_cnt];
 _marker = [_x,_targetRadias,_txt] call GPF_fnc_makeCZ;
 _cnt = _cnt+1;
 _CZmarkers = _CZmarkers + [_marker];
 sleep 1;
} foreach _places;

_on = true;
while {_on} Do {
  _WestScore = 0;
  _EastScore = 0;
  _RestScore = 0;
  //_CiviScore = 0;
  _DeadMarkers = 0;
  _TotalScore = count _CZmarkers;
  
  {_marker = _x; 
  if (getMarkerColor _marker == "ColorWEST") then {_WestScore = _WestScore+1;};
  if (getMarkerColor _marker == "ColorEAST") then {_EastScore = _EastScore+1;};
  if (getMarkerColor _marker == "ColorGUER") then {_RestScore = _RestScore+1;};
  //if (getMarkerColor _marker == "ColorCIV") then { _CiviScore = _CiviScore+1;};
  if (getMarkerColor _marker == "") then {_DeadMarkers = _DeadMarkers+1;};
  } Foreach _CZmarkers;
  
  if (_WestScore == _TotalScore) then {_on = false;[west] call GPF_fnc_endgame;};
  if (_EastScore == _TotalScore) then {_on = false;[east] call GPF_fnc_endgame;};
  if (_RestScore == _TotalScore) then {_on = false;[resistance] call GPF_fnc_endgame;};
  //if (_CiviScore == _TotalScore) then {_on = false;[civilian] call GPF_fnc_endgame;};
  //if (_DeadMarkers == _TotalScore) then {_on = false;};
  scores = Format ["| Blue %1/%4 | Red %2/%4 | Green %3/%4 |",_WestScore,_EastScore,_RestScore,_TotalScore];
  publicVariable "scores";
  //hint _txt;
  Sleep 1;
};

sleep 20;
"end1" call BIS_fnc_endMission;
{
 deleteMarker _x;
} foreach _CZmarkers;