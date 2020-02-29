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
private _filters = _FilterParams Select 0;
private _SideTag = _filters Select 0;
private _VehTag = _filters Select 1;
private _WepTag = _filters Select 2;
private _startPos = GetPos player;
private _start_dir = GetDir player;
private _inc = 20;
private _dist = 20;
private _SideClss = [];
private _VehClss = [];
private _wepClss = [];
private _cb = [];
{
	if (_SideTag in _x) Then { 
		//systemchat Format ["%1",_x];
		_SideClss = _SideClss + [_x];
	};
} foreach _AllClss;
{
	if (_VehTag in _x) Then { 
		//systemchat Format ["%1",_x];
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

_output = format ["%1",SelectRandom _cb];

copyToClipboard _output;
systemchat _output;




/*
private _centerWorld = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
copyToClipboard format ["%1",(markerType 'WPMarker_0')];
_allPlaces = nearestLocations [_centerWorld, ["NameVillage","NameCity","Mount","NameCityCapital","NameLocal"],10000];
_nl = SelectRandom _allPlaces;
_cpos = locationPosition _nl;
_roads = _cpos nearRoads 1000;
_road = selectrandom _roads;
_pos = [6290.04,10830,0];//GetPos _road;
_WaveGroup = createGroup [east, false];
_veh = createVehicle ["I_MRAP_03_F",_pos, [], 0, "FORM"];
_unit = _WaveGroup createUnit ["C_Man_ConstructionWorker_01_Red_F", _pos,[], 0,"FORM"];
_unit setVariable["gpf_wploop_veh",_veh,true];
_unit addEventHandler ["GetOutMan", {_unit = _this select 0;_veh = _this select 2;_veh SetDamage 0;_veh SetFuel 1;}];
_unit moveindriver _veh;
_posistions=[];
_markers = [];

systemchat format ["%1",_posistions];
_nbr = selectRandom [0,1];
_posistions = [_nbr] Call GPF_fnc_MaldenRoute;
_params = [_unit,_posistions,_nbr];
_way = _params call GPF_fnc_WPLoop;
sleep 1;
_veh SetDir 270;
_veh SetPos [6290.04,10830,0];
_veh SetDamage 0.6;
_veh SetFuel 0.3;
//player SetPos (_posistions select 0);
//{player setpos _x;sleep 2;}foreach _posistions;
//systemchat format ["%1",_rv];
// ["WPMarker_0","WPMarker_1","WPMarker_2","WPMarker_3","WPMarker_4","respawn_west","marker_b_helipad","respawn_east","marker_r_helipad","respawn_guerrila","marker_g_helipad","respawn_civilian"]

// private _accmodel = "Land_Carrier_01_base_F";
// private _accpos = [559.729,1423.49,80];
// _acc = createVehicle [_accmodel, _accpos, [], 0, 'FORM'];
// _acc SetPos _accpos;
// _acc setVectorDirAndUp [[1,0,0],[0,0,1]];
// SLEEP 5;
// deletevehicle _acc;
//["helloWorld",player,0] remoteExecCall ["GPF_fnc_playerMSG",0, false];
*/

/*
private _centerWorld = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
private _AllClss = (configfile >> "CfgVehicles") call BIS_fnc_getCfgSubClasses;
private _SideTag = "O_";
private _VehTag = "O_Plane_CAS";
private _WepTag = "_CAS_";
private _startPos = GetPos player;
private _start_dir = GetDir player;
private _inc = 20;
private _dist = 20;
private _SideClss = [];
private _VehClss = [];
private _wepClss = [];
private _cb = [];
//private _isBenifit = _uid in _benifits;
// ["Turrets"]
//["All","Logic","AllVehicles","Land","LandVehicle","Car","Motorcycle","Bicycle","Tank","APC","Man","Animal","Air","Helicopter","Plane","Ship","SmallShip","BigShip","Truck","ParachuteBase","LaserTarget","NVTarget","ArtilleryTarget","ArtilleryTargetW","ArtilleryTargetE","SuppressTarget","PaperCar","FireSectorTarget","Static","Rope","Fortress","Building","NonStrategic","HeliH","AirportBase","Strategic","FlagCarrierCore","Land_VASICore","Thing","ThingEffect","ThingEffectLight","ThingEffectFeather","FxExploArmor1","FxExploArmor2","FxExploArmor3","FxExploArmor4","FxCartridge","WindAnomaly","Tracked_APC","Wheeled_APC","Bus","Tractor","StaticWeapon","StaticMGWeapon","StaticATWeapon","StaticAAWeapon","StaticCannon","StaticGrenadeLauncher","StaticMortar","StaticSEARCHLight","GunShip","TransportHelicopter","UAV","Fighter","CargoAirplane","StaticShip","Structure","fortification","Tent","Train","Gate","Wreck_Base","ReammoBox","HouseBase","Ruins","House_Small","House","Church","Wall","Fence","Library_WeaponHolder","FloatingStructure_F","Object","FxWindGrass1","FxWindGrass2","FxWindGrass3","FxWindGrass4","FxWindHay1","FxWindWheat1","FxWindSeed1","FxWindRock1","FxWindLeaf1","FxWindLeaf2","FxWindLeaf3","FxWindLeaf4","FxWindLeaf5","FxWindLeaf6","FxWindPollen1","FxWindPaper1","FxWindPlastic1","ThingX","Wreck","TankWreck","PlaneWreck","ShipWreck","HelicopterWreck","CarWreck","TruckWreck","Crater","CraterLong","CraterLong_small","Helper_Base_F","Sign_Arrow_F","Sign_Arrow_Green_F","Sign_Arrow_Blue_F","Sign_Arrow_Pink_F","Sign_Arrow_Yellow_F","Sign_Arrow_Cyan_F","Sign_Arrow_Large_F","Sign_Arrow_Large_Green_F","Sign_Arrow_Large_Blue_F","Sign_Arrow_Large_Pink_F","Sign_Arrow_Large_Yellow_F","Sign_Arrow_Large_Cyan_F","Sign_Arrow_Direction_F","Sign_Arrow_Direction_Green_F","Sign_Arrow_Direction_Blue_F","Sign_Arrow_Direction_Pink_F","Sign_Arrow_Direction_Yellow_F","Sign_Arrow_Direction_Cyan_F","Sign_Pointer_F","Sign_Pointer_Green_F","Sign_Pointer_Blue_F","Sign_Pointer_Pink_F","Sign_Pointer_Yellow_F","Sign_Pointer_Cyan_F","Sign_Sphere10cm_F","Sign_Sphere25cm_F","Sign_Sphere100cm_F","Sign_Circle_F","UserTexture1m_F","UserTexture10m_F","LocationBase_F","LocationOutpost_F","LocationCamp_F","LocationResupplyPoint_F","LocationRespawnPoint_F","LocationEvacPoint_F","LocationFOB_F","LocationCityCapital_F","LocationCity_F","LocationVillage_F","LocationArea_F","SideBLUFOR_F","SideOPFOR_F","SideResistance_F","MiscUnlock_F","MiscLock_F","Curator_F","MiscAND_F","MiscOR_F","Module_F","ModuleHideTerrainObjects_F","ModuleEditTerrainObject_F","Timeline_F","Curve_F","Key_F","ControlPoint_F","Camera_F","ModuleSmoke_F","ModuleChemlight_F","ModuleTracers_F","BIS_Effect_FilmGrain","BIS_Effect_Day","BIS_Effect_MovieNight","BIS_Effect_Sepia","ModuleEffectsPlankton_F","ModuleEffectsBubbles_F","ModuleEffectsShells_F","ModuleEffectsSmoke_F","ModuleEffectsFire_F","ModuleDate_F","ModuleWeather_F","ModuleSaveGame_F","ModuleChat_F","ModuleVolume_F","ModuleGenericRadio_F","ModuleGroupID","ModuleCombatGetIn","HighCommand","HighCommandSubordinate","ModuleSkiptime_F","ModuleTaskCreate_F","ModuleTaskSetDescription_F","ModuleTaskSetDestination_F","ModuleTaskSetState_F","ModuleCreateDiaryRecord_F","ModuleHQ_F","ModuleLiveFeedBase_F","ModuleLiveFeedEffects_F","ModuleLiveFeedInit_F","ModuleLiveFeedSetSource_F","ModuleLiveFeedSetTarget_F","ModuleLiveFeedTerminate_F","MartaManager","ModuleZoneRestriction_F","ModuleTrident_F","ModuleCuratorUnlockObject_F","ModuleCuratorUnlockArea_F","ModuleFriendlyFire_F","ModuleSector_F","ModuleSectorDummy_F","ModuleRespawnPosition_F","ModuleRespawnVehicle_F","ModuleShowHide_F","ModulePositioning_F","ModuleSkill_F","ModuleHealth_F","ModuleDamage_F","ModuleFuel_F","ModuleAmmo_F","ModuleMode_F","ModuleRank_F","ModuleAI_F","ModuleRating_F","ModuleDoorOpen_F","ModuleSimulationManager_F","Site_F","Site_Military_Base","Site_FT_Base","Site_BLUFOR","Site_OPFOR","Site_Independent","Site_Ambient","Site_Empty","Site_Minefield","Site_Patrol","ModuleSkirmishBase_F","ModuleSkirmishTrigger_F","ModuleStrategicMapModuleOpen_F","ModuleStrategicMapInit_F","ModuleStrategicMapMission_F","ModuleStrategicMapORBAT_F","ModuleStrategicMapImage_F","SupportRequester","SupportProvider_Base","SupportProvider_Virtual_Base","SupportProvider_Artillery","SupportProvider_Virtual_Artillery","SupportProvider_CAS_Heli","SupportProvider_Virtual_CAS_Heli","SupportProvider_CAS_Bombing","SupportProvider_Virtual_CAS_Bombing","SupportProvider_Drop","SupportProvider_Virtual_Drop","SupportProvider_Transport","SupportProvider_Virtual_Transport","ModuleFiringDrill_F","ModulePoster_F","Land_NavigLight","Land_NavigLight_3_F","Land_Flush_Light_green_F","Land_Flush_Light_red_F","Land_Flush_Light_yellow_F","Land_runway_edgelight","Land_runway_edgelight_blue_F","Land_Runway_PAPI","Land_Runway_PAPI_2","Land_Runway_PAPI_3","Land_Runway_PAPI_4","Rocks_base_F","Land_Small_Stone_01_F","Land_Small_Stone_02_F","Land_Stone_big_F","Land_Stone_medium_F","Land_Stone_small_F","Land_StoneSharp_big","Land_StoneSharp_medium","Land_StoneSharp_small","Land_StoneSharp_wall","Land_BluntRock_apart","Land_BluntRock_monolith","Land_BluntRock_spike","Land_BluntRock_wallH","Land_BluntRock_wallV","Land_BluntStone_01","Land_BluntStone_02","Land_BluntStone_03","Land_BluntStones_erosion","Land_SharpRock_apart","Land_SharpRock_monolith","Land_SharpRock_spike","Land_SharpRock_wallH","Land_SharpRock_wallV","Land_SharpStone_01","Land_SharpStone_02","Land_SharpStone_03","Land_SharpStones_erosion","Land_Stone_big_W","Land_Stone_medium_W","Land_Stone_small_W","Land_StoneSharp_big_W","Land_StoneSharp_medium_W","Land_StoneSharp_small_W","Land_StoneSharp_Wall_W","Land_W_sharpRock_apart","Land_W_sharpRock_monolith","Land_W_sharpRock_spike","Land_W_sharpRock_wallH","Land_W_sharpRock_wallV","Land_W_sharpStone_01","Land_W_sharpStone_02","Land_W_sharpStone_03","Land_W_sharpStones_erosion","Church_F","Church_Small_F","House_F","House_Small_F","Ruins_F","Wall_F","Bridge_PathLod_base_F","Land_Bridge_01_PathLod_F","Land_Bridge_Asphalt_PathLod_F","Land_Bridge_Concrete_PathLod_F","Land_Bridge_HighWay_PathLod_F","Land_Loudspeakers_F","Land_Sink_F","Land_Timbers_F","Land_TreeBin_F","Land_Water_source_F","Land_WoodPile_F","Land_AncientPillar_F","Land_AncientPillar_damaged_F","Land_AncientPillar_fallen_F","Land_BellTower_01_V1_F","Land_BellTower_01_V2_F","Land_BellTower_02_V1_ruins_F","Land_BellTower_02_V1_F","Land_BellTower_02_V2_ruins_F","Land_BellTower_02_V2_F","Land_Calvary_01_V1_F","Land_Calvary_02_V1_F","Land_Calvary_02_V2_F","Camping_base_F","Land_Campfire_F","Campfire_burning_F","Land_Camping_Light_off_F","Land_CampingChair_V1_F","Land_CampingChair_V1_folded_F","Land_CampingChair_V2_F","Land_CampingTable_F","Land_CampingTable_small_F","Land_FieldToilet_F","Land_FirePlace_F","FirePlace_burning_F","Land_Ground_sheet_F","Land_Ground_sheet_OPFOR_F","Land_Ground_sheet_blue_F","Land_Ground_sheet_khaki_F","Land_Ground_sheet_yellow_F","Land_Ground_sheet_folded_F","Land_Ground_sheet_folded_OPFOR_F","Land_Ground_sheet_folded_blue_F","Land_Ground_sheet_folded_khaki_F","Land_Ground_sheet_folded_yellow_F","Land_Pillow_F","Land_Pillow_camouflage_F","Land_Pillow_grey_F","Land_Pillow_old_F","Land_Sleeping_bag_F","Land_Sleeping_bag_blue_F","Land_Sleeping_bag_brown_F","Land_Sleeping_bag_folded_F","Land_Sleeping_bag_blue_folded_F","Land_Sleeping_bag_brown_folded_F","Land_Sun_chair_F","Land_Sun_chair_green_F","Land_Sunshade_F","Land_TentA_F","Land_TentDome_F","Land_ToiletBox_F","Land_Chapel_V1_ruins_F","Land_Chapel_V1_F","Land_Chapel_V2_ruins_F","Land_Chapel_V2_F","Land_Chapel_Small_V1_ruins_F","Land_Chapel_Small_V1_F","Land_Chapel_Small_V2_ruins_F","Land_Chapel_Small_V2_F","Constructions_base_F","Land_Bricks_V1_F","Land_Bricks_V2_F","Land_Bricks_V3_F","Land_Bricks_V4_F","Land_CinderBlocks_F","Land_Coil_F","Land_ConcretePipe_F","Land_IronPipes_F","Land_Pallet_F","Land_Pallet_vertical_F","Land_Pallets_F","Land_Pipes_large_F","Land_Pipes_small_F","Land_Scaffolding_F","Land_WheelCart_F","Land_WoodenBox_F","Land_WorkStand_F","Cemetery_base_F","Dead_base_F","Land_Grave_memorial_F","Land_Grave_monument_F","Land_Grave_obelisk_F","Land_Grave_soldier_F","Land_Grave_V1_F","Land_Grave_V2_F","Land_Grav
{
	if (_SideTag in _x) Then { 
		//systemchat Format ["%1",_x];
		_SideClss = _SideClss + [_x];
	};
} foreach _AllClss;
["O_Plane_CAS_02_F","O_Plane_CAS_02_dynamicLoadout_F","O_Plane_CAS_02_Cluster_F"]
{
	if (_VehTag in _x) Then { 
		//systemchat Format ["%1",_x];
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

copyToClipboard format ["%1",_VehClss];

// "LandVehicle","Car","Motorcycle","Bicycle","Tank","APC","Man","Animal","Air","Helicopter","Plane","Ship","SmallShip","BigShip","Truck"
//_ref= [];
*/

/*
{
 _pos = [_startPos, _dist, _start_dir] call BIS_fnc_relPos;
 _veh = [_pos,(_start_dir+90),_x,(_inc-1)] call GPF_fnc_SpawnVehicle;
 _dist = _dist+_inc;
 systemchat Format ["%1",_x];
} Foreach _cb;
copyToClipboard format ["%1",_SideTag];
*/
/*
_Allvehparams = [];
// _veh = [_pos,_dir,_model,10] call GPF_fnc_SpawnVehicle;
{	
	_tvehparams = [];
	_pos = GetPos _x;
	_dir = GetDir _x;
	_model = typeOf _x;
	_tvehparams = [_pos,_dir,_model,10];
	_Allvehparams = _Allvehparams + [_tvehparams];
} foreach vehicles;

copyToClipboard format ["%1",_Allvehparams];




//_WaveGroup = createGroup [west, false];
//_unit = _WaveGroup createUnit ["B_recon_LAT_F", (getPos player),[], 0,"FORM"];
//_allPlaces = nearestLocations [(getpos player), ["NameVillage","NameCity","Mount","NameCityCapital","NameLocal"],500];
//_nl = _allPlaces select 0;
//_cpos = locationPosition _nl;
//_pos = [(_cpos select 0),(_cpos select 1),0];
//_way1 = group player addWaypoint [_pos, 0];
//_way1 setWaypointCompletionRadius 10;
//_way1 setWaypointStatements ["true","[this] call GPF_fnc_WPLocation"];
//_way1 setWaypointType "MOVE";
//_way1 setWaypointBehaviour "COMBAT";
//_way1 setWaypointCombatMode "RED";
//_way1 setWaypointSpeed "FULL";
// [player] call GPF_fnc_WPLoop;

//cutText ["Hello World!","PLAIN",2];

/*
private _rad = 500;
	private _grp = group _unit;
	private _centerWorld = GetPos _unit;
	private _allPlaces = [];
	private _pCount = count _allPlaces;
	private _trad = _rad;
	while {(_pCount < 1)}do {
		_allPlaces = nearestLocations [_centerWorld, ["NameVillage","NameCity","NameCityCapital"],_trad];
		_trad = _trad+1000;
		_pCount = count _allPlaces;
		sleep 1;
	};
	private _pIndex = _pCount-1;
	private _nl = _allPlaces select _pIndex;
	private _lpos = locationPosition _nl;
	private _roads = _lpos nearRoads _rad;
	private _rCount = count _roads;
	_trad = _rad;
	while {(_rCount < 1)}do {
		_roads = _lpos nearRoads _trad;
		_trad = _trad+1000;
		_rCount = count _roads;
		sleep 1;
	};
	systemchat format ["%1",_rCount];
//systemchat format ["%1",_allPlaces];
*/

