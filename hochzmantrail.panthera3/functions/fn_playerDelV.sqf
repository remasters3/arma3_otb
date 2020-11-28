private ["_player","_Delveh"];
_player = param[0];

_Delveh = vehicle _player;
deleteVehicle _Delveh;

/////// TP TRIGGER, type none
//// Condition
//   this
//// On Activation
// [(thisList select 0)] Call GPF_fnc_playerDelV;
////////