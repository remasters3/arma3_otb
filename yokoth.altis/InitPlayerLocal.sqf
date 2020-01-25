if ((!isServer) && (player != player)) then {
waitUntil {player == player};
};

_unit = _this select 0;
_isJIP = _this select 1;

playerQuad = false;
playerHeli = false;
execVM "playerIcons.sqf";


[] spawn {
    while {true} Do {
	   player enableFatigue false;
	   waitUntil {inputAction "User20" > 0};
	   [] Spawn GPF_fnc_playerDialog;sleep 1;
	   };
};

[] Spawn { 
    while {true} Do {
	 systemChat Format ["%1 units active",Count AllUnits]; 
     Sleep 30;
	 systemChat Format ["Be sure to bind custom action 20"];
	 Sleep 30;
	   };
};

[] Spawn {
	scores = Format ["| Blue 0/8 | Red 0/8 | Green 0/8 |"];
	while {true} do {
	hint scores;
	sleep 1;
	}; 
};

_pos = GetPos _unit;
BIS_fnc_garage_center = createVehicle [ 'Land_HelipadEmpty_F', _pos, [], 0, 'CAN_COLLIDE' ];

[_unit] Spawn { _unit = _this select 0;
   waitUntil {(isNil "MarkersDone")};
   If (Side _unit == West      ) Then {_pos = GetMarkerPos "respawn_west"; _unit SetPos _pos;};
   If (Side _unit == East      ) Then {_pos = GetMarkerPos "respawn_east"; _unit SetPos _pos;};
   If (Side _unit == Resistance) Then {_pos = GetMarkerPos "respawn_guerrila"; _unit SetPos _pos;};
   If (Side _unit == Civilian  ) Then {_pos = GetMarkerPos "respawn_civilian"; _unit SetPos _pos;};
  };