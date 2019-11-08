_SidePos = _this Select 0;
_westp = _SidePos Select 0;
_eastp = _SidePos Select 1;
_restp = _SidePos Select 2;
_civip	= _SidePos Select 3;

_westAA = [([_westp,30,60, 10, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos),west,"B_APC_Tracked_01_AA_F"] Call GPF_fnc_mannedVehicles;
_eastAA = [([_eastp,30,60, 10, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos),east,"O_T_APC_Tracked_02_AA_ghex_F"] Call GPF_fnc_mannedVehicles;
_restAA = [([_restp,30,60, 10, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos),resistance,"I_LT_01_AA_F"] Call GPF_fnc_mannedVehicles;
_civiAA	= [([_civip,30,60, 10, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos),civilian,"C_Truck_02_transport_F"] Call GPF_fnc_mannedVehicles;
