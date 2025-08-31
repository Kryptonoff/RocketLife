private ["_mask","_damage","_protect","_goggles","_pdamage","_zinterval"];

_mask = getArray(getMissionConfig 'LifeCfgAnomaly' >> 'gasMasks');
_damage = damage player;
_protect = false;
_goggles = goggles player;

_pdamage = 0.025;
_zinterval = 1;

{
	if (_goggles == _x) then{_protect = true};
} forEach _mask;

["infoTitleAndText", ["Палладий", 'Вы вошли в зону радиации!']] call SmartClient_gui_toaster_addTemplateToast;

while {triggerActivated RRP_GasZone_1} do {
	if (_goggles != goggles player) then
	{
		_goggles = goggles player;
		{
			if (_goggles == _x) then
			{
				_protect = true;
			} else {
				_protect = false;
			};
		} forEach _mask;
	};

	if (!_protect) then
	{
		_damage = _damage + _pdamage;
		player setDamage _damage;
	};

	uiSleep _zinterval;
};

["infoTitleAndText", ["Палладий", 'Вы вышли с зоны радиации!']] call SmartClient_gui_toaster_addTemplateToast;
