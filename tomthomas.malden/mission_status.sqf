_GameOn = true;
//publicVariable "GameOn";
_top = 5000;
[_GameOn,_top] spawn {_GameOn = _this select 0; _top = _this select 1;
	while {_GameOn} do {
		{if ((scoreSide _x) >= _top) Then {[_x] call GPF_fnc_endgame;_GameOn = false;};} foreach [west,east,resistance];
		sleep 1;
	};
};