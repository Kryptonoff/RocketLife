/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

["achievementsVM", "onEachFrame", {
if !(isNull (findDisplay 46)) then
{
	if (diag_tickTime > ((findDisplay 46) getVariable['achVMDelaySecond', 0])) then 
	{
		(findDisplay 46) setVariable['achVMDelaySecond', diag_tickTime + 1];
		private _speedMS = (speed(vehicle player)) / 3.6;
		private _newLoadout = getUnitLoadout player;
		private _oldLoadout = player getVariable['previousGear', []];
		if (_speedMS > 0) then 
		{
			switch (true) do 
			{
				case (isNull(objectParent player)):
				{
					['tourist', round _speedMS] call RRPClient_ach_gateway;
					if (((getPosASL player) select 2) <= -180) then 
					{
						['diver', 1] call RRPClient_ach_gateway;
					};
					if (call life_donator > 0) then
					{
						["vipmember",1] call RRPClient_ach_gateway;
					};
				};
				case ((objectParent player) isKindOf "LandVehicle"):
				{
					if (driver(objectParent player) isEqualTo player) then 
					{
						['rider', round _speedMS] call RRPClient_ach_gateway
					};
				};
				case ((objectParent player) isKindOf "Air"):
				{
					if (driver(objectParent player) isEqualTo player) then 
					{
						['heli', round _speedMS] call RRPClient_ach_gateway
					};
					if (speed(objectParent player) >= 200) then 
					{
						if (((getPosATL(objectParent player)) select 2) <= 3) then 
						{
							['lowprofile', 1] call RRPClient_ach_gateway;
						};
					};
					if (speed(objectParent player) >= 1000) then 
					{
						['gofast', 1] call RRPClient_ach_gateway;
					};
				};
				case ((objectParent player) isKindOf "Ship"):
				{
					if (driver(objectParent player) isEqualTo player) then 
					{
						['ship', round _speedMS] call RRPClient_ach_gateway
					};
				};
			};
		};
		if (count (units group player) >= 10) then {
			['group', 1] call RRPClient_ach_gateway;
		};
		if !(_newLoadout isEqualTo _oldLoadout) then {
			player setVariable['previousGear', getUnitLoadout player];
			private _arr = [uniform player, vest player, backpack player, headgear player, goggles player, hmd player, binocular player, primaryWeapon player, secondaryWeapon player, handgunWeapon player];
			_arr append(getUnitLoadout player select 9);
			if (({_x isEqualTo ''}count _arr) isEqualTo 0) then {
				['dressed', 1] call RRPClient_ach_gateway;
			};
		};
	};
	if (diag_tickTime > ((findDisplay 46) getVariable['achVMDelayMinute', 0])) then 
	{
		(findDisplay 46) setVariable['achVMDelayMinute', diag_tickTime + 60];
		[[getPlayerUID player],"session_updatePlayTime"] call RRPClient_system_hcExec;
		_time = player getVariable ["PlayerTime",0];
		player setVariable ["PlayerTime",_time + 1,true];
		if (_time > getNumber(missionConfigFile >> "LifeCfgSettings" >> "beginnerTime") && {player getVariable ["isBeginner",false]}) then {
			player setVariable ["isBeginner",false,true];
			["Поздравляем!","Режим новичка с вас снят!"] call toastInfo;
		};
		
		[
			['10hrs', '100hrs', '500hrs', '1000hrs','2500hrs'], 60
		] call RRPClient_ach_gateway;
		
		if ((player getVariable ["lifeState","UNDEFINED"]) isEqualTo "INCAPACITATED") then
		{
			['camatose', 60] call RRPClient_ach_gateway;
		};
		if (([player] call RRPClient_system_isSafeZone) # 0) then
		{
			['siklo', 60] call RRPClient_ach_gateway;
		};
	};
}; 
}] call BIS_fnc_addStackedEventHandler;
