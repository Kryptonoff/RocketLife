
private _t = _this select 0;
try
{
	switch (_t) do
	{
		case "openMenu":
		{
			private ["_object","_update","_display","_id","_name","_ownComp","_sbank","_sbLim","_currency","_payedUntil"];
			_object = param [1,objNull];
			_update = param [2,false];
			if (isNull _object) exitWith {systemChat "Object undefined, try again"};
			if !(_update) then {createDialog "RRPDialogCasinoAdmin"};
			_display = uiNamespace getVariable ["RRPDialogCasinoAdmin",displayNull];
			_display setVariable ["SlotObject",_object];
			_id = _object getVariable ["ltdID",-1];
			(_display displayCtrl 22996) ctrlSetText ((_object getVariable ["ltdSBLim",0]) call RRPClient_util_exponentToString);
			(_display displayCtrl 22998) ctrlSetText (_object getVariable ["ltdName","UNDEFINED"]);
			ctrlEnable [22988,false];
			ctrlEnable [22989,false];
			while {true} do
			{
				_name = _object getVariable ["ltdName","UNDEFINED"];
				_ownComp = (missionNamespace getVariable [format ["ltdData_%1",_object getVariable ["ltdOwner",-1]],[]]) select 1;
				_sbank = _object getVariable ["ltdSBank",0];
				_sbLim = _object getVariable ["ltdSBLim",0];
				_currency = toUpper(_object getVariable ["ltdCurrency","AD"]);
				_payedUntil = _object getVariable ["ltdPayedUntil","UNKNOWN DATE"];
				_text = _display displayCtrl 22990;
				_text ctrlSetStructuredText parseText (format [
				"<t size='0.9'>" + 
				"Название: " + "<t color='#3f6b00'>%2</t><br/>" + 
				"Компания: " + "<t color='#3f6b00'>%3</t><br/>" + 
				"На счету: " + "<t color='#3f6b00'>$%4</t><br/>" + 
				"Лимит: " + "<t color='#3f6b00'>$%5</t><br/>" + 
				"Оплачен до: " + "<t color='#3f6b00'>%7</t>",
					_id,
					_name,
					_ownComp,
					[_sbank] call RRPClient_util_numberText,
					[_sbLim] call RRPClient_util_numberText,
					_currency,
					_payedUntil
				]);
				uiSleep 1;
			};
		};
		case "setLimit": {
			private _display = uiNamespace getVariable ["RRPDialogCasinoAdmin",displayNull];
			private _object = _display getVariable ["SlotObject",objNull];
			if (isNull _object) throw "Объект не определен!"; 
			private _ownComp = (missionNamespace getVariable [format ["ltdData_%1",_object getVariable ["ltdOwner",-1]],[]]) select 0;
			if (getPlayerUID player != _ownComp) throw "У вас нет разрешения на это действие!";
			private _ne = _display displayCtrl 22996;
			if !([ctrlText _ne] call RRPClient_system_isNumber) throw "Должны быть только цифры!";
			_newLimit = parseNumber(ctrlText _ne);
			if (_newLimit <= 0) throw "Лимит не может быть равен или быть меньше 0!";
			_limits = getArray(getMissionConfig "CfgLtdSlots" >> "limit");
			if (_newLimit < _limits#0 or _newLimit > _limits#1) throw format ["Лимит не может быть меньше %1 и не более чем %2",[_limits#0] call RRPClient_util_numberText,[_limits#1] call RRPClient_util_numberText];
			if ((_object getVariable ["ltdID",-1]) isEqualTo -1) throw "Ошибка 804";
			["updBankLim",[_object,_newLimit],netId player] remoteExecCall ["RRPServer_ltd_slots_updateRequest",2];
		};
		case "setName": {
			private _display = uiNamespace getVariable ["RRPDialogCasinoAdmin",displayNull];
			private _object = _display getVariable ["SlotObject",objNull];
			if (isNull _object) throw "Объект не определен!"; 
			private _ownComp = (missionNamespace getVariable [format ["ltdData_%1",_object getVariable ["ltdOwner",-1]],[]]) select 0;
			if (getPlayerUID player != _ownComp) throw "У вас нет разрешения на это действие!";
			private _ne = _display displayCtrl 22998;
			_newName = ctrlText _ne;
			if (_newName isEqualTo "") throw "Название не может быть пустым";
			private _c = count (toArray _newName);
			if (_c <= 3 or _c >= 12) throw "Название должно быть не менее чем 3 и не более 12 символов";
			if ((_object getVariable ["ltdID",-1]) isEqualTo -1) throw "Ошибка 804";
			["updName",[_object,_newName],netId player] remoteExecCall ["RRPServer_ltd_slots_updateRequest",2];
		};
		case "takeBank": {
			private _display = uiNamespace getVariable ["RRPDialogCasinoAdmin",displayNull];
			private _object = _display getVariable ["SlotObject",objNull];
			if (isNull _object) throw "Объект не определен!"; 
			private _ownComp = (missionNamespace getVariable [format ["ltdData_%1",_object getVariable ["ltdOwner",-1]],[]]) select 0;
			if (getPlayerUID player != _ownComp) throw "У вас нет разрешения на это действие!";
			private _ne = _display displayCtrl 22993;
			if !([ctrlText _ne] call RRPClient_system_isNumber) throw "Должны быть только цифры!";
			private _toTake = parseNumber(ctrlText _ne);
			if (_toTake <= 0) throw "Нельзя снять 0 и меньше!";
			private _sbank = _object getVariable ["ltdSBank",0];
			private _slim = _object getVariable ["ltdSBLim",0];
			if ((_sbank - _toTake) <= 0) throw "В автомате нет столько средств!";			
			["updBank",["take",_object,_toTake],netId player] remoteExecCall ["RRPServer_ltd_slots_updateRequest",2];
		};
		case "addBank": {
			private _display = uiNamespace getVariable ["RRPDialogCasinoAdmin",displayNull];
			private _object = _display getVariable ["SlotObject",objNull];
			if (isNull _object) throw "Объект не определен!"; 
			private _sbank = _object getVariable ["ltdSBank",0];
			private _slim = _object getVariable ["ltdSBLim",0];
			private _ne = _display displayCtrl 22993;
			if !([ctrlText _ne] call RRPClient_system_isNumber) throw "Должны быть только цифры!";
			private _toAdd = parseNumber(ctrlText _ne);
			if (_toAdd <= 0) throw "Нельзя добавть 0 и меньше!";
			if ((_sbank + _toAdd) >= _slim) throw "Невозможно добавить сверх лимита";
			["updBank",["add",_object,_toAdd],netId player] remoteExecCall ["RRPServer_ltd_slots_updateRequest",2];
		};
		case "pay": {
			throw "Недоступно";
		};
	};
}catch{
	["ErrorTitleOnly",[_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
