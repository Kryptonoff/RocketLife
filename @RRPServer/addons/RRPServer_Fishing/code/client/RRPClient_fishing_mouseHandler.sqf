private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh"];
params ["_ctrl", "_code", "_shift", "_ctrlKey", "_alt"];
_handled = false;
	
if (dialog) exitwith {};

if !(isnil "ASN_Debug") then {
	hintSilent str _code;
};
if ((currentweapon player) isNotEqualTo "ASN_FishingRod") exitwith {};
if (isNull ASN_Ballon) exitWith {};
switch (_code) do {
	case 0:
	{
		if (surfaceIsWater ((ASLToAGL eyePos player) vectorAdd (eyeDirection player vectorMultiply 50)) && !ASN_Fishing_timeout && (isNil "ASN_Ballon" OR {player distance ASN_Ballon < 10 OR {!surfaceIsWater getPos ASN_Ballon}})) then {
			0 spawn {
				ASN_Fishing_Run_Loop = false;
				ASN_Fishing_timeout = true;
				{
					ropeDestroy _x;
				} foreach (ropes ASN_Fish_Helper);
				if !(isnil "ASN_Ballon") then {deletevehicle ASN_Ballon;};
				ASN_Ballon = "Land_Balloon_01_air_F" createVehicle position player;
				Balrope = ropeCreate[ASN_Fish_Helper, [0, 0.1, -0.5], ASN_Ballon, [0, 0, 0], 55];	
				uiSleep 0.1;
				ropesegmentX = player nearObjects ["ropesegment", 20];
				{if (typeOf _x == "ropesegment") then {_x setObjectTexture [0, ""]; _x setObjectTexture [1, ""]; _x setObjectTexture [2, "#(argb,8,8,3)color(0.752941,0.752941,0.752941,0.5,CA)"];};} foreach ropesegmentX;
				ASN_Ballon allowdamage false;

				_vehicle = ASN_Ballon;
				_vehicle setposASL (getposASL player);
				_vel = velocity _vehicle;
				_dir = direction player;
				_speed = 19;
				_vehicle setVelocity [
					(_vel select 0) + (sin _dir * _speed), 
					(_vel select 1) + (cos _dir * _speed), 
					((_vel select 2) + 12)
				];
				player playAction "ASN_Swing_Rod";  
				uiSleep 0.5; 
				player playAction "ASN_Rod_hold";  

				uiSleep (2);
				ASN_Fishing_timeout = false;
				ASN_Fishing_Run_Loop = true;
				private _profName = getText(missionConfigFile >> "LifeCfgFishing" >> "prof");
				private _dataProf = missionNamespace getVariable (_profName);
				private _curlvl = _dataProf select 0;

				while {ASN_Fishing_Run_Loop} do {
					scopeName "loop1";
					if (!isnil "ASN_Debug") then {
						systemchat "loop 1";
					};				
					uiSleep 1;
					while {ASN_Fishing_Run_Loop} do {
						scopeName "loop2";
						if (!isnil "ASN_Debug") then {
							systemchat "loop 2";
						};
						if (ASN_Fishing_timeout2 OR ASN_Fishing_timeout) then {breakOut "loop2"};
						uiSleep 1;
						if ((surfaceIsWater getpos ASN_Ballon) && !(ASN_Fishing_timeout2) && (player distance ASN_Ballon > 10)) then {
							if (random 100 <= (getNumber(MissionconfigFile >> "LifeCfgFishing" >> "gethooked") + _curlvl)) then {
								_vehicle = ASN_Ballon;
								_vel = velocity _vehicle;
								_dir = ASN_Ballon getDir ASN_Fish_Helper;
								_speed = 0;
								_vehicle setVelocity [
									(sin _dir * _speed), 
									(cos _dir * _speed), 
									-10
								];	
								if (!isnil "ASN_Debug") then {
									systemchat "Fish ASN_Ballon";
								};	
								0 spawn {
									ASN_has_fish = true;
									uiSleep 1;
									ASN_has_fish = false
								};
							};
							0 spawn {
								ASN_Fishing_timeout2 = true;
								uiSleep 5;
								ASN_Fishing_timeout2 = false
							};
							breakOut "loop2";
						} else {
							if (!isnil "ASN_Debug") then {
								systemchat "Timeout = True";
							};	
						};			
					};
					uiSleep 1;
					if (if !(isnil "ASN_Ballon") then {((isnull(ropeAttachedTo ASN_Ballon) OR (count(ropes ASN_Fish_Helper) < 1)))} else {true}) exitwith {
						if (!isnil "ASN_Debug") then {
							systemchat "Exitwith fishing loop";
							ASN_Fishing_Run_Loop = false;
						};				
					};
				};
			};	
		};
		if (!(surfaceIsWater ((ASLToAGL eyePos player) vectorAdd (eyeDirection player vectorMultiply 50))) && !ASN_Fishing_timeout && (isNil "ASN_Ballon" OR {player distance ASN_Ballon < 10 OR {!surfaceIsWater getPos ASN_Ballon}})) then {
			["Рыбалка", "Здесь нельзя рыбачить!"] call toastError; 
		};
		if (!ASN_Fishing_timeout && (player distance ASN_Ballon > 9) && (!isNil "ASN_Ballon" OR {surfaceIsWater (getPos ASN_Ballon)})) then {
			ASN_Ballon allowdamage false;
			[] spawn {
				ASN_Fishing_timeout = true;
				if (ASN_has_fish) then {
					0 spawn {
						["Рыбалка", "Леска кажется тяжелой, может кто-то клюнул"] call toastInfo; 
						_fish = "Mullet_F" createVehicle [0,0,0];
						_fish attachTo [ASN_Ballon, [0, 0, 0.5]]; 
						_fish setVectorUp [0,0.99,0.01];				
						waituntil {uiSleep 1;(player distance ASN_Ballon < 1.5)};
						deletevehicle _fish;
						0 call RRPClient_fishing_addFish;
					};
				} else {
					["Рыбалка", "Леска кажется легкой, вряд ли рыба клюнула"] call toastInfo; 
				};
				while {(player distance ASN_Ballon > 1)} do {
					ropeUnwind [ Balrope, 5, ((player distance ASN_Ballon) + 1)];
					_vehicle = ASN_Ballon;
					_vel = velocity _vehicle;
					_dir = ASN_Ballon getDir player;
					_speed = 4;
					_vehicle setVelocity [
						(sin _dir * _speed), 
						(cos _dir * _speed), 
						0
					];
				};
				waituntil {uiSleep 1; if !(isnil "ASN_Ballon") then {(player distance ASN_Ballon < 1.5)}else {true}};
				ASN_Fishing_timeout = false;
			};	
		};
	};
};
_handled;