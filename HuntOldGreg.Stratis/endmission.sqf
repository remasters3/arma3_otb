_scorelimit = 199;
_wtickets = [west] call BIS_fnc_respawnTickets;
_etickets = [east] call BIS_fnc_respawnTickets;
_endround = false;
if ((_wtickets > _scorelimit) || (_etickets > _scorelimit)) then {{ "END1" call BIS_fnc_endMission;} forEach allUnits;_endround = true;};