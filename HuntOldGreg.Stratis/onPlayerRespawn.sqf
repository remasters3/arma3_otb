private["_wtickets","_etickets"];
_wtickets = [west] call BIS_fnc_respawnTickets;
_etickets = [east] call BIS_fnc_respawnTickets;
if (side player == west) then {hint format ["NATO has %1 ticket(s) left",_wtickets];};
if (side player == east) then {hint format ["CSAT has %1 ticket(s) left",_etickets];};