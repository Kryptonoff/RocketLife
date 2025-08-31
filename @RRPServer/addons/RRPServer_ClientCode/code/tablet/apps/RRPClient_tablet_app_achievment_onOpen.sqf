disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _achSlide = _mainGroup controlsGroupCtrl 28000;

private _config = getMissionConfig "CfgAchievments";
private _achs = ["",1] call RRPClient_ach_getConfig;
private _completedData = RRPClientCompleteAch;
private _profileData = parseSimpleArray (["Achievments","[]"] call RRPClient_reg_read);

private _main = _achSlide controlsGroupCtrl 28002;
private _pageList = _achSlide controlsGroupCtrl 28001;
{ctrlDelete _x}forEach (allControls _main);
{ctrlDelete _x}forEach (allControls _pageList);
_gradient = "\A3\ui_f\data\igui\rscingameui\rscunitinfo\gradient_ca.paa";


private _totalProgCoordinates = [0.007753 * safezoneW,0.014248 * safezoneH,0.376435 * safezoneW,0.054991 * safezoneH];
private _totalProg = _display ctrlCreate ["AppRscStructuredText",-1,_main];
_totalProg ctrlSetBackgroundColor [20/255,203/255,134/255,1];
private _progW = ((count _completedData / count _achs) * (0.376435 * safezoneW));
_totalProg ctrlSetPosition _totalProgCoordinates;
_totalProg ctrlSetPositionW 0;
_totalProg ctrlCommit 0;
_totalProg ctrlEnable false;
_totalProg ctrlSetPositionW _progW;
_totalProg ctrlCommit 1;

private _totalBackground = [_main,-1,_totalProgCoordinates,_gradient,false,false,[0.1,0.1,0.1,0.45]] call RRPClient_gui_util_makeStaticPicture;
_totalBackground ctrlSetAngle [180,0.5,0.5,true];
_totalProgText = _display ctrlCreate ["AppRscStructuredText",-1,_main];
_totalProgText ctrlSetStructuredText (parseText(format["<t valign='middle' align='center' font='SFCompactDisplay'>Получено %1 из %2 возможных (%3%4)</t>",count _completedData, count _achs, round((count _completedData / count _achs) * 100), '%']));
_totalProgText ctrlSetPosition _totalProgCoordinates;
_totalProgText ctrlCommit 0;

_startY = 0.02;
_w = 0.375 * safezoneW;
_createAch = {
	params ["_var","_title","_needDo","_current","_milestone",["_isComplete",false]];
	_progress = _display ctrlCreate ["AppRscStructuredText",-1,_pageList];
    _progress ctrlSetPosition [0.00515664 * safezoneW,_startY,0,0.054991 * safezoneH];
   	_progress ctrlSetBackgroundColor [0, 0.78, 0.89, 1];
	_progress ctrlCommit 0;
    _progress ctrlEnable false;
	_progW = 0;
	if !(_current isEqualTo 0) then
	{
		_progW = ((_current / _milestone) * _w);
	}else{
		if(_isComplete) then
		{
			_progW = _w;
			_progress ctrlSetBackgroundColor [20/255,203/255,134/255,1];
		};
	};
	_progress ctrlSetPositionW _progW;
	_progress ctrlCommit .5;
	_grad = [_pageList,-1,[0.00515664 * safezoneW, _startY, _w, 0.054991 * safezoneH],_gradient,false,false,[0.1,0.1,0.1,0.45]] call RRPClient_gui_util_makeStaticPicture;
    _grad ctrlSetAngle [180,0.5,0.5,true];
   
	_descr = _display ctrlCreate ["AppRscStructuredText",-1,_pageList];
    _descr ctrlSetPosition [0.00515664 * safezoneW, _startY, _w, 0.054991 * safezoneH];
	_descr ctrlSetStructuredText parseText format[
		"<t size='1.3' font='SFCompactDisplay' shadow='2' align='left'>%1</t>"+
		"<t size='0.8' font='SFCompactText' shadow='2' align='right'>%2</t><br/>"+
		"<t size='0.8' color='#e4e4e4' shadow='1' font='SFCompactText' align='left'>%3</t>"+
		"<t size='0.8' shadow='2' font='SFCompactText' align='right'>%4</t>",
		_title,getText(getMissionConfig "CfgAchievments" >> _var >> "rewardText"),_needDo,(if(_isComplete)then{"Выполнен"}else
		{format ["%1 из %2",_current,[_milestone]call RRPClient_util_numberText]})
	];
	_descr ctrlCommit 0;
	_startY = _startY + 0.12;
};

_completeArray = [];
_notComplete = [];
{
	_x params ["_var","_title","_needDo","_milestone","_milestoneFraction","_reward","_rewardText"];
	if (_var in _completedData) then
	{
		_completeArray pushBack [_var,_title,_needDo,0,0,true];
	}else{
		_index = _profileData findIf {_x#0 isEqualTo _var};
		if (_index isEqualTo -1) then
		{
			_notComplete pushBack [_var,_title,_needDo,0,_milestone,false];
		}else{
			(_profileData select _index) params ["_var","_current","_isComplete"];
			_notComplete pushBack [_var,_title,_needDo,floor(_current / _milestoneFraction),_milestone,false];
		};
	};
}forEach _achs;

comment "LIST";
{_x call _createAch}forEach _notComplete;
_startY = _startY + 0.06;
{_x call _createAch}forEach _completeArray;
