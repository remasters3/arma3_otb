_Pos = _this select 0;
_model = _this select 1;

OBJUP = true; publicVariable "OBJUP";
OBJ_0 = createVehicle [_model, _Pos Select 0, [], 0, "FORM"]; _marker0 = createMarker ["OBJ_0MARKER",_Pos Select 0];
OBJ_1 = createVehicle [_model, _Pos Select 1, [], 0, "FORM"]; _marker1 = createMarker ["OBJ_1MARKER",_Pos Select 1];
OBJ_2 = createVehicle [_model, _Pos Select 2, [], 0, "FORM"]; _marker2 = createMarker ["OBJ_2MARKER",_Pos Select 2];
OBJ_3 = createVehicle [_model, _Pos Select 3, [], 0, "FORM"]; _marker3 = createMarker ["OBJ_3MARKER",_Pos Select 3];
OBJ_4 = createVehicle [_model, _Pos Select 4, [], 0, "FORM"]; _marker4 = createMarker ["OBJ_4MARKER",_Pos Select 4];
OBJ_5 = createVehicle [_model, _Pos Select 5, [], 0, "FORM"]; _marker5 = createMarker ["OBJ_5MARKER",_Pos Select 5];

_objs = [OBJ_0,OBJ_1,OBJ_2,OBJ_3,OBJ_4,OBJ_5];
_markers = ["OBJ_0MARKER","OBJ_1MARKER","OBJ_2MARKER","OBJ_3MARKER","OBJ_4MARKER","OBJ_5MARKER"]; 	     		 
{_X setMarkerType "hd_destroy"; _X setMarkerColor "ColorBlack";} Foreach _markers;
 
 
 
[_objs,_markers] Spawn { _objs = _this Select 0; _markers = _this Select 1;
    _obj0 = 0;
    _obj1 = 0;
    _obj2 = 0;
    _obj3 = 0;
    _obj4 = 0;
    _obj5 = 0;
    
    while {OBJUP && true} do {
      Sleep 10;  
      IF ((!alive OBJ_0)) THEN {_obj0 = 1;deleteMarker "OBJ_0MARKER";};
      IF ((!alive OBJ_1)) THEN {_obj1 = 1;deleteMarker "OBJ_1MARKER";};
      IF ((!alive OBJ_2)) THEN {_obj2 = 1;deleteMarker "OBJ_2MARKER";};
      IF ((!alive OBJ_3)) THEN {_obj3 = 1;deleteMarker "OBJ_3MARKER";};
      IF ((!alive OBJ_4)) THEN {_obj4 = 1;deleteMarker "OBJ_4MARKER";};
      IF ((!alive OBJ_5)) THEN {_obj5 = 1;deleteMarker "OBJ_5MARKER";};
      
      _objvalue = _obj0+_obj1+_obj2+_obj3+_obj4+_obj5;
      _objcount = 5;
      IF (_objvalue > _objcount) Then {OBJUP = false; publicVariable "OBJUP";};
	  hint format ["%1",_objvalue];
      };
    waitUntil {!OBJUP};
	hint format ["Status %1",OBJUP];
	{deleteVehicle _x;} foreach _objs;
};
