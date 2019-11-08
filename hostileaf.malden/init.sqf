if ((!isServer) && (player != player)) then {
waitUntil {player == player};
};
execVM "fatigue.sqf";
enableSaving [false, false];
player enableFatigue false;
player enableStamina false;
Resistance setFriend [East, 0];
Resistance setFriend [West, 0];

East setFriend [Resistance, 0];
East setFriend [West, 0];

West setFriend [Resistance, 0];
West setFriend [East, 0];


addMissionEventHandler ["Draw3D",{
  {
    _icon = "A3\ui_f_data\Map\GroupIcons\selector_selectedFriendly_ca.paa";
    If (player == _x) Then {} Else {
	drawIcon3D [_icon, [0,0.1,0.7,0.3], getPosATL _x, 1, 1, 1,format ["%1",name _x], 2, 0.05, "RobotoCondensedLight","center"];
	};
  } Foreach allPlayers;
}];

if (isDedicated) then {deleteVehicle debug_player;


};
waitUntil {time > 20};
Missions = ["obj.sqf"];
{execVM _x;sleep 10;} ForEach Missions;
[] Spawn {while {true} do{Sleep 300;{deleteVehicle _x;} forEach allDeadMen;{deleteVehicle _x;} forEach allDead;};};
               
// comment

