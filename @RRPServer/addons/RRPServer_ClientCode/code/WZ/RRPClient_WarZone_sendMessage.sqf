/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

try
{
	disableSerialization;
	private _display = uiNamespace getVariable ["RRPDialogWarZone",displayNull];
	if ((time - RRPClientWarZoneChatCooldown) < (getNumber(getMissionConfig "CfgWarZone" >> "cooldownChat") * 60)) throw "Отправлять сообщение можно не чаще чем раз в 5 минут";
	private _zone = player call RRPClient_WarZone_util_getZoneInside;
	if (_zone isEqualTo []) throw "Нужно быть в зоне военных действий";
	private _box = _display displayCtrl 25012;
	if (ctrlText _box isEqualTo "") throw "Сообщение не должно быть пустым";
	if ( count (toArray (ctrlText _box)) > 30) throw "Можно отправить не более 30 символов за одно сообщение";
	[ctrlText _box,player] remoteExecCall ["RRPServer_WarZone_broadcastMessage",2];
	RRPClientWarZoneChatCooldown = time;
	_box ctrlSetText "";
}catch{
	["ErrorTitleAndText",["Военное положение",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true