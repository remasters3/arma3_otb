// [player] Call GPF_fnc_earPlugs;
 private ["_player"];
_player   = param[0];

	if (soundVolume == 1) then { systemchat "Ear plugs on";
		1 fadeSound 0.2;} else { systemchat "Ear plugs off";
		1 fadeSound 1;  };
		
_player addEventHandler ["Respawn",{
	1 fadeSound 1;}];