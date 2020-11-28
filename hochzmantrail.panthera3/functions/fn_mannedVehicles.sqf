private _pos = param[0];
private _side = param[1];
private _model = param[2];


private _vehicle = [_pos, 0, _model, _side] call bis_fnc_spawnvehicle;
private _veh = _vehicle select 0;

private _wpgroup = Group _veh;
private _wp = _wpgroup addWaypoint [_pos,0];
_wp setWaypointType "HOLD";
_wp setWaypointBehaviour "COMBAT";
_wp setWaypointCombatMode "RED";
_wp setWaypointSpeed "FULL";


[_pos,_side,_model,_veh] Spawn { 
  _pos = _this select 0; 
  _side = _this select 1; 
  _model = _this select 2;
  _veh = _this Select 3;


  while {true} Do {
                  IF ((alive _veh)) THEN
  			    {
                  _veh SetDamage 0;
				  _type = typeOf _veh;
                  _veh setVehicleAmmo 1;
                  _magazines = getArray(configFile >> "CfgVehicles" >> _type >> "magazines");
                  
                  if (count _magazines > 0) then {
                  	_removed = [];
                  	{
                  		if (!(_x in _removed)) then {
                  			_veh removeMagazines _x;
                  			_removed = _removed + [_x];
                  		};
                  	} forEach _magazines;
                  	{
                  		_veh vehicleChat format ["Reloading %1", _x];
                  		sleep 0.01;
                  		_veh addMagazine _x;
                  	} forEach _magazines;
                  };
                  
                  _count = count (configFile >> "CfgVehicles" >> _type >> "Turrets");
                  
                  if (_count > 0) then {
                  	for "_i" from 0 to (_count - 1) do {
                  		scopeName "xx_reload2_xx";
                  		_config = (configFile >> "CfgVehicles" >> _type >> "Turrets") select _i;
                  		_magazines = getArray(_config >> "magazines");
                  		_removed = [];
                  		{
                  			if (!(_x in _removed)) then {
                  				_veh removeMagazines _x;
                  				_removed = _removed + [_x];
                  			};
                  		} forEach _magazines;
                  		{
                  			_veh vehicleChat format ["Reloading %1", _x];
                  			sleep 0.01;
                  			_veh addMagazine _x;
                  			sleep 0.01;
                  		} forEach _magazines;
                  		_count_other = count (_config >> "Turrets");
                  		if (_count_other > 0) then {
                  			for "_i" from 0 to (_count_other - 1) do {
                  				_config2 = (_config >> "Turrets") select _i;
                  				_magazines = getArray(_config2 >> "magazines");
                  				_removed = [];
                  				{
                  					if (!(_x in _removed)) then {
                  						_veh removeMagazines _x;
                  						_removed = _removed + [_x];
                  					};
                  				} forEach _magazines;
                  				{
                  					_veh vehicleChat format ["Reloading %1", _x]; 
                  					sleep 0.01;
                  					_veh addMagazine _x;
                  					sleep 0.01;
                  				} forEach _magazines;
                  			};
                  		};
                  	};
                  };
                  _veh setVehicleAmmo 1;
                  _veh setDamage 0;
                  while {fuel _veh < 0.99} do {
                  	//_veh setFuel ((fuel _vehicle + 0.1) min 1);
                  	_veh setFuel 1;
                  	sleep 0.01;
                  }; 			  
  				}
  			Else
  			    {
  				  { deleteVehicle _x; } forEach units (group _veh);deleteVehicle _veh;
  				  _vehicle = [_pos, 0, _model, _side] call bis_fnc_spawnvehicle;
  				  _veh = _vehicle select 0;
				  _wpgroup = Group _veh;
                  _wp = _wpgroup addWaypoint [_pos,0];
                  _wp setWaypointType "HOLD";
                  _wp setWaypointBehaviour "COMBAT";
                  _wp setWaypointCombatMode "RED";
                  _wp setWaypointSpeed "FULL";
  				};
	  Sleep 10;
  
  };
};
_veh;
// [_pos,_side,_model] Call GPF_fnc_mannedVehicles;