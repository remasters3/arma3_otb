// [player] Call GPF_fnc_earPlugs;
 private ["_player"];
_player   = param[0];

	if (soundVolume == 1) then {
		1 fadeSound 0.2; systemChat "Earplugs on"} else {
		1 fadeSound 1; systemChat "Earplugs off"};
		
_player addEventHandler ["Respawn",{
	1 fadeSound 1;}];