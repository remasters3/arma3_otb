private _centerWorld =  _this Select 0;
	_pCount = 0;
	_SidePos = [
	[8050.81,10845.1,0], //WEST
	[804.486,12232.4,0], //[11293.5,4653.34,0],//EAST
	[10514.9,4047.27,0], //[7145.7,12206.4,0], // Resistance
	[3787.59,4932.45,0]  //[783.857,12276.5,0] //Civ
];

	private _locs = [
	[(_SidePos Select 0),100,[]],
	[(_SidePos Select 1),100,[]],
	[(_SidePos Select 2),100,[]]
	];
	
	{
	private _loc = _x;
	private _pos = _loc Select 0;
	private _rad = _loc Select 1;
	private _typ = _loc Select 2;
	{_x hideObjectGlobal true} forEach nearestTerrainObjects [_pos, _typ, _rad, false];
	} ForEach _locs;


if (isDedicated or isServer) then {
	[(_SidePos Select 0),(_SidePos Select 1),(_SidePos Select 2),(_SidePos Select 3),_centerWorld] execVM 'markers.sqf';
	[_SidePos] execVM 'emptyvehicles.sqf';
	[_centerWorld] Spawn { _centerWorld = _this Select 0;while {true} do {[_centerWorld]execVM "demo.sqf",sleep 20;};};
	//[]execVM "mission_status.sqf";
};