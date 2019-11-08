_num = _this Select 0;
_Model = _this Select 1;
_pos = _this Select 2;
_dist = _this Select 3;
_vehs = [];
while { (_num) > (0)} Do {
     _qPos = [_pos,20,_dist, 10, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
     _veh = createVehicle [(selectRandom _Model), _qPos, [], 0, "FORM"];
     _vehs = _vehs + [_veh];
     _num = _num-1;
};
waitUntil {!SPAWNVEH}; 
{If ((count (crew _x)) == 0) Then {deleteVehicle _x;};} Foreach _vehs;