#include "macro.sqf"
private ["_GPS", "_items"];
_GPS = call ASORGS_fnc_GetGPS;
_items = (ASORGS_CurrentInventory select GSVI_Items) - [_GPS];
ASORGS_CurrentInventory set [GSVI_Items, _items];
ASORGS_WeightChanged = true;