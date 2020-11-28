// [_pos,_dir,_model,_rad,txt] call GPF_fnc_SpawnVehicle;
private _pos = param[0];
private _dir = param[1];
private _model = param[2];
private _rad = param[3];
private _txtr = param[4];
private _tpos = [0,0,0];
private _veh = objNull;
private _params = _this;
_list = _pos nearEntities [["Air", "Car", "Motorcycle", "Tank"], _rad];
//systemchat format ["--%1--",_list];
if ((count _list) == 0) Then {
		{if ((_pos distance _x) <= _rad+_rad) Then {deleteVehicle _x;};}forEach allDead;
		_veh = createVehicle [_model, _tpos, [], 0, 'FORM'];
		if ((count _params) == 5) Then {_veh setObjectTextureGlobal [0,_txtr];};
		_veh SetDir _dir;
		_veh setpos _pos;
		_veh
	};
_veh 