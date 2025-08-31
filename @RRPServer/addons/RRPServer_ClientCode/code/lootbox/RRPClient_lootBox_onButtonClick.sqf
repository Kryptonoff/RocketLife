/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;
_display = uiNamespace getVariable ["RRPDialogRewards",displayNull];
try
{
	if (isNull _display) throw "Display NULL";
	 
	{
		private _ctrl = _display displayCtrl _x;
		if !(_ctrl isEqualTo (_this select 0)) then
		{
			_ctrl ctrlEnable false;
			_ctrl ctrlRemoveAllEventHandlers "MouseEnter";
			_ctrl ctrlRemoveAllEventHandlers "MouseExit";
		}else{_ctrl ctrlRemoveAllEventHandlers "MouseExit";[_this select 0,1.1,0.1] call BIS_fnc_ctrlSetScale;};
	}forEach [25002,25003,25004,25005,25006];
	if (!isNil "RRPClient_temp_haveGift") throw "Вы уже получили!";
	if (RRPClient_temp_waitGift) throw "Предыдущий еще не обработан!";
	RRPClient_temp_waitGift = true;
	RRPClent_temp_buttonLoot = _this;
	["InfoTitleOnly",["Крутим барабаны... Ожидайте!"]] call SmartClient_gui_toaster_addTemplateToast;
	[netId player] remoteExecCall ["RRPServer_lootBox_requestResult",2];
}catch{
	["ErrorTitleOnly",[_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
