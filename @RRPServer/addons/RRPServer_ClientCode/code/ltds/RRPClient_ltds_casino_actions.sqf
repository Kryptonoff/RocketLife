
#define DISPLAY (uiNamespace getVariable ["RRPDialogBusiness",displayNull])
#define PAGESTOREIDC(x) (DISPLAY displayCtrl 1039) controlsGroupCtrl x
#define SELECTEDCASINO ((uiNamespace getVariable ["RRPDialogBusiness",displayNull]) getVariable ["selectedCasino",objNull])
#define CONFIGCASINO(x) 	_config = getMissionConfig "CfgLtds" >> "stores" >> vehicleVarName x;

private _mode = param [0,"",[""]];
private _display = uiNamespace getVariable ["RRPDialogBusiness",displayNull];
try
{
	_pageCasino = _display displayCtrl 1039;
	_casino = _display getVariable ["selectedCasino",objNull];
	if (isNull _casino) throw "Автомат не определен!";
	_config = getMissionConfig "CfgLtds" >> "casino" >> vehicleVarName _casino;
	switch _mode do
	{
		case "pay": {
			if (RRPClientCredits < getNumber(_config >> "rentCost")) throw (format ["У вас недостаточно средств! Стоимость оплаты %1 RC",getNumber(_config >> "costUpgrade")]);
			[
				DISPLAY,
				{
					CONFIGCASINO(SELECTEDCASINO);
					["pay",SELECTEDCASINO,[player,getNumber(_config >> "rentCost")]] remoteExecCall ["RRPServer_ltds_casino_actions",2];
				},[],
				"Оплатить автомат?",
				format ["Стоимость оплаты автомата %2 составляет %1 RC", getNumber(_config >> "rentCost"), _casino getVariable ["ltdName","UNDEFINED"]]
			] call RRPClient_util_prompt;
		};
		case "applySkin":
		{
			
		};
		case "lockUnlock": 
		{
			
		};
		case "withdraw": {

		};
		case "deposit": {
			
		};
		case "rename": {
			
		};
		case "setLimit": {

		};
		case "remove": {

		};
		default {};
	};
}catch{
	["ErrorTitleAndText",["Управление бизнесом",_exception]] call SmartClient_gui_toaster_addTemplateToast;	
};
true
