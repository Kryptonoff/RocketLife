
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 23000;
private _text = _slide controlsGroupCtrl 23002;
try 
{
	_theme = ctrlText (_slide controlsGroupCtrl 23004);
	if (_theme isEqualTo "") throw "Вы не указали тему";
	_message = ctrlText (_slide controlsGroupCtrl 23005);
	if (_message isEqualTo "") throw "Вы не ввели текст обращения";
	[
		"Reports","","","",false,
		[
			[
				"Steam профиль",
				[
					format ["**Имя:** %1",(player call getNickFullName)],
					format ["**Тема обращения**: %1",_theme],
					format ["**Обращение**: %1",_message]
				] joinString "\n",
				"https://steamcommunity.com/profiles/" + getPlayerUID _player,
				"FFFFFF",false,"","",[],[]
			]
		]
	] remoteExecCall ["DiscordEmbedBuilder_fnc_buildSqf",2];
	(_slide controlsGroupCtrl 23004) ctrlSetText "";
	(_slide controlsGroupCtrl 23005) ctrlSetText "";
	["MainMenu",0] call RRPClient_tablet_slide;
	throw "Ваше сообщение отправлено!";
}catch{
	[_exception, "Понял"] call RRPClient_tablet_showWarning;
};
