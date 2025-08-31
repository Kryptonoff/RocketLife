/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if !(isNil "RRPClient_temp_waitRequest") exitWith {call RRPClient_party_inviteMenu};
if !(RRPClientPartyID isEqualTo "") exitWith {call RRPClient_party_openManage};
createDialog "RRPDialogPartyFirst";
true call RRPClient_gui_util_blur;
private _display = uiNamespace getVariable ["RRPDialogPartyFirst",displayNull];
{
	[_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
	[_display, _x, ctrlPosition _x, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;
}forEach (allControls _display);
(_display displayCtrl 25104) ctrlSetStructuredText (parseText ("<t>Название Вашей тусовки указывать только латинскими символами! Тусовка помещает до 10 человек, создание тусовки бесплатное!</t>"));

private _list = _display displayCtrl 25101;
private _players = _display displayCtrl 25102;
_players lbAdd "Выберите тусовку!";
private _joinBtn = _display displayCtrl 25103;
_joinBtn ctrlEnable false;
lnbClear _list;
{
	_group = _x;
	if (_group getVariable ["party",false] and {!(isNull _group)}) then
	{
		
		_index = _list lnbAddRow [groupId _group,format["%1/%2",count (units _group), getNumber (missionConfigFile >> "CfgParty" >> "maxMembers")]];
		_list lnbSetPicture [[_index,0],(if (_group getVariable ["openClosed",false]) then {"\a3\ui_f\data\GUI\Rsc\RscDisplayMultiplayer\sessions_locked_ca.paa"}else{"\a3\ui_f\data\GUI\Rsc\RscDisplayMultiplayer\showPassworded_ca.paa"})];
		_list lnbSetData [[0,_index],netId _group];
	};
}forEach allGroups;
