class GPF_Player_Dialog
{
  idd = 9999;
  movingEnabled = false;
  
  class controls
  {
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Remasters, v1.063, #Ficotu)
////////////////////////////////////////////////////////

class GPF_rscPicture: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(0.5,0.5,0.5,0.5)";
	x = 0.453594 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.176 * safezoneH;
};
class GPF_rscButton0: RscButton
{
	idc = 1600;
	text = "Close"; //--- ToDo: Localize;
	x = 0.45875 * safezoneW + safezoneX;
	y = 0.731 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.022 * safezoneH;
	action = "closeDialog 0";
	
};
class GPF_rscButton1: RscButton
{
	idc = 1601;
	text = "Call Evac"; //--- ToDo: Localize;
	x = 0.45875 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.022 * safezoneH;
	action = "[GetPos Player,GetMarkerPos 'respawn_marker',west,'B_Heli_Transport_01_camo_F',[40,41,42]] execVM 'fnc_evac.sqf';closeDialog 0";
};
class GPF_rscButton2: RscButton
{
	idc = 1602;
	text = "Reinforcements"; //--- ToDo: Localize;
	x = 0.45875 * safezoneW + safezoneX;
	y = 0.632 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.022 * safezoneH;
	action = "[player,'B_Heli_Transport_01_camo_F','B_soldier_PG_F'] Call GPF_fnc_playerSupport;closeDialog 0";
};
class GPF_rscButton3: RscButton
{
	idc = 1603;
	text = "Spawn ATV"; //--- ToDo: Localize;
	x = 0.45875 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.022 * safezoneH;
	action = "if (playerQuad) Then { deleteVehicle pveh; pveh = createVehicle ['B_G_Quadbike_01_F', position player, [], 0, 'FORM']; playerQuad = true;} Else {pveh = createVehicle ['B_G_Quadbike_01_F', position player, [], 0, 'FORM']; playerQuad = true;};closeDialog 0";
};
class GPF_RSCButton4: RscButton
{
	idc = 1604;
	text = "Clear Troops"; //--- ToDo: Localize;
	x = 0.45875 * safezoneW + safezoneX;
	y = 0.698 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.022 * safezoneH;
	action = "{ deleteVehicle _x } forEach units group player;closeDialog 0";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

  };
};
