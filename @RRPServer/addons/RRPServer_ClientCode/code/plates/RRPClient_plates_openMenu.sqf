/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;
_nearVehicles = nearestObjects [player, ["LandVehicle", "Air", "Ship"], 50];
_localVehicles = [];
{
	if (local _x) then
	{
		if (alive _x) then
		{
			if !((_x getVariable ["dbInfo",[]]) isEqualTo []) then 
			{
				if (((_x getVariable "dbInfo") select 0) isEqualTo (getPlayerUID player)) then
				{
					_localVehicles pushBack _x;
				};
			};
		};
	};
}
forEach _nearVehicles;
if (_localVehicles isEqualTo []) exitWith
{
	["ErrorTitleAndText", ["Ошибка!", "Припаркуйте машину в радиусе 50 метров и покиньте ее с места водителя!"]] call SmartClient_gui_toaster_addTemplateToast;
};
createDialog "RRPDialogChangePlate";
private _dialog = uiNamespace getVariable ["RRPDialogChangePlate",displayNull];
{
	[_dialog, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
	[_dialog, _x, ctrlPosition _x, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;
}forEach (allControls _dialog);
true call RRPClient_gui_util_blur;
private _vehList = _dialog displayCtrl 7601;
private _buyBtn = _dialog displayCtrl 7602;
private _name1 = _dialog displayCtrl 7603;
private _name2 = _dialog displayCtrl 7604;
private _number1 = _dialog displayCtrl 7605;
private _number2 = _dialog displayCtrl 7606;
private _number3 = _dialog displayCtrl 7607;
private _number4 = _dialog displayCtrl 7608;
private _name3 = _dialog displayCtrl 7609;
private _name4 = _dialog displayCtrl 7610;

lbClear _vehList;
{
    _veh = _x;
    if (!isNull _veh && alive _veh && (_veh isKindOf "Car") || (_veh isKindOf "Air") || (_veh isKindOf "Ship")) then 
	{
		if !(isNil {_veh getVariable "dbInfo"}) then
		{
			_text = "";
			if (!isNil {_veh getVariable "Life_VEH_color"}) then 
			{
				_color = _veh getVariable ["Life_VEH_color",""];
				if (isClass (missionConfigFile >> "LifeCfgVehTextures" >> _color)) then 
				{
					_text = format[" (%1)",getText (missionConfigFile >> "LifeCfgVehTextures" >> _color >> "displayName")];
				};
			};
			_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
			_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
			_idx = _vehList lbAdd format ["%1 %3 - %2",_name,(_veh getVariable ["dbInfo",["","НЕТ НОМЕРОВ"]] select 1),_text];
			if (_pic != "pictureStaticObject") then 
			{
				_vehList lbSetPicture [(lbSize _vehList)-1,_pic];
			};
			_vehList lbSetData [(lbSize _vehList)-1,netId _veh];
		};
    };
}forEach _localVehicles;