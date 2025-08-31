/*
	Project: Rimas Role Play
	License: CC BY-ND
	Author: FairyTale#5571
*/

private ["_display","_config","_achs","_completedData","_profileData","_mainGroup","_pageList","_profName","_totalProg","_totalProgText",
"_background","_gradient","_startY","_w","_progress","_grad","_progW","_completeArray","_notComplete","_totPos","_totalBackground"];
createDialog "RRPDialogAchievment";
_display = uiNamespace getVariable ["RRPDialogAchievment",displayNull];
{
	[_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
	[_display, _x, ctrlPosition _x, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;
}forEach allControls _display;
_config = getMissionConfig "CfgAchievments";
_achs = ["",1] call RRPClient_ach_getConfig;
_completedData = RRPClientCompleteAch;
_profileData = parseSimpleArray (["Achievments","[]"] call RRPClient_reg_read);
_mainGroup = _display displayCtrl 24002;
_pageList = _display displayCtrl 24001;
_profName = _mainGroup controlsGroupCtrl 2000;
_background = _mainGroup controlsGroupCtrl 2003;
_background ctrlEnable false;
_profName ctrlSetStructuredText (parseText(format["<t font='RobotoCondensed' size='1.2'>Выполняйте достижения и получайте редкие награды</t>"]));
_gradient = "\A3\ui_f\data\igui\rscingameui\rscunitinfo\gradient_ca.paa";
_totalProg = _display ctrlCreate ["RRP_RscStructuredText",-1,_mainGroup];
_totalProg ctrlSetBackgroundColor [20/255,203/255,134/255,1];
_progW = ((count _completedData / count _achs) * 0.375);
_totalProg ctrlSetPosition [0.3625,0.02,0,0.06];
_totalProg ctrlCommit 0;
_totalProg ctrlEnable false;
_totalProg ctrlSetPositionW _progW;
_totalProg ctrlCommit 1;
_totalBackground = [_mainGroup,-1,[0.3625,0.02,0.375,0.06],_gradient,false,false,[0.1,0.1,0.1,0.45]] call RRPClient_gui_util_makeStaticPicture;
_totalBackground ctrlSetAngle [180,0.5,0.5,true];
_totalProgText = _display ctrlCreate ["RRP_RscStructuredText",-1,_mainGroup];
_totalProgText ctrlSetStructuredText (parseText(format["<t valign='middle' align='center' font='RobotoCondensed'>Получено %1 из %2 возможных (%3%4)</t>",count _completedData, count _achs, round((count _completedData / count _achs) * 100), '%']));
_totalProgText ctrlSetPosition [0.3625,0.02,0.375,0.06];
_totalProgText ctrlCommit 0;

_startY = 0.02;
_w = 0.725;
_createAch = {
	params ["_var","_title","_needDo","_current","_milestone",["_isComplete",false]];
	_progress = _display ctrlCreate ["RRP_RscStructuredText",-1,_pageList];

    _progress ctrlSetPosition [0.0125,_startY,0,0.10];
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
	_grad = [_pageList,-1,[0.0125,_startY,0.725,0.10],_gradient,false,false,[0.1,0.1,0.1,0.45]] call RRPClient_gui_util_makeStaticPicture;
    _grad ctrlSetAngle [180,0.5,0.5,true];
   
	_descr = _display ctrlCreate ["RRP_RscStructuredText",-1,_pageList];
    _descr ctrlSetPosition [0.0125,_startY,0.725,0.10];
	_descr ctrlSetStructuredText parseText format[
		"<t size='1.3' font='RobotoCondensed' shadow='2' align='left'>%1</t>"+
		"<t size='0.8' font='RobotoCondensedLight' shadow='2' align='right'>%2</t><br/>"+
		"<t size='0.8' color='#e4e4e4' shadow='1' font='RobotoCondensedLight' align='left'>%3</t>"+
		"<t size='0.8' shadow='2' font='RobotoCondensedLight' align='right'>%4</t>",
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
