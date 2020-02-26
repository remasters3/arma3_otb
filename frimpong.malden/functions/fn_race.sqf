// [_RaceStart,_RaceStartDir,_RaceEnd,_RaceEndDir,_CheckPoints,_CarModels,_RacerCount,_Gap] Call GPF_fnc_race;
private ["_RaceStart",
         "_RaceStartDir",
		 "_RaceEnd",
		 "_RaceEndDir",
		 "_CheckPoints",
		 "_CarModels",
		 "_RacerCount",
		 "_CarPos",
		 "_RaceCar",
		 "_Gap"];


_RaceStart = param[0];
_RaceStartDir = param[1];
_RaceEnd = param[2];
_RaceEndDir = param[3];
_CheckPoints = param[4];
_CarModels  = param[5];
_RacerCount = param[6];
_gap = param[7];
_RaceCars = [];
_RaceCarGroups = [];
_Things = [];
_StartGrid = createVehicle ["Land_HelipadEmpty_F", _RaceStart, [], 0, "FORM"];
_StartGrid setDir _RaceStartDir; _StartGrid SetPos _RaceStart;
_Things = _Things + [_StartGrid];
_EndGate = createVehicle ["Land_FinishGate_01_wide_F", _RaceEnd, [], 0, "FORM"];
_EndGate setDir _RaceEndDir; _EndGate SetPos _RaceEnd;
_Things = _Things + [_EndGate];

_CarCount =_RacerCount/2;


_CarPosP = [_StartGrid, _gap/2,90 ] call BIS_fnc_relPos;
_CarPosM = [_StartGrid, _gap/2,270 ] call BIS_fnc_relPos;

while {_CarCount > 0} Do
{ 
  _RaceCarP = createVehicle [(SelectRandom _CarModels), _CarPosP, [], 0, "FORM"];
  _RaceCarP setFuel 0;
  _RaceCarP SetDir _RaceStartDir;_RaceCarP SetPos _CarPosP; 
  _RaceCarPL = createVehicle ["VR_Area_01_square_4x4_grey_F", _CarPosP, [], 0, "FORM"];
  _RaceCarPL SetDir _RaceStartDir;_RaceCarPL SetPos _CarPosP; 
  _RaceCars = _RaceCars + [_RaceCarP];
  _Things = _Things + [_RaceCarPL];
  _CarPosP = [_RaceCarP, _gap,90 ] call BIS_fnc_relPos;

  _RaceCarM = createVehicle [(SelectRandom _CarModels), _CarPosM, [], 0, "FORM"];
  _RaceCarM setFuel 0;
  _RaceCarM SetDir _RaceStartDir;_RaceCarM SetPos _CarPosM;
  _RaceCarML = createVehicle ["VR_Area_01_square_4x4_grey_F", _CarPosP, [], 0, "FORM"];
  _RaceCarML SetDir _RaceStartDir;_RaceCarML SetPos _CarPosM; 
  _RaceCars = _RaceCars + [_RaceCarM];
  _Things = _Things + [_RaceCarML];
  _CarPosM = [_RaceCarM, _gap,270 ] call BIS_fnc_relPos;
  _CarCount = _CarCount-1; 
};


[_RacerCount,_RaceCars,_StartGrid,_RaceStartDir,_CheckPoints,_RaceEnd] Spawn {

  _RacerCount = _this Select 0;
  _RaceCars = _this Select 1;
  _StartGrid = _this Select 2;
  _RaceStartDir = _this Select 3;
  _CheckPoints = _this Select 4;
  _RaceEnd = _this Select 5;
  _RaceCarGroups = [];
      _playerIn = _RacerCount;
      while {_playerIn > 0 } do {
        _playerIn = _RacerCount;
       {
       
       If ((player IN _x)) Then {_playerIn = _playerIn-1;} 
                           Else {};
       } Foreach _RaceCars;
       hint Format ["waiting on %1/%2",_playerIn,_RacerCount];
       Sleep 1;
      };
	  
  {_x setVehicleLock "LOCKED";} Foreach _RaceCars; 
  _LightPos = [_StartGrid, 10,_RaceStartDir ] call BIS_fnc_relPos;
  _Lights = ["Sign_Arrow_Large_F","Sign_Arrow_Large_Yellow_F","Sign_Arrow_Large_Green_F"];
  {_light = _x createVehicle _LightPos; sleep 1;deleteVehicle _Light;} Foreach _Lights;
  {_x setFuel 1;} Foreach _RaceCars;
  
  
  //{_group = Group  (driver _x);_RaceCarGroups = _RaceCarGroups + [_group];} Foreach _RaceCars;
  {
    _group = Group  (driver _x);
         {
		 _way1 = _group addWaypoint [_x, 0];
         _way1 setWaypointType "MOVE";
         _way1 setWaypointBehaviour "CARELESS";
         _way1 setWaypointCombatMode "BLUE";
         _way1 setWaypointSpeed "FULL";
         _way1 setWaypointCompletionRadius 50; 
		 } Foreach _CheckPoints;
		 
   _way2 = _group addWaypoint [_RaceEnd, 0];
   _way2 setWaypointType "MOVE";
   _way2 setWaypointBehaviour "CARELESS";
   _way2 setWaypointCombatMode "BLUE";
   _way2 setWaypointSpeed "FULL";
   //_way2 setWaypointCompletionRadius 1;
   _way2 setWaypointTimeout [1, 2, 3];
   _way2 setWaypointStatements ["true", '_veh = Vehicle this; Hint format ["%1 is the Winner",name this]'];
   
  } Foreach _RaceCars;
 
};
  


//
[_RaceCars,_StartGrid,_Things]Spawn {_RaceCars = _this Select 0;_StartGrid = _this Select 1;_Things = _this Select 2;
Sleep 60;
{deleteVehicle _x;} ForEach _RaceCars; {deleteVehicle _x;} ForEach _Things;
}

/*
 "C_Hatchback_01_sport_F"
 "Land_FinishGate_01_wide_F"
 "Land_FinishGate_01_wide_F"
 "VR_Area_01_square_4x4_grey_F"
 
*/