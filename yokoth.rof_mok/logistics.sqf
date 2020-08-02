// [_EvacPos,_TargetPos,_Side,_Model,_Wait] call GPF_fnc_LogiLoop;
_SidePos = _this select 0;
_params = [
    [(getPosASL plane_blue_04),(_SidePos Select 0),west,"B_Heli_Transport_01_camo_F",60],
	[(getPosASL plane_red_04),(_SidePos Select 1),east,"O_Heli_Transport_04_covered_F",60],
	[(getPosASL plane_green_04),(_SidePos Select 2),resistance,"I_Heli_Transport_02_F",60]
];

while (true) do {
 {_x call GPF_fnc_LogiLoop;} foreach _params;
 sleep 120;
};