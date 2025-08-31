

params [
	"_player", "_profileName","_name","_surName","_nickName",["_code",""],"_age","_spec","_face","_acc"
];

try
{
	if (isNull _player) throw "Юнит не определен";
	
	if !(_player getVariable ["haveAcc",false]) then 
	{
		private _checkName = format ["char_checkName:%1:%2",_name,_surName] call RRPServer_DB_selectSingleField;
		if (_checkName) throw "Такое имя уже занято!";
	};

	private _checkNickName = format ["char_checkNickName:%1",_nickName] call RRPServer_DB_selectSingleField;
	if (_checkNickName) throw "Такой псевдоним уже занят!";

	if (_code isNotEqualTo "") then {
		private _checkcode = format ["char_checkCode:%1",_code] call RRPServer_DB_selectSingleField;
		if (isNil "_checkcode") throw "Код не определен, попробуйте другой!";
		format ["char_insertCodePlayer:%1:%2",getPlayerUID _player,_code] call RRPServer_DB_fireAndForget;
	};

	format ["char_confirm:%1",getPlayerUID _player] call RRPServer_DB_fireAndForget;
	format ["char_setNewPlayer:%1:%2:%3:%4:%5:%6:%7:%8",_profileName,_name,_surName,_nickName,_age,_face,_acc,getPlayerUID _player] call RRPServer_DB_fireAndForget;
	_player setVariable ["name_surname",[_name,_surName],true];
	_player setVariable ["nickname",_nickName,true];
	_player setVariable ["age",_age,true];
	_player setVariable ["haveAcc",nil,true];
	[_spec,5] remoteExecCall ["RRPClient_skills_addLevelInstant",_player];
	
	[
		"UserRegistered","","","",false,
		[
			[
				format["Steam профиль: %1",_profileName],
				"",
				"https://steamcommunity.com/profiles/" + getPlayerUID _player,
				"#FBFF00",true,
				"","",[],[],
				[
					[
						"**Зарегистрирован новый игрок:**",
						[
							format ["**Имя профиля:** %1",_profileName],
							format ["**Имя:** %1",_name],
							format ["**Фамилия:** %1",_surName],
							format ["**Псевдоним:** %1",_nickName],
							format ["**Возраст:** %1",_age],
							format ["**Специализация:** %1",_spec],
							format ["**Акссессуар:** %1",_acc],
							format ["**Лицо:** %1",_face]
						] joinString "\n",
						true
					]
				]
			]
		]
	] call DiscordEmbedBuilder_fnc_buildSqf;

	[true,"Ваш персонаж успешно создан! Приятной игры!"] remoteExecCall ["RRPClient_char_confirmResponse",_player]; 
	[
		"Загрузка...",
		"Загрузка...",
		[1,1,1,1],
		"rimas_agent\texture\mod\icon.paa",
		{life_loading_completed || {!isNull (uiNamespace getVariable ["RRPDialogCharCreate",displayNull])}},
		{},
		[],
		9999
	] remoteExec ["RRPClient_gui_createLoadingScreen",_player];
}catch{
	[false,_exception] remoteExecCall ["RRPClient_char_confirmResponse",_player]; 
};
true
