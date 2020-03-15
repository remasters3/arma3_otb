If ((side player) == civilian) Then {ShowFriendly = false;ShowTargets = false;} Else {ShowFriendly = true;ShowTargets = true;};
addMissionEventHandler ["Draw3D",{
_icon = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\Banner_01_IDAP_F.jpg"; //'iconMan';
_trgt = GetMarkerPos "respawn_civilian";
_dst = player distance _trgt;
_txt = format ["%1m",floor _dst];
_iconColour = [1,1,1,0.5];
If (Side player == West      ) Then {_iconColour = [0,0,1,0.5];_trgt = GetMarkerPos "marker_b_helipad";_dst = player distance _trgt;/*_txt = format ["Drop Zone - %1m",floor _dst];*/_icon = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\Banner_01_NATO_F.jpg";};
If (Side player == East      ) Then {_iconColour = [1,0,0,0.5];_trgt = GetMarkerPos "marker_r_helipad";_dst = player distance _trgt;/*_txt = format ["Drop Zone - %1m",floor _dst];*/_icon = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\Banner_01_CSAT_F.jpg";};
If (Side player == Resistance) Then {_iconColour = [0,1,0,0.5];_trgt = GetMarkerPos "marker_g_helipad";_dst = player distance _trgt;/*_txt = format ["Drop Zone - %1m",floor _dst];*/_icon = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\Banner_01_AAF_F.jpg"; };
//_icon = "\a3\3den\data\cfg3den\history\create_ca.paa";
_icon = "a3\3den\data\cfg3den\history\moveitems_ca.paa";

if (ShowFriendly) then {
	drawIcon3D [_icon, [1,1,1,1],_trgt, 0.5, 0.5, 1,_txt, 0, 0.04, "RobotoCondensedLight","center",true];
	{
		if ((side player) == (side _x))  Then {
			if ("evacleader" in allVariables _x) then {
			
				if (_x getVariable "evacleader") then {
				
						if ((vehicle _x) == _x) then {
							private _rdst = player distance _x;
							private _icon = "\a3\3den\data\cfg3den\object\iconcommander_ca.paa"; //'iconMan';
							private _rescuegroup = group _x;
							private _cnt = {alive _x} count units _rescuegroup;
							drawIcon3D [_icon, _iconColour,(getpos _x), 0.3, 0.3, 1,format ["%3 | %2 Units | %1m",floor _rdst,_cnt,_rescuegroup], 0, 0.04, "RobotoCondensedLight","center",true];
						};
					};
				};
		};
} Foreach allUnits;
};

if (ShowTargets) then {

{
	if (side player != side _x) then {
		If (Side _x == West      ) Then {_iconColour = [0,0,1,0.5];};
		If (Side _x == East      ) Then {_iconColour = [1,0,0,0.5];};
		If (Side _x == Resistance) Then {_iconColour = [0,1,0,0.5];};
				
		if ((side _x) != civilian) then {
			private _rdst = player distance _x;
			//private _icon = "\a3\3den\data\cfg3den\object\iconturret_ca.paa"; //'iconMan';
			private _icon = "\a3\3den\data\cfgwaypoints\destroy_ca.paa"
			private _cnt = typeOf _x;
			if (alive _x) Then {
			drawIcon3D [_icon, _iconColour,(getpos _x), 0.3, 0.3, 1,format ["%3 %2 - %1m",floor _rdst,_cnt,side _x], 0, 0.04, "RobotoCondensedLight","center",true];
			};
		};

	};

} Foreach MainTargets;

};

}];
