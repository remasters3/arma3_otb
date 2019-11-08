private _sourceObject = param[0];
private _Dist = param[1];
private _Incr = param[2];
private _FullRound = param[3];
private _Side = param[4];
private _Model = param[5];
private _Count = 0;
private _units = [];

while {_Count < _FullRound} Do {
 _WaveGroup = createGroup [_Side, false];
 _pos = [_sourceObject, _Dist, _Count] call BIS_fnc_relPos;
 _unit = _WaveGroup createUnit [(selectRandom _Model), _pos,[], 0,"FORM"];
 _isWater = surfaceIsWater _pos;
 if (_isWater) Then {
 
    removeAllWeapons _unit;
    removeAllItems _unit;
    removeAllAssignedItems _unit;
    removeUniform _unit;
    removeVest _unit;
    removeBackpack _unit;
    removeHeadgear _unit;
    removeGoggles _unit;
    
    comment "Add containers";
    _unit forceAddUniform "U_I_Wetsuit";
    _unit addItemToUniform "FirstAidKit";
    for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_556x45_Stanag";};
    for "_i" from 1 to 2 do {_unit addItemToUniform "20Rnd_556x45_UW_mag";};
    for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
    for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
    for "_i" from 1 to 4 do {_unit addItemToUniform "Chemlight_green";};
    _unit addVest "V_RebreatherIA";
    _unit addBackpack "I_Assault_Diver";
    _unit addItemToBackpack "Rangefinder";
    for "_i" from 1 to 2 do {_unit addItemToBackpack "30Rnd_556x45_Stanag";};
    for "_i" from 1 to 2 do {_unit addItemToBackpack "20Rnd_556x45_UW_mag";};
    _unit addItemToBackpack "SatchelCharge_Remote_Mag";
    for "_i" from 1 to 3 do {_unit addItemToBackpack "MiniGrenade";};
    for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellGreen";};
    for "_i" from 1 to 4 do {_unit addItemToBackpack "Chemlight_green";};
    _unit addGoggles "G_I_Diving";
    
    comment "Add weapons";
    _unit addWeapon "arifle_SDAR_F";
    _unit addWeapon "hgun_ACPC2_F";
    _unit addHandgunItem "muzzle_snds_acp";
    
    comment "Add items";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadio";
  
};
 _way1 = _WaveGroup addWaypoint [GetPos _sourceObject, 0];
 _way1 setWaypointType "MOVE";
 _way1 setWaypointBehaviour "COMBAT";
 _way1 setWaypointCombatMode "RED";
 _way1 setWaypointSpeed "FULL";
 _way1 setWaypointCompletionRadius 10;
 _way1 setWaypointStatements ["true","deleteVehicle this;"];
 _Count = _Count+_Incr;
 _units = _units + [_unit];
 sleep 0.5;
};
_units;