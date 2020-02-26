// [winner] call GPF_fnc_endgame;
_winner = _this select 0;
{
		if ((side _x) == _winner) Then {
		["END2", true, true, true, true] remoteExecCall ["BIS_fnc_endMission",[_x]];
	} Else {
		["LOSER", false, true,true, true] remoteExecCall ["BIS_fnc_endMission",[_x]];
	}
} foreach allplayers;

if (isDedicated or isServer) then {["END1", false, true,true, true]call BIS_fnc_endMission;};