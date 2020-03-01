private _centerWorld =  _this Select 0;
private _maxunits = (count AllPlayers)*9;
private _spawners = [[[6227.71,10722.2,0],344.766],[[6218.53,10659.2,0],0.00202736],[[6300.59,10650.6,0],0.108305],[[6082.95,10686.9,0],359.92],[[5942.38,10727.2,0],0.00200302],[[5915.95,10727.8,0],0.00201336],[[5768.57,10713.3,0],40.0689],[[5818.26,10802.5,0],51.0389],[[5863.2,10769.9,0],141.029]];
private _enemys = [];
private _cnt = 0;
private _FilterParams=[];
waitUntil {(!isNil "MarkersDone")};
{
	if ((side _x) == East) Then {
		_enemys = _enemys+[_x];
		};
} foreach Allunits;
_cnt = {alive _x} count _enemys;

_FilterParams=[
["O_","_MBT_","_cannon_"],
["O_","_APC_","_Tracked_"],
["O_","_APC_","_Wheeled_"],
["O_","_LSV_","_AT_"],
["O_","_LSV_","_armed_"],
["O_","_MRAP_","_hmg_"],
["O_","_MRAP_","_gmg_"],
["O_","_Heli_","_dynamicLoadout_"]
];

private _AllClss = (configfile >> "CfgVehicles") call BIS_fnc_getCfgSubClasses;
private _filters = SelectRandom _FilterParams;
private _SideTag = _filters Select 0;
private _VehTag = _filters Select 1;
private _WepTag = _filters Select 2;
private _spawner = SelectRandom _spawners;
private _SideClss = [];
private _VehClss = [];
private _wepClss = [];
private _cb = [];
{
	if (_SideTag in _x) Then {
		_SideClss = _SideClss + [_x];
	};
} foreach _AllClss;
{
	if (_VehTag in _x) Then {
		_VehClss = _VehClss + [_x];
	};
} foreach _SideClss;

{
	if (_WepTag in _x) Then {
		_wepClss = _wepClss + [_x];
	};
} foreach _VehClss;

{
	if (_VehTag in _x) Then {
		_cb = _cb + [_x];
	};
} foreach _wepClss;

if (_cnt < _maxunits) Then {
private _result = [[771.906,12146.2,0],0, (SelectRandom _cb), east] call BIS_fnc_spawnVehicle;
_result params ["_veh", "_crew", "_group"];
_unit = leader _group;
_posistions=[];
_nbr = selectRandom [0,1];
_veh addEventHandler ["GetOut", "_veh = _this select 0;_veh SetDamage 1;"];
_veh SetDir (_spawner select 1);
_veh SetPos (_spawner select 0);
_veh SetDamage 0;
_veh SetFuel 1;
_posistions = [_nbr] Call GPF_fnc_MaldenRoute;
_params = [_unit,_posistions,_nbr];
_way = _params call GPF_fnc_WPLoop;
};