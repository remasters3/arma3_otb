private _plyr = _this Select 0;
private _bModels = ['B_G_medic_F','B_G_engineer_F','B_HeavyGunner_F','B_ghillie_ard_F','B_G_Soldier_LAT_F','B_soldier_AAA_F'];
private _oModels = ['O_soldierU_medic_F','O_engineer_U_F','O_HeavyGunner_F','O_ghillie_ard_F','O_soldierU_AT_F','O_soldierU_AA_F'];
private _rModels = ['I_Soldier_AA_F','I_G_medic_F','I_G_engineer_F','I_C_Soldier_Bandit_3_F','I_G_Soldier_LAT_F','I_ghillie_ard_F'];
private _cModels = ['C_man_polo_2_F','C_man_polo_3_F','C_man_polo_4_F','C_man_polo_5_F','C_man_polo_6_F','C_man_polo_1_F'];
private _grp = group _plyr;

if ((leader _grp) == _plyr) Then {
		   
	If (Side _plyr == west) Then {[_plyr,'B_Heli_Transport_01_camo_F',_bModels] Call GPF_fnc_playerSupport;};
	If (Side _plyr == east) Then {[_plyr,'O_Heli_Light_02_dynamicLoadout_F',_oModels] Call GPF_fnc_playerSupport;};
	If (Side _plyr == resistance) Then {[_plyr,'I_Heli_light_03_dynamicLoadout_F',_rModels] Call GPF_fnc_playerSupport;};
	If (Side _plyr == civilian) Then {[_plyr,'C_IDAP_Heli_Transport_02_F',_cModels] Call GPF_fnc_playerSupport;};
} Else {
	systemchat "You are not a group leader, press U for group menu.";
};