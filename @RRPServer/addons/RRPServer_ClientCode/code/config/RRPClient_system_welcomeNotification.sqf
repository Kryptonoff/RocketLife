/*
  Project: Rimas Role Play
  Author: FairyTale5571
  License: CC BY-ND
*/

0 spawn {

	_print = {
		_text = _this;
		[
			parseText format ["<t font='SFCompactTextItalic' align='right' shadow='1' size='1.4'>%1</t>",_text], 
			[safezoneX, safezoneY + safeZoneH * 0.4, safezoneW * 0.3, safeZoneH * 0.25], 
			nil, 
			6, 
			0.7,
			0 
		] call BIS_fnc_textTiles;
	};

	_handle = "Добро пожаловать на сервер<br />Rocket Life" spawn _print;
	waitUntil {scriptDone _handle};
	_handle = "Наш сайт:<br />rocket-rp.fun" spawn _print;
	waitUntil {scriptDone _handle};
	_handle = "Перед игрой настоятельно рекомендуем ознакомиться с правилами поведения на сервере!" spawn _print;
	waitUntil {scriptDone _handle};
	_handle = format ["Версия сервера <br/><t size='1.3'>%1</t>",briefingName] spawn _print;
	waitUntil {scriptDone _handle};
};
