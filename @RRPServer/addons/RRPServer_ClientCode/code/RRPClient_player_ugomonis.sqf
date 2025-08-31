
_target = param [0,objNull,[objNull]];
if (isNull _target) exitWith {};
["WarningTitleAndText", ["Внимание!","Администратор предупреждает вас о нарушении правил и просит прекратить их нарушать! Спасибо!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_target];