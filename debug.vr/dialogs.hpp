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
	text = "Repair"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.566 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "_veh = vehicle player; _veh setDammage 0;closeDialog 0";
};
class GPF_rscButton1: RscButton
{
	idc = 1601;
	text = "Call Troops"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0;[player] execVM 'troops.sqf';";
};
class GPF_rscButton2: RscButton
{
	idc = 1602;
	text = "Garage"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.566 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	//action = "['Open',true] call BIS_fnc_garage;closeDialog 0";
	action = "closeDialog 0;[player]execVM'garage.sqf';";
	
};
class GPF_rscButton3: RscButton
{
	idc = 1603;
	text = "Spawn ATV"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.533 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "if (playerQuad) Then { deleteVehicle pveh; pveh = createVehicle ['B_G_Quadbike_01_F', position player, [], 0, 'FORM']; playerQuad = true;} Else {pveh = createVehicle ['B_G_Quadbike_01_F', position player, [], 0, 'FORM']; playerQuad = true;};closeDialog 0";
	// needs "playerQuad = false;" set in "InitPlayerLocal.sqf" file
};
class GPF_RSCButton4: RscButton
{
	idc = 1604;
	text = "Clear Troops"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "{ deleteVehicle _x } forEach units group player;closeDialog 0";
};
class GPF_RSCButton5: RscButton
{
	idc = 1605;
	text = "Arsenal"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.533 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "['Open',true] spawn BIS_fnc_arsenal;closeDialog 0";
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
	text = "Call Evac"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.632 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0; [player] execVM 'evac.sqf';";
};
class GPF_RSCButton8: RscButton
{
	idc = 1608;
	text = "Placeholder_0"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0;";
};
class GPF_RSCButton9: RscButton
{
	idc = 1609;
	text = "Placeholder_1"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0";
};
class GPF_RSCButton11: RscButton
{
	idc = 1610;
	text = "Placeholder_2"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.698 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0";
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
