// []execVM "dm_units.sqf";
// {deleteVehicle _x;}  forEach units RedDMGROUP;{deleteVehicle _x;}  forEach units GreenDMGROUP;{deleteVehicle _x;}  forEach units BlueDMGROUP;
DMWayPoint={
            private _wpgroup = _this select 0;
            way1 = _wpgroup addWaypoint [[23702.5,16251.8,0], 0];
            way1 setWaypointType "HOLD";
            way1 setWaypointBehaviour "COMBAT";
            way1 setWaypointCombatMode "RED";
            way1 setWaypointSpeed "FULL";
 };
_UnitsPerSide = 6;
RedDMGROUP = [(getMarkerPos "marker_rdm"),EAST, _UnitsPerSide] call BIS_fnc_spawnGroup;[RedDMGROUP]Call DMWayPoint;
_RedDmCount = {alive _x} count units RedDMGROUP ;
GreenDMGROUP = [(getMarkerPos "marker_gdm"),resistance, _UnitsPerSide] call BIS_fnc_spawnGroup;[GreenDMGROUP]Call DMWayPoint;
_GreenDmCount = {alive _x} count units GreenDMGROUP ;
BlueDMGROUP = [(getMarkerPos "marker_bdm"),west, _UnitsPerSide] call BIS_fnc_spawnGroup; [BlueDMGROUP]Call DMWayPoint;
_BlueDmCount = {alive _x} count units BlueDMGROUP ;
 
 []Spawn{ While {true} Do {
    _UnitsPerSide = 6;
	_MinUnitsPerSide = 3;
    _RedDmCount = {alive _x} count units RedDMGROUP ;
    IF ( _RedDmCount < _MinUnitsPerSide) THEN {RedDMGROUP = [(getMarkerPos "marker_rdm"),EAST, _UnitsPerSide] call BIS_fnc_spawnGroup;[RedDMGROUP]Call DMWayPoint;};
    _GreenDmCount = {alive _x} count units GreenDMGROUP ;
	IF ( _GreenDmCount < _MinUnitsPerSide) THEN {GreenDMGROUP = [(getMarkerPos "marker_gdm"),resistance, _UnitsPerSide] call BIS_fnc_spawnGroup;[GreenDMGROUP]Call DMWayPoint;};
	_BlueDmCount = {alive _x} count units BlueDMGROUP ;
	IF ( _BlueDmCount < _MinUnitsPerSide) THEN {BlueDMGROUP = [(getMarkerPos "marker_bdm"),west, _UnitsPerSide] call BIS_fnc_spawnGroup;[BlueDMGROUP]Call DMWayPoint;};
	Sleep 60;
	};
 };
 
[]Spawn{ While {true} Do {
        Sleep 600;
        {deleteVehicle _x;}  forEach units RedDMGROUP;
        {deleteVehicle _x;}  forEach units GreenDMGROUP;
        {deleteVehicle _x;}  forEach units BlueDMGROUP;
        };

 
 
DebugDM={
          {deleteVehicle _x;}  forEach units RedDMGROUP;
          {deleteVehicle _x;}  forEach units GreenDMGROUP;
          {deleteVehicle _x;}  forEach units BlueDMGROUP;	
};