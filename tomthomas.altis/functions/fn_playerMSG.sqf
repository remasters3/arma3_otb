// ["string message"] Call GPF_fnc_playerMSG;
private ["_msg"];
_msg = param[0];
_msg = param[1];
systemchat format ["%1",_msg];

//["string message"] remoteExecCall ["GPF_fnc_playerMSG",[player];