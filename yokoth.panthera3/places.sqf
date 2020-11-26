private _centerWorld =  _this Select 0;
private _allPlaces = nearestLocations [_centerWorld, ["NameVillage","NameCity","NameCityCapital","Strategic"],20000];
_places = []; {_nl = locationPosition _x;_places = _places + [_nl];} Foreach _allPlaces;
_LocObjectT = createVehicle ["VR_Area_01_square_1x1_grey_F", [(_centerWorld Select 0),(_centerWorld Select 1),0], [], 0, "FORM"];
// CentreZone
_pCount = 0;
_placePos = [];

// OuterCentre Zone
_OuterCentrePos = [
[19467,16968,0],
[20092,12737,0],
[7671.75,3879.02,0],
[18196.5,15853.1,0],
[12644.9,17761.6,0],
[3847.66,12938.1,0]
];
{_OuterCentrePos = _OuterCentrePos+[[(_x select 0),(_x select 1),0]];} foreach _places;


// Side Zones
_SidePos =  [
	[2756.44,3447.06,0],
	[4135.45,7702.04,0],
	[8036.74,2019.03,0],
	[7695.29,4879.75,0]
];

_SideFlagModels = [
	"HeliHEmpty",
	"HeliHEmpty",
	"HeliHEmpty"
];

if (isDedicated or isServer) then { _offset = 0;
        {
         If (Side _x == West      ) Then {_westpos = _SidePos Select 0; _x SetPos [(_westpos Select 0)-_offset,(_westpos Select 1),0];};
         If (Side _x == East      ) Then {_eastpos = _SidePos Select 1; _x SetPos [(_eastpos Select 0)-_offset,(_eastpos Select 1),0];};
         If (Side _x == Resistance) Then {_guerrilapos = _SidePos Select 2; _x SetPos [(_guerrilapos Select 0)-_offset,(_guerrilapos Select 1),0];};
         If (Side _x == Civilian  ) Then {_civilianpos = _SidePos Select 3; _x SetPos [(_civilianpos Select 0)-_offset,(_civilianpos Select 1),0];};
        } Foreach Allunits;
        
        //[(_SidePos Select 0),(_SidePos Select 1),(_SidePos Select 2),_centerWorld] execVM 'markers.sqf';
		[(_SidePos Select 0),(_SidePos Select 1),(_SidePos Select 2),(_SidePos Select 3),_centerWorld] execVM 'markers.sqf';
        private _outposts = [];
        { _outpost = [_x,0] Call GPF_fnc_worldOutpost; deleteVehicle (_outpost Select 0);deleteVehicle (_outpost Select 1); _outposts = _outposts + _outpost;} Foreach [(_SidePos Select 0),(_SidePos Select 1),(_SidePos Select 2)];
        
        [_SidePos] execVM 'emptyvehicles.sqf';
		//[_SidePos] execVM 'logistics.sqf';
		//[_SidePos] execVM 'mannedvehicles.sqf';
		_cz = [(_OuterCentrePos select 6),(_OuterCentrePos select 7)];
		[_OuterCentrePos] execVM 'CZmarkers.sqf';
		//[_OuterCentrePos,20,50] execVM "cover.sqf";
		
		_n = count _SideFlagModels;
		for "_i" from 0 to _n-1 do {
		_flag = createVehicle [(_SideFlagModels Select _i), (_SidePos Select _i), [], 0, "FORM"];
		};
		
		[_OuterCentrePos] Spawn { _centerWorld = _this Select 0;
			while {true} do {[_centerWorld]execVM "demo.sqf",sleep 20;};
		};
		
		
		
		
    };
	

private _locs = [
	[(_SidePos Select 0),50,[]],
	[(_SidePos Select 1),50,[]],
	[(_SidePos Select 2),50,[]]
	//[(_SidePos Select 3),50,[]]
];
{
 _newloc = [_x,6,[]];
 _locs = _locs+[_newloc];
} foreach _OuterCentrePos;

{
  private _loc = _x;
  private _pos = _loc Select 0;
  private _rad = _loc Select 1;
  private _typ = _loc Select 2;
  {_x hideObjectGlobal true} forEach nearestTerrainObjects [_pos, _typ, _rad, false];
 } ForEach _locs;


deleteVehicle _LocObjectT;