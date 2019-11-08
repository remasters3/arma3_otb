if (!isDedicated) exitWith {};

[] spawn { while {true} do {


_AirattackDead = isNil "airattack";
_AirattackDead2 = isNil "airattack2";
_AirattackDead3 = isNil "airattack3";
IF (!_AirattackDead) Then 
{
  IF (!_AirattackDead2) Then   
    {
	  IF (!_AirattackDead3) Then
      {	
        { deleteVehicle _x; } forEach units group airattack; 
		deleteVehicle airattack; 
		deleteVehicle airattack2; 
		deleteVehicle airattack3;
		deleteVehicle airattack4;
	  };
    };
  };

_airattack = [(getMarkerPos "air_spawn_1"), 180, "O_Plane_CAS_02_F", East] call bis_fnc_spawnvehicle ;
airattack = _airattack select 0;
sleep 3;
_airattack2 = [(getMarkerPos "air_spawn_1"), 180, "O_Plane_CAS_02_F", (group airattack)] call bis_fnc_spawnvehicle;
airattack2 = _airattack2 select 0;
sleep 3;
_airattack3 = [(getMarkerPos "air_spawn_1"), 180, "O_Plane_CAS_02_F", (group airattack)] call bis_fnc_spawnvehicle;
airattack3 = _airattack3 select 0;

_airattack4 = [(getMarkerPos "air_spawn_1"), 180, "O_Heli_Attack_02_F", (group airattack)] call bis_fnc_spawnvehicle;
airattack4 = _airattack select 0;
sleep 3;
//_airattack5 = [(getMarkerPos "air_spawn_1"), 180, "O_Heli_Attack_02_F", (group airattack)] call bis_fnc_spawnvehicle;
//airattack5 = _airattack2 select 0;
//sleep 3;
//_airattack6 = [(getMarkerPos "air_spawn_1"), 180, "O_Heli_Attack_02_F", (group airattack)] call bis_fnc_spawnvehicle;
//airattack6 = _airattack3 select 0;

way1 = (group airattack) addWaypoint [(getMarkerpos "respawn_west"), 0];
way1 setWaypointType "MOVE";
way1 setWaypointBehaviour "COMBAT";
way1 setWaypointCombatMode "RED";
way1 setWaypointSpeed "FULL";
way2 = (group airattack) addWaypoint [(getMarkerpos "respawn_west"), 0];
way2 setWaypointType "DESTROY";
way2 setWaypointBehaviour "COMBAT";
way2 setWaypointCombatMode "RED";
way2 setWaypointSpeed "FULL";
		
Sleep 300;
{ deleteVehicle _x; } forEach units group airattack; 
deleteVehicle airattack; 
deleteVehicle airattack2; 
deleteVehicle airattack3;
deleteVehicle airattack4;
//deleteVehicle airattack5;
//deleteVehicle airattack6;
Sleep 600;
 };
};