disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 36000;
try
{
	private _group = group player;
	private _parties = units _group;
	private _leaderGroup = leader _group;

	private _playerList = 	_slide controlsGroupCtrl 36006;
	private _kickButon = 	_slide controlsGroupCtrl 36003;
	private _leader = 		_slide controlsGroupCtrl 36002;
	private _statText = 	_slide controlsGroupCtrl 36010;
	private _kv = 			_slide controlsGroupCtrl 36012;
	private _dv = 			_slide controlsGroupCtrl 36015;
	private _delGroup = 	_slide controlsGroupCtrl 36005;
	private _checkBox = 	_slide controlsGroupCtrl 36009;
	private _leaveParty = 	_slide controlsGroupCtrl 36004;
	private _pinGroup = 	_slide controlsGroupCtrl 36019;
	private _pinSet = 		_pinGroup controlsGroupCtrl 36023;
	private _pinEdit = 		_pinGroup controlsGroupCtrl 36022;

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
	
	_pinGroup ctrlShow (_opened);
	_pinGroup ctrlEnable (_opened);
	_pinEdit ctrlSetText str _pinCode;

	_checkBox cbSetChecked (_opened);
	_statText ctrlSetText (if (_opened) then {"Закрыта"}else{"Открыта"});
	lbClear _playerList;
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
