private _unit = _this select 0;
private _ACC = [];

If (Side _unit == West      ) Then {_unit setposASL GetPosASL carrier_sl_blue;};
If (Side _unit == East      ) Then {_unit setposASL GetPosASL carrier_sl_red;};
If (Side _unit == Resistance) Then {_unit setposASL GetPosASL carrier_sl_green;};
If (Side _unit == Civilian  ) Then {_unit setposASL GetPosASL carrier_sl_red;};
// _unit setposASL _ACC;