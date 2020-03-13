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

_centerWorld = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");

_debug = true;
if (_debug) then {
   //debug_player setPos _centerWorld;
   debug_player AddAction ["Kill", "_veh = cursorTarget; _veh SetDamage 1;"];
   debug_player AddAction ["Tagert2Clip", "systemchat str(typeOf cursortarget); copyToClipboard str(typeOf cursortarget);"];
   debug_player AddAction ["Heal","_this Select 0 SetDamage 0"];    
   debug_player addAction ["debug.sqf", "execVM 'debug.sqf';"];
   debug_player AddAction ["CivRespawnMarker","vehicle player SetPos [559.729,1423.49,81.3931];"];    /*(getMarkerPos 'respawn_civilian');*/
   debug_player AddAction ["VKill","{_x SetDamage 1;} Foreach vehicles;{deleteVehicle _x;} forEach allDeadMen;{deleteVehicle _x;} forEach allDead;"];   
   debug_player AddAction ["EKill","{if (side _x == EAST) then { _x SetDamage 1;};} Foreach AllUnits;"];
   debug_player AddAction ["WKill","{if (side _x == WEST) then { _x SetDamage 1;};} Foreach AllUnits;"];
   debug_player AddAction ["RKill","{if (side _x == Resistance) then { _x SetDamage 1;};} Foreach AllUnits;"];
   debug_player AddAction ["KillAll","{if (_x != debug_player) Then {_x SetDamage 1;};} Foreach AllUnits;"];
   debug_player AddAction ["Pos2Clip", "[(_this Select 0)] Call GPF_fnc_Pos2Clip;"];
   debug_player AddAction ["Route2Clip",'_posistions=[];{if ((markerType _x) == "mil_destroy") Then {_posistions = _posistions+[(GetMarkerPos _x)];};} foreach allMapMarkers;copyToClipboard format ["%1",_posistions];'];
   
   /*[]Spawn{
		while {true} do {
		hint format ["| WEST:%1 | EAST:%2 | GUER:%3 |",scoreSide west,scoreSide east,scoreSide resistance];
		sleep 1;
		};
	};*/
   
} else {deleteVehicle debug_player;};

[_centerWorld]execVM "places.sqf";


if (isDedicated or isServer) then {
	[] Spawn {while {true} do{Sleep 300;{deleteVehicle _x;} forEach allDeadMen;{deleteVehicle _x;} forEach allDead;};};
	["Initialize", [true]] call BIS_fnc_dynamicGroups;
};
waitUntil {time > 20};