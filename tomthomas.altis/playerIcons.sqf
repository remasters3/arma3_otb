addMissionEventHandler ["Draw3D",{
_icon = 'iconMan';
If (Side player == West      ) Then {drawIcon3D [_icon, [0,0,1,0.2], GetMarkerPos "marker_b_helipad", 0.5, 0.5, 1,format ["Evac Point"], 2, 0.03, "RobotoCondensedLight","center"];};
If (Side player == East      ) Then {drawIcon3D [_icon, [1,0,0,0.2], GetMarkerPos "marker_r_helipad", 0.5, 0.5, 1,format ["Evac Point"], 2, 0.03, "RobotoCondensedLight","center"];};
If (Side player == Resistance) Then {drawIcon3D [_icon, [0,1,0,0.2], GetMarkerPos "marker_g_helipad", 0.5, 0.5, 1,format ["Evac Point"], 2, 0.03, "RobotoCondensedLight","center"];};
}];