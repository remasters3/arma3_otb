_player = _this select 0;
_benifits = [
 "76561198121313381",
 "76561197971753110"
];
private _isBenifit = false;
private _uid = getPlayerUID _player;

{if (_uid ==_x) Then {_isBenifit = true;};} Foreach _benifits;

if (_isBenifit) then {createDialog "GPF_Benifits_Dialog";waitUntil {!isNull (findDisplay 9999);};} Else {hint "NOPE!"};

//_player AddAction ["TP","openMap true;waitUntil {inputAction 'ActionInMap' > 0};private _cords = (findDisplay 12 displayCtrl 51) ctrlMapScreenToWorld getMousePosition;_veh = vehicle player; _veh SetPos _cords;_textPos = Format ['%1',_cords];copyToClipboard _textPos;openMap false;"];