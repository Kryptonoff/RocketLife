/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/


params [
	["_house",objNull,[objNull]],
	["_container",objNull,[objNull]]
];

try {
	if (isNull _house) throw "Ошибка при определение дома!";
	if (isNull _container) throw "Ошибка при определение ящика!";
	if (!isClass (missionConfigFile >> "LifeCfgAnomaly" >> "HouseLootItems" >> (typeOf _house))) throw "Такого дома нет в конфиге!";

	private ["_lootList","_amountItems","_items","_amount","_chanceList","_mbAddScandium"];

	_items = getArray(missionConfigFile >> "LifeCfgAnomaly" >> "HouseLootItems" >> (typeOf _house) >> "items");
	_chanceList = [["Arcane",1],["Legendary",5],["Mythical",10],["uncommon",15],["rare",27],["common",37]];

	_amount = (getNumber(missionConfigFile >> "LifeCfgAnomaly" >> "maxItems")) * (if (daytime >= 19 OR daytime <= 6) then {getNumber(missionConfigFile >> "LifeCfgAnomaly" >> "NightCoef")} else {1});

	_amountItems = ceil(random _amount);

	_lootList = [];
	for "_i" from 1 to _amountItems step 1 do {
		private ["_chanse","_randomItem","_chanseItemsList"];
		_chanse = [_chanceList] call RRPClient_util_selectRandom;
		_chanseItemsList = _items select {(_x select 2) isEqualTo _chanse};
	 	_randomItem = selectRandom _chanseItemsList;

		_lootList pushBack _randomItem;
	};

	_mbAddScandium = ( (round(random 100)) < 45);
	if (_mbAddScandium) then {
		[_container,"RRP_Scandium",ceil(random 5),true] call RRPClient_system_vehicleInv;
	};

	{
		_x params ["_class","_mod","_chance"];
		if (_mod isEqualTo "virt") then {
			[_container,_class,1,true] call RRPClient_system_vehicleInv;
		} else {
			private ["_infoItems","_itemMag"];
			_infoItems = [_class] call RRPClient_util_itemDetails;
			if !(_infoItems isEqualTo []) then {
				_itemMag = _infoItems param [7,[]];
				if !(_itemMag isEqualTo []) then {
					for "_i" from 1 to ceil(random 3) step 1 do {
						[(selectRandom _itemMag),_container] call RRPClient_system_addItemToBox;
					};
				};
				[_class,_container] call RRPClient_system_addItemToBox;
			} else {
				private _error = format ["%1 не существует или опечатка в конфиге!", _class];
				diag_log _error; systemChat _error;
			}
		};
	} forEach _lootList;

} catch {
	["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
