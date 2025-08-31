

if !(canSuspend) exitWith {_this spawn RRPClient_atm_actions};
private ["_mode","_parameters"];
_mode = param [0,"",[""]];
_parameters = param [1,[],[[]]];
try
{
	if !(isNull (objectParent player)) throw "Вам нужно выйти из машины";
	if (player getVariable ["restrained",false]) throw "У вас руки связаны";
	if (player getVariable ["surrender",false]) throw "Опустите руки";
	if (player getVariable ["isBlind",false]) throw "Вы ничего не видите";
	if (player getVariable ["knoked",false]) throw "Вы не в состоянии";
	if (player getVariable ["tazed",false]) throw "Вы в шоке!";

	switch (_mode) do
	{
		case "openMenu": {
			if (!life_use_atm) throw "После ограбления вы не можете использовать банкомат в течении 10 минут.";
			if (life_jail_coin  > 0) throw "У Вас есть долг перед государством, ваш счет временно заморожен в банке до окончания исправительных работ!";
			if (time - life_atm_timer < 3) throw "Прошлая транзакция еще не завершена, подождите пару секунд!";
			if ((curTarget getVariable ['ATMRob', 'Work']) isNotEqualto 'Work') throw "Банкомат ограбили, он не работает!";

			createDialog "RRPDialogATM";
			private _display = uiNamespace getVariable ["RRPDialogATM",displayNull];
			{
				[_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
				[_display, _x, ctrlPosition _x, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;
			}forEach (allControls _display);
			_units = _display displayCtrl 2710;
			_text = _display displayCtrl 2706;
			if (count RRPClientGroupInfo isEqualTo 0) then 
			{
				_text ctrlSetStructuredText parseText format[
					"<t size ='1.1'>"+
					"<img size='1.5' image='\rimas_pack\icons\bank.paa'/> $%1<br/>"+
					"<img size='1.5' image='\rimas_pack\icons\cash.paa'/> $%2<br/>"+
					"<t align='right'><img size='1.5' image='\rimas_pad\icons\icon-money-dcash.paa'/> $%3</t>"+
					"</t>",
					[RRPClientAtmMoney] call RRPClient_util_numberText,
					[RRPClientCashMoney] call RRPClient_util_numberText,
					[RRPClientCashMoneyD] call RRPClient_util_numberText
				];
			}else{
				_text ctrlSetStructuredText parseText format[
					"<t size ='1.1'>"+
					"<img size='1.5' image='\rimas_pack\icons\bank.paa'/> $%1 <t align='right'><img size='1.5' image='\rimas_pad\icons\icon-money-dcash.paa'/> $%3</t><br/>"+
					"<img size='1.5' image='\rimas_pack\icons\cash.paa'/> $%2 <t align='right'><img size='1.5' image='\rimas_pad\icons\icon-gang.paa'/> $%4</t><br/>"+
					"</t>",
					[RRPClientAtmMoney] call RRPClient_util_numberText,
					[RRPClientCashMoney] call RRPClient_util_numberText,
					[RRPClientCashMoneyD] call RRPClient_util_numberText,
					[RRPClientGroupInfo get "bank"] call RRPClient_util_numberText
				];
			};
			lbClear _units;
			{
				if (alive _x && {_x getVariable ["lifeState",""] isEqualTo "HEALTHY"} && {_x != player} && {_x getVariable ["nickname",""] != ""}) then 
				{
					_index = _units lbAdd format["%1",_x call getNickName];
					_units lbSetColor [_index,[0.902,0.553,1,1]];
					_units lbSetData [_index,netId _x];
				};
			}forEach allPlayers;
			lbSort [_units,"ASC"];
			
			if (count RRPClientGroupInfo isEqualTo 0) then 
			{
				(_display displayCtrl 2713) ctrlEnable false;
				(_display displayCtrl 2715) ctrlEnable false;
			} else {
				(_display displayCtrl 2713) ctrlEnable true;
				(_display displayCtrl 2715) ctrlEnable true;
			};
		};
		case "deposit": {
			_value = ctrlText 2709;
			if (RRPClientAtmWaitingResponse) throw "Предыдущая транзакция еще не была обработана!";
			if !([_value] call RRPClient_system_isnumber) throw "Некорректный ввод. Введите сумму.";
			_value = parseNumber(_value);
			if (_value <= 0) throw "Укажите положительное значение";
			if (_value > RRPClientCashMoney) throw "У вас недостаточно наличности.";
			RRPClientAtmWaitingResponse = true;
			["bankActions",["deposit",[_value]]] call RRPClient_system_send;
		};
		case "withdraw": {
			_value = ctrlText 2709;
			if (RRPClientAtmWaitingResponse) throw "Предыдущая транзакция еще не была обработана!";
			if !([_value] call RRPClient_system_isnumber) throw "Некорректный ввод. Введите сумму.";
			_val = parseNumber (_value);
			if (_val <= 0) throw "Укажите положительное значение";
			if (_val > RRPClientAtmMoney) throw "У вас нет такой суммы на вашем счёте!";
			RRPClientAtmWaitingResponse = true;
			["bankActions",["withdraw",[_val]]] call RRPClient_system_send;
		};
		case "transfer": {
			private _unit = objectFromnetId (lbData[2710,lbCurSel 2710]);
			private _val = ctrlText 2711;
			if (RRPClientAtmWaitingResponse) throw "Предыдущая транзакция еще не была обработана!";
			if (isNil "_unit") throw "Такой игрок, кажется, не существует?";
			if (isNull _unit) throw "Такой игрок, кажется, не существует?";
			if ((lbCurSel 2710) isEqualTo -1) throw "Необходимо выбрать имя получателя";
			if !([_val] call RRPClient_system_isnumber) throw "Некорректный ввод. Введите сумму.";
			_val = parseNumber _val;
			if (_val < 1000) throw "Минимальная сумма для перевода состовляет $1000";
			if (_val > RRPClientAtmMoney) throw "Недостаточно денег";
			if (_unit getVariable ["nickname",""] isEqualTo "") throw "Не удается определить имя получателя.";
			private _tax = round(_val * 0.05);
			private _sum = _val + _tax;
			if (_sum > RRPClientAtmMoney) throw format["У вас не хватает денег на счету. Для перевода $%1 вам необходимо оплатить налог $%2.",_val,_tax];
			[
				(uiNamespace getVariable ["RRPDialogATM",displayNull]),
				{
					RRPClientAtmWaitingResponse = true;
					["bankActions",["transfer",[_val,_tax,netId _unit]]] call RRPClient_system_send;
				},[],
				"Перевести деньги?",
				format["Вы хотите перевести $%2 %1, комиссия составит $%3?",_unit call getNickName,[_val] call RRPClient_util_numberText,[_tax] call RRPClient_util_numberText]
			] call RRPClient_util_prompt;
		};
		case "orgDeposit": {
			if (RRPClientAtmWaitingResponse) throw "Предыдущая транзакция еще не была обработана!";
			if !("deposit" call RRPClient_groups_util_permCheck) throw "У вас нет на это разрешения!";
			private _scalar = ctrlText 2709;
			if !([_scalar] call RRPClient_system_isNumber) throw "Вы должны ввести только цифры!";
			_scalar = parseNumber _scalar;
			_min = getNumber(getMissionConfig "CfgGroups" >> "minimumDepositToBank");
			if (_scalar < _min) throw format["Минимальная сумма для вноса на счет организации: $%1",[_min] call RRPClient_util_numberText];
			if (_scalar > RRPClientAtmMoney) throw "Недостаточно денег";
			if (_scalar <= 0) throw "Число не может быть отрицательным или нулем!";
			_tax = getNumber(getMissionConfig "CfgGroups" >> "taxToDeposit") / 100;
			_sum = round (_scalar + (_scalar * _tax));
			private _limit = getNumber(missionConfigFile >> "CfgGroups" >> "limitDeposit");
			if (_limit < ((RRPClientGroupInfo get "bank") + _scalar)) throw format ["Банк организации имеет ограничение в $%1",[_limit] call RRPClient_util_numberText];
			if (_sum > RRPClientAtmMoney) throw format["У вас недостаточно денег на счету для оплаты налога в %1%2",getNumber(getMissionConfig "CfgGroups" >> "taxToDeposit"),"%"];
			[
				(uiNamespace getVariable ["RRPDialogATM",displayNull]),
				{
					RRPClientAtmWaitingResponse = true;
					["updateGroupBank",[true,_scalar]] call RRPClient_system_send;
				},[],
				"Перевести в банк организации?",
				format["Вы переводите в счет организации '%1' $%2, комиссия $%3?",(RRPClientGroupInfo get "name"),[_scalar] call RRPClient_util_numberText,[_scalar * _tax] call RRPClient_util_numberText]
			] call RRPClient_util_prompt
		};
		case "orgWithdraw": {
			if (RRPClientAtmWaitingResponse) throw "Предыдущая транзакция еще не была обработана!";
			if !("withdraw" call RRPClient_groups_util_permCheck) throw "У вас нет на это разрешения!";
			private _scalar = ctrlText 2709;
			if !([_scalar] call RRPClient_system_isNumber) throw "Вы должны ввести только цифры!";
			_scalar = parseNumber _scalar;
			_min = getNumber(getMissionConfig "CfgGroups" >> "minimumDepositToBank");
			if (_scalar < _min) throw format["Минимальная сумма для cнятия со счета организации: $%1",[_min] call RRPClient_util_numberText];
			if (_scalar <= 0) throw "Число не может быть отрицательным или нулем!";
			if ((RRPClientGroupInfo get "bank") < _scalar) throw "В банке организации нет столько денег!";
			[
				(uiNamespace getVariable ["RRPDialogATM",displayNull]),
				{
					RRPClientAtmWaitingResponse = true;
					["updateGroupBank",[false,_scalar]] call RRPClient_system_send;
				},[],
				"Снять со счета организации?",
				format["Вы хотите снять $%2 со счета организации '%1'",(RRPClientGroupInfo get "name"),[_scalar] call RRPClient_util_numberText]
			] call RRPClient_util_prompt
		};
		case "response": {
			_parameters params ["_responseText",["_params",[],[[]]]];
			_params params [["_sound","money_out"]];
			playSound _sound;
			RRPClientAtmWaitingResponse = false;
			["InfoTitleAndText",["ATM",_responseText]] call SmartClient_gui_toaster_addTemplateToast;
			if (isNull (uiNamespace getVariable ["RRPDialogATM",displayNull])) exitWith {};
			private _display = uiNamespace getVariable ["RRPDialogATM",displayNull];
			_text = _display displayCtrl 2706;
			if (count RRPClientGroupInfo isEqualTo 0) then 
			{
				_text ctrlSetStructuredText parseText format[
					"<t size ='1.1'>"+
					"<img size='1.5' image='\rimas_pack\icons\bank.paa'/> $%1<br/>"+
					"<img size='1.5' image='\rimas_pack\icons\cash.paa'/> $%2<br/>"+
					"<t align='right'><img size='1.5' image='\rimas_pad\icons\icon-money-dcash.paa'/> $%3</t>"+
					"</t>",
					[RRPClientAtmMoney] call RRPClient_util_numberText,
					[RRPClientCashMoney] call RRPClient_util_numberText,
					[RRPClientCashMoneyD] call RRPClient_util_numberText
				];
			}else{
				_text ctrlSetStructuredText parseText format[
					"<t size ='1.1'>"+
					"<img size='1.5' image='\rimas_pack\icons\bank.paa'/> $%1 <t align='right'><img size='1.5' image='\rimas_pad\icons\icon-money-dcash.paa'/> $%3</t><br/>"+
					"<img size='1.5' image='\rimas_pack\icons\cash.paa'/> $%2 <t align='right'><img size='1.5' image='\rimas_pad\icons\icon-gang.paa'/> $%4</t><br/>"+
					"</t>",
					[RRPClientAtmMoney] call RRPClient_util_numberText,
					[RRPClientCashMoney] call RRPClient_util_numberText,
					[RRPClientCashMoneyD] call RRPClient_util_numberText,
					[RRPClientGroupInfo get "bank"] call RRPClient_util_numberText
				];
			};
		};
		default {throw "Че за нах?"};
	};
}catch{
	playSound "bank_error";
	["ErrorTitleAndText",["ATM",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true
