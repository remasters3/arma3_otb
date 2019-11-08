if ((!isServer) && (player != player)) then
{
waitUntil {player == player};
};
_plyr = _this select 0;
_Nplyr = _this select 1;
_plyr enableFatigue false;
_plyr enableStamina false;
//[_Nplyr] call GPF_fnc_playerSpawn;
//_plyr moveInCargo boat_00;