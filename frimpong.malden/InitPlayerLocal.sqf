if ((!isServer) && (player != player)) then {
waitUntil {player == player};
};

_unit = _this select 0;
_isJIP = _this select 1;

playerQuad = false;
playerHeli = false;

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
	_cnt = 0;
	_enemys = [];
	{
		if ((side _x) == East) Then {
			_enemys = _enemys+[_x];
			};
	} foreach Allunits;
	_cnt = {alive _x} count _enemys;
	 player enableFatigue false;
	 systemChat Format ["%1 enemy units active",_cnt];
     Sleep 30;
	 systemChat Format ["Be sure to bind custom action 20"];
	 Sleep 30;
	};
};

[_unit] Spawn { _unit = _this select 0;
   waitUntil {(!isNil "MarkersDone")};
   If (Side _unit == West      ) Then {
   _pos = GetMarkerPos "respawn_west"; _unit SetPos _pos;
   _EvacMarker = createMarkerLocal ["marker_helipad",(GetMarkerPos "marker_b_helipad")];
   _EvacMarker setMarkerColorLocaL "ColorWEST";
   _EvacMarker setMarkerTypeLocal "mil_flag";
   };
   If (Side _unit == East      ) Then {
   _pos = GetMarkerPos "respawn_east"; _unit SetPos _pos;
   _EvacMarker = createMarkerLocal ["marker_helipad",(GetMarkerPos "marker_r_helipad")];
   _EvacMarker setMarkerColorLocaL "ColorEAST";
   _EvacMarker setMarkerTypeLocal "mil_flag";
   };
   If (Side _unit == Resistance) Then {
   _pos = GetMarkerPos "respawn_guerrila"; _unit SetPos _pos;
   _EvacMarker = createMarkerLocal ["marker_helipad",(GetMarkerPos "marker_g_helipad")];
   _EvacMarker setMarkerColorLocaL "ColorGUER";
   _EvacMarker setMarkerTypeLocal "mil_flag";
   };
   If (Side _unit == Civilian  ) Then {
   _pos = GetMarkerPos "respawn_civilian"; _unit SetPos _pos;
   };
   [] execVM "playerIcons.sqf";
  };