if ((!isServer) && (player != player)) then {
waitUntil {player == player};
};

_unit = _this select 0;
_isJIP = _this select 1;
_debug = false;

[_debug,_unit] Spawn {
   _debug = _this select 0;
   _unit = _this select 1;
   	GoHome = { _player = _this select 0;
	if (side _player == west) then {player SetPos GetMarkerPos "respawn_west";};
	if (side _player == east) then {player SetPos GetMarkerPos "respawn_east";};
	if (side _player == resistance) then {player SetPos GetMarkerPos "respawn_guerrila";};
	if (side _player == civilian) then {player SetPos GetMarkerPos "respawn_civilian";};
	};
   while {_debug} Do {
    if (_debug) then { 
   	   waitUntil {Alive player};
         player AddAction ["Kill", "_veh = cursorTarget; _veh SetDamage 1;"];
         player AddAction ["Heal","_this Select 0 SetDamage 0"];    
         player addAction ["debug.sqf", "execVM 'debug.sqf';"];
         player AddAction ["TP","openMap true;waitUntil {inputAction 'ActionInMap' > 0};private _cords = (findDisplay 12 displayCtrl 51) ctrlMapScreenToWorld getMousePosition;_veh = vehicle player; _veh SetPos _cords;_textPos = Format ['%1',_cords];copyToClipboard _textPos;openMap false;"]; 
         player AddAction ["VKill","{_x SetDamage 1;} Foreach vehicles;"];   
         player AddAction ["EKill","{if (side _x == EAST) then { if (_x != player) then {_x SetDamage 1;};};} Foreach AllUnits;"]; 
         player AddAction ["WKill","{if (side _x == WEST) then { if (_x != player) then {_x SetDamage 1;};};} Foreach AllUnits;"]; 
         player AddAction ["RKill","{if (side _x == resistance) then { if (_x != player) then {_x SetDamage 1;};};} Foreach AllUnits;"];
         player AddAction ["CKill","{if (side _x == civilian) then { if (_x != player) then {_x SetDamage 1;};};} Foreach AllUnits;"];		 
         player AddAction ["Pos2Clip", "[(_this Select 0)] Call GPF_fnc_Pos2Clip;"];
   	   waitUntil {!Alive player};
	   };
    };
};

if (!isDedicated) then {
    ["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
};

/*
 [_unit] Spawn { _unit = player;
 
    while {true} Do {
    waitUntil {Alive _unit};
    If (Side _unit == West      ) Then {_pos = GetMarkerPos "respawn_west"; _unit SetPos _pos;};
    If (Side _unit == East      ) Then {_pos = GetMarkerPos "respawn_east"; _unit SetPos _pos;};
    If (Side _unit == Resistance) Then {_pos = GetMarkerPos "respawn_guerrila"; _unit SetPos _pos;};
    If (Side _unit == Civilian  ) Then {_pos = GetMarkerPos "respawn_civilian"; _unit SetPos _pos;};
    waitUntil {!Alive _unit};
    };
 };
 
 [1841.08,1327.95]
 [5671.48,3663.59]
 [4096.32,3372.22]
 [7867.56,4187.02]
 [7756.84,4441.21]
*/


playerQuad = false;
playerHeli = false;

execVM "playerIcons.sqf";
[]execVM "fuelstations.sqf";

waitUntil {!isNil "missionon"};
waitUntil {missionon};

[] spawn {
    while {missionon} Do {
	   player enableFatigue false;
	   waitUntil {inputAction "User20" > 0};
	   [] Spawn GPF_fnc_playerDialog;sleep 1;
	   };
};

[] Spawn { 
    while {missionon} Do {
	 systemChat Format ["%1 units active",Count AllUnits]; 
     Sleep 30;
	 systemChat Format ["Be sure to bind custom action 20"];
	 Sleep 30;
	 _wscore = scoreSide west;
	 _escore = scoreSide east;
	 _rscore = scoreSide resistance;
	 _cscore = scoreSide civilian;
	 systemChat Format ["| WEST: %1 | EAST: %2 | RESISTANCE: %3 | CIVILIAN: %4 |",_wscore,_escore,_rscore,_cscore];
	 sleep 30;
	};
};

[_unit] Spawn { 
   _unit = _this select 0;
   waitUntil {Alive player};
 while {missionon} Do {
   waitUntil {Alive player};
   player enableFatigue false;
   waitUntil {!Alive player};
 };
};

/*
[_unit] Spawn { _unit = _this select 0;
 waitUntil {!isNil "winner"};
 _txt = Format ["%1 have won the round.",winner];
 if ((side player) == winner) Then {["Winners",true,2,true,false] call BIS_fnc_endMission;} Else {
   if (winner == west) Then {["WestWin",false,2,true,false] call BIS_fnc_endMission;};
   if (winner == east) Then {["EastWin",false,2,true,false] call BIS_fnc_endMission;};
   if (winner == resistance) Then {["RestWin",false,2,true,false] call BIS_fnc_endMission;};
 };
};
*/


_pos = GetPos _unit;
BIS_fnc_garage_center = "";//createVehicle [ 'Land_HelipadEmpty_F', _pos, [], 0, 'CAN_COLLIDE' ];

