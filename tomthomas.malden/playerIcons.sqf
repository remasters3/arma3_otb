ShowFriendly = true;
addMissionEventHandler ["Draw3D",{
if (ShowFriendly) then {
	_icon = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\Banner_01_IDAP_F.jpg"; //'iconMan';
	_trgt = GetMarkerPos "respawn_civilian";
	_dst = player distance _trgt;
	_txt = format ["Home - %1m",floor _dst];
	_iconColour = [1,1,1,0.5];
	If (Side player == West      ) Then {_iconColour = [0,0,1,0.5];_trgt = GetMarkerPos "marker_b_helipad";_txt = format ["Drop off - %1m",floor _dst];_icon = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\Banner_01_NATO_F.jpg";};
	If (Side player == East      ) Then {_iconColour = [1,0,0,0.5];_trgt = GetMarkerPos "marker_r_helipad";_txt = format ["Drop off - %1m",floor _dst];_icon = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\Banner_01_CSAT_F.jpg";};
	If (Side player == Resistance) Then {_iconColour = [0,1,0,0.5];_trgt = GetMarkerPos "marker_g_helipad";_txt = format ["Drop off - %1m",floor _dst];_icon = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\Banner_01_AAF_F.jpg"; };
	
	
	drawIcon3D [_icon, _iconColour,_trgt, 0.5, 0.5, 1,_txt, 0, 0.04, "RobotoCondensedLight","center",true];
	{
		if ((side player) == (side _x))  Then {
			if ("evacleader" in allVariables _x) then {
			
				if (_x getVariable "evacleader") then {
				
						if ((vehicle _x) == _x) then {
							_rdst = player distance _x;
							drawIcon3D ['iconMan', _iconColour,(getpos _x), 0.3, 0.3, 1,format ["Pick up %2 - %1m",floor _rdst,group _x], 0, 0.04, "RobotoCondensedLight","center",true];
						};
					};
				};
		};
} Foreach allUnits;
};
}];