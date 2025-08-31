disableSerialization;

params ["_display", "_laptop", "_screen"];
_display setVariable ["openlidscript", _thisScript];

uiNamespace setVariable ["AlienInvasionDispRef", _display];
Lid = addMissionEventHandler ["Draw3D", 
{ 
	if (isNull (uiNamespace getVariable ["AlienInvasionDispRef", displayNull])) exitWith 
	{
		removeMissionEventHandler ["Draw3D",Lid];
	}; 
	setMousePosition [100, -100];
}];

uiSleep 0.25;

private _phase = 0; 
while { _phase < 1 } do 
{
	_laptop ctrlAnimateModel ['Lid', _phase]; 
	_phase = _phase + 0.01; 
	uiSleep 0.01;
};

private _prompt = _screen controlsGroupCtrl 300;
private _bg = _screen controlsGroupCtrl 400;
private _launchSeq = "Вторжение... ";
private _text = ">";

_prompt ctrlsetTextColor [1,1,1,1]; 
_prompt ctrlSetText _text; 

_screen ctrlShow true;

uiSleep 0.3;

{
	_text = _text + _x;
	_prompt ctrlSetText _text;
	playSound "ClickSoft";
	uiSleep 0.01;
}
forEach (_launchSeq splitString "");

_text = _text + endl + ">";
_prompt ctrlSetText _text;

uiSleep 0.3;

_bg ctrlSetTextColor [1,1,1,1]; 
_prompt ctrlShow false;

[getResolution select 5, _display, _screen] call KK_fnc_initAlienInvasion;
