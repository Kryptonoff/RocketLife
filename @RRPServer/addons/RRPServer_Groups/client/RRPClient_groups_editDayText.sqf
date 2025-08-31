/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_mode","_display","_pageMain","_strText","_editMSGbtn","_config","_pos","_edit"]; 
_mode = param [0,"",[""]];

try
{
	if !("setDayMessage" call RRPClient_groups_util_permCheck) throw "У вас нет разрешения!";
	if (isNull (uiNamespace getVariable ["RRPDialogTablet",displayNull])) throw "Диалог закрыт, откройте и попробуйте еще раз";
	
	_display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
	_pageMain = _display displayCtrl 1037;
	_strText = _pageMain controlsGroupCtrl 11035;
	_editMSGbtn = _pageMain controlsGroupCtrl 11031;
	switch _mode do
	{
		case "start": {
			_strText ctrlShow false;
			_strText ctrlEnable false;
			_config = getMissionConfig "GroupsSlide" >> "controls" >> "pageMain" >> "Controls" >> "messageDay";
			_pos = [getNumber(_config >> "x"),getNumber(_config >> "y"),getNumber(_config >> "w"),getNumber(_config >> "h")];
			_dayText = RRPClientGroupInfo get "massage_day";
			_edit = _display ctrlCreate ["ctrlEditMulti",11030,_pageMain];
			_edit ctrlSetPosition _pos;
			_edit ctrlCommit 0;
			_dayText = toString _dayText;
			_dayText = _dayText splitString endl joinString "<br/>"; 
			_edit ctrlSetText _dayText;
			_editMSGbtn ctrlRemoveAllEventHandlers "ButtonClick";
			_editMSGbtn ctrlAddEventHandler ["ButtonClick",{["end"] call RRPClient_groups_editDayText}];
		};
		case "end": {
			_edit = _pageMain controlsGroupCtrl 11030;
			_text = ctrlText _edit;
			if (getNumber (getMissionConfig "CfgGroups" >> "maximumDayChar") < count (toArray _text)) throw "Максимально доступно 280 символов";
			_text = _text splitString endl joinString "<br/>";
			_strText ctrlEnable true; 
			_strText ctrlShow true;
			["updateDayText",[toarray _text]] call RRPClient_system_send;
			_strText ctrlSetStructuredText parseText (format["<t>Данные обновляются...</t>"]);
			ctrlDelete _edit;
			_editMSGbtn ctrlRemoveAllEventHandlers "ButtonClick";
		};
		case "response": {
			_strText ctrlSetStructuredText parseText (format["<t>%1</t>",tostring (param [1,[],[[]]])]);
			private _textPosition = ctrlPosition _strText;
			_textPosition set [3,((ctrlTextHeight _strText) + (0.005 * safezoneH))];
			_strText ctrlSetPosition _textPosition;
			_strText ctrlCommit 0;
			_editMSGbtn ctrlAddEventHandler ["ButtonClick",{["start"] call RRPClient_groups_editDayText}];
		};
		default {throw "wtf?"};
	};
}catch{
	["ErrorTitleAndText",["Организация",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};