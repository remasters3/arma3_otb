private ["_player","_pos"];
_player = param[0];
_pos = param[1];

_TPveh = vehicle _player;
_TPvehPos = [_pos,10,500, 10, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
_TPveh SetPos _TPvehPos;
/////// TP TRIGGER, type none
//// Condition
//   this
//// On Activation
// _ThisPlayer = thisList select 0; [(thisList select 0),(GetMarkerPos "respawn_marker")] Call GPF_fnc_playerTPV;
////////