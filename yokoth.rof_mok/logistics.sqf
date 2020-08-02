// [_EvacPos,_TargetPos,_Side,_Model,_Wait] call GPF_fnc_LogiLoop;
_SidePos = _this select 0;
_timeframe = [28,29,30];
_params = [
    [(getPosASL plane_blue_04),(_SidePos Select 0),west,"B_Heli_Transport_01_camo_F",_timeframe],
	[(getPosASL plane_red_04),(_SidePos Select 1),east,"O_Heli_Transport_04_covered_F",_timeframe],
	[(getPosASL plane_green_04),(_SidePos Select 2),resistance,"I_Heli_Transport_02_F",_timeframe]
];

while {true} do {
 {_x call GPF_fnc_LogiLoop;} foreach _params;
 sleep 180;
 {deleteVehicle _x;} forEach allDead;
};