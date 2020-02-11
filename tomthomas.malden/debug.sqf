player setvariable ["evacleader",true,true]; 
_all = allVariables player;
if (("evacleader" in allVariables player)) then {hint "true"} else {hint "false"};
