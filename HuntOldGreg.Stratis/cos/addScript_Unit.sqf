_unit =(_this select 0);
/*
Add Script to individual units spawned by COS.
_unit = unit. Refer to Unit as _unit.
_unit addWeapon "hgun_Pistol_heavy_01_snds_F";// EXAMPLE SCRIPT
_unit addMagazines ["11Rnd_45ACP_Mag", 1]; */

//removeBackpack _unit;
//_unit addbackpack "B_AssaultPack_mcamo";

_unit addEventHandler ["Killed",{script = [] execVM "civdeath.sqf";}];
//_unit addEventHandler ["killed",hint "civvy killed"];