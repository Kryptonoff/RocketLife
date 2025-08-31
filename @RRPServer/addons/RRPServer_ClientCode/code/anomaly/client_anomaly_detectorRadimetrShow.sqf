disableSerialization;
private _show = param [0,true,[false]];
if (_show && {life_detectorRadimetrItem isEqualTo "" OR !life_detectorRadimetrActive}) exitWith {};

if (life_detectorRadimetrItem isEqualTo "ftmItem_det_DBG06M") exitWith {
	if (_show) then {
		["DETECTOR_DBG06M","PLAIN"] call RRPClient_gui_CreateRscLayer;
		[{
		private _control = uiNamespace getVariable ["DETECTOR_FIELD",controlNull];
		private _radLevelFormat = ([life_radiationTerrain, 2] call RRPClient_util_decimalNumber)* 10;
		_control ctrlSetText format ["%1", _radLevelFormat];
		(isNull _control OR player getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"] OR !life_detectorRadimetrActive OR !([player, life_detectorRadimetrItem] call client_system_hasItem))
		},{},[]] call CBA_fnc_waitUntilAndExecute;
	} else {
		systemChat "DETECTOR_DBG06M OFF";
		["DETECTOR_DBG06M"] call RRPClient_gui_DestroyRscLayer;
	};
};

if (life_detectorRadimetrItem isEqualTo "ftmItem_det_RKS20") exitWith {
	if (_show) then {
		["DETECTOR_RKS20","PLAIN"] call RRPClient_gui_CreateRscLayer;
		[{
		private _control = uiNamespace getVariable ["DETECTOR_FIELD",controlNull];
		private _radLevelFormat = ([life_radiationTerrain, 4] call RRPClient_util_decimalNumber)* 10;
		_control ctrlSetText format ["%1", _radLevelFormat];
		(isNull _control OR player getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"] OR !life_detectorRadimetrActive OR !([player, life_detectorRadimetrItem] call client_system_hasItem))
		},{},[]] call CBA_fnc_waitUntilAndExecute;
	} else {
		systemChat "DETECTOR_RKS20 OFF";
		["DETECTOR_RKS20"] call RRPClient_gui_DestroyRscLayer;
	};
};
if (life_detectorRadimetrItem isEqualTo "ftmItem_det_MKS1009") exitWith {
	if (_show) then {
		["DETECTOR_MKS1009","PLAIN"] call RRPClient_gui_CreateRscLayer;
		[{
		private _control = uiNamespace getVariable ["DETECTOR_FIELD",controlNull];
		private _radLevelFormat = ([life_radiationTerrain, 4] call RRPClient_util_decimalNumber)* 10;
		private _radLevelTime = [life_radiationSpentTime] call BIS_fnc_timeToString;
		_control ctrlSetStructuredText parseText (format ["%1<br/><t size='0.05'>%2</t>", _radLevelFormat, _radLevelTime]);
		(isNull _control OR player getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"] OR !life_detectorRadimetrActive OR !([player, life_detectorRadimetrItem] call client_system_hasItem))
		},{},[]] call CBA_fnc_waitUntilAndExecute;
	} else {
		systemChat "DETECTOR_MKS1009 OFF";
		["DETECTOR_MKS1009"] call RRPClient_gui_DestroyRscLayer;
	};
};
