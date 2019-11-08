_plyr = _this Select 0;
_pos =  _plyr GetPos [20,getDir _plyr];
{deleteVehicle _x} Foreach crew BIS_fnc_garage_center;
deleteVehicle BIS_fnc_garage_center;
BIS_fnc_garage_center = createVehicle [ 'B_G_Quadbike_01_F', _pos, [], 0, 'CAN_COLLIDE' ];
['Open',false] call BIS_fnc_garage;