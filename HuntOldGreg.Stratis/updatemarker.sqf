[] spawn {
while{not isnull OldGreg} do { "og_marker" setmarkerpos getpos OldGreg; [east, 2] call BIS_fnc_respawnTickets; { hint "map updated"; } forEach allUnits; script = [] execVM "endmission.sqf"; sleep 300;};
};
