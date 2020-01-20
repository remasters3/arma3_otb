/*findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["Draw","
	{ If (player == _x) Then {} Else {
	 
	    If (Side _x == Side Player) Then {
		 _clr = [1,1,1,1];
		 If (Side _x == West      ) Then {_clr = [0,0,1,0.2]};
		 If (Side _x == East      ) Then {_clr = [1,0,0,0.2]};
		 If (Side _x == Resistance) Then {_clr = [0,1,0,0.2]};
		 If (Side _x == Civilian  ) Then {_clr = [1,0,1,0.2]};
	     _this select 0 drawIcon [
	     'iconMan',
	     _clr,
	     getPos _x,
	     24,
	     24,
	     getDir _x,
	     format ['%1',name _x],
	     1,
	     0.03,
	     'TahomaB',
	     'right'
	     ];
	     };
	    };
	} Foreach allUnits;
"];*/
findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["Draw","
	{ If (player == _x) Then {} Else {
	 
	    If (Side _x == Side Player) Then {
	     _this select 0 drawIcon [
	     'iconMan',
	     [1,1,1,0.2],
	     getPos _x,
	     24,
	     24,
	     getDir _x,
	     format ['%1',name _x],
	     1,
	     0.03,
	     'TahomaB',
	     'right'
	     ];
	     };
	    };
	} Foreach allUnits;
"];

addMissionEventHandler ["Draw3D",{
  {
	_icon = 'iconMan';
    If (player == _x) Then {} Else {
	   If (Side _x == Side Player) Then {
	     If (Side _x == West      ) Then {drawIcon3D [_icon, [0,0,1,0.2], getPosATL _x, 1, 1, 1,format ["%1",name _x], 2, 0.03, "RobotoCondensedLight","center"];};
		 If (Side _x == East      ) Then {drawIcon3D [_icon, [1,0,0,0.2], getPosATL _x, 1, 1, 1,format ["%1",name _x], 2, 0.03, "RobotoCondensedLight","center"];};
		 If (Side _x == Resistance) Then {drawIcon3D [_icon, [0,1,0,0.2], getPosATL _x, 1, 1, 1,format ["%1",name _x], 2, 0.03, "RobotoCondensedLight","center"];};
		 If (Side _x == Civilian  ) Then {drawIcon3D [_icon, [1,0,1,0.2], getPosATL _x, 1, 1, 1,format ["%1",name _x], 2, 0.03, "RobotoCondensedLight","center"];};		 
	   };
	};
  } Foreach allUnits;
}];