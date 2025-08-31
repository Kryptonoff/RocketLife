
private [
	"_description",
	"_fitText",
	"_key",
	"_display",
	"_hash",
	"_values"
];

_plateEdits = {
	disableSerialization;
	private _group = 		_display displayCtrl 27006;
	private _name1 = 		_group controlsGroupCtrl 27011;
	private _name2 = 		_group controlsGroupCtrl 27012;
	private _number1 = 		_group controlsGroupCtrl 27013;
	private _number2 = 		_group controlsGroupCtrl 27014;
	private _number3 = 		_group controlsGroupCtrl 27015;
	private _number4 = 		_group controlsGroupCtrl 27016;
	private _name3 = 		_group controlsGroupCtrl 27017;
	private _name4 = 		_group controlsGroupCtrl 27018;

	private _toArray = 		_plate splitString "";

	_name1 ctrlSetText 		(_toArray select 0);
	_name2 ctrlSetText 		(_toArray select 1);
	_number1 ctrlSetText 	(_toArray select 3);
	_number2 ctrlSetText 	(_toArray select 4);
	_number3 ctrlSetText 	(_toArray select 5);
	_number4 ctrlSetText 	(_toArray select 6);
	_name3 ctrlSetText 		(_toArray select 8);
	_name4 ctrlSetText 		(_toArray select 9);
};

_disableCtrls = {
	{
			_x ctrlEnable _this;
	}forEach ((allControls (_display displayCtrl 27006)) + [(_display displayCtrl 27024)]);
};

_description = {
	private _vehicleInfo = [_className] call RRPClient_util_fetchVehInfo;

	true call _disableCtrls;
	if (_insure isEqualTo 2 and {_parking isEqualTo []}) then
	{
		_retrieButton = _display displayCtrl 27009;
		_retrieButton ctrlSetText "Получить выплату";
		_retrieButton ctrlRemoveAllEventHandlers "ButtonClick";
		_retrieButton ctrlAddEventHandler ["ButtonClick","_this call RRPClient_system_insurancePay"];
		{
			_ctrl = _display displayCtrl _x;
			_ctrl ctrlEnable false;
		}forEach [27008,27010,27011,27012,27013,27014,27015,27016,27017,27018,27019,27024];
	}else{
		
		_retrieButton = _display displayCtrl 27009;
		_retrieButton ctrlSetText "Забрать транспорт";
		_retrieButton ctrlRemoveAllEventHandlers "ButtonClick";
		_retrieButton ctrlAddEventHandler ["ButtonClick","_this call RRPClient_garage_retrieve"];

		{
			_ctrl = _display displayCtrl _x;
			_ctrl ctrlEnable true;
		}forEach [27008,27010,27011,27012,27013,27014,27015,27016,27017,27018,27019,27024];
	};

	_parkingText = if (_parking isNotEqualTo []) then {
		false call _disableCtrls;
		format ["<br/><t size='1.2' color='#FF0000'>Техника на штрафстоянке!<br/>Сумма штрафа: <t align='right'>$%1</t><br/>Примечание: <t align='right'>%2</t></t>",[_parking select 0] call RRPClient_util_numberText,_parking select 1]
	}else{""};

	private _trunkSpace = getNumber(missionConfigFile >> "LifeCfgVehicles" >> _className >> "vItemSpace");
	private _vehicleColor = if (isClass (missionConfigFile >> "LifeCfgVehTextures" >> _color)) then {getText(missionConfigFile >> "LifeCfgVehTextures" >> _color >> "displayName")} else {"Стандарт"};
	private _vehicleMaterial = if (isClass (missionConfigFile >> "LifeCfgVehMaterials" >> _material)) then {getText(missionConfigFile >> "LifeCfgVehMaterials" >> _material >> "displayName")} else {"Стандарт"};

	private ["_sellPrice","_retrievePrice"];
	if (_basePrice isEqualTo 0) then {
		_sellPrice = 0;
		_retrievePrice = 0;
	} else {
		_sellPrice = round (_basePrice - (_basePrice*0.3));
		_retrievePrice = round (_basePrice * 0.02);
		if (["MatesRates"] call perk) then {_retrievePrice = round(_retrievePrice * 0.75)};
	};

	if (player call getSide in ["cop","med"] OR (_retrievePrice <= 0)) then {_retrievePrice = 500};
	
	_spName = getText(missionConfigFile >> "LifeCfgGarages" >> worldName >> _spName >> "displayName");
	private _group = _display displayCtrl 27020;
	_ctrl = _group controlsGroupCtrl 27023;

	_insureText = call {
		if (_insure isEqualTo 1) exitWith {"Есть"};
		if (_insure isEqualTo 2) exitWith {"Готова выплата"};
		"Отсутствует"
	};
	
	_ctrl ctrlSetStructuredText parseText format [
		"<br/>" + 
		"<t size='1.1' color='#FFFFFF' align='center'>%1</t><br/><br/>" +
		"<t size='0.9' color='#FFFFFF'>" + 
		"	Цена выдачи:" + " <t align='right'>$%2 </t><br/>" +
		"	Цена продажи:" + " <t align='right'>$%3 </t><br/><br/>" +
		"	Макс скорость:" + " <t align='right'>%4 км/ч </t><br/>" +
		"	Мощность (л/с)" + " <t align='right'>%5 </t><br/>" +
		"	Мест для пассажиров:" + " <t align='right'>%6 </t><br/>" +
		"	Вместимость багажника:" + " <t align='right'>%7 </t><br/>" +
		"	Заполненность багажника:" + " <t align='right'>%20%19 </t><br/>" +
		"	Объем бензобака:" + " <t align='right'>%8 </t><br/>" +
		"	Заполненость бака:" + " <t align='right'>%18%19 </t><br/>" +
		"	Топливо:" + " <t align='right'>%17 </t><br/>" +
		"	Цвет" + " <t align='right'>%9 </t><br/>" +
		"	Материал:" + " <t align='right'>%10 </t><br/>" +
		"	Номер:" + " <t align='right'>%15 </t><br/>" +
		"	Пробег:" + " <t align='right'>%16 км. </t><br/>" +
		"	Гараж:" + " <t align='right'>%11 </t><br/>" +
		"	Страховка:" + " <t align='right'>%14 </t><br/>" +
		"	Апгрейды:" + " <t align='right'>%13	</t><br/>" +
		"%12" +
		"<br/></t>",

		getText(configFile >> "CfgVehicles" >> _classname >> "displayName"),
		[_retrievePrice] call RRPClient_util_numberText,
		[_sellPrice] call RRPClient_util_numberText,
		_vehicleInfo select 8,
		_vehicleInfo select 11,
		_vehicleInfo select 10,
		_trunkSpace,
		_vehicleInfo select 12,
		_vehicleColor,
		_vehicleMaterial,
		_spName,
		_parkingText,
		if (_tuning_data isEqualTo []) then {"Отсутствуют"} else {"Есть"},
		_insureText,
		_plate,
		_distance,
		"Неизвестно",
		_fuel * 100,
		"%",
		_filled
	];
	call _plateEdits;
	call _fitText;
};

_fitText = {
	_textPosition = ctrlPosition _ctrl;
	_textPosition set [3,((ctrlTextHeight _ctrl) + (0.005 * safezoneH))];
	_ctrl ctrlSetPosition _textPosition;
	_ctrl ctrlCommit 0.1;
};

params ["_control","_index"];
try
{
	private _key = _control lbValue _index;
	if (_key isEqualTo 0) throw "Ошибка #0";
	private _display = ctrlParent _control;
	if (isNull _display) throw "Ошибка #1";
	private _hash = _display getVariable "cache";
	if (isNil "_hash") throw "Ошибка #2";
	private _values = _hash get _key;
	if (isNil "_values") throw "Ошибка #3";
	_values params ["_classname","_color","_spname","_tuning_data","_insure","_baseprice","_material","_fuel","_parking","_plate","_distance","_damage","_filled"];
	_display setVariable ["value",_key];
	_spname call debugConsole;
	call _description;
	[_display,_classname,_color,_material,_plate] call RRPClient_system_shopBoxUpdate;
}catch{
	["ErrorTitleAndText",["Гараж", _exception]] call SmartClient_gui_toast_addTemplateToast;
	closeDialog 0;
};
