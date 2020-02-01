_positions = _this select 0;
_total = _this select 1;
_dist = _this select 2;
_Model = [
"Land_HBarrier_1_F",
"Land_Cargo10_red_F",
"Land_Cargo10_light_blue_F",
"Land_Cargo10_cyan_F",
"Land_Cargo10_grey_F",
"Land_Cargo10_light_green_F",
"Land_Cargo10_military_green_F",
"Land_Cargo10_sand_F",
"Land_CncBarrierMedium_F",
"Land_CncShelter_F",
"Land_CinderBlocks_F",
"Land_ConcretePipe_F",
"Land_CncWall1_F",
"Land_CncWall4_F",
"Land_SandbagBarricade_01_hole_F",
"Land_SandbagBarricade_01_F",
"Land_SandbagBarricade_01_half_F",
"Land_Barricade_01_4m_F",
"Land_PowerGenerator_F",
"Land_Stone_4m_F",
"Land_WallCity_01_4m_plain_grey_F"
];
{
	private _pCount = 45;
	private _dCount = 0;
	while {_pCount < 360} Do {
	_pos = [_x, 4, _pCount] call BIS_fnc_relPos;
	_dir = _dCount;
	_pCount = _pCount+90;
	_dCount = _dCount+90;
	_bag = createVehicle ["Land_HBarrierWall_corner_F", _pos, [], 0, "FORM"];
	_bag SetDir _dir;
	_bag SetPos _pos;
	_bag allowDamage false;
	_bag enableSimulationGlobal false;
	};

	for "_i" from 1 to _total do {
		_dir = SelectRandom [45,90,135,180,225,270,315,360];
		_qPos = [_x,10,_dist, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
		_veh = createVehicle [(selectRandom _Model), _qPos, [], 0, "FORM"];
		_veh SetDir _dir;
		_veh SetPos _qPos;
		_veh allowDamage false;
		_veh enableSimulationGlobal false;
		};


} foreach _positions;



