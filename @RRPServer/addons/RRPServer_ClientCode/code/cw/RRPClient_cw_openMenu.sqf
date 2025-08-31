/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/
private ["_display","_str","_mod","_btnAction","_btn"];
_mod = _this;
try {
	if (!(alive player)) throw "";
	if (!(isPlayer curTarget)) throw "Это не игрок, попробуйте еще раз";
	if !(createDialog 'RRPDialogPunish') throw "Ошибка при открытии диалога";
	_display = uiNamespace getVariable ['RRPDialogPunish',displayNull];
	{
		[_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
		[_display, _x, ctrlPosition _x, 0, 0.4] call RRPClient_gui_util_animateAllCtrl;
	} forEach (allControls _display);

	_target = curTarget;

	_group = _display displayCtrl 25001;
	_str = _group controlsGroupCtrl 25002;
	_btn = _display displayCtrl 25005;
	_btnAction = if (_mod isEqualTo  "cw") then {"call RRPClient_cw_sendToWork"} else {"call RRPClient_system_arrestAction"};
	_btn buttonSetAction _btnAction;

	_str ctrlSetStructuredText parseText format ["<t align = 'left' size = '0.75' color = '#ffffff' >"+
	"Именем Закона республики Rocket, Я, <t color='#E4FF00'>%1</t>, приговариваю Вас, гражданин <t color='#00FF8A'>%2</t>, к наказанию в виде <t color='#FF0000'>%3</t> сроком на (срок лишения свободы месяцы=минуты/отработки) за следующие преступления:<br/>"+
	"(ВСЕ нарушения УК данного гражданина).<br/>"+
	"В ходе расследования были выявлены отягчающие/смягчающие обстоятельства, а именно - ... (пример: сотрудничество со следствием, отсутствие сопротивления при задержании) <br/>"+
	"Спросить: «Вам понятен приговор?» - <br/>"+
	"Спросить: «У Вас имеется последнее слово?».</t>", player call getFullName, _target call getFullName, if (_mod isEqualTo  "cw") then {"принудительных отработок"} else {"тюремного заключения"}];
	_hText = ctrlTextHeight _str;
	_str ctrlSetPositionH _hText;
	_str ctrlCommit 0;

} catch {
	["ErrorTitleAndText",["Ошибка",_exception]] call SmartClient_gui_toaster_addTemplateToast;
	closeDialog 0;
};
