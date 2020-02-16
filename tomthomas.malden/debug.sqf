// private _accmodel = "Land_Carrier_01_base_F";
// private _accpos = [559.729,1423.49,80];
// _acc = createVehicle [_accmodel, _accpos, [], 0, 'FORM'];
// _acc SetPos _accpos;
// _acc setVectorDirAndUp [[1,0,0],[0,0,1]];
// SLEEP 5;
// deletevehicle _acc;
//["helloWorld",player,0] remoteExecCall ["GPF_fnc_playerMSG",0, false];

[]Spawn{
	while {true} do {
	hint format ["|B:%1|R:%2|G:%3|",scoreSide west,scoreSide east,scoreSide resistance];
	sleep 1;
	};
};
