/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_display"];
if !(createDialog "RRPDialogRewards") exitWith {};
_display = uiNamespace getVariable ["RRPDialogRewards",displayNull];
if (isNull _display) exitWith {};

{
	[_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
	[_display, _x, ctrlPosition _x, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;
}forEach (allControls _display);

_inform = _display displayCtrl 25008;
_inform ctrlSetStructuredText (parseText (format [
"
	<t size='0.95' align='center'><br/>
	Приветствуем Вас %1 в ежегодной Новогодней лотерее! <br/>
	В течении 24 часов, с момента последнего открытия карточки и до 14 января 2022 года включительно, вы сможете получать случайные подарки<br/>
	Получите эксклюзивные машины, уникальной модификации в уникальной раскраске которую можно получить только тут!<br/>
	И конечно же, деньги!<br/>
	Откройте случайную карту и посмотрите как повезло сегодня Вам!<br/>",player call getNickName]));

{
	private _ctrl = _display displayCtrl _x;
	_ctrl ctrlRemoveAllEventHandlers "MouseEnter";
	_ctrl ctrlRemoveAllEventHandlers "MouseExit";
	_ctrl ctrlSetText "rimas_agent\assets\loot\question_grey.paa";
	_ctrl ctrlAddEventHandler ["MouseEnter",{[_this select 0,1.1,0.1] call BIS_fnc_ctrlSetScale; (_this select 0) ctrlSetText "rimas_agent\assets\loot\question.paa";}];
	_ctrl ctrlAddEventHandler ["MouseExit",{[_this select 0,0.9,0.1] call BIS_fnc_ctrlSetScale; (_this select 0) ctrlSetText "rimas_agent\assets\loot\question_grey.paa";}];
}forEach [25002,25003,25004,25005,25006];
