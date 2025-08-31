


_checkPlate = {
	private _name1 = 		toUpper(ctrlText 27011);
	private _name2 = 		toUpper(ctrlText 27012);
	private _number1 = 		ctrlText 27013;
	private _number2 = 		ctrlText 27014;
	private _number3 = 		ctrlText 27015;
	private _number4 = 		ctrlText 27016;
	private _name3 = 		toUpper(ctrlText 27017);
	private _name4 = 		toUpper(ctrlText 27018);

	if 	(
		_name1 isEqualTo "" || 
		{_name2 isEqualTo ""} || 
		{_number1 isEqualTo ""} || 
		{_number2 isEqualTo ""} || 
		{_number3 isEqualTo ""} || 
		{_number4 isEqualTo ""} ||
		{_name3 isEqualTo ""} || 
		{_name4 isEqualTo ""}) throw "Все поля должны быть заполнены!";
	_alphabet = "QWERTYUIOPASDFGHJKLZXCVBNM";
	_numbers = "0123456789";
	if 	(
		!(([_name1,_alphabet] call RRPClient_util_containsForbiddenCharacter) isEqualTo -1) ||
		{!(([_name2,_alphabet] call RRPClient_util_containsForbiddenCharacter) isEqualTo -1)} ||
		{!(([_name3,_alphabet] call RRPClient_util_containsForbiddenCharacter) isEqualTo -1)} ||
		{!(([_name4,_alphabet] call RRPClient_util_containsForbiddenCharacter) isEqualTo -1)}
	) throw "Ошибка в написании последнего блока, использоваться должны только латинские буквы!";
	if	(
		!(([_number1,_numbers] call RRPClient_util_containsForbiddenCharacter) isEqualTo -1) ||
		{!(([_number2,_numbers] call RRPClient_util_containsForbiddenCharacter) isEqualTo -1)} ||
		{!(([_number3,_numbers] call RRPClient_util_containsForbiddenCharacter) isEqualTo -1)} ||
		{!(([_number4,_numbers] call RRPClient_util_containsForbiddenCharacter) isEqualTo -1)}
	) throw "Ошибка в написании номера, использоваться должны только цифры!";
	private _new = format ["%1%2 %3%4%5%6 %7%8",_name1,_name2,_number1,_number2,_number3,_number4,_name3,_name4];
	format ["@: %1",_plate] call debugConsole;
	if (_new isEqualTo _plate) throw "Номер не отличается от существующего!";
	
	_new
};

try
{
	_display = uiNamespace getVariable ["RRPDialogGarage",displayNull];
	_key = _display getVariable ["value",-1];
	if (_key isEqualTo -1) exitWith {};
	_hash = _display getVariable "cache";
	private _values = _hash get _key;

	if (RRPClientAtmWaitingResponse) throw "Предыдущая транзакция еще не была обработана!";
	
	_cost = getNumber(getMissionConfig "LifeCfgGarages" >> "costPlate");
	if (RRPClientCredits < _cost) throw format ["Недостаточно средств, стоимость услуги %1 RC",_cost];

	_values params ["_classname","_color","_spname","_tuning_data","_insure","_baseprice","_material","_fuel","_parking","_plate","_distance","_damage","_filled"];
	
	_newPlate = call _checkPlate;
	[
		_display,
		{
			// TODO: Set new plate on server
			[_this,"garage_setPlate"] call RRPClient_system_hcExec;
			RRPClientAtmWaitingResponse = true;
		},
		[_key,_newPlate,_plate,_classname],
		"Установить новые номера?",
		format["Вы хотите установить номер '%1' на %2 это действие стоит %3 RC?",_newPlate, getText(configFile >> "CfgVehicles" >> _classname >> "displayName"),getNumber(getMissionConfig "LifeCfgGarages" >> "costPlate")]
	] call RRPClient_util_prompt;
}catch{
	["ErrorTitleAndText",["Гараж",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
