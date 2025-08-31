/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_mode","_nearVehicles","_localVehicles","_basePrice","_display","_list","_index","_className","_displayName","_picture","_control","_selection","_vehicle","_btnOwn","_btnSell",
	"_basePrice","_price","_price2","_vehicleSide","_priceTag","_priceTagOwn"];
if !(canSuspend) exitWith {_this spawn RRPClient_chopShop_action};
_mode = param [0,""];
_myPos = getPosWorld player;
try
{
	switch (_mode) do
	{
		case "onLoad":
		{
			private _cop_min_illegal = call RRPClient_system_copsForIllegal;
			if (((["cop"] call RRPClient_system_playerCount) < _cop_min_illegal) AND (call life_adminlevel < 1)) throw format[ "Для перебивки и продажи техники необходимо как минимум %1 полицейских на острове",_cop_min_illegal];
			_nearVehicles = nearestObjects [player, ["LandVehicle", "Air", "Ship"], getNumber(getMissionConfig "CfgChopShop" >> "distanceReq")];
			_localVehicles = [];
			{
				if (isClass (missionConfigFile >> "LifeCfgVehicles" >> typeOf _x)) then
				{
					if !((getNumber(missionConfigFile >> "LifeCfgVehicles" >> typeOf _x >> "price")) isEqualTo -1) then
					{
						if (local _x) then
						{
							if (alive _x) then
							{
								if ((crew _x isEqualTo []) && (_x in life_vehicles)) then
								{
									if !((_x getVariable ["dbInfo",[]]) isEqualTo []) then
									{
										_localVehicles pushBack _x;
									};
								};
							};
						};
					};
				};
			}forEach _nearVehicles;
			if (_localVehicles isEqualTo []) throw format ["Припаркуйте машину в радиусе %1 метров и покиньте ее с места водителя!",getNumber(getMissionConfig "CfgChopShop" >> "distanceReq")];
			createDialog "RRPDialogChopShop";
			_display = uiNamespace getVariable ["RRPDialogChopShop",displayNull];
			_list = _display displayCtrl 39402;

			{
				if (alive _x) then {
					_className = typeOf _x;
					_displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
					_picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");
					if((crew _x isEqualTo []) && (_x in life_vehicles)) then
					{
						_index = _list lbAdd _displayName;
						_list lbSetData [_index,netId _x];
						_list lbSetPicture [_index,_picture];
					};
				};
			} foreach _localVehicles;
		};
		case "onLbSelChanged":
		{
			disableSerialization;
			_control = _this#1 param [0,controlNull,[controlNull]];
			_selection = _this#1 param [1,-1,[0]];
			_vehicle = objectFromNetId(_control lbData _selection);
			_display = uiNamespace getVariable ["RRPDialogChopShop",displayNull];
			_display setVariable ["temp",_vehicle];
			_btnOwn = _display displayCtrl 39404;
			_btnSell = _display displayCtrl 39405;
			_basePrice = getNumber(missionConfigFile >> "LifeCfgVehicles" >> typeOf _vehicle >> "price");

			_price = round (_basePrice * (getNumber(getMissionConfig "CfgChopShop" >> "coefSell")));
			_price = ["ScrapDealer", _price] call RRPClient_perks_activatePerk;
			
			_vehicleSide = _vehicle getVariable ["tf_side","sideUnknown"];
			_price2 = if (_vehicleSide == "west") then {
				round (_basePrice * 5)
			} else {
				round (_basePrice * (getNumber(getMissionConfig "CfgChopShop" >> "coefChop")))
			};

			_price2 = ['priceSell',_price2] call RRPClient_system_VIP;

			_priceTag = _display displayCtrl 39401;
			_priceTagOwn = _display displayCtrl 39403;
			_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>" +("Цена:")+ " <t color='#8cff9b'>$%1</t></t>",[(_price)] call RRPClient_util_numberText];
			_priceTagOwn ctrlSetStructuredText parseText format ["<t size='0.8'>Перебивка: <t color='#c20c15'>$%1</t></t>", [_price2] call RRPClient_util_numberText];
		};
		case "own":
		{
			_display = uiNamespace getVariable ["RRPDialogChopShop",displayNull];
			_vehicle = _display getVariable ["temp",objNull];
			call RRPClient_util_throwGarageSlots;
			if (RRPClientAtmWaitingResponse) throw "Ожидаем обработки...";
			if (isNull _vehicle) throw "Техника не определена!";
			if (["B_mas_HMMWV",(typeOf _vehicle)] call BIS_fnc_inString) throw "Перебивка военной техники невозможна";
			if (typeOf _vehicle in (getArray(getMissionConfig "CfgChopShop" >> "chopBlacklist"))) throw "Ты знаешь, я даже за большие деньги не буду связываться с этой техникой. Могу только пустить на лом, чтобы побыстрее избавиться!";
			if !((allPlayers select {_x distance player < 1000 AND _x call getSide == "cop"}) isEqualTo []) throw "Дружище, у тебя копы на хвосте! Избавься от них, иначе я не успею перебить номера на движке!";
			if (!isNil {_vehicle getVariable "adacAntiBreaking"}) throw "На данной технике установлен комплект улучшений ""антиперебивка""";

			private ["_chopCondition","_chopEnabled"];
			_chopCondition = getText(missionConfigFile >> "LifeCfgVehicles" >> typeOf _vehicle >> "chopEnabled");
			_chopEnabled = if (_chopCondition isEqualTo "") then {true} else {[_chopCondition] call RRPClient_util_conditionsCheck};
			if !(_chopEnabled) throw "Вы не можете перебить данную техинку!";

			_basePrice = getNumber(missionConfigFile >> "LifeCfgVehicles" >> typeOf _vehicle >> "price");
			private _vehicleSide = _vehicle getVariable ["tf_side","sideUnknown"];
			if (_vehicleSide isEqualTo "west") then
			{
				_price = round (_basePrice * 5);
			} else {
				_price = round (_basePrice * (getNumber(getMissionConfig "CfgChopShop" >> "coefChop")));
			};
			_price = ['priceSell',_price] call RRPClient_system_VIP;
			private _upp = format["Перебиваем %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")];
			private _cP = 0;
			titleText[_upp,"PLAIN"];
			while{true} do
			{
				uiSleep 0.1;
				_cP = _cP + 0.003;
				[_cP,"criminal"] call RRPClient_system_progressBar;
				if(_cP >= 1 OR {(call RRPClient_system_isInterrupted)} OR {speed _vehicle >= 5} OR {!(crew _vehicle isEqualTo [])} OR {!(isNull objectParent player)} OR {life_interrupted} OR {(player distance2D _myPos > 10)}) exitWith {};
			};
			["life_progress"] call RRPClient_gui_DestroyRscLayer;
			if (life_interrupted OR {!(isNull objectParent player)} OR {player distance2D _myPos > 10}) then
			{
				life_interrupted = false;
				throw ( "Действие отменено");
			};
			if (RRPClientCashMoney < _price) throw "У вас недостаточно наличности, необходимой для перебивки номеров этого транспорта";
			closeDialog 0;
			RRPClientAtmWaitingResponse = true;
			["chopAction",["own",netId _vehicle,_price]] call RRPClient_system_send;
			throw "Спрашиваем сервер...";
		};
		case "sell":
		{
			if (RRPClientAtmWaitingResponse) throw "Ожидаем обработки предыдущей транзакции...";
			if !((allPlayers select {_x distance player < 1000 AND _x call getSide == "cop"}) isEqualTo []) throw "Дружище, у тебя копы на хвосте! Избавься от них, иначе я не успею продать машину!";
			_display = uiNamespace getVariable ["RRPDialogChopShop",displayNull];
			_vehicle = _display getVariable ["temp",objNull];
			if (typeOf _vehicle in (getArray(getMissionConfig "CfgChopShop" >> "sellBlacklist"))) throw "Не могу купить эту технику...";
			if (isNull _vehicle) throw "Техника не определена!";
			if ((_vehicle getVariable ["tf_side","sideUnknown"]) isEqualTo "east") throw "Нельзя продавать технику МЧС";
			_basePrice = getNumber(missionConfigFile >> "LifeCfgVehicles" >> typeOf _vehicle >> "price");
			if (_basePrice <= 0) throw "У техники нет стоимости и серийного номера. Ее нельзя перебить или продать.";

			private ["_sellCondition","_sellEnabled"];
			_sellCondition = getText(missionConfigFile >> "LifeCfgVehicles" >> typeOf _vehicle >> "sellEnabled");
			_sellEnabled = if (_sellCondition isEqualTo "") then {true} else {[_sellCondition] call RRPClient_util_conditionsCheck};
			if !(_sellEnabled) throw "Вы не можете продать данную техинку!";


			_price = round (_basePrice * getNumber(getMissionConfig "CfgChopShop" >> "coefSell"));
			closeDialog 0;
			RRPClientAtmWaitingResponse = true;
			["chopAction",["sell",netId _vehicle,_price]] call RRPClient_system_send;
			throw "Спрашиваем сервер...";
		};
		case "response":
		{
			RRPClientAtmWaitingResponse = false;
			["SuccessTitleOnly", [_this#1]] call SmartClient_gui_toaster_addTemplateToast;
		};
		default {throw "Whoops"};
	};
}catch{
	["WarningTitleOnly", [_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true
