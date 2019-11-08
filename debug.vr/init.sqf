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

//_centerWorld = [12814,16670.7,0];//[13452.8,17885.6,0];
_centerWorld = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");

_debug = true;
if (_debug) then { 
   player AddAction ["Kill", "_veh = cursorTarget; _veh SetDamage 1;"];
   player AddAction ["Heal","_this Select 0 SetDamage 0"];    
   player addAction ["debug.sqf", "execVM 'debug.sqf';"];
   player AddAction ["loopoff", "gameon = false;"];
   player AddAction ["CenterWorld","_centerWorld = getArray(configFile >> 'CfgWorlds' >> worldName >> 'centerPosition');_scwPos = [(_centerWorld Select 0)+10,(_centerWorld Select 1)+10,0];vehicle player SetPos _scwPos;"]; 
   player AddAction ["VKill","{_x SetDamage 1;} Foreach vehicles;"];   
   player AddAction ["EKill","{if (side _x == EAST) then { _x SetDamage 1;};} Foreach AllUnits;"]; 
   player AddAction ["WKill","{if (side _x == WEST) then { _x SetDamage 1;};} Foreach AllUnits;"]; 
   player AddAction ["Pos2Clip", "[(_this Select 0)] Call GPF_fnc_Pos2Clip;"];
};


[_centerWorld]execVM "places.sqf";



if (isDedicated or isServer) then {
	[] Spawn {while {true} do{Sleep 300;{deleteVehicle _x;} forEach allDeadMen;{deleteVehicle _x;} forEach allDead;};};
	[_centerWorld] Spawn { _centerWorld = _this Select 0;
	while {true} do {[_centerWorld]execVM "demo.sqf";sleep 20;};
	};
};
waitUntil {time > 20};