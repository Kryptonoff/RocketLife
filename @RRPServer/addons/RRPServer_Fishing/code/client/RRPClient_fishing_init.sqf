if (isnil "ASN_Fishing_timeout") then {
	ASN_Fishing_timeout = false;
	ASN_has_fish = false;
	ASN_Fishing_timeout2 = false;
	ASN_Fishing_Run_Loop = false;
};	

["ASN_FishingFrames", "onEachFrame", 
{
		if (currentweapon player isequalto "ASN_FishingRod" && isnil "ASN_Fish_Helper") then {
			ASN_Fish_Helper = "ASN_Client_Fishing_helper" createVehicle [0,0,0];	
			[ASN_Fish_Helper] remoteexeccall ["ASN_fnc_hidefishhelp",2];
			ASN_Fish_Helper disableCollisionWith player;
		};	
		if !(currentweapon player isequalto "ASN_FishingRod" && !isnil "ASN_Fish_Helper") then {
			deletevehicle ASN_Fish_Helper;	
			deletevehicle ASN_Ballon;
			ASN_Fish_Helper = nil;
			ASN_Ballon = nil;
			ASN_Fishing_Run_Loop = false;
		};

		if (currentweapon player isequalto "ASN_FishingRod") then {
			_range = -2.02;   
			_rwrist = (player selectionPosition "lefthand");
			_start = player modeltoworld [_rwrist select 0, (_rwrist select 1) + 0, (_rwrist select 2) + 0];
			
			if (surfaceIsWater getpos player) then {
				_lstart = (player modeltoworld _rwrist);
				_lend = (player weaponDirection currentWeapon player) vectorMultiply _range;
				_end = (_lend vectoradd _lstart);
				_endL = _end;
				ASN_Fish_Helper setposASL _endl;
			} else {
				_lstart = atltoasl(player modeltoworld _rwrist);
				_lend = (player weaponDirection currentWeapon player) vectorMultiply _range;
				_end = asltoatl(_lend vectoradd _lstart);
				_endL = _end;
				ASN_Fish_Helper setposATL _endl;	
			};

			
			ASN_Fish_Helper setdir (getDir	player);	
			if (!isnil "ASN_Debug") then {	
					drawLine3D [_start, _endL, [1,0,0,1.5-sunOrmoon]];
			};		
			if (!isnil "ASN_Debug") then {	
				_beg = ASLToAGL eyePos player;
				_endE = (_beg vectorAdd (eyeDirection player vectorMultiply 50));
				if (surfaceIsWater _endE) then {
					drawLine3D [_beg, _endE, [0,1,0,1]];
				} else {
					drawLine3D [_beg, _endE, [1,0,0,1]];		
				};
			}; 
			if (ASN_Fish_Helper distance ASN_Ballon > 50) then {
					_vehicle = ASN_Ballon;
					_vel = velocity _vehicle;
					_dir = ASN_Ballon getDir ASN_Fish_Helper;
					_speed = 2;
					_vehicle setVelocity [
						(sin _dir * _speed), 
						(cos _dir * _speed), 
						0
					];
			};	
			if (isnull(ropeAttachedTo ASN_Ballon) && count(ropes ASN_Fish_Helper) > 0) then {
				["Рыбалка", "Леска сломалась"] call toastError;
				{
					ropeDestroy _x;
				} foreach (ropes ASN_Fish_Helper);
				deletevehicle ASN_Ballon;
				ASN_Ballon = nil;
				ASN_Fishing_Run_Loop = false;
			};		
			if !(vehicle player isequalto player) then {		
				{
					ropeDestroy _x;
				} foreach (ropes ASN_Fish_Helper);
				deletevehicle ASN_Fish_Helper;	
				deletevehicle ASN_Ballon;
				ASN_Fish_Helper = nil;
				ASN_Ballon = nil;
				ASN_Fishing_Run_Loop = false;
			};
		};
}] call BIS_fnc_addStackedEventHandler;


ASN_fishykeys = (findDisplay 46) displayAddEventHandler ["MouseButtonDown", "call RRPClient_fishing_mouseHandler;"];
