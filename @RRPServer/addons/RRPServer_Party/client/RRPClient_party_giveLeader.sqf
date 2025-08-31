/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 36000;

private _players = _slide controlsGroupCtrl 36006;
try
{
	private _index = lbCurSel _players;
	private _selected = objectFromNetId (_players lbData _index);
	private _name = _players lbText _index;
	if (isNull _selected) throw "Вы выбрали - НИЧЕГО!";
	if !(leader group player isEqualTo player) throw "Вы не лидер!";
	if (_selected isEqualTo player) throw "Нельзя назначить себя же!";
	private _group = group player;
	_group selectLeader _selected;
	
	private _parties = units _group;
	private _leader = leader _group;
	lbClear _players;
	{
		if (isPlayer _x) then
		{
			_index = _players lbAdd (_x call getNickName);
			_players lbSetData [_index,netId _x];
			if (_x isEqualTo _leader) then
			{
				_players lbSetPicture [_index, "\a3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa"];
			}else{
				_players lbSetPicture [_index, "\a3\ui_f\data\gui\cfg\Ranks\private_gs.paa"];
			};
			if (_x == player) then
			{
				_players lbSetColor [_index, [0/255, 178/255, 205/255, 1]];
			}else{
				if !(alive _x || ((_x getVariable ["lifeState",""]) isEqualTo "INCAPACITATED")) then
				{
					_players lbSetColor [_index, [225/255, 65/255, 65/255, 1]];
				};
			};
		};
	}forEach _parties;
	["SuccessTitleOnly",[format["Лидерство передано %1",_name]]] call SmartClient_gui_toaster_addTemplateToast;
	["SuccessTitleOnly",[format["Теперь вы лидер '%1'",groupId _group]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_selected];
}catch{
	["ErrorTitleAndText",["Тусовка!",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};

