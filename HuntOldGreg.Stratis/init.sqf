
if ((!isServer) && (player != player)) then {
waitUntil {player == player};
};
enableSaving [false, false];
player enableFatigue false;
script = [] execVM "updatemarker.sqf";
//script = [] execVM "endmission.sqf";
[west,100] call BIS_fnc_respawnTickets;
[east,0] call BIS_fnc_respawnTickets;