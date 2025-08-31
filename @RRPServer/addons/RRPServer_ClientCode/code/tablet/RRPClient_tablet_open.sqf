#include <macros.hpp>

_notifications = [];

private _createNotification = {
	params ["_notification"];
	
	private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
	private _leftGroup = _display displayCtrl 25300;
	private _notificationGroup = _leftGroup controlsGroupCtrl 25304;

	_ctrl = _notificationGroup ctrlCreate ["AppNotification",-1];
	
};

private _fillNotifications = {
	reverse RRPClientNotificationHistory;

	{
		[_x] call _createNotification;
		if (_forEachIndex == 25) then {break};
	} forEach RRPClientNotificationHistory;
};

private _powerOn = {
	
	disableSerialization;
	private ["_ctrl"];
	params ["_display"];
	_controls = [1206,24001,25300,25304,25401];

	if (RRPClientTabletFirstOpen && life_welcomeScreen) then {
		playSound "AppStartup";
		{
			_control = _display displayCtrl _x;
			_control ctrlSetFade 1;
			_control ctrlCommit 0;
		}
		forEach _controls;
		_backgroundSplash = _display displayCtrl 25400;
		_backgroundSplash ctrlSetFade 1;
		_backgroundSplash ctrlShow true;
		_backgroundSplash ctrlCommit 0;
		_backgroundSplash ctrlSetFade 0;
		_backgroundSplash ctrlCommit 0.25;
		waitUntil {ctrlCommitted _backgroundSplash};

		uiSleep 1;
		{
			_control = _display displayCtrl _x;
			_control ctrlSetFade 0;
			_control ctrlCommit 0;
		}
		forEach _controls;
		_backgroundSplash ctrlSetFade 1;
		_backgroundSplash ctrlCommit 0.250;
		waitUntil {ctrlCommitted _backgroundSplash};
		_backgroundSplash ctrlShow false; 
		_backgroundSplash ctrlSetPosition [-1, -1]; 
		_backgroundSplash ctrlCommit 0;

		RRPClientTabletFirstOpen = false;
	}else{
		
		_backgroundSplash = _display displayCtrl 25400;
		_backgroundSplash ctrlShow false;
		_backgroundSplash ctrlSetFade 1;
		_backgroundSplash ctrlCommit 0;		
	};
};

private _createButton = {
	params [
		["_grp",controlNull],
		["_idc",-1],
		["_position",[0,0,0,0]],
		["_text",""],
		["_image",""],
		["_action",""],
		["_font","SFProDisplay"],
		["_size",((pixelH * 5) * 90)],
		["_textColor",[1,1,1,1]],
		["_ctrlType","AppButton",[""]]
	];
	private _noGrp = (_grp isEqualType 0);
	if (!_noGrp AND {isNull _grp}) exitWith {controlNull};
	private _display = ctrlParent _grp;
	if (isNull _display) exitWith {controlNull};
	private _ctrl = if (_noGrp) then {
		_display ctrlCreate [_ctrlType, _idc];
	} else {
		_display ctrlCreate [_ctrlType, _idc, _grp];
	};
	_ctrl ctrlSetPosition _position;
	_ctrl ctrlSetStructuredText parseText format[TEXT ,_text, _image,_font];

	_ctrl ctrlSetTextColor _textColor;
	_ctrl ctrlSetFont _font;
	_ctrl ctrlSetFontHeight (0.03 * _size);
	if (_action isEqualTo '') then {_ctrl ctrlEnable false} else {_ctrl ctrlEnable true};
	_ctrl ctrlSetEventHandler ['ButtonClick',_action];
	_ctrl ctrlAddEventHandler ["MouseEnter",{[_this select 0,1.2,0.15] call BIS_fnc_ctrlSetScale;}];
	_ctrl ctrlAddEventHandler ["MouseExit",{[_this select 0,1,0.15] call BIS_fnc_ctrlSetScale;}];
	_ctrl ctrlCommit 0;
	_ctrl;
};

_exit = call {
	if (player getVariable ["restrained",false]) exitWith  {"У вас руки связаны"};
	if (player getVariable ["surrender",false]) exitWith  {"Опустите руки"};
	if (player getVariable ["isBlind",false]) exitWith  {"Вы ничего не видите"};
	if (player getVariable ["knoked",false]) exitWith  {"Вы не в состоянии"};
	if (player getVariable ["tazed",false]) exitWith  {"Вы в шоке!"};
	""
};

if (_exit isNotEqualTo "") exitWith {["Планшет", _exit] call toastError};

createDialog "RRPDialogTablet";
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _background = _display displayCtrl 1206;
_background ctrlSetText (getText(getMissionConfig "CfgWallpaper" >> life_myPadSkinID >> "path"));
[player] call RRPClient_tablet_object;
[_display] call _powerOn;


private _updateTime = {
	private _vipText = call {
		if ((call life_donator) > 0) exitWith {format ["VIP-%1 Account",call life_donator]};
		"Free Account"
	};
	private _weather = call {
		
		if (rain > 0.7) exitWith  
		{
			if (daytime > 18 and {daytime < 4}) exitWith 
			{
				"\rimas_agent\assets\tablet\weather\weather-showers-night.paa";
			};
			"\rimas_agent\assets\tablet\weather\weather-showers-day.paa";
		}; 
		if (rain > 0.3) exitWith 
		{ 
			if (daytime > 18 and {daytime < 4}) exitWith 
			{
				"\rimas_agent\assets\tablet\weather\weather-showers-scattered-night.paa";
			};
			"\rimas_agent\assets\tablet\weather\weather-showers-scattered-day.paa";
		};
		if (overcast > 0.5) exitWith 
		{
			if (daytime > 18 and {daytime < 4}) exitWith 
			{
				"\rimas_agent\assets\tablet\weather\weather-clouds-night.paa";
			};
			"\rimas_agent\assets\tablet\weather\weather-clouds.paa";
		};
		if (daytime > 18 and {daytime < 4}) exitWith 
		{
			"\rimas_agent\assets\tablet\weather\weather-clear-night.paa";
		};
		"\rimas_agent\assets\tablet\weather\weather-clear.paa";
	};

	private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
	private _leftPage = _display displayCtrl 25300;
	private _time = _leftPage controlsGroupCtrl 25302;
	private _money = _leftPage controlsGroupCtrl 25305;
	_money ctrlSetStructuredText parseText format ["<t size ='0.8' font='SFCompactText'>"+
		"<img size='1' image='\rimas_pack\icons\bank.paa'/> $%1"+
		"<t align='right'>RC: %4 <img size='1' image='\rimas_agent\assets\hud\rc.paa'/></t><br/>"+
		"<t align='right'>TRX: %5 <img size='1' image='\rimas_agent\assets\hud\trx.paa'/></t>"+
		"<img size='1' image='\rimas_pack\icons\cash.paa'/> $%2<br/>"+
		"<img size='1' image='\rimas_pad\icons\icon-money-dcash.paa'/> $%3"+
		"</t>",
	[RRPClientAtmMoney] call RRPClient_util_numberText,
	[RRPClientCashMoney] call RRPClient_util_numberText,
	[RRPClientCashMoneyD] call RRPClient_util_numberText,
	[RRPClientCredits] call RRPClient_util_numberText,
	[RRPClientTRX] call RRPClient_util_numberText
	];
	RRPPublicTime params ["_year", "_month", "_day", "_hour", "_minute", "_second"];
	_time ctrlSetStructuredText parseText format [
		TIME_TEXT,
		_hour call RRPClient_tablet_util_doubleDigits,
		_minute call RRPClient_tablet_util_doubleDigits,
		_day,
		_month call RRPClient_util_monthToString, 
		call RRPClient_util_day2day,
		_vipText,
		_weather
	];
};

true call RRPClient_gui_util_blur;

if (RRPClientTabletCurrentSlide in (getArray(getMissionConfig "CfgMainMenu" >> "ignoreSlide")) || !openApp) then {
	RRPClientTabletCurrentSlide = "MainMenu";
};

{
	_slideControlID = getNumber (_x >> "controlID");
	_slideName = configName _x;
	_slideControl = _display displayCtrl _slideControlID;
	if (_slideName isEqualTo RRPClientTabletCurrentSlide) then {
		if (isNull _slideControl) then 
		{
			_appID = getNumber(_x >> "controlID");
			_slidesControlGroup = _display displayCtrl 24001;
			_slideControl = _display ctrlCreate [getText(_x >> "resource"), _appID, _slidesControlGroup];
		};
		_slideControl ctrlSetPosition [(0 * 0.05),(0 * 0.05)];
		_slideControl ctrlShow true;
		_slideControl ctrlCommit 0;
		_toSlideOpenFunction = missionNamespace getVariable [format ["RRPClient_tablet_app_%1_onOpen", _slideName], ""];
		if !(_toSlideOpenFunction isEqualTo "") then
		{
			call _toSlideOpenFunction;
		};

	}else{
		_slideControl ctrlShow false;
	};
} forEach ("true" configClasses (getMissionConfig "CfgMainMenu" >> "Tabs"));

private _config = getMissionConfig "CfgMainMenu" >> "Tabs";

private _mainTab = _display displayCtrl 25100;
private _statusCtrl = _display displayCtrl 25401;


_statusCtrl ctrlSetStructuredText parseText format [STATUS_TEXT, getText(_config >> RRPClientTabletCurrentSlide >> "name"), player call getNickFullName];

private _leftPage = _display displayCtrl 25300;
private _time = _leftPage controlsGroupCtrl 25302;

call _updateTime;

#define POS_X 0.008
private _posX = POS_X;
private _posY = 0.0054489;
{
	_action = if (getText(_x >> "action") isEqualTo "") then {
			format ["['%1', 1] call RRPClient_tablet_slide",configName _x]
		}else{
			getText(_x >> "action")
		};

	_ctrl = [_mainTab,25101 + _forEachIndex,[_posX*safezoneW, _posY*safezoneH, 0.0572*safezoneW,0.09*safezoneH],
		getText(_x >> "name"),
		getText(_x >> "icon"),
		_action
	 ] call _createButton;
	_posX = _posX + 0.06171299;
	if ((_forEachIndex + 1) % 6 == 0) then {
		_posY = _posY + 0.10343799;
		_posX = POS_X;
	};

}forEach ("[getText(_x >> 'condition')] call RRPClient_util_conditionsCheck and ((configName _x) isNotEqualTo 'MainMenu')" configClasses _config);


RRPClientTabletThreadUpdateTime = [0.5, _updateTime, [], true] call RRPClient_system_thread_addtask;