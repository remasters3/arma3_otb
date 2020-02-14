_player = player;
_posASL = GetPos player;
_fpos = [(_posASL select 0),(_posASL select 1)+1,(_posASL select 2)+1];
_dir = GetDir civ_af_asl;
_model = 'C_Heli_Light_01_civil_F';//'B_Plane_CAS_01_dynamicLoadout_F';
_rad = 20;
//_veh = [_pos,_dir,_model,_rad] call GPF_fnc_SpawnVehicle;
//player MoveInDriver _veh;

// OuterCentre Zone
_pCount = 0;
_OuterCentrePos = [];
while {_pCount < 360} Do {
 _pos = [_fpos, 20*2, _pCount] call BIS_fnc_relPos;
 _dir = _pCount;
 _pCount = _pCount+45;
  _veh = [_pos,_dir,_model,_rad] call GPF_fnc_SpawnVehicle;
};