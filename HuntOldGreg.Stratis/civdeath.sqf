"og_marker" setmarkerpos getpos OldGreg; [east, 1] call BIS_fnc_respawnTickets; { hint "A Civilian has been Killed, Check your Map!"; } forEach allUnits;
script = [] execVM "endmission.sqf";