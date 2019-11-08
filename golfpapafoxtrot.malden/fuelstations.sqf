private _centerWorld =  getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
private _build = [];
private _Allbuild = [];
private _cnt = 0;
private _buildings = [
"Land_FuelStation_01_roof_malevil_F",
"Land_fs_roof_F",
"Land_FuelStation_Shed_F",
"Land_FuelStation_02_roof_F",
"Land_FuelStation_01_roof_F",
"VR_Area_01_circle_4_yellow_F"
];


{
 _model = _x;
 _build = _centerWorld nearObjects [_model, 25000];
 _Allbuild = _Allbuild + _build;
} Foreach _buildings;

_mknum = 0;
{
 _pos = GetPos _x;
 _dir = GetDir _x;
 _txt = Format ["Marker_0%1",_mknum];
 
 _mrkr = createMarkerLocal [_txt,_x];
 _mrkr setMarkerTextLocal "";
 _mrkr setMarkerTypeLocal "mil_box";
 _mrkr setMarkerColorLocal "ColorYellow";
 _mrkr setMarkerAlphaLocal 0.2;
 _mknum = _mknum+1;
 
 _trg = createTrigger ["EmptyDetector", _pos,false];
 _trg setTriggerArea [10, 10, _dir, true];
 _trg setTriggerActivation ["ANY", "PRESENT", true];
 _trg setTriggerStatements ["this", "_xhandle= (thislist select 0) execVM 'x_reload.sqf'", ""];
} foreach _Allbuild;