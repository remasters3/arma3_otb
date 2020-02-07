private _numberOfunits = _this select 0;
private _side =_this Select 1;
private _respos = _this select 2;
private _target = _this select 3;
private _timeout = 60*30;
private _TotalDistance = 0;
private _score = 0;
private _shell = 'SmokeShellPurple';
if (_side == west) Then {_shell = 'SmokeShellBlue';};
if (_side == east) Then {_shell = 'SmokeShellRed';};
if (_side == resistance) Then {_shell = 'SmokeShellGreen';};
_pos = [(_respos select 0),(_respos select 1),0];

[_numberOfunits,_side,_respos,_target,_timeout,_TotalDistance,_score,_shell] Spawn {
	_numberOfunits = _this select 0;
	_side =_this Select 1;
	_respos = _this select 2;
	_target = _this select 3;
	_timeout = _this select 4;
	_TotalDistance = _this select 5;
	_score = _this select 6;
	_shell = _this select 7;

	while {((count allunits) < 10)} do {
	systemchat Format ["[%1,%2,%3,%4,%5]call GPF_fnc_rescueEvac;",_numberOfunits,_side,_pos,_target,40];
	sleep 10;
	};

};