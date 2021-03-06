#include "macro.sqf"
private["_item", "_class", "_wpnItems", "_type"];
_item = _this select 0;
_class = _item call ASORGS_fnc_GetClass;
_wpnItems = call ASORGS_fnc_GetLauncherItems;
_type = getNumber(configFile >> "cfgWeapons" >> _class >> "ItemInfo" >> "type");
switch(_type) do {
	case IIT_SCOPE: { _wpnItems set [2, _class];  };
	case IIT_SUPPRESSOR: { _wpnItems set [0, _class];  };
	case IIT_RAIL: { _wpnItems set [1, _class];  };
};
ASORGS_CurrentInventory set [GSVI_LauncherItems, _wpnItems];
ASORGS_WeightChanged = true;