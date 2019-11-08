if (isDedicated) then { 

    dmctpos = GetPos DMCT;
	publicVariable "dmctpos";
	
	// entryPositions = [[1233.44,12339.4,4.34404],[1027.16,12155.9,4.34404],[988.894,12341.7,4.34404],[618.549,12339,4.34404],[710.829,12238.6,4.34404],[853.43,12245.8,4.34404],[729.068,12106.5,4.34403],[795.279,12128.8,17.7943],[1174.45,12212.7,17.7919]];
	// {_unit = "O_soldier_M_F" createUnit [_x, createGroup east];_unit setPosASL (getPosASL ResupplyBoxPurple);} forEach SentryPositions;
	//"O_soldier_M_F" createUnit [[1233.44,12339.4,4.34404], createGroup east];_unit setPosASL (getPosASL ResupplyBoxPurple);
	// player setPosASL [1233.44,12339.4,10];
	// player setVehiclePosition [[], [1233.44,12339.4,4.34404], 0, "CAN_COLLIDE"];
	
	
	dmctpos_1 = GetPos DMCT_1;
	publicVariable "dmctpos_1";
    GreenDMGroup = [dmctpos,east, 1] call BIS_fnc_spawnGroup;
	GreenDMGroup_1 = [dmctpos_1,east, 1] call BIS_fnc_spawnGroup;
	
	patpos = GetMarkerPos "patrol_marker_2";
	patpos_1 = GetMarkerPos "patrol_marker_3";
	_blacklist = ["blacklist_01","blacklist_02","blacklist_03","blacklist_04"];
	[GreenDMGroup, patpos_1, 50,_blacklist] call BIS_fnc_taskPatrol;
	[GreenDMGroup_1, patpos, 50,_blacklist] call BIS_fnc_taskPatrol;
	//
    //[] Spawn {
	//    _cars = [car_00,car_01,car_02,car_03,car_13,car_04,car_05,car_06,car_08,car_07,car_09,car_10,car_11,car_12];
	//	{_x SetDamage 1; Sleep 60; } foreach _cars;
	//};

	waitUntil {MISSIONUP};
      while {MISSIONUP && true} do {
	   _greengroupcount = {alive _x} count units GreenDMGroup;
	   _greengroupcount_1 = {alive _x} count units GreenDMGroup_1;
	   _MinUnitsPerSide = 5;
	   
	   IF ( _greengroupcount < _MinUnitsPerSide) THEN { 
	   moretroops = [dmctpos,east, 1] call BIS_fnc_spawnGroup;
	   {[_x] join GreenDMGroup; } forEach units moretroops; 
	   };
	   IF ( _greengroupcount_1 < _MinUnitsPerSide) THEN { 
	   moretroops_1 = [dmctpos_1,east, 1] call BIS_fnc_spawnGroup;
	   {[_x] join GreenDMGroup_1; } forEach units moretroops_1; 
	   };
	   
       //hint Format ["%1 - %2",_greengroupcount,_MinUnitsPerSide];
	   Sleep 60;
	};

};

