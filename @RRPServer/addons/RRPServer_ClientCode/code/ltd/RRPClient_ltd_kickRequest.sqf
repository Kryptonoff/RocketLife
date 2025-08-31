/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;
private _display = 			uiNamespace getVariable ["RRPDialogCompanyMenu",displayNull];
private _membersListbox = 	_display displayCtrl 9418;
private _selectedUid = 		_membersListbox lbData (lbCursel _membersListbox);
private _playerName = 		_membersListbox lbText (lbCursel _membersListbox);

if	!(_selectedUid isEqualTo "")then
{
	if !(RRPClientLTDsData isEqualTo [])then
	{
		RRPClientLTDsData params ["_id","_name"];
		_dataCompany = missionNamespace getVariable [format["ltdData_%1",_id],[]];
		_dataCompany params ["_owner","_name","_bank","_members"];
		if ((getPlayerUID player) isEqualTo _owner) then
		{
			_action = ["Вы уверены что хотите уволить выбранного сотрудника?","Уволить?","Да","Не надо"] call BIS_fnc_guiMessage;
			if(_action) then
			{
				[_selectedUid,player,_id] remoteExecCall ["RRPServer_ltd_kickFromCompany",2];
			};
		};
	};
};
