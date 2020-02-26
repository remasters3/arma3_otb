private _plyr = _this Select 0;
openMap true;waitUntil {inputAction 'ActionInMap' > 0};
private _cords = (findDisplay 12 displayCtrl 51) ctrlMapScreenToWorld getMousePosition; 			   
If (Side _plyr == west) Then {[GetPos _plyr,_cords,(Side _plyr),"B_Heli_Transport_01_camo_F",[40,41,42]] Call GPF_fnc_playerEvac;};
If (Side _plyr == east) Then {[GetPos _plyr,_cords,(Side _plyr),"O_Heli_Transport_04_covered_F",[40,41,42]] Call GPF_fnc_playerEvac;};
If (Side _plyr == resistance) Then {[GetPos _plyr,_cords,(Side _plyr),"I_Heli_Transport_02_F",[40,41,42]] Call GPF_fnc_playerEvac;};
If (Side _plyr == civilian) Then {[GetPos _plyr,_cords,(Side _plyr),"C_IDAP_Heli_Transport_02_F",[40,41,42]] Call GPF_fnc_playerEvac;};
openMap false;