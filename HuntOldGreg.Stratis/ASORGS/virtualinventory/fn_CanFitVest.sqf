#include "macro.sqf"
private ["_item", "_mass"];
_item = _this;
call ASORGS_fnc_UpdateWeight;
_mass = _item call ASORGS_fnc_GetItemMass;

if((ASORGS_VestFilled + _mass) > ASORGS_VestCapacity) exitWith { false };

true
