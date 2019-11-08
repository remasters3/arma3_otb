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

_OuterCentreLocations = [];
_ct = 0;
{_txt = Format ["L%1",_ct];_nl = ['NameLocal',_x,_txt]; _OuterCentreLocations = _OuterCentreLocations+[_nl];_ct = _ct+1;} Foreach _OuterCentrePos;
//[_OuterCentreLocations] Call GPF_fnc_makeLocations;

// Side Zones
/*
_pCount = 45;
_SidePos = [];
while {_pCount < 360} Do {
 _pos = [([_LocObjectT, 3000, _pCount] call BIS_fnc_relPos),1,200, 30, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
 _pCount = _pCount+90;
 _SidePos = _SidePos + [_pos];
};
*/

_westpos = [3945.54,7489.96,0];
_eastpos = [7773.56,6661.48,0];
_restpos = [4040.4,3664.69,0];
_civipos = [2239.58,3456.56,0];
_SidePos = [_westpos,_eastpos,_restpos,_civipos];
_SideLocations = [];
_SideLocationNames = ["West","East","Resistance","Civilian"];
_nc = 0;
{_txt = Format ["%1 H.Q.",(_SideLocationNames Select _nc)];_nl = ['NameLocal',_x,_txt];_nc = _nc+1;_SideLocations = _SideLocations+[_nl];} Foreach _SidePos;
[_SideLocations] Call GPF_fnc_makeLocations;

if (isDedicated or isServer) then { _offset = 10;
        {
         If (Side _x == West      ) Then {_westpos = _SidePos Select 0; _x SetPos [(_westpos Select 0)-_offset,(_westpos Select 1),0];};
         If (Side _x == East      ) Then {_eastpos = _SidePos Select 1; _x SetPos [(_eastpos Select 0)-_offset,(_eastpos Select 1),0];};
         If (Side _x == Resistance) Then {_guerrilapos = _SidePos Select 2; _x SetPos [(_guerrilapos Select 0)-_offset,(_guerrilapos Select 1),0];};
         If (Side _x == Civilian  ) Then {_civilianpos = _SidePos Select 3; _x SetPos [(_civilianpos Select 0)-_offset,(_civilianpos Select 1),0];};
        } Foreach Allunits;
        
        [(_SidePos Select 0),(_SidePos Select 1),(_SidePos Select 2),(_SidePos Select 3)] execVM 'markers.sqf';
       /* 
	   private _outposts = [];
        {
		_outpost = [_x,0] Call GPF_fnc_worldOutpost; 
		deleteVehicle (_outpost Select 0);
		deleteVehicle (_outpost Select 1);
		deleteVehicle (_outpost Select 2);
		deleteVehicle (_outpost Select 3);
		deleteVehicle (_outpost Select 4);
		deleteVehicle (_outpost Select 5);
		deleteVehicle (_outpost Select 6);
		deleteVehicle (_outpost Select 7);
		deleteVehicle (_outpost Select 8);
		deleteVehicle (_outpost Select 9);
		deleteVehicle (_outpost Select 10);
		deleteVehicle (_outpost Select 11);
		deleteVehicle (_outpost Select 12);
		deleteVehicle (_outpost Select 13);
		deleteVehicle (_outpost Select 14);
		deleteVehicle (_outpost Select 15);
		deleteVehicle (_outpost Select 16);
		_outposts = _outposts + _outpost;} Foreach [(_SidePos Select 0),(_SidePos Select 1),(_SidePos Select 2),(_SidePos Select 3)];
		*/
        
        [_SidePos] execVM 'emptyvehicles.sqf';
        _cz = [(_OuterCentrePos select 6),(_OuterCentrePos select 7)];
};


deleteVehicle _LocObjectT;
