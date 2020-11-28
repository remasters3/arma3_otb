gpf_fn_zpawner = compile preprocessFile "gpf_fn_zpawner.sqf";
_zombies = "getNumber (_x >> 'scope') >= 2 AND getNumber (_x >> 'side') == 0 AND configname _x isKindOf 'RyanZombieC_man_1'" configClasses (configFile >> "CfgVehicles") apply {configName _x};
_ZombieModels = [];
{
	if ("walker" in _x) then {	
	 _ZombieModels = _ZombieModels+[_x];
	};

} foreach _zombies; 

_debug = false;
_Spawns = [         
[4353.97,7495.4,0], //Arnoldstein Airport  
[8622.31,4784.41,0], //Airport Lesce  
[7988.78,1965.18,0], //Smugglers Airport  
[2330.83,567.24,0], //Airport Fortieste  
[734.45,9510.76,0], //Airport Vatra
[4846.34,5232.24,0], //Trenta  
[5404.55,3882.18,0], //Ukanc  
[3570.13,3534.46,0], //Dreznica  
[3473.41,5421.4,0], //Log Pod Mangartom  
[3024.39,4563.32,0], //Bovec  
[3002.2,4324.77,0], //Cezsoca  
[3503.04,3278.31,0], //Ladra  
[3523.11,5549.25,0], //Strmec  
[2974.97,3821.69,0], //Trnovo  
[3384.46,3212.58,0], //Idrsko  
[4429.37,2757.99,0], //Dolje  
[6025.19,3915.89,0], //Stara Fuzina  
[5985.29,3759.13,0], //Ribcev Laz  
[3013.04,3329.57,0], //Suzid  
[4593.39,2620.7,0], //Tolmin  
[6186.02,3984.98,0], //Studor  
[2858.47,3396.1,0], //Staro Selo  
[3420.58,2830.72,0], //Livek  
[4789.51,2581.26,0], //Podljubinj  
[4375.63,2517.76,0], //Volce  
[2560.76,3965.96,0], //Srpenica  
[6267.85,4032.63,0], //Srednja Vas  
[3172.45,5879.04,0], //Cave del Predil  
[2379.23,4195.34,0], //Zaga  
[5325.73,2553.98,0], //Sela  
[6456.72,4014.89,0], //Cesnjica  
[5067.66,6418.56,0], //Kranjska Gora  
[6537.15,4140.98,0], //Jereka  
[4761.15,2271.17,0], //Modrej  
[4812.96,6522.85,0], //Podkoren  
[4055.74,6553.04,0], //Fusine  
[2338.6,5203.74,0], //Sella Nevea  
[3148.69,6238.14,0], //Riofreddo  
[6523.38,3735.46,0], //Boh. Bistrica  
[6570.37,3860.54,0], //Bitnje  
[5284.91,2330.45,0], //Klavze  
[4891.38,2163.99,0], //Baca  
[5511.51,6402.3,0], //Gozd Mar.  
[5424.25,2343.28,0], //Kneza  
[6699.78,4489.36,0], //Goreljek  
[3988.49,2121.51,0], //Bolhowo  
[2431.84,3176.51,0], //FOB Boriana  
[4472.15,2055.48,0], //Sela Pri Volcah  
[6772.28,4175.26,0], //Koprivnik  
[6381.86,5740.02,0], //Radovna  
[6807.58,4710.77,0], //Mrzli Studenec  
[3709.67,2069.44,0], //Bajo Fuerta  
[5814.73,2375.8,0], //Koritnica  
[3854.39,1976.79,0], //Ditchwood  
[6143.95,6299.91,0], //Belca  
[4780.08,1845.9,0], //Taff Grove  
[4496.82,1818.65,0], //Pikia  
[6954.81,3968.41,0], //Nomenj  
[6375.11,6105.47,0], //Mojstrana  
[7047.45,4256.04,0], //Gorjuse  
[6711.47,3021.71,0], //Podbrdo  
[6436.18,6213.7,0], //Dovje  
[3630.24,1662.09,0], //Chabola  
[4776.17,1556.29,0], //Ramon's Villa  
[7404.96,4451.87,0], //Obrne  
[3513.52,1495.69,0], //Cape Goat  
[6970.59,6016.83,0], //Hrusica  
[5539.39,7238.79,0], //Hoopsberg  
[7451.89,4661.87,0], //Boh. Bela  
[7189.11,3130.39,0], //Sorica  
[5788.94,7136.95,0], //Kelch  
[7485.91,5083.95,0], //Gorje  
[5995.37,7143.97,0], //Mork  
[2533.98,1719.04,0], //Rontus Hospital  
[7617.99,5515.96,0], //Kocna  
[6118.58,7371.2,0], //Senzatoka  
[7800.64,5459.8,0], //Blejska Dobrava  
[6946.01,1879,0], //Fishers Corner  
[8009.67,4717.66,0], //Ribno  
[6750.56,1563.33,0], //Belley  
[8034.04,5270.52,0], //Breg  
[5965.58,926.2,0], //Zappado  
[7043.22,7147.45,0], //Kleinfort  
[8111.18,5418.37,0], //Zirovnica  
[7204.62,7054.3,0], //Freckle  
[8209.23,5195.33,0], //Vrba  
[8283.25,4875.39,0], //Lesce  
[8314.93,4582.73,0], //Lancovo  
[747.06,6018.99,0], //Villa Simona  
[2270.1,7867.52,0], //Volkovo  
[7312.22,1403.54,0], //Rockburn  
[1288.18,7194.1,0], //Felis Prison  
[8480.49,3479.68,0], //Drazgose  
[7019.83,1134.1,0], //Foxhill  
[8585.82,4281.64,0], //Kamna Gorica  
[8405,3146.5,0], //Zelezniki  
[861.16,2114.11,0], //Fortieste Island  
[7867.08,1943.23,0], //Smugglers Den  
[639.28,6421.05,0], //Isla Rubina  
[8655.94,5026.98,0], //Begunje  
[8692.2,3982.73,0], //Kropa  
[1176.23,7478.54,0], //Savagia  
[8708.46,3122.03,0], //Selca  
[6672.41,432.2,0], //Cato  
[7876.93,1406.76,0], //New Skooma  
[2262.18,9076.93,0], //Mello  
[1628.08,8851.74,0], //Borna  
[8279.46,8488.18,0], //Maintenance Shed / Power Station  
[1827.64,9429,0],   //Gazetovo  
[9621.88,6969,0],   //Power Station  
[8185.33,8954.19,0], //Ammo Bunker  
[9121.35,8065.48,0], //VIP Helipad  
[8321.83,9610.88,0], //Research Lab Nero      
[3952.71,3639.64,0], //Krn
[4121.92,5582.1,0], //Jalovec
[5485.09,5055.14,0], //Triglav
[5108.74,5466.7,0], //Razor
[3422.15,3484.76,0], //Volnik
[4907.07,5650.21,0], //Prisojnik
[4475.64,5757.65,0], //Mojstrovka
[3491.16,3367.79,0], //Ladrski vrh
[5343.17,5412.54,0], //Stenar
[5404.21,3346.54,0], //Vogel
[3027.41,4934.03,0], //Rombon
[3908.24,5817.16,0], //Mangart
[3368.5,5513.52,0], //Kolovrat
[5348.66,5765.12,0], //Skrlatica
[5635.58,3255.68,0], //Shija
[4525.55,2691.73,0], //Kozlov Rob
[3754.81,6065.72,0], //Picco di Mezzodi (Kopa)
[5351.84,5927.63,0], //Spik
[2747.74,3639.78,0], //Mali Vrh
[2641.39,5018.8,0], //Monte Lopa
[2921.83,3126.99,0], //Matajur
[2546.28,3713.51,0], //Stol 2
[3919.99,6322.79,0], //Colrotondo
[6394.01,4549.5,0], //Mesnovec
[2470.62,5166.18,0], //Monte Poviz
[4886.6,2295.12,0], //Senica
[4545.71,2222.12,0], //Mrzli Vrh
[2177.02,4884.28,0], //Mt. Kanin
[2419.65,5521.22,0], //Punta Plagnis
[2467.09,5622.68,0], //Cime Castrein
[2480.23,5716.85,0], //Jof Fuart
[2305,5550.11,0], //Modeon del Buinz
[2184.25,3489.11,0], //Airbase Boriana
[7739.84,3271.51,0], //Ratitovec
[8147.29,4258.56,0], //Jelovica
[8054.01,5612.85,0], //Ajdna Ruins
[8435.16,5742.8,0], //Stol
[992.28,7754.3,0], //Research Base A5
[2104.22,8640.35,0], //Mt. Maleficio
[8852.96,7989.55,0], //Trident Lab
[9595.67,7669.63,0], //Grimsted's Farm
[8273.71,8624.22,100], //Malcolm's Hacienda
[9324.03,8874,100], //Central Paddocks                             
[2609.78,1480.82,0], //Rontus
[1041.7,6307.94,0], //Citta Rubina
[8721.05,2390.73,0], //Porto Ritmo
[8946.58,2752.9,0], //Porto Ritmo
[3217.66,3344.35,0], //Kobarid, 
[3321.08,6670.45,0], //Tarvisio, 
[7461.03,5799.64,0], //Jesenice, 
[1292.96,5744.13,0], //Porto Pyano, 
[7913.81,4937.32,0], //Bled, 
[4521.07,7976.7,0], //Arnoldstein, 
[7798.07,5671.63,0], //Koroska Bela, 
[1991.87,1559.14,0], //Borovo, 
[8432.93,4647.76,0], //Radovljica, 
[1586.56,7318.3,0], //Eli, 
[1260.06,1644,0], //Bazovica, 
[1610.34,7590.16,0], //Saval, 
[445.51,2601.64,0], //Zalia, 
[585,2281.72,0], //Banak, 
[329.79,6770.06,0], //Maribu, 
[1356.23,688.18,0], //Bubinela, 
[750.13,7668.7,0], //Melara, 
[260.59,1716.93,0], //Arapovo, 
[8434.13,8719.85,0], //Visitor's Center, 
[8906.2,8235.43,0], //Diego's Farm, 
[9401.98,7579.66,0], //Old Village (Ruins), 
[1036.78,9370.18,0], //Vatra, 
[8511.16,9110.22,0], //Workers Village
[2735.84,8127.8,0] //NorthWest Island Trader Airfield
];

if (_debug) Then {
_Spawns = [ 
[9993.1,386.963,0] //debug island
];
};
{	// systemchat "echo";
	[_x,_ZombieModels] Spawn { _SpawnPos = _this select 0; _ZombieModels = _this select 1;

	    _target = _SpawnPos;
	    _minZombies = 10;
	    _RespawnTime = 30;
	    _Side = EAST;
	    _Timeout = -1;
	    _Blacklist = [];
	    _SpawnerModel = "HeliHEmpty"; //"FlagCarrierWhite_EP1"; //
		_rad = 300;
	    while {true} Do {
			
	    	_active = false;
	        _list = _SpawnPos nearObjects ["Man", _rad];
	        _RealPlayers = [];
	    	if ((count _list) > 0) Then {
	    		{if (isPlayer _x) Then {_RealPlayers = _RealPlayers + [_x];}; } Foreach _list;
	    		// systemchat "trigger 1";
	    	};
	    	
	    	if ((count _RealPlayers) == 0) Then {
				// systemchat "no players";
	    	    
	    	} else {
			// systemchat "trigger 2";
	    		if (!_active) Then {
	    		private _twd = [_SpawnPos,_target,_minZombies,_RespawnTime,_Side,_ZombieModels,_rad,_Timeout,_Blacklist,_SpawnerModel] Call gpf_fn_zpawner;
				_ZombieGroup = _twd select 0;
				_active = true;
	    		waituntil {(({alive _x} count units _ZombieGroup) == 0)};
	    		};
	    	};
	    
	    sleep 10;
	    };
	};
} foreach _Spawns;




