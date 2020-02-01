
		class Item13
		{
			dataType="Trigger";
			position[]={4117.626,5,4015.2439};
			angle=4.8067756;
			class Attributes
			{
				name="repairtrigger_00";
				condition="(""LandVehicle"" countType thislist  > 0) && ((getpos (thislist select 0)) select 2 < 1)";
				onActivation="_xhandle= (thislist select 0) execVM ""x_reload.sqf"";";
				sizeA=6;
				sizeB=6;
				repeatable=1;
				activationBy="ANY";
			};
			id=75;
			type="EmptyDetector";
		};
		

{		
 
_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [5, 5, 0, false];
_trg setTriggerActivation ["ANY", "PRESENT", true];
_trg setTriggerStatements ["this", "_xhandle= (thislist select 0) execVM 'x_reload.sqf'", ""];
} 


_xhandle= (thislist select 0) execVM 'x_reload.sqf'






































Call OBJ1; // Kill the heli transport
sleep 10; _objs = [KILLHELI_0,KILLHELI_1,KILLHELI_2,KILLHELI_3,KILLHELI_4,KILLHELI_5];{_x SetDamage 1;} foreach _objs; //debug
waitUntil {!OBJ1UP}; 
Sleep 30;
Call OBJ2; // Hold The Airfield
Sleep 10; {if (side _x == EAST) then { _x SetDamage 1;};} Foreach AllUnits; //debug
waitUntil {!OBJ2UP};
Call OBJ3; // Clear the Landing
SPAWNTOWERS = true; publicVariable "SPAWNTOWERS";
[["OBJ3Towermarker_00","OBJ3Towermarker_01","OBJ3Towermarker_02","OBJ3Towermarker_03"],east,"O_soldier_M_F"] Call GuardTowers;
SPAWNBARRAKS = true; publicVariable "SPAWNBARRAKS";
["obj3_troops","obj3_troops",5,30,east,["blacklist_05","blacklist_06","blacklist_07","blacklist_08"]] Call Barraks;
Sleep 10; {if (side _x == EAST) then { _x SetDamage 1;};} Foreach AllUnits; //debug
waitUntil {!OBJ3UP};
SPAWNTOWERS = false; publicVariable "SPAWNTOWERS";
SPAWNBARRAKS = false; publicVariable "SPAWNBARRAKS";
sleep 10;
"EveryoneWon" call BIS_fnc_endMissionServer;


_grp = createGroup [east, true]; _unit =  "O_soldier_M_F" createUnit [[709.561,12240,4], _grp];_unit setPosASL [getPosASL DMCT_14 select 0, getPosASL DMCT_14 select 1, getPosASL DMCT_14 select 2];

_grp = createGroup [east, true]; _unit =  "O_soldier_M_F" createUnit [[709.561,12240,4], _grp];

_unit setPosASL [getPosASL DMCT_14 select 0, (DMCT_14 player select 1) + 10, DMCT_14 select 2];

player setPosASL [getPosASL DMCT_14 select 0, getPosASL DMCT_14 select 1, (getPosASL player select 2) + 10];

{if (side _x == EAST) then { _x SetDamage 1;};} Foreach AllUnits;
this AddAction ["Kill East","{if (side _x == EAST) then { _x SetDamage 1;};} Foreach AllUnits;"];
this AddAction ["Kill West","{if (side _x == WEST) then { _x SetDamage 1;};} Foreach AllUnits;"];


_grp = createGroup [east, true]; 
_unit = _grp createUnit ["O_soldier_M_F", GetPos DMCT_14,[], 0,"FORM"];
_unit setPosASL [(getPosASL DMCT_14 select 0) + 0.5, (getPosASL DMCT_14 select 1) + 0.5, (getPosASL DMCT_14 select 2) + 4];

_OBJ3Towermarkers = ["OBJ3Towermarker_00","OBJ3Towermarker_01","OBJ3Towermarker_02"];
{
 _tower = createVehicle ["Land_Cargo_Patrol_V3_F", GetMarkerPos _x, [], 0, "FORM"];
 _grp = createGroup [east, true]; 
 _unit = _grp createUnit ["O_soldier_M_F", GetPos _tower,[], 0,"FORM"];
 _unit setPosASL [(getPosASL _tower select 0) + 0.5, (getPosASL _tower select 1) + 0.5, (getPosASL _tower select 2) + 4];
} Foreach _OBJ3Towermarkers;


Land_Cargo_Patrol_V3_F (DMCT_12)
_grp = createGroup [east, true]; 
_unit = _grp createUnit ["O_soldier_M_F", GetPos DMCT_14,[], 0,"FORM"];
_unit setPosASL [getPosASL DMCT_14 select 0, (getPosASL DMCT_14 select 1) + 0.5, (getPosASL DMCT_14 select 2) + 4];

 _unit setPosASL [getPosASL DMCT_14 select 0, getPosASL DMCT_14 select 1, getPosASL player select 2];



_pundit = 'C_journalist_F' createVehicle getMarkerPos " ";
pundit globalChat format["Medic is in route for %1", (name _x)];

pundit globalChat format["Hello World"];

//recure tigger
//// Condition
civilian1 in thislist
//// action
Call RescueOver;

this addaction ["MH-9 Hummingbird",'["B_Heli_Light_01_F"]Call SelectEvacHeli;']; 
this addaction ["UH-80 Ghost Hawk",'["B_Heli_Transport_01_F"]Call SelectEvacHeli;']; 
this addaction ["M-290 Taru",'["O_Heli_Transport_04_bench_F"]Call SelectEvacHeli;'];
this addAction ["Recall Heli", "Call ResetHeli;"];
this addAction ["boom", "_objs = [KILLHELI_0,KILLHELI_1,KILLHELI_2,KILLHELI_3,KILLHELI_4,KILLHELI_5];{_x SetDamage 1;} foreach _objs;"];
player MoveInCargo CounterDropHeli;

this addAction ["2Choppa", "player MoveInCargo CounterDropHeli;"];
this addAction ["2OBJ2", "player SetPos GetPos DMCT_1;"];
this addAction ["boom", "_objs = [KILLHELI_0,KILLHELI_1,KILLHELI_2,KILLHELI_3,KILLHELI_4,KILLHELI_5];{_x SetDamage 1;} foreach _objs;"];
this addAction ["heli group", "_group = group CounterDropHeli;[player] Join _group;"];
this addAction ["count enemy",'hint Format ["%1",east countSide AllUnits];'];


this addAction ["Fatigue Off", "player enableFatigue false;"];




nul = [this, -1, nil, "FULL"] execVM "R3F_LOG\USER_FUNCT\init_creation_factory.sqf"; 
_null = [this, 1, 1, 2] execVM "heal.sqf"; 
this setVariable ["R3F_LOG_disabled", true]; 
this addAction ["Teleport to Spawn Vehicle", "player moveInCargo spawntruck_blue"];   
this addAction["Ground Troops","execvm 'backupunits_blue.sqf'"]; 
this addAction["Air Support", "execvm 'airsupport.sqf'"]; 
this addAction["Remove Ground Troops","execVM 'clearbackupunits.sqf'"]; 
this addAction["Remove Air Support","execVM 'clearairsupport.sqf'"]; 
this addAction["Remove All Units", "execvm 'removegroup.sqf'"];




for "_i" from 1 to 3 do {this addItemToUniform "11Rnd_45ACP_Mag";};
this addWeapon "hgun_Pistol_heavy_01_F";
this addHandgunItem "muzzle_snds_acp";
this addHandgunItem "optic_MRD";


comment "Exported from Arsenal by Remasters";

comment "Remove existing items";
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;
removeGoggles this;

comment "Add containers";
this forceAddUniform "U_C_Poor_2";
for "_i" from 1 to 3 do {this addItemToUniform "30Rnd_545x39_Mag_F";};
this addGoggles "G_Aviator";

comment "Add weapons";
this addWeapon "arifle_AKS_F";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";

comment "Set identity";
this setFace "GreekHead_A3_06";
this setSpeaker "Male06GRE";








Land_Medevac_house_V1_F




[3068.16,12569.6,0.621745]
[3068.18,12570.2,0.631307]














_tgt = "some text"; this addAction ["firescript", {hint format ["var eq  %1!",_this Select 0]}];


this addAction ["firescript", {(_this select 0) moveincargo car;}];

(_this select 0) moveincargo car;


corpseRemovalMinTime = 600;
corpseRemovalMaxTime = 1200;
corpseLimit = 1;

wreckLimit = 1;
wreckRemovalMinTime = 60;
wreckRemovalMinTime = 61;


_idx = this addEventHandler ["Dammaged", {_obj = this SetDamage 0;}]

_idx = this addEventHandler ["Dammaged", {_obj = _this select 0;_obj SetDamage 0;}];
this addEventHandler ["Fired",{[_this select 0,getNumber (configFile/"CfgAmmo"/(_this select 4)/"explosive")] spawn {if (_this select 1==1) then {sleep 0.75};_this select 0 setVehicleAmmo 1}}];






//inmfite ammo
this addEventHandler ["Fired",{[_this select 0,getNumber (configFile/"CfgAmmo"/(_this select 4)/"explosive")] spawn {if (_this select 1==1) then {sleep 0.75};_this select 0 setVehicleAmmo 1}}];
this addEventHandler ["Dammaged",_this SetDamage 0;];





comment "Exported from Arsenal by Remasters";

comment "Remove existing items";
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;
removeGoggles this;

comment "Add containers";
this forceAddUniform "U_I_C_Soldier_Bandit_3_F";
for "_i" from 1 to 3 do {this addItemToUniform "11Rnd_45ACP_Mag";};
this addVest "V_Rangemaster_belt";
for "_i" from 1 to 3 do {this addItemToVest "30Rnd_556x45_Stanag";};
this addBackpack "B_FieldPack_oucamo";
this addHeadgear "H_Cap_red";

comment "Add weapons";
this addWeapon "arifle_Mk20_plain_F";
this addPrimaryWeaponItem "muzzle_snds_M";
this addPrimaryWeaponItem "acc_flashlight";
this addPrimaryWeaponItem "optic_Aco";
this addWeapon "hgun_Pistol_heavy_01_F";
this addHandgunItem "muzzle_snds_acp";
this addHandgunItem "optic_MRD";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";
this linkItem "ItemGPS";














nul = [this, -1, nil, "FULL"] execVM "R3F_LOG\USER_FUNCT\init_creation_factory.sqf";
_null = [this, 1, 1, 2] execVM "heal.sqf";
this addAction["Gear", "execvm 'ASORGS\open.sqf'"]; 
this setVariable ["R3F_LOG_disabled", true];
this addAction ["Teleport to Spawn Vehicle", "player moveInCargo spawntruck_blue"];  
this addAction["Ground Troops","execvm 'backupunits_blue.sqf'"];
this addAction["Air Support", "execvm 'airsupport.sqf'"];
this addAction["Remove Ground Troops","execVM 'clearbackupunits.sqf'"];
this addAction["Remove Air Support","execVM 'clearairsupport.sqf'"];
this addAction["Remove All Units", "execvm 'removegroup.sqf'"];












[] Spawn {
While {true} do {

_markerList = [];

{
_marker = createMarkerLocal [format ["%1",name _x], getPos _x]; 
_marker setMarkerShapeLocal "ICON";         
if (side _x == WEST) then {_marker setMarkerColorLocal "ColorBlue";} else {_marker setMarkerColorLocal "ColorRED";};    
_marker setMarkerTypeLocal "b_inf";  
_marker setMarkerTextLocal format ["%1",_x]; 
_markerList = _markerList + [_marker];
} foreach allunits;

sleep 10;

{deleteMarkerLocal _x} foreach _markerList; 

};

};






DropHeliMove={
                while {_heliAlive = alive DropHeli; _heliAlive && true} do
		             {
					    sleep 10;
					    IF (HeliTarget) THEN { DropHeli setDamage 0; Call EvacHomeWaypoint;};
						IF (HeliHome) THEN { DropHeli setDamage 0; [_targetposition] Call EvacTargetWaypoint;}; 
			            //DropHeli setDamage 0;
		                //waitUntil {HeliHome};
	                    //hint format["HeliHome EQ 1% \nHeli Leaves in %2 Seconds",HeliHome,60];
	                    //sleep 60;
		                //_targetposition = GetMarkerPos _markername;
		                //[_targetposition] Call EvacTargetWaypoint;
	                    //hint format["HeliHome EQ 1% \nThe Heli is Leaving",HeliHome];
		                //waitUntil {HeliTarget};
						//sleep 30;
	                    //Call EvacHomeWaypoint;
					 };
};

DropHomeTrigger={Sleep 60;HeliTarget = false; HeliHome = true; publicVariable "HeliTarget"; publicVariable "HeliHome";};















DropTargetTrigger={Sleep 10;HeliTarget = true;HeliHome = false; publicVariable "HeliTarget"; publicVariable "HeliHome";};


IF (HeliTarget) THEN { DropHeli setDamage 0; Call EvacHomeWaypoint;} 



//box
_nul = [this] execVM"R3F_LOG\USER_FUNCT\init_creation_factory.sqf";



nul = [this, -1, nil, "FULL"] execVM "R3F_LOG\USER_FUNCT\init_creation_factory.sqf";
_null = [this, 1, 1, 2] execVM "heal.sqf"; 
this addAction["Gear", "execvm 'ASORGS\open.sqf'"];
this setVariable ["R3F_LOG_disabled", true]; 
this addAction ["Teleport to spawntruck", "player moveInCargo spawntruck_blue"]; 
this addAction["Clear Backup","execVM 'clearbackupunits.sqf'"]; 
this addAction["Get Backup","execvm 'backupunits_blue.sqf'"];

//spawn truck baseerace
this addAction["Gear", "execvm 'ASORGS\open.sqf'"]; 
this addAction["Spwn ATV","'B_G_Quadbike_01_F' createVehicle position player"];     
this addAction["Get Backup","execvm 'backupunits.sqf'"];    
this addAction["Clear Backup","execVM 'clearbackupunits.sqf'"]; 
this addAction["Repair","[spawntruck_blue setDamage 0]"]; 
_nul = [this] execVM"R3F_LOG\USER_FUNCT\init_creation_factory.sqf";  
_null = [this, 10, 1, 2] execVM "heal.sqf";

_nul = [ this, 300, 60 ] spawn LVR_fnc_vehRespawn;

{deleteVehicle _x;} forEach allDeadMen;{deleteVehicle _x;} forEach allDead;




Resistance setFriend [East, 0];
Resistance setFriend [West, 0];
East setFriend [Resistance, 0];
West setFriend [Resistance, 0];

   player addAction["Get Backup","execvm 'backupunits.sqf'"];   
   player addAction["Clear Backup","execVM 'clearbackupunits.sqf'"];
   player addaction ["KillEmAll","{ deleteVehicle _x } forEach units BRGROUP"];


_pos = GetMarkerPos "marker_10"; _group = group player; {_x SetPos _pos;}forEach units _group;
{_x setDamage 1; _x groupChat "Braaains"} forEach allUnits;
this addaction ["KillEmAll",({ deleteVehicle _x } forEach units BRGROUP;)];

this addaction ["Call Evac","[group player,(getMarkerPos "respawn_west"), (GetPos getPos player), (getPos "evac_pad"), "B_Heli_Transport_03_F", "GET IN", [{ hintSilent "SPAWNED!"; }, { hintSilent "LANDED AT EXTRACTION POINT!"; }, { hintSilent "LANDED AT EXTRACTION TARGET!"; }]] execVM "extraction.sqf";"

// spawn truck
this addAction["firescript","execvm 'spawntruck.sqf'"];  
this addAction["Clear Backup","execVM 'clearbackupunits.sqf'"]; 
_nul = [ this, 120, 10,LVR_fn_spawntruckblueInit] spawn LVR_fnc_vehRespawn;
_nul = [ this, 05, 05, LVR_fnc_testInit  ] spawn LVR_fnc_vehRespawn


this addAction["Gear", "execvm 'ASORGS\open.sqf'"];
this addAction["Spwn ATV","'B_G_Quadbike_01_F' createVehicle position player"];    
this addAction["Get Backup","execvm 'backupunits.sqf'"];   
this addAction["Clear Backup","execVM 'clearbackupunits.sqf'"];
this addAction["Repair","[spawntruck_blue setDamage 0]"];
_nul = [this] execVM"R3F_LOG\USER_FUNCT\init_creation_factory.sqf"; 
_null = [this, 10, 1, 2] execVM "heal.sqf";


this addAction["Gear", "execvm 'ASORGS\open.sqf'"];
this addAction["Spwn ATV","'B_G_Quadbike_01_F' createVehicle position player"];
_null = [this, 10, 1, 2] execVM "heal.sqf";

nul = [my_factory] execVM "R3F_LOG\USER_FUNCT\init_creation_factory.sqf";

_null = [this, 10, 1, 2] execVM "heal.sqf"; nul = [this] execVM "R3F_LOG\USER_FUNCT\init_creation_factory.sqf"; this setVariable ["R3F_LOG_disabled", true];


_nul = [ this, 120, 10 ] spawn LVR_fnc_vehRespawn;

_nul = [ this, 120, 10, LVR_fn_spawntruckInit ] spawn LVR_fnc_vehRespawn;

_null = [this, 10, 1, 2] execVM "heal.sqf"; nul = [this] execVM "R3F_LOG\USER_FUNCT\init_creation_factory.sqf"; _nul = [ this, 120, 10, LVR_fn_spawntruckInit ] spawn LVR_fnc_vehRespawn;

_swt =_this Select 0 ;
_swt addAction["Get Backup","execvm 'backupunits.sqf'"]; 
_swt addAction["Spwn ATV","'B_G_Quadbike_01_F' createVehicle position player"];

_swt addAction["Clear Backup","execVM 'clearbackupunits.sqf'"];
_null = [_this, 10, 1, 2] execVM "heal.sqf"; 
_null = [ _this, 1800, 1, LVR_fnc_spawntruckInit ] spawn LVR_fnc_vehRespawn

this addAction ["Teliport to spawntruck", "player moveInCargo spawntruck_blue"]; 

//creation box
_null = [this, 1, 1, 2] execVM "heal.sqf";
_null = [this] execVM "R3F_LOG\USER_FUNCT\init_creation_factory.sqf";
this setVariable ["R3F_LOG_disabled", true];
this addAction ["Teliport to spawntruck", "player moveInCargo spawntruck_blue"];
this addAction["Clear Backup","execVM 'clearbackupunits.sqf'"];
this addAction["Get Backup","execvm 'backupunits_blue.sqf'"];

(thislist select 0) setPos getPos base2
//spawntruck
this addAction["Get Backup","execvm 'backupunits_blue.sqf'"]; 
this addAction["Clear Backup","execVM 'clearbackupunits.sqf'"];
_nul = [ this, 120, 10,LVR_fn_spawntruckblueInit] spawn LVR_fnc_vehRespawn;

//bluebox// this addAction["Return Box","bluebox setPos (getMarkerPos 'boxmarkerblue')"];
_null = [this, 1, 1, 2] execVM "heal.sqf"; 
_null = [this] execVM "R3F_LOG\USER_FUNCT\init_creation_factory.sqf"; 
this addAction["Clear Backup","execVM 'clearbackupunits.sqf'"]; 
this addAction["Get Backup","execvm 'backupunits_blue.sqf'"];

spawntruck_blue
this addAction["Gear", "execvm 'ASORGS\open.sqf'"];
this addAction["Get Backup","execvm 'backupunits.sqf'"];   
this addAction ["Recall SpawnTruck"] execVM "spawntruck.sqf";]
this addAction["Spwn ATV","'B_G_Quadbike_01_F' createVehicle position player"];  
this addAction["Home","tphome.sqf"];   
this addAction["Clear Backup","execVM 'clearbackupunits.sqf'"];  
_null = [this, 10, 1, 2] execVM "heal.sqf";    
_null = [ this, 1800, 1, LVR_fnc_spawntruckInit ] spawn LVR_fnc_vehRespawn 