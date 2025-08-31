/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_plate","_curPlate"];
disableSerialization;
private _dialog = 		uiNamespace getVariable ["RRPDialogChangePlate",displayNull];
private _name1 = 		ctrlText 7603;
private _name2 = 		ctrlText 7604;
private _number1 = 		ctrlText 7605;
private _number2 = 		ctrlText 7606;
private _number3 = 		ctrlText 7607;
private _number4 = 		ctrlText 7608;
private _name3 = 		toUpper(ctrlText 7609);
private _name4 = 		toUpper(ctrlText 7610);
try
{
	if (isNull RRPClientSelectedPlateVeh) throw "Машина не выбрана!";
	if 	(
		_name1 isEqualTo "" || 
		_name2 isEqualTo "" || 
		_number1 isEqualTo "" || 
		_number2 isEqualTo "" || 
		_number3 isEqualTo "" || 
		_number4 isEqualTo "" ||
		_name3 isEqualTo "" || 
		_name4 isEqualTo "") throw "Все поля должны быть заполнены!";
	_alphabet = "QWERTYUIOPASDFGHJKLZXCVBNM";
	_numbers = "0123456789";
	if 	(
		!([_name1,_alphabet] call RRPClient_util_containsForbiddenCharacter isEqualTo -1) ||
		!([_name2,_alphabet] call RRPClient_util_containsForbiddenCharacter isEqualTo -1) ||
		!([_name3,_alphabet] call RRPClient_util_containsForbiddenCharacter isEqualTo -1) ||
		!([_name4,_alphabet] call RRPClient_util_containsForbiddenCharacter isEqualTo -1)
	) throw "Ошибка в написании последнего блока, использоваться должны только латинские буквы!";
	if	(
		!([_number1,_numbers] call RRPClient_util_containsForbiddenCharacter isEqualTo -1) ||
		!([_number2,_numbers] call RRPClient_util_containsForbiddenCharacter isEqualTo -1) ||
		!([_number3,_numbers] call RRPClient_util_containsForbiddenCharacter isEqualTo -1) ||
		!([_number4,_numbers] call RRPClient_util_containsForbiddenCharacter isEqualTo -1)
	) throw "Ошибка в написании номера, использоваться должны только цифры!";

	if (RRPClientCredits > 990) throw "Недостаточно RCredits! Стоимость 990 RC!";
	_plate = format ["%1%2 %3%4%5%6 %7%8",_name1,_name2,_number1,_number2,_number3,_number4,_name3,_name4];
	_curPlate = RRPClientSelectedPlateVeh getVariable "dbInfo" select 1;
	_dialog setVariable ["temp",[_plate,_curPlate]];
	if (_curPlate isEqualTo _plate) throw "Номер не отличается от существующего!";

	[
		(uiNamespace getVariable ["RRPDialogChangePlate",displayNull]),
		{
			_temp = (uiNamespace getVariable ["RRPDialogChangePlate",displayNull]) getVariable ["temp",[]];
			[player,RRPClientSelectedPlateVeh,_temp#0,_temp#1] remoteExecCall ["RRPServer_plates_changePlate",2];
			["InfoTitleAndText", ["Спрашиваем...", "Запрос на сервер отправлен!"]] call SmartClient_gui_toaster_addTemplateToast;
		},[],
		"Изменить номера?",
		format ["Вы хотите изменить номерной знак на своем %1? Стоимость услуги составляет %2 RC",getText(configFile >> "CfgVehicles" >> typeOf RRPClientSelectedPlateVeh >> "displayName"),[990] call RRPClient_util_numberText]
	] call RRPClient_util_prompt;

	
}catch{
	["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
