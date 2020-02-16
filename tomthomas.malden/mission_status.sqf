_GameOn = true;
//publicVariable "GameOn";
_top = 500;
[_GameOn,_top] spawn {_GameOn = _this select 0; _top = _this select 1;
	while {_GameOn} do {
		{if ((scoreSide _x) >= _top) Then {[_x] call GPF_fnc_endgame;_GameOn = false;};} foreach [west,east,resistance];
		sleep 1;
	};
	["LOSER", false, true,true, true]call BIS_fnc_endMission;
};