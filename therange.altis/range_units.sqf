//this addAction["debug", "[] execVM 'range_units.sqf'"]; this addAction["kill all", "Call DebugFunc"];
BlueMarkerPos = GetMarkerPos "marker_bunits";
RedMarkerPos = GetMarkerPos "marker_runits";
GreenMarkerPos = GetMarkerPos "marker_gunits";

AddWaypoints={ 
              private _wpgroup = _this select 0;          
                {
				 way0 = _wpgroup addWaypoint [(GetMarkerPos _x),0];
                 way0 setWaypointType "MOVE";
                 way0 setWaypointBehaviour "COMBAT";
                 way0 setWaypointCombatMode "RED";
                 way0 setWaypointSpeed "NORMAL";
				 way0 setWaypointFormation "COLUMN";
                 } ForEach ["marker_0","marker_1","marker_2","marker_3","marker_4","marker_5","marker_6","marker_7","marker_8"];
             };
			 
SpawnBlueUnits={
             private _delay = _this select 0;
			 _delay = 10;
			 bStartPosition = [BlueMarkerPos,100,200, 100, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
		    _bescort1 = [bStartPosition, 0, "B_APC_Tracked_01_rcws_F", west] call bis_fnc_spawnvehicle ;
            bescort1 = _bescort1 select 0;bTroops = group bescort1;_tr = [bTroops]Call AddWaypoints;
			//Sleep _delay;
			bStartPosition = [BlueMarkerPos,100,200, 100, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
			_bescort2 = [bStartPosition, 0, "B_APC_Wheeled_01_cannon_F", bTroops] call bis_fnc_spawnvehicle; 
			bescort2 = _bescort2 select 0;
			//Sleep _delay;
			bStartPosition = [BlueMarkerPos,100,200, 100, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
			_bescort3 = [bStartPosition, 0, "B_MBT_01_TUSK_F", bTroops] call bis_fnc_spawnvehicle; 			
			bescort3 = _bescort3 select 0;			
			//Sleep _delay;
			bStartPosition = [BlueMarkerPos,100,200, 100, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
			_bescort4 = [bStartPosition, 0, "B_MRAP_01_hmg_F", bTroops] call bis_fnc_spawnvehicle; 
			bescort4 = _bescort4 select 0;
			//Sleep _delay;
			bStartPosition = [BlueMarkerPos,100,200, 100, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
			_bescort5 = [bStartPosition, 0, "B_Heli_Light_01_armed_F", bTroops] call bis_fnc_spawnvehicle; 
			bescort5 = _bescort5 select 0;
			//Sleep _delay;
			bStartPosition = [BlueMarkerPos,100,200, 100, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
			bgroundgroup = [bStartPosition, WEST,20] call BIS_fnc_spawnGroup; {[_x] join bTroops;} forEach units bgroundgroup;
			publicVariable "bTroops";
};

SpawnRedUnits={
             private _delay = _this select 0;
			 _delay = 10;
			 rStartPosition = [RedMarkerPos,100,200, 100, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
		    _rescort1 = [rStartPosition, 0, "O_APC_Tracked_02_cannon_F", east] call bis_fnc_spawnvehicle ;
            rescort1 = _rescort1 select 0;rTroops = group rescort1;_tr = [rTroops]Call AddWaypoints;
			//Sleep _delay;
			rStartPosition = [RedMarkerPos,100,200, 100, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
			_rescort2 = [rStartPosition, 0, "O_MRAP_02_hmg_F", rTroops] call bis_fnc_spawnvehicle; 
			rescort2 = _rescort2 select 0;
			//Sleep _delay;
			rStartPosition = [RedMarkerPos,100,200, 100, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
			_rescort3 = [rStartPosition, 0, "O_APC_Wheeled_02_rcws_F", rTroops] call bis_fnc_spawnvehicle; 			
			rescort3 = _rescort3 select 0;
			//Sleep _delay;
			rStartPosition = [RedMarkerPos,100,200, 100, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
			_rescort4 = [rStartPosition, 0, "O_MBT_02_cannon_F", rTroops] call bis_fnc_spawnvehicle; 
			rescort4 = _rescort4 select 0;
			//Sleep _delay;
			rStartPosition = [RedMarkerPos,100,200, 100, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
			_rescort5 = [rStartPosition, 0, "O_Heli_Light_02_F", rTroops] call bis_fnc_spawnvehicle; 
			rescort5 = _rescort5 select 0;
			//Sleep _delay;
			rStartPosition = [RedMarkerPos,100,200, 100, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
			rgroundgroup = [rStartPosition, EAST,20] call BIS_fnc_spawnGroup; {[_x] join rTroops;} forEach units rgroundgroup;
			publicVariable "rTroops";
};

SpawnGreenUnits={
             private _delay = _this select 0;
			 _delay = 10;
			 gStartPosition = [GreenMarkerPos,100,200, 100, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
		    _gescort1 = [gStartPosition, 0, "I_APC_tracked_03_cannon_F", resistance] call bis_fnc_spawnvehicle ;
            gescort1 = _gescort1 select 0;gTroops = group gescort1;_tr = [gTroops]Call AddWaypoints;
			//Sleep _delay;
			gStartPosition = [GreenMarkerPos,100,200, 100, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
			_gescort2 = [gStartPosition, 0, "I_APC_Wheeled_03_cannon_F", gTroops] call bis_fnc_spawnvehicle; 
			gescort2 = _gescort2 select 0;
			//Sleep _delay;
			gStartPosition = [GreenMarkerPos,100,200, 100, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
			_gescort3 = [gStartPosition, 0, "I_MBT_03_cannon_F", gTroops] call bis_fnc_spawnvehicle; 			
			gescort3 = _gescort3 select 0;
			//Sleep _delay;
			gStartPosition = [GreenMarkerPos,100,200, 100, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
			_gescort4 = [gStartPosition, 0, "I_MRAP_03_hmg_F", gTroops] call bis_fnc_spawnvehicle; 
			gescort4 = _gescort4 select 0;
			//Sleep _delay;
			gStartPosition = [GreenMarkerPos,100,200, 100, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;;
			_gescort5 = [gStartPosition, 0, "I_Heli_light_03_F", gTroops] call bis_fnc_spawnvehicle; 
			gescort5 = _gescort5 select 0;
			//Sleep _delay;
			gStartPosition = [GreenMarkerPos,100,200, 100, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
			ggroundgroup = [gStartPosition, resistance,20] call BIS_fnc_spawnGroup; {[_x] join gTroops;} forEach units ggroundgroup;
			publicVariable "gTroops";
};

CleanUpBlue={
             {deleteVehicle _x;}  forEach units bTroops;
			 {deleteVehicle _x;} forEach [bescort1,bescort2,bescort3,bescort4,bescort5];
};

CleanUpRed={
            {deleteVehicle _x;}  forEach units rTroops;
		    {deleteVehicle _x;} forEach [rescort1,rescort2,rescort3,rescort4,rescort5];
};
CleanUpGreen={
              {deleteVehicle _x;}  forEach units gTroops;
			  {deleteVehicle _x;} forEach [gescort1,gescort2,gescort3,gescort4,gescort5];
};


[] Spawn {
           //Troops = [StartPosition,west, 10] call BIS_fnc_spawnGroup;Call AddWaypoints;
          _bu = [10] Call SpawnBlueUnits;
		  _ru = [10] Call SpawnRedUnits;
		  _gu = [10] Call SpawnGreenUnits;
          _bUnitCount = {alive _x} count units bTroops ;
		  _rUnitCount = {alive _x} count units rTroops ;
		  _gUnitCount = {alive _x} count units gTroops ;
          
         
		   while {true} do {
		            Sleep 60;
					_minunits = 20;
		            _bUnitCount = {alive _x} count units bTroops;
                    _rUnitCount = {alive _x} count units rTroops ;                    
                    _gUnitCount = {alive _x} count units gTroops ;
					
		             IF ( _bUnitCount < _minunits) THEN {
                          Call CleanUpBlue;					 
                          _bu = [10] Call SpawnBlueUnits;
						  _tr = [bTroops]Call AddWaypoints;
						  };
					 IF ( _rUnitCount < _minunits) THEN {
                           Call CleanUpRed;
						   _ru = [10] Call SpawnRedUnits;
                          _tr = [rTroops]Call AddWaypoints;						   
                          
						  };						  
					 IF ( _gUnitCount < _minunits) THEN {	
                           Call CleanUpGreen;
						   _gu = [10] Call SpawnGreenUnits; 
                          _tr = [gTroops]Call AddWaypoints;					   
						  };
  
					_tr = [bTroops]Call AddWaypoints;	  
					_tr = [rTroops]Call AddWaypoints;
					_tr = [gTroops]Call AddWaypoints;			 
				 };

};


[]spawn{
         while  {true} do {
		    Sleep 300;
			Call CleanUpBlue;
			Call CleanUpRed;
			Call CleanUpGreen;
			
		 };
};


DebugFunc={
           {deleteVehicle _x;}  forEach units bTroops;
           {deleteVehicle _x;}  forEach units rTroops;
           {deleteVehicle _x;}  forEach units gTroops;
           {deleteVehicle _x;} forEach [bescort1,bescort2,bescort3,bescort4,bescort5];
           {deleteVehicle _x;} forEach [rescort1,rescort2,rescort3,rescort4,rescort5];
           {deleteVehicle _x;} forEach [gescort1,gescort2,gescort3,gescort4,gescort5];
};
