private _centerWorld =  getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
private _build = [];
private _Allbuild = [];
private _cnt = 0;
private _buildings = [
/*"Land_FuelStation_01_roof_malevil_F",
"Land_fs_roof_F",
"Land_FuelStation_Shed_F",
"Land_FuelStation_02_roof_F",
"Land_FuelStation_01_roof_F",*/
"Land_HelipadCivil_F"
];


{
 _model = _x;
 _build = _centerWorld nearObjects [_model, 25000];
 _Allbuild = _Allbuild + _build;
} Foreach _buildings;

_mknum = 0;
{
 _pos = GetPosASL _x;
 _dir = GetDir _x;
 //_txt = Format ["Marker_0%1",_mknum]; 
 //_mrkr = createMarkerLocal [_txt,_x];
 //_mrkr setMarkerTextLocal "";
 //_mrkr setMarkerTypeLocal "mil_box";
 //_mrkr setMarkerColorLocal "ColorYellow";
 //_mrkr setMarkerAlphaLocal 0.2;
 //_mknum = _mknum+1;
 //_x Addaction ['Repair & Rearm',{_driver = _this select 1;_veh = vehicle _driver;[_veh]execVM 'x_reload.sqf';}];
 //_gap = 0.3;
//for "_i" from 1 to 7 do {
//   _pos = [(_pos Select 0),(_pos Select 1),(_pos Select 2)+_gap];
//   _vrc = "Land_HelipadCivil_F" createVehicleLocal _pos;
//   _vrc SetPosASL _pos;
// };
_trg = createTrigger ["EmptyDetector", _pos,false];
_trg setTriggerArea [5, 5, _dir, true];
_trg setTriggerActivation ["ANY", "PRESENT", true];
_trg setTriggerStatements ["this", "_xhandle= (thislist select 0) execVM 'x_reload.sqf';", ""];
  //_trg setTriggerStatements ["this", "_veh thislist select 0;_veh Addaction ['Repair & Rearm',{_veh = _this select 0;[_veh]execVM 'x_reload.sqf';}];", "_veh thislist select 0;removeAllActions _veh"];
} foreach _Allbuild;

