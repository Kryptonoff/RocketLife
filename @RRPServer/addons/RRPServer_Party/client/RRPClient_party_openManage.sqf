/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

createDialog "RRPDialogPartyManagement";
private _display = uiNamespace getVariable ["RRPDialogPartyManagement",displayNull];
{
	[_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
	[_display, _x, ctrlPosition _x, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;
}forEach (allControls _display);
try
{
	private _group = group player;
	private _parties = units _group;
	private _leaderGroup = leader _group;

	private _playerList = 	_display displayCtrl 25196;
	private _kickButon = 	_display displayCtrl 25195;
	private _leader = 		_display displayCtrl 25194;
	private _statText = 	_display displayCtrl 25183;
	private _kv = 			_display displayCtrl 25188;
	private _dv = 			_display displayCtrl 25187;
	private _delGroup = 	_display displayCtrl 25192;
	private _checkBox = 	_display displayCtrl 25184;
	private _leaveParty = 	_display displayCtrl 25191;
	private _titleText = 	_display displayCtrl 25199;
	private _pinGroup = 	_display displayCtrl 25300;
	private _pinSet = 		_pinGroup controlsGroupCtrl 25304;
	private _pinEdit = 		_pinGroup controlsGroupCtrl 25303;

	private _tfarInfo = 	_group getVariable ["TFAR_Freq",[]];
	private _opened = 		_group getVariable ["openClosed",false];
	private _pinCode = 		_group getVariable ["PartyPin",1234];
	
	if !(_tfarInfo isEqualTo []) then
	{
		_dv ctrlSetText STR(_tfarInfo # 0);
		_kv ctrlSetText STR(_tfarInfo # 1);
	};
	_kickButon ctrlEnable false;
	_leader ctrlEnable false;
	_titleText ctrlSetText format ["Тусовка - '%1'",groupId _group];
	
	_pinGroup ctrlShow (_opened);
	_pinGroup ctrlEnable (_opened);
	_pinEdit ctrlSetText str _pinCode;

	_checkBox cbSetChecked (_opened);
	_statText ctrlSetText (if (_opened) then {"Закрыта"}else{"Открыта"});
	
	{
		if (isPlayer _x) then
		{
			_index = _playerList lbAdd (_x call getNickName);
			_playerList lbSetData [_index,netId _x];
			if (_x isEqualTo _leaderGroup) then
			{
				_playerList lbSetPicture [_index, "\a3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa"];
			}else{
				_playerList lbSetPicture [_index, "\a3\ui_f\data\gui\cfg\Ranks\private_gs.paa"];
			};
			if (_x isEqualTo player) then
			{
				_playerList lbSetColor [_index, [0/255, 178/255, 205/255, 1]];
			}else{
				if !(alive _x || ((_x getVariable ["lifeState",""]) isEqualTo "INCAPACITATED")) then
				{
					_playerList lbSetColor [_index, [225/255, 65/255, 65/255, 1]];
				};
			};
		};
	}forEach _parties;
}catch{
	["ErrorTitleAndText",["Тусовка!",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
