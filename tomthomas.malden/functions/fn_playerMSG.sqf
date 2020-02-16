// ["string message",player,message type] remoteExecCall ["GPF_fnc_playerMSG",0, JIP]; // ["string message",player,message type] Call GPF_fnc_playerMSG;
private _msg = param[0];
private _plr = param[1];
private _typ = param[2];

if (_plr == player) Then {
	if (_typ == 0) Then {
		systemchat _msg;
	};
	if (_typ == 1) Then {
		hint _msg;
	};
};

// ["helloWold",player,1] remoteExecCall ["GPF_fnc_playerMSG",0, JIP];