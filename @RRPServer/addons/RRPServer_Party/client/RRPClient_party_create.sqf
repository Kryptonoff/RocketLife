/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 36300;

try
{
	if (isNull _display) throw "Display is null";
	private _partyInput = _slide controlsGroupCtrl 36310;
	private _partyname = ctrlText _partyInput;
	private _countName = count _partyname;
	if (_countName isEqualTo 0) throw "Вы ничего не ввели!";
	private _charsCheck = [_partyname,getText(missionConfigFile >> "CfgParty" >> "allowedChars")] call RRPClient_util_containsForbiddenCharacter;
	if !(_charsCheck isEqualTo -1) throw format ["Нельзя использовать символ '%1'",_charsCheck];
	_partyname = [_partyname] call CBA_fnc_trim;
	if (_countName < 2) throw "Слишком короткое!";
	if (_countName > 20) throw "Слишком длинное!";
	{
		if (toLower(groupId _x) isEqualTo toLower(_partyname)) throw "Это название уже занято!";
	}forEach allGroups;

	private _group = createGroup independent;
	_group setGroupIdGlobal [_partyname];	comment "Temporary";
	[player] joinSilent _group;
	_group deleteGroupWhenEmpty true;
	RRPClientPartyID = netId _group;
	_group setVariable ["party",true,true];
	_group setVariable ["openClosed",false,true];
	_group setVariable ["PartyPin",round(random([1000,5000,9999])),true];
	[_group,"TFAR_Freq",[parseNumber(random[50,60,87] toFixed 1),parseNumber(random[50,256,512] toFixed 1)]] call CBA_fnc_setVarNet;
	["SuccessTitleOnly",["Тусовка создана!"]] call SmartClient_gui_toaster_addTemplateToast;
	["party_manage",1] call RRPClient_tablet_slide;
	call RRPClient_party_createPanel;
}catch{
	["ErrorTitleAndText",["Тусовка!",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
