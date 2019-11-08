_unit = _this select 0;
_marker = _this select 1;
_marker setMarkerColor "ColorGreen";

while{alive _unit}do{
  _marker setMarkerPos (getPos _unit);
  _marker setMarkerDir (getDir _unit);
  hint "OLD GREG HAS BEEN SPOTTED! CHECK YOUR MAP!";
  [east, 2] call BIS_fnc_respawnTickets;
_etickets = [east] call BIS_fnc_respawnTickets;
_wtickets = [west] call BIS_fnc_respawnTickets;
  sleep 10;
script = [] execVM "endmission.sqf";
  sleep 120;
};

_marker setMarkerColor "ColorRed"