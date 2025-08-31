private _xPos = 0;
private _yPos = 0.128; 
private _wPos = 1; 
private _hPos = 0.2;
private _background = "#(argb,8,8,3)color(0,0,0,0.8)"; 

private _watermarkText = format ["<br/><t align='center' size='5'><img image='\rimas_agent\assets\hud\logo.jpg'/><t><br/><t align='center' font='SFCompactTextBold' size='1.5' color='#FFFFFF'><br/><a href='https://bot.rocket-rp.fun/redirect/site'>Сайт</a> |
<a href='https://bot.rocket-rp.fun/redirect/forum'>Форум</a> | 
<a href='https://bot.rocket-rp.fun/redirect/lk'>Личный кабинет</a> |
<a href='https://bot.rocket-rp.fun/redirect/discord'>Discord</a></t>"]; 



private _DT_fnc_checkValidity = {
	params ['_ctrl'];
	if (isNull _ctrl) exitWith {false};
	if !(ctrlEnabled _ctrl) exitWith {false};
	if (ctrlFade _ctrl > 0) exitWith {false};
	if !(ctrlShown _ctrl) exitWith {false};
	true
};

private _DT_fnc_generateMark = {
	private _display = findDisplay 49;
	private _container = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1]; 
	_container ctrlSetPosition [_xPos * safezoneW + safezoneX,_yPos * safezoneH + safezoneY,_wPos * safezoneW,_hPos * safezoneH]; 
	
	_container ctrlEnable true;
	_container ctrlCommit 0;
	(ctrlPosition _container) params ['_gX','_gY','_gW','_gH'];

	private _backgroundCtrl = _display ctrlCreate ["RscPicture", -1, _container]; 
	_backgroundCtrl ctrlSetPosition [0,0,_gW,_gH];
	_backgroundCtrl ctrlSetText _background;
	_backgroundCtrl ctrlEnable false;
	_backgroundCtrl ctrlCommit 0;

	private _textCtrl = _display ctrlCreate ["RscStructuredText", -1, _container];
	_textCtrl ctrlSetPosition [0,0,_gW,_gH];
	_textCtrl ctrlEnable true;
	_textCtrl ctrlSetStructuredText (parseText _watermarkText);
	_textCtrl ctrlCommit 0;
	_textCtrl
};

disableSerialization;
while {true} do {
	waitUntil {!isNull (findDisplay 49)};
	private _textCtrl = 0 call _DT_fnc_generateMark;
	waitUntil {
		_textCtrl ctrlSetStructuredText (parseText _watermarkText); 
		(isNull (findDisplay 49))
	OR !(_textCtrl call _DT_fnc_checkValidity)
	};
};
