
private["_gameStatusCode", "_buyInAmount", "_dialog", "_joinButton", "_canJoin", "_buyInValue", "_playerMoney", "_gameStatusValue"];

private _gameStatusCode = _this select 0;
createDialog "RRPDialogRouletteJoin";
private _display = uiNamespace getVariable ["RRPDialogRouletteJoin",displayNull];
private _joinButton = _display displayCtrl 24033;
private _rules = _display displayCtrl 24034;
_rules ctrlSetStructuredText (parseText "<t size='1.4' align='center'>Русская рулетка!</t><br/>Русская рулетка - экстремальная азартная игра или пари с летальным исходом.<br/>Усади своих друзей за один стол и продемонстрируй у кого  яйца побольше.<br/>Взносы делаются с вашего банковского счета!");
private _canJoin = true;
private _gameStatusValue = _display displayCtrl 24035;
switch (_gameStatusCode) do {
	case 0: 
	{ 
		_gameStatusValue ctrlSetStructuredText (parseText "<t size='1.4' align='center' color='#b2ec00'>Ожидаем игроков...</t>");
	};
	case 1: 
	{
		_gameStatusValue ctrlSetStructuredText (parseText "<t size='1.4' align='center' color='#ffca12'>Игра уже идет!</t>");
		_canJoin = false;
	};
	case 2: 
	{
		_gameStatusValue ctrlSetStructuredText (parseText "<t size='1.4' align='center' color='#ea0000'>Приходите после бури!</t>");
		_canJoin = false;
	};
};
_joinButton ctrlEnable _canJoin;

private _slider = _display displayCtrl 24031;
_slider ctrlEnable _canJoin;

_slider sliderSetRange [100, RRPClientAtmMoney];
_slider sliderSetSpeed [1,1];

_slider ctrlAddEventHandler ["SliderPosChanged",{
	params ["_control","_newValue"];
	_display = ctrlParent _control;
	private _betText = _display displayCtrl 24032;
	_betText ctrlSetStructuredText (parseText format["<t size='1.4' align='left' color='#b2ec00'>Ваш взнос:</t><t size='1.4' align='right' color='#b2ec00'>$%1</t>",[_newValue] call RRPClient_util_numberText]);
	_display setVariable ["bet",round _newValue];
}];
