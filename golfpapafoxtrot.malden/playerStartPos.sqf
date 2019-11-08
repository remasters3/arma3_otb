_unit = _this select 0;
waitUntil {!isNil "MarkersDone"};
If (Side _unit == West      ) Then {this SetPos GetMarkerPos "respawn_west";    };
If (Side _unit == East      ) Then {this SetPos GetMarkerPos "respawn_east";    };
If (Side _unit == Resistance) Then {this SetPos GetMarkerPos "respawn_guerrila";};
If (Side _unit == Civilian  ) Then {this SetPos GetMarkerPos "respawn_civilian";};