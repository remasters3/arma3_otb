// [_num,_Model,_pos,_distance,_Timeout ] Call GPF_fnc_EmptyVehicles;
 private ["_num ","_Model","_pos","_dist","_Timeout","_vehs"];
_num   = param[0];
_Model = param[1];
_pos = param[2];
_dist = param[3];
_Timeout = param[4];
_vehs = [];

    while { (_num) > (0)} Do {
         _qPos = [_pos,10,_dist, 10, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
         _veh = createVehicle [(selectRandom _Model), _qPos, [], 0, "FORM"];
         _vehs = _vehs + [_veh];
         _num = _num-1;
    };
	
	

[_num,_Model,_pos,_dist,_Timeout,_vehs] Spawn {
     _num = _this select 0; 
     _Model = _this Select 1; 
     _pos = _this Select 2; 
     _dist = _this select 3;
     _Timeout = _this select 4; 
     _vehs = _this select 5;
        Sleep _Timeout;
    if (_timeout > 0 ) Then {	
        {If ((count (crew _x)) == 0) Then {deleteVehicle _x;};} Foreach _vehs;
    	};
};
_vehs;