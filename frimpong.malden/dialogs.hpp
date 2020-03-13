class GPF_Player_Dialog
{
  idd = 9999;
  movingEnabled = false;
  
  class controls
  {
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Remasters, v1.063, #Goripu)
////////////////////////////////////////////////////////

class GPF_rscPicture: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(0.5,0.5,0.5,0.5)";
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.201094 * safezoneW;
	h = 0.242 * safezoneH;
};
class GPF_rscButton0: RscButton
{
	idc = 1600;
	text = "Repair Vehicle"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.566 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;	
	h = 0.022 * safezoneH;
	action = "_items = items player; if ('ToolKit' in _items) then { _veh = vehicle player; if (player != _veh) Then {_veh setDammage 0;_veh SetFuel 1;};} Else {systemChat 'Needs Toolkit'};closeDialog 0";
};
class GPF_rscButton1: RscButton
{
	idc = 1601;
	text = "Deploy Support Troops"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0;[player] execVM 'troops.sqf';";
};
class GPF_rscButton2: RscButton
{
	idc = 1602;
	text = "Gear"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.566 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "['Open',true] spawn BIS_fnc_arsenal;closeDialog 0";
	//action = "if (playerHeli) Then { deleteVehicle hveh; hveh = [(GetPos player)] Call gpf_SpawnAirTransport; playerHeli = true;} Else {hveh = [(GetPos player)] Call gpf_SpawnAirTransport; playerHeli = true;};closeDialog 0";
	//action = "if (playerHeli) Then { deleteVehicle hveh; hveh = createVehicle ['C_Heli_Light_01_civil_F', position player, [], 0, 'FORM']; playerHeli = true;} Else {hveh = createVehicle ['C_Heli_Light_01_civil_F', position player, [], 0, 'FORM']; playerHeli= true;};closeDialog 0;";
	//action = "closeDialog 0;[player]execVM'garage.sqf';";
	
};
class GPF_rscButton3: RscButton
{
	idc = 1603;
	text = "Spawn ATV"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.533 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "if (playerQuad) Then { deleteVehicle pveh; pveh = [(GetPos player)] Call gpf_SpawnLandTransport; playerQuad = true;} Else {pveh = [(GetPos player)] Call gpf_SpawnLandTransport; playerQuad = true;};closeDialog 0";
	// action = "if (playerQuad) Then { deleteVehicle pveh; pveh = createVehicle ['B_G_Quadbike_01_F', position player, [], 0, 'FORM']; playerQuad = true;} Else {pveh = createVehicle ['B_G_Quadbike_01_F', position player, [], 0, 'FORM']; playerQuad = true;};closeDialog 0";
	// needs "playerQuad = false;" set in "InitPlayerLocal.sqf" file
};
class GPF_RSCButton4: RscButton
{
	idc = 1604;
	text = "Clear Support Troops"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "{ deleteVehicle _x } forEach units group player;closeDialog 0";
};
class GPF_RSCButton5: RscButton
{
	idc = 1605;
	text = "Spawn Heli";//text = "Gear"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.533 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "if (playerHeli) Then { deleteVehicle hveh; hveh = [(GetPos player)] Call gpf_SpawnAirTransport; playerHeli = true;} Else {hveh = [(GetPos player)] Call gpf_SpawnAirTransport; playerHeli = true;};closeDialog 0";
};
class GPF_RSCButton6: RscButton
{
	idc = 1606;
	text = "Ear Plugs"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.632 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "[player] Call GPF_fnc_earPlugs;closeDialog 0";
};
class GPF_RSCButton7: RscButton
{
	idc = 1607;
	text = "Air Evac"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.632 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0; [player] execVM 'evac.sqf';";
};
class GPF_RSCButton8: RscButton
{
	idc = 1608;
	text = "Toggle HUD Markers"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0;if (ShowFriendly) Then {ShowFriendly = false;} Else {ShowFriendly= true;};";
};
class GPF_RSCButton9: RscButton
{
	idc = 1609;
	text = "Groups Menu"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0;findDisplay 46 createDisplay 'RscDisplayDynamicGroups';";
};
class GPF_RSCButton11: RscButton
{
	idc = 1610;
	text = ""; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.698 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0;[player]execVM 'benifits.sqf';";
};
class GPF_RSCButton10: RscButton
{
	idc = 1611;
	text = "Placeholder_3"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.698 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0";
};
class GPF_RSCButton13: RscButton
{
	idc = 1612;
	text = "Placeholder_4"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.731 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0";
};
class GPF_RSCButton12: RscButton
{
	idc = 1613;
	text = "Placeholder_5"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.731 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
  };
};


class GPF_Benifits_Dialog
{
  idd = 9998;
  movingEnabled = false;
  
  class controls
  {
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Remasters, test)
////////////////////////////////////////////////////////

class GPF_rscPicture100: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(0.5,0.5,0.5,0.5)";
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.201094 * safezoneW;
	h = 0.242 * safezoneH;
};
class GPF_rscButton000: RscButton
{
	idc = 1600;
	text = "Go to.."; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.566 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0;[]execvm 'tp.sqf';";
};
class GPF_rscButton100: RscButton
{
	idc = 1601;
	text = "Kill All West"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0;{if (side _x == WEST) then { if (_x != player) then {_x SetDamage 1;};};} Foreach AllUnits;";
};
class GPF_rscButton200: RscButton
{
	idc = 1602;
	text = "Kill All East"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.566 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0;{if (side _x == EAST) then { if (_x != player) then {_x SetDamage 1;};};} Foreach AllUnits;";

	
};
class GPF_rscButton300: RscButton
{
	idc = 1603;
	text = "Kill All Resistance"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.533 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
    action = "closeDialog 0;{if (side _x == resistance) then { if (_x != player) then {_x SetDamage 1;};};} Foreach AllUnits;";
};
class GPF_RSCButton400: RscButton
{
	idc = 1604;
	text = "Kill All Civilian"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0;{if (side _x == civilian) then { if (_x != player) then {_x SetDamage 1;};};} Foreach AllUnits;";
};
class GPF_RSCButton500: RscButton
{
	idc = 1605;
	text = "home"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.533 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0;player setpos GetMarkerPos 'respawn_civilian';";
};
class GPF_RSCButton600: RscButton
{
	idc = 1606;
	text = "Garage"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.632 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "_pos = player getPos [30,getDir player];BIS_fnc_garage_center = createVehicle [ 'Land_HelipadEmpty_F', _pos, [], 0, 'CAN_COLLIDE' ];[ 'Open', true ] call BIS_fnc_garage;closeDialog 0";
};
class GPF_RSCButton700: RscButton
{
	idc = 1607;
	text = "Air Evac"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.632 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0; [player] execVM 'evac.sqf';";
};
class GPF_RSCButton800: RscButton
{
	idc = 1608;
	text = "Toggle HUD Icons"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0;if (ShowFriendly) Then {ShowFriendly = false;} Else {ShowFriendly= true;};";
};
class GPF_RSCButton900: RscButton
{
	idc = 1609;
	text = "Groups Menu"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0;findDisplay 46 createDisplay 'RscDisplayDynamicGroups';";
};
class GPF_RSCButton1100: RscButton
{
	idc = 1610;
	text = "Player Menu"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.698 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0;createDialog 'GPF_Player_Dialog';waitUntil {!isNull (findDisplay 9999);};";
};
class GPF_RSCButton1000: RscButton
{
	idc = 1611;
	text = "spawn heli"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.698 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "if (playerHeli) Then { deleteVehicle hveh; hveh = [(GetPos player)] Call gpf_SpawnAirTransport; playerHeli = true;} Else {hveh = [(GetPos player)] Call gpf_SpawnAirTransport; playerHeli = true;};closeDialog 0";
	//action = "closeDialog 0";
};
class GPF_RSCButton1300: RscButton
{
	idc = 1612;
	text = "Placeholder_4"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.731 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0";
};
class GPF_RSCButton1200: RscButton
{
	idc = 1613;
	text = "Placeholder_5"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.731 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT TEST END
////////////////////////////////////////////////////////
  };
};

class GPF_Crate_Dialog
{
  idd = 9997;
  movingEnabled = false;
  
  class controls
  {
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Remasters, v1.063, #Goripu)
////////////////////////////////////////////////////////

class GPF_rscPicture: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(0.5,0.5,0.5,0.5)";
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.201094 * safezoneW;
	h = 0.242 * safezoneH;
};
/*class GPF_rscButton0: RscButton
{
	idc = 1600;
	text = "Repair Vehicle"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.566 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;	
	h = 0.022 * safezoneH;
	action = "_items = items player; if ('ToolKit' in _items) then { _veh = vehicle player; if (player != _veh) Then {_veh setDammage 0;_veh SetFuel 1;};} Else {systemChat 'Needs Toolkit'};closeDialog 0";
};*/
class GPF_rscButton1: RscButton
{
	idc = 1601;
	text = "Ground Support"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0;[player] execVM 'troops.sqf';";
};
class GPF_rscButton2: RscButton
{
	idc = 1602;
	text = "Gear"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.566 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "['Open',true] spawn BIS_fnc_arsenal;closeDialog 0";
};
class GPF_rscButton3: RscButton
{
	idc = 1603;
	text = "Spawn ATV"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.566 * safezoneH + safezoneY;//y = 0.533 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "private _quad = [(GetMarkerPos 'marker_b_helipad'),0,'B_Quadbike_01_F',10] call GPF_fnc_SpawnVehicle;if (!isNull _quad) then {systemChat format ['%1',_this];player moveindriver _quad;_quad addEventHandler ['GetOut', '_veh = _this select 0;if (count crew _veh <= 0) Then {deleteVehicle _veh;};playerHeli = false;'];};closeDialog 0";
	// action = "if (playerQuad) Then { deleteVehicle pveh; pveh = createVehicle ['B_G_Quadbike_01_F', position player, [], 0, 'FORM']; playerQuad = true;} Else {pveh = createVehicle ['B_G_Quadbike_01_F', position player, [], 0, 'FORM']; playerQuad = true;};closeDialog 0";
	// needs "playerQuad = false;" set in "InitPlayerLocal.sqf" file
};
class GPF_RSCButton4: RscButton
{
	idc = 1604;
	text = "Clear Support Troops"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "{ deleteVehicle _x } forEach units group player;closeDialog 0";
};
class GPF_RSCButton5: RscButton
{
	idc = 1605;
	text = "";//text = "Gear"; //--- ToDo: Localize;
	x = 0.44 * safezoneW + safezoneX; //x = 0.489687 * safezoneW + safezoneX;
	y = 0.533 * safezoneH + safezoneY; //y = 0.566 * safezoneH + safezoneY;//y = 0.533 * safezoneH + safezoneY;
	w = 0.0928001* safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0";
};
/*class GPF_RSCButton6: RscButton
{
	idc = 1606;
	text = "Ear Plugs"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.632 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "[player] Call GPF_fnc_earPlugs;closeDialog 0";
};
class GPF_RSCButton7: RscButton
{
	idc = 1607;
	text = "Air Evac"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.632 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0; [player] execVM 'evac.sqf';";
};
class GPF_RSCButton8: RscButton
{
	idc = 1608;
	text = "Toggle HUD Markers"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0;if (ShowFriendly) Then {ShowFriendly = false;} Else {ShowFriendly= true;};";
};
class GPF_RSCButton9: RscButton
{
	idc = 1609;
	text = "Groups Menu"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0;findDisplay 46 createDisplay 'RscDisplayDynamicGroups';";
};

class GPF_RSCButton11: RscButton
{
	idc = 1610;
	text = ""; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.698 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0;[player]execVM 'benifits.sqf';";
};
class GPF_RSCButton10: RscButton
{
	idc = 1611;
	text = "Placeholder_3"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.698 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0";
};
class GPF_RSCButton13: RscButton
{
	idc = 1612;
	text = "Placeholder_4"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.731 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0";
};
class GPF_RSCButton12: RscButton

{
	idc = 1613;
	text = "Placeholder_5"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.731 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0";
};*/
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
  };
};