_positions = _this select 0;
_side = _this select 1;
_Model = _this select 2;
_dir = _this select 3;
_towers = [];
_towerunits = [];
{
 _tower = createVehicle ["Land_Cargo_Patrol_V3_F", _x, [], 0, "FORM"]; _tower setDir _dir;
 _grp = createGroup [_side, true]; 
 _unit = _grp createUnit [(selectRandom _Model), GetPos _tower,[], 0,"FORM"]; _unit setDir _dir;
 _unit setPosASL [(getPosASL _tower select 0) - 0.5, (getPosASL _tower select 1) - 0.5, (getPosASL _tower select 2) + 4];
 _towers = _towers + [_tower];
 _towerunits = _towerunits + [_unit];
 sleep 1;
} Foreach _positions;
 waitUntil {!SPAWNTOWERS}; 
 {deleteVehicle _x;} Foreach _towers; 
 {deleteVehicle _x;} Foreach _towerunits;
 
// SPAWNTOWERS = true; publicVariable "SPAWNTOWERS";[["OBJ3Towermarker_00","OBJ3Towermarker_01","OBJ3Towermarker_02","OBJ3Towermarker_03"],east,"O_soldier_M_F"] execVM "fnc_GuardTowers.sqf"; 
