
try{
	if (server_restartSoon) throw "Надвигается буря. Все магазины закрыты.";
	params [
		["_shop","",[""]],
		["_spawnPoints","",["",[]]],
		["_shopFlag","",[""]],
		["_shopTitle","",[""]],
		["_disableBuy",false,[true]]
	];

	if !(isClass(missionConfigFile >> "LifeCfgVehShops" >> _shop)) exitWith {titleText ["Магазин не определен","PLAIN"]};

	private _exit = false;
	private _shopSide = getText(missionConfigFile >> "LifeCfgVehShops" >> _shop >> "side");
	private _vehicleType = getText(missionConfigFile >> "LifeCfgVehShops" >> _shop >> "type");
	if !(_shopSide isEqualTo "") then
	{
		private _side = player call getSide;
		if !(_shopSide isEqualTo _side) then {
			_exit = true;
		};
	};

	if (_exit) exitWith {titleText ["Магазин недоступен для вашей фракции","PLAIN"]};

	private _conditions = getText(missionConfigFile >> "LifeCfgVehShops" >> _shop >> "conditions");
	if !([_conditions] call RRPClient_util_conditionsCheck) throw (getText(missionConfigFile >> "LifeCfgVehShops" >> _shop >> "conditionsMessage"));

	disableSerialization;
	createDialog "UnionDialogVehicleShopV2";
	waitUntil {!isNull (findDisplay 2300)};
	uiNamespace setVariable ["UnionDialogVehicleShopV2",(findDisplay 2300)];

	life_veh_shop = [_shop,_spawnpoints,_shopFlag,_disableBuy];

	ctrlSetText [2301,_shopTitle];
	ctrlSetText [601,format["Наличность: $%1 / RCredits: %2            ",[RRPClientCashMoney] call RRPClient_util_numberText,[RRPClientCredits] call RRPClient_util_numberText]];

	private _control = ((findDisplay 2300) displayCtrl 2302);
	lbClear _control;

	ctrlShow [2330,false];
	ctrlEnable [2304,false];
	ctrlEnable [2305,false];

    private _groupID = getNumber(missionConfigFile >> "LifeCfgVehShops" >>_shop >> "groupID");
	private _multiplier = getNumber(missionConfigFile >> "LifeCfgVehShops" >> _shop >> "multiplier");
	private ["_vehicleInfo","_basePrice"];

	if (((getText(missionConfigFile >> "LifeCfgVehShops" >> _shop >> "pushVIPitems")) isEqualTo "") and (_multiplier >= 1)) then {
		_exclusiveItems = (getArray(missionConfigFile >> "ptw" >> "exclusive_car" >> "vehicles")) + (['vehicle', _vehicleType] call RRPClient_system_getPurchasedItemsList);
		if (_groupID isNotEqualTo 0) then
		{
			_exclusiveItems = _exclusiveItems + (_groupID call RRPClient_system_getGroupRentItems);
		};
		{
			_x params ["_className","_conditions",["_conditionsMsg","",[""],["_onlyRent","false",[""]]]];
			if (isClass(configFile >> "CfgVehicles" >> _className)) then
			{
				if ([_conditions] call RRPClient_util_conditionsCheck) then {
					_basePrice = getNumber(missionConfigFile >> "LifeCfgVehicles" >> _className >> "price");
					if (_basePrice > 0) then {
						_vehicleInfo = [_className] call RRPClient_util_fetchVehInfo;
						private _index = _control lbAdd format["%1",(_vehicleInfo select 3)];
						_control lbSetData [_index,str([_className,_conditions,_conditionsMsg])];
						_control lbSetColor [_index, [0.75, 0.04, 0.67, 1]];
						_control lbSetPicture [_index,"\RRP_icons\shop\exlusiveContent.paa"];
						_basePrice = _basePrice * _multiplier;
						_basePrice = ['priceSell',_basePrice] call RRPClient_system_VIP;
						_control lbSetTextRight [_index, format["  $%1",[round(_basePrice)] call RRPClient_util_numberText]];
						_control lbSetValue [_index, _basePrice];
						if !([_conditions] call RRPClient_util_conditionsCheck) then {
							_control lbSetColor [_index, [0.89, 0.0, 0.0, 0.5]];
						};
					};
				};
			}else{format ["%1 нет в аддоне, удалить в конфиге!",_className] call RRPClient_system_log};
		} foreach _exclusiveItems;
	};

	{
		_x params ["_className","_conditions",["_conditionsMsg","",[""],["_onlyRent","false",[""]]]];
		if (isClass(configFile >> "CfgVehicles" >> _className)) then
		{
			if (isClass (missionConfigFile >> "LifeCfgVehicles" >> _className)) then {
				_basePrice = getNumber(missionConfigFile >> "LifeCfgVehicles" >> _className >> "price");
				if (_basePrice > 0) then {
					_vehicleInfo = [_className] call RRPClient_util_fetchVehInfo;
					private _index = _control lbAdd format["%1",(_vehicleInfo select 3)];
					_control lbSetData [_index,str([_className,_conditions,_conditionsMsg])];
					_basePrice = _basePrice * _multiplier;
					_basePrice = ['priceSell',_basePrice] call RRPClient_system_VIP;
					_control lbSetTextRight [_index, format["  $%1",[round(_basePrice)] call RRPClient_util_numberText]];
					_control lbSetValue [_index, _basePrice];
					if !([_conditions] call RRPClient_util_conditionsCheck) then {
						_control lbSetColor [_index, [0.89, 0.0, 0.0, 0.5]];
					};
				};
			};
		}else{format ["%1 нет в аддоне, удалить в конфиге!",_className] call RRPClient_system_log};
	} foreach (getArray(missionConfigFile >> "LifeCfgVehShops" >> _shop >> "vehicles"));
	lbSortByValue _control;

	["Land_TentHangar_V1_F",(findDisplay 2300),_spawnPoints] call RRPClient_system_shopBoxCreate;
	_control lbSetCurSel 0;
}catch{
	[_exception] call toastError;
};
true
