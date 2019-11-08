if (isDedicated) then { 

    _locationPos = GetPos ct_01;
     ARMOROBJPOS = GetMarkerPos "patrol_marker_1";
     _gescort0 = [ARMOROBJPOS, 0, "O_G_Offroad_01_armed_F", east] call bis_fnc_spawnvehicle; 
     ARMOROBJ = _gescort0 select 0;
     ARMOROBJGRP = group ARMOROBJ;
[] Spawn {     
	 while {alive ARMOROBJ} do {
	_Markers = ["patrol_marker_0","patrol_marker_1","patrol_marker_2","patrol_marker_3"];
	{_pos = GetMarkerPos _x;
	way = ARMOROBJGRP addWaypoint [_pos, 0];
    way setWaypointType "MOVE";
    way setWaypointBehaviour "COMBAT";
    way setWaypointCombatMode "RED";
    way setWaypointSpeed "LIMITED";
	Sleep 60;
	} foreach _Markers; 
	 };
	//execVM "patrol.sqf";
	
  };
//[] Spawn {
//     while {true} do {sleep 900; ARMOROBJ SetDamage 1;};
//  };
};

// KILLHELI_1