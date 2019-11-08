private _plyr = _this Select 0;
private _pos = [(GetPos _plyr),0,50, 5, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
openMap true;waitUntil {inputAction 'ActionInMap' > 0};
private _cords = (findDisplay 12 displayCtrl 51) ctrlMapScreenToWorld getMousePosition; 			   
If (Side _plyr == west) Then {[_pos,_cords,(Side _plyr),"B_Heli_Light_01_F",[40,41,42]] Call GPF_fnc_playerEvac;};
If (Side _plyr == east) Then {[_pos,_cords,(Side _plyr),"O_Heli_Light_02_unarmed_F",[40,41,42]] Call GPF_fnc_playerEvac;};
If (Side _plyr == resistance) Then {[_pos,_cords,(Side _plyr),"I_Heli_light_03_unarmed_F",[40,41,42]] Call GPF_fnc_playerEvac;};
If (Side _plyr == civilian) Then {[_pos,_cords,(Side _plyr),"C_Heli_Light_01_civil_F",[40,41,42]] Call GPF_fnc_playerEvac;};
openMap false;