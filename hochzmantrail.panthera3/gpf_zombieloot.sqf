//[zombie] execVM "gpf_zombieloot.sqf";
_unit = _this Select 0;
if(isnil "_unit") ExitWith {};
if(!(_unit iskindof "man")) ExitWith {};
_things = ["1Rnd_HE_Grenade_shell"];
_vest = selectRandom ["V_BandollierB_cbr","V_BandollierB_blk"];
_unit addItemToUniform (SelectRandom _things);
_loot = selectRandom [true,false,false,false,false,true,false,false,false,false,false,true];
if (_loot) Then {
	removeVest _unit;
	_unit addVest _vest;
	_unit addItemToVest (SelectRandom _things);
};

//exile cash
// _AIMoney = SelectRandom [1,11,2,3,4,15,10,16,17,18,19,15,10,20,3,4,5,6,8,9];
// _unit setVariable
// [
// 	"ExileMoney",
// 	_AIMoney,
// 	true
// ];
// _unit addMPEventHandler ["MPKilled",'if (isServer) Then {_dst = (_this Select 0) distance (_this Select 1); _score = floor (_dst/2); [(_this Select 1),_score]execVM "gpf_score.sqf";};'];

if (true) ExitWith {};