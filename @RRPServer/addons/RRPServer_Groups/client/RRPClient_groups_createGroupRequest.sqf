
try{
	private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
	if (isNull _display) throw "Что то пошло не так...";

	if ((count RRPClientGroupInfo) isNotEqualTo 0) throw "Вы уже состоите в организации, вам нужно ее сначала покинуть";
	private _cost = getNumber(getMissionConfig "CfgGroups" >> "createGroupCost");
	if (_cost > RRPClientAtmMoney) throw "У вас недостаточно средств";
	
	private _mainGroup = _display displayCtrl 24001;
	private _slide = _mainGroup controlsGroupCtrl 37500;
	private _nameCtrl = _slide controlsGroupCtrl 37503;
	
	private _name = ctrlText _nameCtrl;
	if (_name isEqualTo "") throw "Введите название организации";
	if (count (toArray _name) < 4) throw "Название организации должно быть не менее 4 символов";
	if (count (toArray _name) > 20) throw "Название организации не должно превышать 20 символов";

	private _allowedChars = getText(getMissionConfig "CfgGroups" >> "allowAlphabet");
	_chars = [_name,_allowedChars] call RRPClient_util_containsForbiddenCharacter;
	if!(_chars isEqualTo -1) throw format ["Символ '%1' нельзя использовать!",_chars];

	[player, _name] remoteExecCall ["RRPServer_groups_createGroup",2];

}catch{
	["Регистратор", _exception] call toastError;
};
true
