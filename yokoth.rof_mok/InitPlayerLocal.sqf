if ((!isServer) && (player != player)) then {
waitUntil {player == player};
};

_unit = _this select 0;
_isJIP = _this select 1;

playerQuad = false;
playerHeli = false;
execVM "playerIcons.sqf";

gpf_SpawnLandTransport = {
	_pos = _this Select 0;
	_quad = createVehicle ['B_Quadbike_01_F', _pos, [], 0, 'FORM'];
	_quad addEventHandler ["GetOut", "_veh = _this select 0;if (count crew _veh <= 0) Then {deleteVehicle _veh;};playerQuad = false;"];
	_quad
};

gpf_SpawnAirTransport = {
	_pos = _this Select 0;
	_veh = createVehicle ['C_Heli_Light_01_civil_F', _pos, [], 0, 'FORM'];
	[_veh,["Digital",1],["AddTread",1,"AddTread_Short",0]] call BIS_fnc_initVehicle;
	_veh addEventHandler ["GetOut", "_veh = _this select 0;if (count crew _veh <= 0) Then {deleteVehicle _veh;};playerHeli = false;"];
	_veh
};

if (!isDedicated) then {
    ["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
};

[] spawn {
    while {true} Do {
	   player enableFatigue false;
	   waitUntil {inputAction "User20" > 0};
	   [] Spawn GPF_fnc_playerDialog;sleep 1;
	};
};

[] Spawn { 
    while {true} Do {
	 player enableFatigue false;
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


//BIS_fnc_garage_center = createVehicle [ 'Land_HelipadEmpty_F', _pos, [], 0, 'CAN_COLLIDE' ];

[_unit] Spawn { _unit = _this select 0;
   waitUntil {(!isNil "MarkersDone")};
   private _pos = [];
   private _ACC = [];
   
   If (Side _unit == West      ) Then {
       _pos = GetMarkerPos "respawn_west"; 
	   _ACC = carrier_sl_blue;
	   };
	   
   If (Side _unit == East      ) Then {
		_pos = GetMarkerPos "respawn_east"; 
		_ACC = carrier_sl_red;
		};
		
   If (Side _unit == Resistance) Then {
		_pos = GetMarkerPos "respawn_guerrila"; 
		_ACC = carrier_sl_green;
		};
		
   If (Side _unit == Civilian  ) Then {
		_pos = GetMarkerPos "respawn_civilian"; 
		_ACC = carrier_sl_red;
		};
    _trg_spawn = createTrigger ["EmptyDetector", _pos,false];
    _trg_spawn setTriggerArea [5, 5, _dir, true];
    _trg_spawn setTriggerActivation ["ANYPLAYER", "PRESENT", true];
    _trg_spawn setTriggerStatements ["this", "[thisList select 0] execVM 'goToACC.sqf'"," "];
	_unit SetPos _pos;

   private _cnt = 0;
   while {(_cnt < 360)} Do {
   private _pos = [_pos, 2,_cnt] call BIS_fnc_relPos;
   private _box = "Land_PaperBox_open_full_F" createVehicleLocal _pos;
   _box addAction ["ACC","[_this select 1] execVM 'goToACC.sqf';"];
   _box setDir _cnt;
   _box setPos _pos;
   _cnt = _cnt+361;
   };
   
  };