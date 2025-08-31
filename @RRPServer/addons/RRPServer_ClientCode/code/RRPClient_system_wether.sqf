//::::::::::::  ::::::::::::\\
//	Filename: D41\scripts\Markt\fn_D41_wetter.sqf
//	Author: Distrikt41.de - Dscha
//
//	Beschreibung: Random Weather Script - What else can i say?
//::::::::::::  ::::::::::::\\

	private ["_fnc_D41_WetterWerte"];

	
	W_FOG = [0,0,0];
	W_Waves = 1;
	W_Preview = 0.5;
	W_Wind = [1, 1, true];
	W_Rain = 0;
	W_RainCounter = 1;
	W_Flash = 0;

	_fnc_D41_WetterWerte =
	{
		if (isDedicated) then
			{
				D41_ChanceN = round(random 100);
				if(D41_ChanceN <= 10) then
					{
						W_FOG = [0,0,0]; W_Waves = 1; W_Preview = 0.2; W_Wind = [2, 2, true]; W_Rain = 0; W_RainCounter = 0;
						D41_WMod = round(random 9);
						if(D41_WMod == 0)	then {W_FOG = [1, 0.1,10];		W_Rain = 0;	W_Preview = 0.4; W_Flash = 0;}; //Dicht
						if(D41_WMod == 1)	then {W_FOG = [1, 0.2,10];		W_Rain = 0;	W_Preview = 0.3; W_Flash = 0;};
						if(D41_WMod == 2)	then {W_FOG = [1, 0.3,10];		W_Rain = 0;	W_Preview = 0.2; W_Flash = 0;}; //geht so, akzeptabler Nebel
						if(D41_WMod == 3)	then {W_FOG = [0.9, 0.1,15];	W_RainCounter = 0; W_Flash = 0;}; //Dicht
						if(D41_WMod == 4)	then {W_FOG = [0.8, 0.1,15];	W_Rain = 0;	W_Preview = 0.4; W_Flash = 0;};
						if(D41_WMod == 5)	then {W_FOG = [0.7, 0.1,15];	W_RainCounter = 0; W_Flash = 0;}; //geht so, akzeptabler Nebel
						if(D41_WMod == 6)	then {W_FOG = [0.6, 0.1,30];	W_RainCounter = 0; W_Flash = 0;};
						if(D41_WMod == 7)	then {W_FOG = [0.5, 0.1,30];	W_Rain = 0.1;	W_Preview = 0.4; W_Flash = 0;};
						if(D41_WMod == 8)	then {W_FOG = [0.4, 0.1,30];	W_RainCounter = 0; W_Flash = 0;}; //geht so, akzeptabler Nebel
						if(D41_WMod == 9)	then {W_FOG = [0.1, 0.1,50];	W_Rain = 0.1;	W_Waves = 1;	W_Preview = 0.5; W_Flash = 1;}; //Hoch halt
					};

				if(D41_ChanceN >=11 && D41_ChanceN <= 35 && W_RainCounter == 0) then
					{
						W_FOG = [0,0,0]; W_Waves = 1; W_Preview = 1; W_Rain = 0; W_RainCounter = 0;
						D41_WMod = round(random 9);
						if(D41_WMod == 0)	then {W_FOG = 0.1;	W_Waves = 1;		W_Preview = 1; 	W_Wind = [4, 4, true];	W_Rain = 0.6; W_Flash = 1;};
						if(D41_WMod == 1)	then {W_FOG = 0.3;	W_Waves = 1;		W_Preview = 1; 	W_Wind = [4, 4, true];	W_Rain = 0.6; W_Flash = 1;};
						if(D41_WMod == 2)	then {W_FOG = 0.1;	W_Waves = 1;		W_Preview = 0.9; W_Wind = [4, 4, true];	W_Rain = 0.5; W_Flash = 1;};
						if(D41_WMod == 3)	then {W_FOG = 0.2;	W_Waves = 1;		W_Preview = 0.8; W_Wind = [0, 5, true];	W_Rain = 0.5; W_Flash = 1;};
						if(D41_WMod == 4)	then {W_FOG = 0.1;	W_Waves = 1;		W_Preview = 0.7; W_Wind = [6, 0, true];	W_Rain = 0.3; W_Flash = 0;};
						if(D41_WMod == 5)	then {W_FOG = 0.1;	W_Waves = 1;		W_Preview = 0.7; W_Wind = [0, 6, true];	W_Rain = 0.3; W_Flash = 0;};
						if(D41_WMod == 6)	then {W_FOG = 0.1;	W_Waves = 1;		W_Preview = 0.6; W_Wind = [5, 0, true];	W_Rain = 0.2; W_Flash = 0;};
						if(D41_WMod == 7)	then {W_FOG = 0.1;	W_Waves = 1;		W_Preview = 0.5; W_Wind = [2, 4, true];	W_Rain = 0.2; W_Flash = 0;};
						if(D41_WMod == 8)	then {W_FOG = 0.1;	W_Waves = 1;		W_Preview = 0.4; W_Wind = [3, 2, true];	W_Rain = 0.2; W_Flash = 0;};
						if(D41_WMod == 9)	then {W_FOG = 0.1;	W_Waves = 1;		W_Preview = 0.4; W_Wind = [2, 1, true];	W_Rain = 0.1; W_Flash = 0;};
					};

				if(D41_ChanceN >=11 && D41_ChanceN <= 35 && W_RainCounter == 1) then {D41_ChanceN = 36};

				if(D41_ChanceN >=36 && D41_ChanceN <= 80) then
				{
					W_FOG = [0,0,0]; W_Waves = 1; W_Preview = 0.2; W_Wind = [5, 5, true]; W_Rain = 0; W_RainCounter = 0;
					D41_WMod = round(random 9);
					if(D41_WMod == 0)	then {W_Preview = 0.9;	W_Wind = [3, 0, true]; W_Flash = 0;};
					if(D41_WMod == 1)	then {W_Preview = 0.9;	W_Wind = [0, 3, true]; W_Flash = 0;};
					if(D41_WMod == 2)	then {W_Preview = 0.7;	W_Wind = [2, 3, true]; W_Flash = 0;};
					if(D41_WMod == 3)	then {W_Preview = 0.7;	W_Wind = [3, 2, true]; W_Flash = 0;};
					if(D41_WMod == 4)	then {W_Preview = 0.6;	W_Wind = [0, 3, true]; W_Flash = 0;};
					if(D41_WMod == 5)	then {W_Preview = 0.6;	W_Wind = [2, 0, true]; W_Flash = 0;};
					if(D41_WMod == 6)	then {W_Preview = 0.5;	W_Wind = [2, 2, true]; W_Flash = 0;};
					if(D41_WMod == 7)	then {W_Preview = 0.5;	W_Wind = [2, 0, true]; W_Flash = 0;};
					if(D41_WMod == 8)	then {W_Preview = 0.4;	W_Wind = [0, 2, true]; W_Flash = 0;};
					if(D41_WMod == 9)	then {W_Preview = 0.4;	W_Wind = [1, 1, true]; W_Flash = 0;};
				};

				if(D41_ChanceN >=81 && D41_ChanceN <= 100) then
				{
					W_FOG = [0,0,0]; W_Waves = 1; W_Preview = 0.2; W_Wind = [1, 1, true]; W_Rain = 0; W_RainCounter = 1;
					D41_WMod = round(random 2);
					if(D41_WMod == 0)	then {W_Preview = 0.2;	W_Wind = [3, 0, true]; W_Flash = 0;};
					if(D41_WMod == 1)	then {W_Preview = 0.2;	W_Wind = [0, 3, true]; W_Flash = 0;};
					if(D41_WMod == 2)	then {W_Preview = 0.1;	W_Wind = [0, 0, true]; W_Flash = 0;};			
				};
				Diag_log format ["::::::::: WETTER SYSTEM ::::::::: D41_ChanceN = %1 ::: D41_WMod = %2",D41_ChanceN, D41_WMod];
				publicVariable "W_FOG";
				publicVariable "W_Waves";
				publicVariable "W_Preview";
				publicVariable "W_Wind";
				publicVariable "W_Rain";
			};
	};

	if(isDedicated)then
	{
		while{true}do
		{
			call _fnc_D41_WetterWerte;
			//uiSleep 1;
			60 setfog (W_FOG);
			60 setRain (W_Rain);
			0 setOvercast (W_Preview);
			setWind (W_Wind);
			60 setWaves (W_Waves);
			uiSleep 1200;
		};
	};

	//JIP und sync Ged�hns
	if (!isDedicated) then
	{
		while{true}do
		{
			60 setfog (W_FOG);
			60 setRain (W_Rain);
			0 setOvercast (W_Preview);
			setWind (W_Wind);
			60 setWaves (W_Waves);
			uiSleep 120;
		};
	};