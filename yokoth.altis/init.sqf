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
_centers = [
	[19639,8404.59,0],
	[23399.7,18899.8,0],
	[12813,16671.7,0],
	[11182.9,8721.09,0],
	[11182.9,8721.09,0],
	[21013,7317.08,0],
	[16085,17000.2,0],
	[16085,17000.2,0],
	[25304.3,21808.3,0],
	[9682.51,15142.2,0],
	[14349.3,18946,0],
	[21037.9,14758.4,0],
	[6178.33,16244.8,0],
	[8555.76,20909.2,0],
	[25295.1,21807,0]
	];
_centerWorld = SelectRandom _centers;
//_centerWorld = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");

_debug = true;
if (_debug) then {
   //debug_player setPos _centerWorld;
   debug_player AddAction ["Kill", "_veh = cursorTarget; _veh SetDamage 1;"];
   debug_player AddAction ["Heal","_this Select 0 SetDamage 0"];    
   debug_player addAction ["debug.sqf", "execVM 'debug.sqf';"];
   debug_player AddAction ["loopoff", "gameon = false;"];
   debug_player AddAction ["CenterWorld","_centerWorld = getArray(configFile >> 'CfgWorlds' >> worldName >> 'centerPosition');_scwPos = [(_centerWorld Select 0)+10,(_centerWorld Select 1)+10,0];vehicle player SetPos _scwPos;"]; 
   debug_player AddAction ["VKill","{_x SetDamage 1;} Foreach vehicles;"];   
   debug_player AddAction ["EKill","{if (side _x == EAST) then { _x SetDamage 1;};} Foreach AllUnits;"]; 
   debug_player AddAction ["WKill","{if (side _x == WEST) then { _x SetDamage 1;};} Foreach AllUnits;"]; 
   debug_player AddAction ["Pos2Clip", "[(_this Select 0)] Call GPF_fnc_Pos2Clip;"];
} else {deleteVehicle debug_player;};


[_centerWorld]execVM "places.sqf",



if (isDedicated or isServer) then {
	[] Spawn {while {true} do{Sleep 300;{deleteVehicle _x;} forEach allDeadMen;{deleteVehicle _x;} forEach allDead;};};

};
waitUntil {time > 20};