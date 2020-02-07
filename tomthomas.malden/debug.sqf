//_evac = [_numberOfunits,_side,_pos,_target,40] Call GPF_fnc_rescueEvac;
_things = [configfile >> "CfgVehicles","vehicleClass"] call BIS_fnc_returnConfigEntry;
{
systemchat format ["%1",_x];
} foreach _things;
