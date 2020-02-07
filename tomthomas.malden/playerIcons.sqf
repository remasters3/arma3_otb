addMissionEventHandler ["Draw3D",{
_icon = 'iconMan';
If (Side player == West      ) Then {_trgt = GetMarkerPos "marker_b_helipad"; _dst = player distance _trgt;drawIcon3D [_icon, [0,0,1,0.4],_trgt, 0.5, 0.5, 1,format ["%1m",floor _dst], 2, 0.04, "RobotoCondensedLight","center",true];};
If (Side player == East      ) Then {_trgt = GetMarkerPos "marker_r_helipad"; _dst = player distance _trgt;drawIcon3D [_icon, [1,0,0,0.4],_trgt, 0.5, 0.5, 1,format ["%1m",floor _dst], 2, 0.04, "RobotoCondensedLight","center",true];};
If (Side player == Resistance) Then {_trgt = GetMarkerPos "marker_g_helipad"; _dst = player distance _trgt;drawIcon3D [_icon, [0,1,0,0.4],_trgt, 0.5, 0.5, 1,format ["%1m",floor _dst], 2, 0.04, "RobotoCondensedLight","center",true];};
}];