disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 36300;

private _text = _slide controlsGroupCtrl 36308;
_text ctrlSetStructuredText (parseText ("<t size='0.8'>Название Вашей тусовки указывать только латинскими символами! Тусовка помещает до 10 человек, создание тусовки бесплатное!</t>"));

private _list = _slide controlsGroupCtrl 36303;
private _players = _slide controlsGroupCtrl 36305;
lbClear _players;
_players lbAdd "Выберите тусовку!";
private _joinBtn = _slide controlsGroupCtrl 36306;
_joinBtn ctrlEnable false;
lnbClear _list;
{
	_group = _x;
	if (_group getVariable ["party",false] and {!(isNull _group)}) then
	{
		
		_index = _list lnbAddRow [groupId _group,format["%1/%2",if (_group getVariable ["openClosed",false]) then {"?"}else{count (units _group)}, getNumber (missionConfigFile >> "CfgParty" >> "maxMembers")]];
		_list lnbSetPicture [[_index,0],(if (_group getVariable ["openClosed",false]) then {"\a3\ui_f\data\GUI\Rsc\RscDisplayMultiplayer\sessions_locked_ca.paa"}else{"\a3\ui_f\data\GUI\Rsc\RscDisplayMultiplayer\showPassworded_ca.paa"})];
		_list lnbSetData [[0,_index],netId _group];
	};
}forEach allGroups;
