/*

	Filename: 	RRPClient_inventory_colorSlots.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
#define ALLOWED_COLOR "#(argb,8,8,3)color(1,1,1,0.4,co)"
#define NOTALLOWED_COLOR "#(argb,8,8,3)color(1,0,0,0.4,co)"
#define ALLOWED_COLOR_LIST "#(argb,8,8,3)color(1,1,1,1,co)"
#define NOTALLOWED_COLOR_LIST "#(argb,8,8,3)color(1,0,0,1,co)"
#define NEUTRAL_COLOR "#(argb,8,8,3)color(1,1,1,0.1,co)"
#define NEUTRAL_COLOR_LIST "#(argb,8,8,3)color(1,1,1,0,co)"

private _allowed = _this;
private _display = findDisplay 1000;

private _backgroundSlotUniform = _display displayCtrl 6332;
private _backgroundSlotVest = _display displayCtrl 6382;
private _backgroundSlotBackpack = _display displayCtrl 6192;

private _backgroundSlotPrimary = _display displayCtrl 1242;
private _backgroundSlotPrimaryMuzzle = _display displayCtrl 1243;
private _backgroundSlotPrimaryUnderBarrel = _display displayCtrl 1200;
private _backgroundSlotPrimaryFlashlight = _display displayCtrl 1244;
private _backgroundSlotPrimaryOptics = _display displayCtrl 1245;
private _backgroundSlotPrimaryMagazineGL = _display displayCtrl 1267;
private _backgroundSlotPrimaryMagazine = _display displayCtrl 1246;

private _backgroundSlotSecondary = _display displayCtrl 1247;
private _backgroundSlotSecondaryMuzzle = _display displayCtrl 1248;
private _backgroundSlotSecondaryUnderBarrel = _display displayCtrl 1266;
private _backgroundSlotSecondaryFlashlight = _display displayCtrl 1249;
private _backgroundSlotSecondaryOptics = _display displayCtrl 1250;
private _backgroundSlotSecondaryMagazine = _display displayCtrl 1251;

private _backgroundSlotHandgun = _display displayCtrl 1252;
private _backgroundSlotHandgunMuzzle = _display displayCtrl 1253;
private _backgroundSlotHandgunUnderBarrel = _display displayCtrl 1268;
private _backgroundSlotHandgunFlashlight = _display displayCtrl 1254;
private _backgroundSlotHandgunOptics = _display displayCtrl 1255;
private _backgroundSlotHandgunMagazine = _display displayCtrl 1256;

private _backgroundSlotHeadgear = _display displayCtrl 1257;
private _backgroundSlotGoggles = _display displayCtrl 1258;
private _backgroundSlotHMD = _display displayCtrl 1259;
private _backgroundSlotBinoculars = _display displayCtrl 1260;
private _backgroundSlotMap = _display displayCtrl 1261;
private _backgroundSlotGPS = _display displayCtrl 1262;
private _backgroundSlotCompass = _display displayCtrl 1263;
private _backgroundSlotRadio = _display displayCtrl 1264;
private _backgroundSlotWatch = _display displayCtrl 1265;

private _externalContainerBackground = _display displayCtrl 1240;
private _playerContainerBackground = _display displayCtrl 1241;

if (_allowed isEqualTo ["all"]) exitWith {
	_backgroundSlotUniform ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotVest ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotBackpack ctrlSetText NEUTRAL_COLOR;

	_backgroundSlotPrimary ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotPrimaryMuzzle ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotPrimaryUnderBarrel ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotPrimaryFlashlight ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotPrimaryOptics ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotPrimaryMagazineGL ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotPrimaryMagazine ctrlSetText NEUTRAL_COLOR;

	_backgroundSlotSecondary ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotSecondaryMuzzle ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotSecondaryUnderBarrel ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotSecondaryFlashlight ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotSecondaryOptics ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotSecondaryMagazine ctrlSetText NEUTRAL_COLOR;

	_backgroundSlotHandgun ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotHandgunMuzzle ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotHandgunUnderBarrel ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotHandgunFlashlight ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotHandgunOptics ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotHandgunMagazine ctrlSetText NEUTRAL_COLOR;

	_backgroundSlotHeadgear ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotGoggles ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotHMD ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotBinoculars ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotMap ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotGPS ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotCompass ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotRadio ctrlSetText NEUTRAL_COLOR;
	_backgroundSlotWatch ctrlSetText NEUTRAL_COLOR;

	_externalContainerBackground ctrlSetText NEUTRAL_COLOR_LIST;
	_playerContainerBackground ctrlSetText NEUTRAL_COLOR_LIST;

	[] call RRPClient_inventory_setTitle;
};
_backgroundSlotUniform ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("uniform" in _allowed));
_backgroundSlotVest ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("vest" in _allowed));
_backgroundSlotBackpack ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("backpack" in _allowed));

_backgroundSlotPrimary ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("primWepPl" in _allowed));
_backgroundSlotPrimaryMuzzle ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("primWepMuzzle" in _allowed));
_backgroundSlotPrimaryUnderBarrel ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("primWepBipod" in _allowed));
_backgroundSlotPrimaryFlashlight ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("primWepFlash" in _allowed));
_backgroundSlotPrimaryOptics ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("primWepOptics" in _allowed));
_backgroundSlotPrimaryMagazineGL ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("primWepMuzzleMag2" in _allowed));
_backgroundSlotPrimaryMagazine ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("primWepMuzzleMag1" in _allowed));

_backgroundSlotSecondary ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("secWepPl" in _allowed));
_backgroundSlotSecondaryMuzzle ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("secWepMuzzle" in _allowed));
_backgroundSlotSecondaryUnderBarrel ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("secWepBipod" in _allowed));
_backgroundSlotSecondaryFlashlight ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("secWepFlash" in _allowed));
_backgroundSlotSecondaryOptics ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("secWepOptics" in _allowed));
_backgroundSlotSecondaryMagazine ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("secWepMuzzleMag1" in _allowed));

_backgroundSlotHandgun ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("hgWepPl" in _allowed));
_backgroundSlotHandgunMuzzle ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("hgWepMuzzle" in _allowed));
_backgroundSlotHandgunUnderBarrel ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("hgWepBipod" in _allowed));
_backgroundSlotHandgunFlashlight ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("hgWepFlash" in _allowed));
_backgroundSlotHandgunOptics ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("hgWepOptics" in _allowed));
_backgroundSlotHandgunMagazine ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("hgWepMuzzleMag1" in _allowed));

_backgroundSlotHeadgear ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("headgear" in _allowed));
_backgroundSlotGoggles ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("goggles" in _allowed));
_backgroundSlotHMD ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("hmd" in _allowed));
_backgroundSlotBinoculars ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("binocular" in _allowed));
_backgroundSlotMap ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("map" in _allowed));
_backgroundSlotGPS ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("gps" in _allowed));
_backgroundSlotCompass ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("compass" in _allowed));
_backgroundSlotRadio ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("radio" in _allowed));
_backgroundSlotWatch ctrlSetText ([NOTALLOWED_COLOR, ALLOWED_COLOR] select ("watch" in _allowed));

_externalContainerBackground ctrlSetText ([NOTALLOWED_COLOR_LIST, ALLOWED_COLOR_LIST] select ("external" in _allowed));
_playerContainerBackground ctrlSetText ([NOTALLOWED_COLOR_LIST, ALLOWED_COLOR_LIST] select ("backpack_list" in _allowed));