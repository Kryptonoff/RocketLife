/*
    Author(s):
    Arrra (original)
    ----
    Сontacts:
    SteamID: 76561198090549826
    Discord: merkava#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd
*/
private['_number','_className','_displayName','_pct','_VehArray','_display','_lbCtrl','_titleText','_progPar','_progText','_progTextB','_btn','_this','_pct','_netID','_index'];
processing = _this;
_VehArray = nearestObjects [position player,['LandVehicle','Truck','Air'],25];
if !(createDialog 'ProcessingDialog') exitWith {};
 _display = uiNamespace getVariable ['ProcessingDialog',displayNull];
if (isNull _display) exitWith {};

 _lbCtrl    = _display displayCtrl 1991;
 _titleText = _display displayCtrl 1995;
 _progPar   = _display displayCtrl 1997;
 _progText  = _display displayCtrl 1996;
 _progTextB = _display displayCtrl 2004;
 _btn       = _display displayCtrl 1998;
_btn ctrlEnable false;

["info","Выберите машину для взаимодействия..."] call RRPClient_processing_nonification;

{
  [_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
} forEach (allControls _display);

{
  if !(_x in [_progText,_progPar,_progTextB]) then {
  	[_display, _x, ctrlPosition _x, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;
  }
} forEach (allControls _display);

_titleText ctrlSetText getText(missionConfigFile >> 'CFGProcessing' >> (missionNamespace getVariable ['processing','']) >> 'processingName');


_index = _lbCtrl lbAdd "Мой инвентарь";
_netID = netId player;
_lbCtrl lbSetData [_index,str([_netID,"player"])];
_lbCtrl lbSetPicture [_index,"\RRP_uniform\UI\UI_bag.paa"];

{
    if (!(isNull _x) and {(crew _x isEqualTo [])} and {(alive _x)} and {(_x in life_vehicles)} ) then
	{
		_className   = typeOf _x;
		_displayName = getText(configFile >> 'CfgVehicles' >> _className >> 'displayName');
		_pct         = getText(configFile >> 'CfgVehicles' >> _className >> 'picture');
		_netID       = netId _x;
    _number = (_x getVariable ["dbInfo",[]]);

		_index = _lbCtrl lbAdd _displayName;
		_lbCtrl lbSetPicture [_index,_pct];
		_lbCtrl lbSetData [_index,str([_netID,"vehicle"])];
    _lbCtrl lbSetTextRight [_index, if (count _number > 0) then {format ["%1",_number select 1];} else {"Арендованый"}];
	};
} foreach _VehArray;
