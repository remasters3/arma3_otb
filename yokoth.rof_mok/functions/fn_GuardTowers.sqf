// [_positions,_side,_Model,_dir,_Timeout,_towermodel] Call GPF_fnc_GuardTowers;
 private ["_positions","_side","_Model","_dir","_Timeout","_blackList","_Count","_units","_towers","_towerunits","_towermodel"];
_positions  = param[0];
_side = param[1];
_Model = param[2];
_dir = param[3];
_Timeout = param[4];
_towermodel = param[5];

_Count = 0;
_towers = [];
_towerunits = [];
{
 _tower = createVehicle [_towermodel, _x, [], 0, "FORM"]; _tower setDir _dir;
 _grp = createGroup [_side, true]; 
 _unit = _grp createUnit [(selectRandom _Model), GetPos _tower,[], 0,"FORM"]; _unit setDir _dir;
 _unit setPosASL [(getPosASL _tower select 0) - 0.5, (getPosASL _tower select 1) - 0.5, (getPosASL _tower select 2) + 4];
 _towers = _towers + [_tower];
 _towerunits = _towerunits + [_unit];
 sleep 1;
} Foreach _positions;

[_Timeout,_towers,_towerunits] Spawn { _Timeout = _this Select 0; _towers = _this Select 1; _towerunits  = _this Select 2;
 Sleep _Timeout; 
 {deleteVehicle _x;} Foreach _towers; 
 {deleteVehicle _x;} Foreach _towerunits;
};
_output = [_towerunits, _towers];
_output;