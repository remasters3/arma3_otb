_wtickets = [west] call BIS_fnc_respawnTickets;
_etickets = [east] call BIS_fnc_respawnTickets;
hint format ["%1 - The Hunters",_wtickets];
sleep 2;
hint format ["%1 - Old Greg",_etickets];
