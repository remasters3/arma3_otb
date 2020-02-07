// [player] Call GPF_fnc_Pos2Clip;
 private ["_player","_myPos","_textPos"];
_player   = param[0];
_myPos = getPos _player;
_textPos = format ["%1", _myPos];
hint _textPos;
copyToClipboard _textPos;