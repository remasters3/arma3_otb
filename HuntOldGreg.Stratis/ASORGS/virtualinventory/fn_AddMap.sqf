#include "macro.sqf"
_item = _this select 0;
_class = _item call ASORGS_fnc_GetClass;
call ASORGS_fnc_RemoveMap;
if(_class == "") exitWith {};

_items = (ASORGS_CurrentInventory select GSVI_Items) + [_class];
ASORGS_CurrentInventory set [GSVI_Items, _items];
ASORGS_WeightChanged = true;