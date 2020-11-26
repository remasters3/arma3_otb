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
_centers = [[10365.2,18682.9,0],
			[9888.03,20236.2,0],
			[9211.08,17063.2,0],
			[13731.8,16459.6,0],
			[3684.38,4407.33,0],
			[15246.5,12897.1,0],
			[14648,16272.7,0]
		   ];
// _centerWorld = SelectRandom _centers; /*_centers select 2;*/
_centerWorld = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");

_debug = true;
if (_debug) then {
   //debug_player setPos _centerWorld;
   debug_player AddAction ["Kill", "_veh = cursorTarget; _veh SetDamage 1;"];
   debug_player AddAction ["Heal","_this Select 0 SetDamage 0"];    
   debug_player addAction ["debug.sqf", "execVM 'debug.sqf';"];
   debug_player AddAction ["loopoff", "gameon = false;"];
   debug_player AddAction ["CenterWorld","vehicle player SetPos (getMarkerPos 'respawn_civilian');"];    
   debug_player AddAction ["VKill","{_x SetDamage 1;} Foreach vehicles;"];   
   debug_player AddAction ["EKill","{if (side _x == EAST) then { _x SetDamage 1;};} Foreach AllUnits;"]; 
   debug_player AddAction ["WKill","{if (side _x == WEST) then { _x SetDamage 1;};} Foreach AllUnits;"]; 
   debug_player AddAction ["Pos2Clip", "[(_this Select 0)] Call GPF_fnc_Pos2Clip;"];
   debug_player AddAction  ["Green Spawn","debug_player SETPOS GetMarkerPos 'respawn_guerrila';"];
   debug_player AddAction  ["Red Spawn","debug_player SETPOS GetMarkerPos 'respawn_east';"];
   debug_player AddAction  ["Blue Spawn","debug_player SETPOS GetMarkerPos 'respawn_west';"];
} else {deleteVehicle debug_player;};
// debug_player AddAction ["CenterWorld","_centerWorld = getArray(configFile >> 'CfgWorlds' >> worldName >> 'centerPosition');_scwPos = [(_centerWorld Select 0)+10,(_centerWorld Select 1)+10,0];vehicle player SetPos _scwPos;"]; 

[[(_centerWorld select 0),(_centerWorld select 1),0]]execVM "places.sqf";



if (isDedicated or isServer) then {
	[] Spawn {while {true} do{Sleep 300;{deleteVehicle _x;} forEach allDeadMen;{deleteVehicle _x;} forEach allDead;};};
	["Initialize", [true]] call BIS_fnc_dynamicGroups;

};
waitUntil {time > 20};