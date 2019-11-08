//_evac = [_models,_side,_pos,_targetPos,_targetRadias] call GPF_fnc_rescueEvac;

//passed vars
_models = _this Select 0;
_side = _this Select 1;
_pos = _this Select 2;
_targetPos = _this Select 3;
_targetRadias = _this Select 4;

//script vars
_rescuegroup = [_pos, _side,_models] call BIS_fnc_spawnGroup;
private _walkers = units _rescuegroup;


// adding get in/out actions
{
 _x addEventHandler ["GetInMan", {_unit = _this select 0;_unit DisableAI 'FSM';_txt = format ['%1 is in',name _unit];vehicle _unit vehicleChat _txt;}];
 _x addEventHandler ["GetOutMan", {_unit = _this select 0;_unit EnableAI 'FSM';_txt = format ['%1 is out',name _unit];_unit globalChat _txt;}];
} foreach units _rescuegroup;

// waiting for the pickup
[_rescuegroup,_targetPos,_targetRadias] Spawn {_rescuegroup = _this select 0;_targetPos = _this Select 1;_targetRadias = _this Select 2;
  _cnt = {alive _x} count units _rescuegroup;
  _txt = Format ["%1",_rescuegroup];
  _leader = leader _rescuegroup;
  _side = side _leader;
  _smc = Format ["color%1",_side];
  _marker = createMarker [_txt,GetPos _leader];
  _marker setMarkerType "hd_pickup";
  _marker setMarkerText _txt;
  _marker setMarkerColor _smc;
    while {_cnt > 0} do {
    _txt = Format ["[%1] %2 units to rescue",_rescuegroup,_cnt];
	_marker setMarkerText _txt;
	_marker SetMarkerPos GetPos _leader;
    _civs = [];
    _vehs = [];
    _riders = [];
    _walkers = [];
    _ride = SelectRandom _vehs;
    _list = _leader nearEntities [["Air", "Car", "Motorcycle", "Tank"], 100];
    
    //find all vehicles on same side
    {
      if ((side _x) == _side) then {
 	                                  _civ = _x;
 									  _civs = _civs + [_civ];
 									 };
    } forEach _list;
    
   {  
    //Get vehicles with crew 
    if ((count fullCrew _x) > 0) Then {
                                       _veh = _x;
 	                                  _vehs = _vehs + [_veh];
                                      };
   } forEach _civs;
 
   //all rescue units not in vehicles aka _walkers
   {
    _unit = _x;if ((vehicle _unit) == _unit) Then {_walkers = _walkers + [_unit];};
   } Foreach units _rescuegroup;
   
  
   
   //tell the walkers what to do
   {
    _unit = _x;
    if ((_unit distance _targetPos) > _targetRadias) Then {if ((count _vehs) > 0) Then {//_ride = SelectRandom _vehs;
                                                                             _ride = _vehs Select 0;
 														                    _unit assignAsCargo _ride;
 																			[_unit] orderGetIn true;
 																			};
 										} Else {[_unit] Spawn {_unit = _this select 0; Sleep 10;deleteVehicle _unit;};};
   } foreach _walkers;
  
   //all rescue units in vehicles aka _riders
   {
    _unit = _x;if ((vehicle _unit) != _unit) Then {_riders = _riders + [_unit];};
   } Foreach units _rescuegroup;
   
 //tell the riders what to do
 {
   _unit = _x;
   if ((_unit distance _targetPos) < _targetRadias) Then {
     _veh = vehicle _unit;
 	_list = (crew _veh) select {(assignedVehicleRole _x) select 0 isEqualTo 'cargo'};
 	{_x EnableAI 'FSM';unassignVehicle _x;[_x] orderGetIn false;commandGetOut _x;} forEach _list;
   };
 } Foreach _riders;
 
 _cnt = {alive _x} count units _rescuegroup;
 Sleep 1;  
 };
 deleteMarker _marker;
};
_rescuegroup;