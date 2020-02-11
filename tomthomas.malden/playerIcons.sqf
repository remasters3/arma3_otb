ShowFriendly = true;
addMissionEventHandler ["Draw3D",{
if (ShowFriendly) Then {
	_icon = 'iconMan';
	_trgt = GetMarkerPos "respawn_civilian";
	_iconColour = [0,0,1,0.4];
	If (Side player == West      ) Then {_iconColour = [0,0,1,0.4];_trgt = GetMarkerPos "marker_b_helipad"};
	If (Side player == East      ) Then {_iconColour = [1,0,0,0.4];_trgt = GetMarkerPos "marker_r_helipad"};
	If (Side player == Resistance) Then {_iconColour = [0,1,0,0.4];_trgt = GetMarkerPos "marker_g_helipad"};
	_dst = player distance _trgt;
	
	drawIcon3D [_icon, _iconColour,_trgt, 0.5, 0.5, 1,format ["Drop - %1m",floor _dst], 0, 0.04, "RobotoCondensedLight","center",true];
	{
		if ((side player) == (side _x))  Then {
			if ("evacleader" in allVariables _x) then {
				if (_x getVariable "evacleader") Then {
					_rdst = player distance _x;
					drawIcon3D [_icon, _iconColour,(getpos _x), 0.3, 0.3, 1,format ["Pick up %2 - %1m",floor _rdst,group _x], 0, 0.04, "RobotoCondensedLight","center",true];
					};
				};
		};
} Foreach allUnits;
};
}];

