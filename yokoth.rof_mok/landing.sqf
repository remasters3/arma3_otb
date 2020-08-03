private _veh = _this select 0;
[_veh] spawn { 
_veh = _this select 0;
private _driver = driver _veh;
private _lp = [];
	If (Side _driver == West) Then {
		_lp = plane_blue_04;
		};
		
	If (Side _driver == East) Then {
		_lp = plane_red_04;
	};
			
	If (Side _driver == Resistance) Then {
		_lp = plane_green_04;
	};
			
	If (Side _driver == Civilian  ) Then {
	
	};
	waituntil {((distance _veh _lp) <= 1.5)};
	_veh setfuel 0;
	sleep 30;
	_veh setdamage 0;
	_veh setfuel 1;
};