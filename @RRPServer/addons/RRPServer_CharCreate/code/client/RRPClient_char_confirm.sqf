

private _checkNameInput = {
	private _text = _this;
	forceUnicode 0;
	private _alph = getText(_config >> "AllowedNameSurChars");
	private _index = [_text,_alph] call RRPClient_util_containsForbiddenCharacter;
	if !(_index isEqualTo -1) throw "Ошибка в написании имени/фамилии, допустимо использовать только латиницу!";
	private _nums = getArray(_config >> "MaxMinChars");
	private _countString = count _text;
	if (_nums#0 > _countString || _nums#1 < _countString) throw format ["Величина имени/фамилии должна быть от %1 до %2 символов",_nums#0,_nums#1];
};

private _checkNickNameInput= {
	private _text = _this;
	forceUnicode 0;
	private _alph = getText(_config >> "AllowedNicknameChars");
	private _index = [_text,_alph] call RRPClient_util_containsForbiddenCharacter;
	if !(_index isEqualTo -1) throw "Ошибка в написании псевдонима, допустимо использовать только латиницу и кириллицу!";
	private _nums = getArray(_config >> "MaxMinNickChars");
	private _countString = count _text;
	if (_nums#0 > _countString || _nums#1 < _countString) throw format ["Величина псевдонима должна быть от %1 до %2 символов",_nums#0,_nums#1];
};

try{
	if (RRPClientAtmWaitingResponse) throw "Предыдущий запрос еще не был обработан...";
	_config = missionConfigFile >> "CfgCharCreate";
	private _display = uiNamespace getVariable ["RRPDialogCharCreate",displayNull];
	private _group = _display displayCtrl 26100;
	private _nameEdit = _group controlsGroupCtrl 26105;
	private _surNameEdit = _group controlsGroupCtrl 26107;
	private _ageCombo = _group controlsGroupCtrl 26110;
	private _nickNameEdit = _group controlsGroupCtrl 26112;
	private _codeEdit = _group controlsGroupCtrl 26115;

	if ((ctrlText _surNameEdit) isEqualTo (ctrlText _nameEdit)) throw "Имя и фамилия не могут быть одинаковыми!";

	(ctrlText _nameEdit) 		call _checkNameInput;
	(ctrlText _surNameEdit) 	call _checkNameInput;
	(ctrlText _nickNameEdit) 	call _checkNickNameInput;

	if !([ctrlText _codeEdit] call RRPClient_system_isnumber) throw "Код состоит только из цифр!";
	if (parseNumber(ctrlText _codeEdit) isEqualTo (call RRPClientPlayerID)) throw "Код не определен, попробуйте другой!";

	[
		_display,
		{
			params ["_name","_surName","_nickName","_code","_age","_spec","_face","_acc"];
			comment "disableUserInput";
			[
				player, 
				profileName,
				_name,_surName,_nickName,_code,_age,_spec,_face,_acc
			] remoteExecCall ["RRPServer_char_requestRegister",2];
			["infoTitleAndText",["Создание персонажа","Отправляем запрос на сервер..."]] call toast;
			ctrlEnable [26103,false];
			RRPClientAtmWaitingResponse = true;
		},
		[
			(ctrlText _nameEdit),
			(ctrlText _surNameEdit),
			(ctrlText _nickNameEdit),
			ctrlText _codeEdit,
			_display getVariable ["age",21],
			_display getVariable ["spec",""],
			_display getVariable ["face",""],
			_display getVariable ["accessories",""]
		],
		"Все готово?",
		format ["Вы создаете персонажа с такими данными: <br/>Имя: %1 Фамилия: %2 Псевдоним: %3 Возраст: %4 <br/>Лицо: %5, Аксессуар: %6<br/>Все верно?",
			(ctrlText _nameEdit),
			(ctrlText _surNameEdit),
			(ctrlText _nickNameEdit),
			_display getVariable ["age",21],
			_display getVariable ["spec",""],
			_display getVariable ["face",""],
			_display getVariable ["accessories",""]
		]
		
	] call RRPClient_util_prompt;
}catch{
	["ErrorTitleAndText",["Создание персонажа", _exception]] call toast;
};
true
