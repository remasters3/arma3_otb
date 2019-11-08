//[<oldUnit>, <killer>, <respawn>, <respawnDelay>]
private _oldUnit = _this select 0;
private _killer = _this select 1;
private _txt = Format ["%1 was kiled by %2",(name _oldUnit),(name _killer)];
systemChat _txt;