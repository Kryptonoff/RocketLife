/*
	Filename: 	RRPClient_system_deathScreen.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];

disableSerialization;
["Death_Screen_V2","PLAIN"] call RRPClient_gui_CreateRscLayer;
private _uiDisp = GVAR_UINS ["Death_Screen_V2",displayNull];

life_deathScreen_canRespawn = false;
DS_EHId = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call RRPClient_system_deathScreenKeyHandler"];

_unit switchCamera "INTERNAL";

LIFE_PPE_DAMAGE05 = ppEffectCreate ["colorCorrections", 2009];
LIFE_PPE_DAMAGE05 ppEffectEnable true;
LIFE_PPE_DAMAGE05 ppEffectAdjust [1, 1.04, -0.004, [0.5, 0.5, 0.5, 0.0], [0.5, 0.5, 0.5, 0.0],  [0.5, 0.5, 0.5, 0.0]];
LIFE_PPE_DAMAGE05 ppEffectCommit 5;

"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [3];
"dynamicBlur" ppEffectCommit 2;

private _txtTopLeft = _uiDisp displayCtrl 66601;
private _txtTopRight = _uiDisp displayCtrl 66602;
private _txtBottomLeft = _uiDisp displayCtrl 66603;
private _txtBottomRight = _uiDisp displayCtrl 66604;

life_medicstatus = -1;
life_medicstatusby = "";

[_unit,_txtBottomLeft,true] spawn RRPClient_system_medicalTimer;

private ["_nearby","_distance","_statusText","_medicsOnlineTxt","_medicsNearTxt"];
waitUntil
{
	_unit setBleedingRemaining 3;
	_nearby = 99999;
	{
		if (_x call getSide == "med" && {alive _x} && {_x != player}) then {
			_distance = (getPosATL _unit) distance _x;
			if (_distance < _nearby) then {_nearby = _distance};
		};
	} forEach playableUnits;
	if (player getVariable ['RRPVariablePartyMeatActive',false]) then {
		_txtBottomRight ctrlSetStructuredText parseText "<t align = 'center' size = '1.1' >Нажмите <t size = '1,4' color = '#00FFFF' >M</t> что-бы покинуть игру</t>";
	} else {
		_medicsNearTxt = if (_nearby > 5000) then {
			format["Ближайший медик: более 5 км.",_nearby];
		} else {
			format["Ближайший медик: %1 м.",[(round _nearby)] call RRPClient_util_numberText];
		};
		_statusText = switch(life_medicstatus) do {
			case -1: {format["Нажмите <t color='#ffd200'>М</t> чтобы вызвать медика"]};
			case 0: {format["<t color='#ffd200'>Ожидайте</t>"]};
			case 1: {format["<t color='#f30404'>Отказано</t>"]};
			case 2: {format["<t color='#65d315'>%1 принял ваш вызов</t>",life_medicstatusby]};

			case 3: {format["Идет бой - <t color='#ffd200'>Ожидайте</t>"]};
			case 4: {format["Военное положение - <t color='#ffd200'>Ожидайте</t>"]};
			case 5: {format["Красная зона - <t color='#f30404'>Отказано</t>"]};
			case 6: {format["Черный список - <t color='#f30404'>Отказано</t>"]};
			case 7: {format["В розыске - <t color='#f30404'>Отказано</t>>"]};
		};
		_medicsOnlineTxt = format["Медиков в сети: %1",["med"] call RRPClient_system_playerCount];

		_txtBottomRight ctrlSetStructuredText parseText format ["<t size='0.8' align='center' valign='middle'>%1<br/>%2<br/><br/>%3</t>",_medicsOnlineTxt,_medicsNearTxt,_statusText];
	};
	uiSleep 3;
	isNull (GVAR_UINS ["Death_Screen_V2",displayNull])
};

(findDisplay 46) displayRemoveEventHandler ["KeyDown", DS_EHId];

LIFE_PPE_DAMAGE05 ppEffectAdjust [1, 1, 0,[ 0, 0, 0, 0],[ 1, 1, 1, 1],[ 0, 0, 0, 0]];
LIFE_PPE_DAMAGE05 ppEffectCommit 5;
LIFE_PPE_DAMAGE05 = -1;

"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit 2;
"dynamicBlur" ppEffectEnable false;

_unit setBleedingRemaining 0;
