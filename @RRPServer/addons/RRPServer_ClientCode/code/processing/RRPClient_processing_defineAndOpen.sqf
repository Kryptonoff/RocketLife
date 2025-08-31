/*
    Author(s):
    Arrra (original)
    ----
    Сontacts:
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd
*/
if (missionNamespace getVariable ['activeProcessing',false]) exitWith {};
private ['_ProcessingName','_ProcessingObj','_condition'];

procObject = _this;
{
		_ProcessingName = configName _x;
		_ProcessingObj  = missionNamespace getVariable [_ProcessingName,objNull];
		if (_ProcessingObj isEqualto procObject) exitWith {};

} forEach ('true' configClasses (missionConfigFile >> 'CFGProcessing'));

_condition  = getText(missionConfigFile >> "CFGProcessing" >> _ProcessingName >> "condition");
if (_condition isEqualTo "") then {_condition = true} else {_condition =  call (compile _condition)};
if !(_condition) exitWith {["ErrorTitleAndText", ["Нет доступа", (getText(missionConfigFile >> "CFGProcessing" >> _ProcessingName >> "conditionMess"))]] call SmartClient_gui_toaster_addTemplateToast};

if (_ProcessingName isEqualto '') exitWith {};
_ProcessingName call RRPClient_processing_searchVehicleForInteraction;
