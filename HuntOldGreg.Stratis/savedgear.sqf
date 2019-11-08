_p = player;

removeAllWeapons _p;
removeAllWeapons _p;
removeUniform _p;
removeBackpack _p;
removeVest _p;

_p addBackpack backpackvar;
_p addVest vestvar;
_p forceAddUniform uniformvar;
_p addHeadgear headgearvar;

{_p addItem _x} forEach itemsvar;
{_p addMagazine _x} forEach magazinesvar;
{_p addWeapon _x} forEach weaponsvar;
{_p addPrimaryWeaponItem _x} forEach primaccvar;
{_p addSecondaryWeaponItem _x} forEach secaccvar;
{_p addHandgunItem _x} forEach sideaccvar;
{_p addItem _x} forEach assitemsvar;
{_p assignItem _x} forEach assitemsvar;

_primw = primaryWeapon _p;
hint "Loadout Restored";
if (_primw != "") then {
    _p selectWeapon _primw;
    // Fix for weapons with grenade launcher
    _muzzles = getArray(configFile>>"cfgWeapons" >> _primw >> "muzzles");
    _p selectWeapon (_muzzles select 0);
};