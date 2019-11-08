if ((!isServer) && (player != player)) then {
waitUntil {player == player};
};
enableSaving [false, false];
player enableFatigue false;
player enableStamina false;

Resistance setFriend [East, 0];
Resistance setFriend [West, 0];
East setFriend [Resistance, 0];
East setFriend [West, 0];
West setFriend [Resistance, 0];
West setFriend [East, 0];

//_centerWorld = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_centerWorld = [5515.61,6277.11,0];
[_centerWorld]execVM "places.sqf";

if (isDedicated or isServer) then {
    ["Initialize"] call BIS_fnc_dynamicGroups;
    missionon = true; publicVariable "missionon";
    winner = nil; publicVariable "winner";
    patrolon = false; publicVariable "patrolon";
	planeon = false; publicVariable "planeon";
	baseson = false; publicVariable "baseson";
	heloOn = false; publicVariable "heloOn";
	[] Spawn {while {missionon} do{Sleep 300;{deleteVehicle _x;} forEach allDeadMen;{deleteVehicle _x;} forEach allDead;};};
	[_centerWorld] execVM 'CZmarkers.sqf';
	[_centerWorld] execVM 'civ_rescue.sqf';
	[_centerWorld] execVM 'west_rescue.sqf';
	[_centerWorld] execVM 'east_rescue.sqf';
	[_centerWorld] execVM 'rest_rescue.sqf';
	[] Spawn { while {missionon} Do {if (!patrolon) Then {sleep 60;[]execVM "mission_patrol.sqf";};Sleep 300;};};
	[] Spawn { while {missionon} Do {if (!baseson) Then {sleep 60;[]execVM "mission_bases.sqf";};Sleep 300;};};
	[] Spawn { while {missionon} Do {if (!planeon) Then {sleep 60;[]execVM "mission_plane.sqf";};Sleep 300;};};
	[] Spawn { while {missionon} Do {if (!heloOn) Then {sleep 60;[]execVM "mission_helo.sqf";};Sleep 300;};};
	
};
waitUntil {time > 20};