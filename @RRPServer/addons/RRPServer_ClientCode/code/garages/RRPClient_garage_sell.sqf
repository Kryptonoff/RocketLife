
try
{
	_display = uiNamespace getVariable ["RRPDialogGarage",displayNull];
	_key = _display getVariable ["value",-1];
	if (_key isEqualTo -1) exitWith {};
	_hash = _display getVariable "cache";
	private _values = _hash get _key;

	if (RRPClientAtmWaitingResponse) throw "Предыдущая транзакция еще не была обработана!";
	
	_values params ["_classname","_color","_spname","_tuning_data","_insure","_baseprice","_material","_fuel","_parking","_plate","_distance","_damage","_filled"];
	if (_baseprice isEqualTo 0) throw "У техники нет стоимости покупки!";

	_price = round (_baseprice - (_baseprice * 0.3));

	[
		_display,
		{
			comment "TODO: Sell on server";
			params ["_key","_classname","_price"];
			[[
				_key,
				_classname,
				_price
			],"garage_sell"] call RRPClient_system_hcExec;
			RRPClientAtmWaitingResponse = true;
		},
		[_key, _classname, _price ],
		"Продать автомобиль?",
		format["Вы хотите продать %1 за $%2?",getText(configFile >> "CfgVehicles" >> _classname >> "displayName"),
			[_price] call RRPClient_util_numberText
		]
	] call RRPClient_util_prompt;
	
}catch{
	["ErrorTitleAndText",["Гараж",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
