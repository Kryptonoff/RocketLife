/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

if !(canSuspend) exitWith {_this spawn RRPClient_lottery_checklotteryinput};
private ["_type","_numbers","_editbox","_input","_amount","_charsamount","_number","_price","_code","_jackpot"];
_type = param [0, -1];
try
{
	
	private _amount = getNumber(getMissionConfig "CfgLottery" >> "amounts");
	private _maxNumbers = getNumber(getMissionConfig "CfgLottery" >> "maxNumber");
	private _price = getNumber(getMissionConfig "CfgLottery" >> "cost");
	if (SessionId isEqualTo "") throw "НЕТ НЕТ НЕТ! ID СЕССИИ ПУСТОЕ! ПОПРОБУЙТЕ ПЕРЕЗАЙТИ";
	if(_type isEqualTo -1) throw "Неверные данные!";
	if(_type isEqualTo 0) exitWith
	{
		private ["_display","_text","_textPosition","_numbers","_enumber","_lotterynumbers","_lotteryCode"];
		disableSerialization;
		createDialog "RRPDialogLottery";
		_display = uiNamespace getVariable ["RRPDialogLottery",displayNull];
		{
			[_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
			[_display, _x, ctrlPosition _x, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;
		}forEach allControls _display;
		_numbers = [];
		for "_i" from 1 to _maxNumbers do {
			_enumber = str _i;
			if((count _enumber) isEqualTo 1) then {
				_enumber = format["0%1",_i];
			};
			_numbers pushBack _enumber;
		};
		_lotterynumbers = [];
		for "_i" from 1 to _amount do {
			_lotterynumbers pushBack (selectRandom _numbers);
		};
		_lotteryCode = _lotterynumbers joinString "-";

		_text = _display displayCtrl 85552;
		_textPosition = ctrlPosition _text;
		_text ctrlSetStructuredText parseText (format [
		"<t size='0.95'>" +
		"<t size='2' align='center' font='gtav'>Лотерея 'Из грязи - в Князи!'</t><br/>"+
		"<t align='center' >Правила очень просты. Вы покупаете билет и ОБЯЗАТЕЛЬНО заполняете его в формате:</t><br/>"+
		"<t size='1.5' color='%1' align='center' >%1</t><br/>"+
		"<t align='center' >Стоимость билета составляет $%3</t><br/>"+
		"<t align='center' >Будьте внимательны при заполнении билета, иначе он может не сыграть</t><br/>"+
		"<t align='center' >Также следует знать, что в каждом блоке цифра не может превышать %2.</t><br/>"+
		"<t align='center' >Чем больше билетов Вы купите, тем больше шансов у Вас будет выиграть</t><br/>"+
		"<t align='center' >Чем больше билетов будет продано, тем больше будет джек-пот!</t><br/>"+
		"<t align='center' >Розыгрыш билетов проводится ежедневно в 17:00 в автоматическом режиме!</t><br/>" +
		"<t align='center' >В случае победы, Вам необходимо забрать свой выигрыш до того, как начнется следующий розыгрыш, в противном случае выигрыш будет аннулирован!</t><br/>" +
		"<t align='center' >К счастью, Вы всегда можете посмотреть результаты лотереи в <t color='#FFA500' href='https://lk.rocket-rp.fun/lottery'>Личном кабинете!</t></t><br/>" +
		"<t size='2' align='center' font='gtav'>Удачи!</t><br/>
		",_lotteryCode,_maxNumbers,_price]);

		_textPosition set [3,((ctrlTextHeight _text) + (0.005 * safezoneH))];
		_text ctrlSetPosition _textPosition;
		_text ctrlCommit 0.5;

		ctrlSetText[85553,_lotteryCode];
	};
	if(_type isEqualTo 2) exitWith {
		disableSerialization;
		_editbox = (findDisplay 85550) displayCtrl 85553;
		_input = ctrlText _editbox;
		_numbers = [];
		for "_i" from 1 to _maxNumbers do {
			_enumber = str _i;
			if((count _enumber) isEqualTo 1) then {
				_enumber = format["0%1",_i];
			};
			_numbers pushBack _enumber;
		};
		_charsamount = (_amount *2) + (_amount -1);
		if(!((count _input) isEqualto _charsamount)) throw format["Вы не выбрали %1 число или неправильно заполнили билет!",_amount];
		for "_i" from 0 to (_amount -1) do {
			_number = _input select [_i*3,2];
			if(!(_number in _numbers)) throw format ["Ваше число %1 недопустимо, так как оно не находится между %2 и %3.",_i+1,_numbers select 0, _numbers select ((count _numbers)-1)];
		};
		_price = getNumber(getMissionConfig "CfgLottery" >> "cost");
		if(RRPClientCashMoney < _price) throw format["Недостаточно средств для покупки. Стоимость билета составляет $%1",[_price] call RRPClient_util_numberText];
		[[player,"cash","take",_price],"system_moneyChange"] call RRPClient_system_hcExec;

		[0,SessionId,_input] remoteExec ["RRPServer_lottery_action",2];
		["lottery",1] call RRPClient_ach_gateway;
		closeDialog 0;
		["InfoTitleOnly",["Вы приобрели лотерейный билет! Ожидайте начало розыгрыша!"]] call SmartClient_gui_toaster_addTemplateToast;
	};
	if(_type isEqualTo 3) exitWith { 
		if !(isNil "RRPClientLotteryChecked") throw "Вы уже проверяли результаты!";
		RRPClientLotteryChecked = true;
		["InfoTitleOnly",["Проверяем Ваш билет..."]] call SmartClient_gui_toaster_addTemplateToast;
		[1,SessionId] remoteExec ["RRPServer_lottery_action",2];
		life_lottery_timer = time;
	};
	if(_type isEqualTo 4) exitWith {
		_amount = param [1, 0];
		if(_amount isEqualTo 0) throw "К сожалению, вы ничего не выиграли!";
		uiSleep 4;
		["InfoTitleOnly",["Поздравляем с выиграшем! Ожидайте выплату..."]] call SmartClient_gui_toaster_addTemplateToast;
		uiSleep 4;
		[[player,"cash","add",_amount],"system_moneyChange"] call RRPClient_system_hcExec;
		["LotBot",format ["%1 (%2) забрал лотерейный выигрыш на сумму %3",name player,getPlayerUID player,[_amount] call RRPClient_util_numberText]] remoteExecCall ["RRPServer_discord_sendMessage",2];
		["SuccessTitleOnly",[format["Выплата произведена! Вы выиграли $%1!",[_amount] call RRPClient_util_numberText]]] call SmartClient_gui_toaster_addTemplateToast;
	};
}catch{
	["ErrorTitleOnly",[_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
