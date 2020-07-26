private _centerWorld =  _this Select 0;
private ["_NewLocations","_pCount","_LocObjectT","_placePos","_lString"];
_LocObjectT = createVehicle ["VR_Area_01_square_4x4_grey_F", [(_centerWorld Select 0),(_centerWorld Select 1),0], [], 0, "FORM"];
// CentreZone
_pCount = 0;
_placePos = [];
while {_pCount < 360} Do {
 _pos = [_LocObjectT, 1000, _pCount] call BIS_fnc_relPos;
 _pCount = _pCount+90;
 _placePos = _placePos + [_pos];
};

_NewLocations = [
   ["NameCityCapital",[(_centerWorld Select 0),(_centerWorld Select 1),0],"Conflict Zone"],
   ["Hill",(_placePos Select 0),"NM"],
   ["Hill",(_placePos Select 1),"EM"],
   ["Hill",(_placePos Select 2),"SM"],
   ["Hill",(_placePos Select 3),"WM"]
];
//[_NewLocations] Call GPF_fnc_makeLocations;

// OuterCentre Zone
_pCount = 0;
_OuterCentrePos = [];

while {_pCount < 360} Do {
 _pos = [_LocObjectT, 500, _pCount] call BIS_fnc_relPos;
 _pCount = _pCount+45;
 _OuterCentrePos = _OuterCentrePos + [_pos];
};
_OuterCentrePos = [
	[9886.59,20229.9,0],
	[9849.59,19575,0],
	[11893.2,18590,0],
	[17214.1,20382.8,0],
	[18202.2,15851.8,0],
	[20049,12794.2,0],
	[19893,11064.9,0],
	[3845.29,12932.1,0]
];
_OuterCentreLocations = [];
_ct = 0;
{_txt = Format ["L%1",_ct];_nl = ['NameLocal',_x,_txt]; _OuterCentreLocations = _OuterCentreLocations+[_nl];_ct = _ct+1;} Foreach _OuterCentrePos;
//[_OuterCentreLocations] Call GPF_fnc_makeLocations;

// Side Zones
_pCount = 0;
_SidePos = [];
while {_pCount < 360} Do {
 _pos = [_LocObjectT, 1000, _pCount] call BIS_fnc_relPos; //[([_LocObjectT, 1000, _pCount] call BIS_fnc_relPos),1,200, 20, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
 _pCount = _pCount+120;
 _SidePos = _SidePos + [_pos];
};
_SidePos = _SidePos + [_centerWorld];
_SidePos =  [
	[4182.36,13719.6,0],
	[19959.6,13701.8,0],
	[9733.53,4677.75,0],
	[11202.9,14976.2,0]
	
];

_SideLocations = [];
_SideLocationNames = ["Blue","Red","Green","Civilian"];
_SideFlagModels = [
	"Flag_NATO_F",
	"Flag_CSAT_F",
	"Flag_AAF_F"
];
_nc = 0;
{_txt = Format ["%1 H.Q.",(_SideLocationNames Select _nc)];_nl = ['NameCity',_x,_txt];_nc = _nc+1;_SideLocations = _SideLocations+[_nl];} Foreach _SidePos;
//[_SideLocations] Call GPF_fnc_makeLocations;





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