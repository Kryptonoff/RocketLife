
createDialog "RRPDialogOrgCreate";
private _display = uiNamespace getVariable ["RRPDialogOrgCreate",displayNull];
private _description = _display displayCtrl 25001;
private _cost = getText(getMissionConfig "CfgGroups" >> "createGroupCost");
_description ctrlSetStructuredText parseText (format ["<t align='center'>Тут скоро будет описание. Цена: %1</t>",_cost]);