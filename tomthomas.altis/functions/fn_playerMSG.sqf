// ["string message"] Call GPF_fnc_playerMSG;
private ["_msg"];
_msg = param[0];
systemchat format ["%1",_msg];