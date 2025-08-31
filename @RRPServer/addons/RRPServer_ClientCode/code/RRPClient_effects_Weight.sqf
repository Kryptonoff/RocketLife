/*
    Author(s):
    Arrra (original)
    ----
    Сontacts:
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd
*/

private["_weightBP","_load","_backpack","_condition"];
_backpack = "";

while {true} do {
	if ((backpack player) isEqualto "") then {
		life_maxWeight = life_maxWeightT;
		_backpack = "";
	} else {
		if !(_backpack isEqualto (backpack player)) then {
			_backpack = backpack player;
			_weightBP = getNumber(configFile >> "CfgVehicles" >> _backpack >> "maximumload");

			if (isClass(missionConfigFile >> "clothing_settings" >> _backpack)) then {
				_condition = getText(missionConfigFile >> "clothing_settings" >> _backpack >> "condition_use");
				if ([_condition] call RRPClient_util_conditionsCheck) then
				{
					_load = getNumber(missionConfigFile >> "clothing_settings" >> _backpack >> "back_pack_weight");
					if (_load isEqualto 0) then {
						if (_weightBP > 300) then {_weightBP = 300};
						_load = round(_weightBP / 8);
					};
				} else {
					if (_weightBP > 300) then {_weightBP = 300};
					_load = round(_weightBP / 8);
				};
			} else {
				if (_weightBP > 300) then {_weightBP = 300};
				_load = round(_weightBP / 8);
			};
			if (["Muscleman"] call perk) then {_load = round(_load * 1.25)};
			life_maxWeight = life_maxWeightT + _load;
		};
	};

	if (life_carryWeight > life_maxWeight && !isForcedWalk player) then {
		player forceWalk true;
		player setFatigue 1;
		["WarningTitleAndText", ["Инвентарь перегружен", "Освободите инвентарь что-бы передвигаться быстрее"]] call SmartClient_gui_toaster_addTemplateToast;
	} else {
		if (isForcedWalk player AND isNull(player getVariable ["escortingPlayer",objNull])) then {player forceWalk false};
	};

	uiSleep 2;
};
