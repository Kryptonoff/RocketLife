/*
	Project: Police Systems for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _display = uiNamespace getVariable ["RRPDialogPoliceDatabase",displayNull];
private _type = _this;
private _hintCtrl = _display displayCtrl 7713;
private _editBox = _display displayCtrl 7702;
private _editText = ctrlText 7702;
try
{
	if (_editText isEqualTo "") throw "Вы ничего не ввели!";
	switch (_type) do
	{
		case "id": 
		{
			_alph = getText(missionConfigFile >> "LifeCfgSettings" >> "allowNumber");
			_index = [_editText,_alph] call RRPClient_util_containsForbiddenCharacter;
			if !(_index isEqualTo -1) throw (format ["Нельзя использовать '%1'!",_index]);
		};
		case "name": {throw "Выберите игрока из списка!";};
		case "car": 
		{
			if !(count _editText isEqualTo 10) throw "Похоже, вы ввели неверный номер автомобиля!";
		};
	};
	_hintCtrl ctrlSetText "Данные отправлены на сервер, ожидайте...";
	_hintCtrl ctrlSetBackgroundColor [0.4,0.8,1,0.8];
	[_type,_editText] remoteExecCall ["RRPServer_police_searchData",2];
	RRPClientPoliceCurrentID = _editText;
}catch{
	_hintCtrl ctrlSetText _exception;
	_hintCtrl ctrlSetBackgroundColor [1,0,0,0.8];
};