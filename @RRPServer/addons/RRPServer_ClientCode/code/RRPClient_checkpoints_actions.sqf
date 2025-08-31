
private ["_mode","_config","_unlock","_object","_code","_cp","_configCP","_checkpoints"];
_mode = param [0,""];

try
{
	_config = getMissionConfig "CfgpGates";
	switch _mode do
	{
		
		case "init":
		{
			{
				_unlock = getNumber(_x >> "unlockOnRestart") isEqualTo 1;
				missionNamespace setVariable [format ["MSN_CP_%1",configName _x], _unlock, true];
				if (_unlock) then
				{
					{
						_object = missionNamespace getVariable [_x,objNull];
						if (isNull _object) then {continue};
						_object animate ["Gate", 1]; 
						_object animate ["barier", 1];
					}forEach getArray(_x >> "objects");
				};
				_code = getText(_config >> configName _x >> "triggerCode");
				if !(_code isEqualTo "") then {call compile _code};
			}forEach ("true" configClasses _config);
		};
		case "open": 
		{
			_cp = param [1,"", [[],""]];
			switch (true) do
			{
				case (_cp isEqualType ""): 
				{
					if !(isClass (_config >> _cp)) throw format ["Конфигурация '%1' не определена, обратитесь к администратору",_cp];
					missionNamespace setVariable [format ["MSN_CP_%1",_cp], true, true];
					_config = _config >> _cp;
					if !([getText(_config >> "condition")] call RRPClient_util_conditionsCheck) throw format ["У вас нет разрешения на взаимодействие с %1",getText(_config >> "displayName")];
					
					{ 
						_object = missionNamespace getVariable [_x,objNull]; 
						if (isNull _object) then {continue};
						
						_object animate ["Gate", 1]; 
						_object animate ["barier", 1];  
					}forEach getArray(_config >> "objects"); 
					_code = getText(_config >> "triggerCode");
					if !(_code isEqualTo "") then {call compile _code};
				};
				case (_cp isEqualType []): 
				{
					_checkpoints = _cp;
					{
						_cp = _x;
						if !(isClass (_config >> _cp)) throw format ["Конфигурация '%1' не определена, обратитесь к администратору",_cp];
						_configCP = _config >> _cp;
						if !([getText(_configCP >> "condition")] call RRPClient_util_conditionsCheck) throw format ["У вас нет разрешения на взаимодействие с %1",getText(_configCP >> "displayName")];
						missionNamespace setVariable [format ["MSN_CP_%1",_cp], true, true];
						{ 
							_object = missionNamespace getVariable [_x,objNull]; 
							if (isNull _object) then {continue};
							_object animate ["Gate", 1]; 
							_object animate ["barier", 1]; 
						}forEach getArray(_configCP >> "objects"); 
						_code = getText(_configCP >> "triggerCode");
						if !(_code isEqualTo "") then {call compile _code};
					}forEach _checkpoints;
				};
			};
				
		};
		case "close":
		{
			_cp = param [1,"", [[],""]];
			switch (true) do
			{
				case (_cp isEqualType ""): 
				{
					if !(isClass (_config >> _cp)) throw format ["Конфигурация '%1' не определена, обратитесь к администратору",_cp];
					missionNamespace setVariable [format ["MSN_CP_%1",_cp], false, true];
					_config = _config >> _cp;
					if !([getText(_config >> "condition")] call RRPClient_util_conditionsCheck) throw format ["У вас нет разрешения на взаимодействие с %1",getText(_config >> "displayName")];
					
					{ 
						_object = missionNamespace getVariable [_x,objNull]; 
						
						if (isNull _object) then {continue};
						_object animate ["Gate", 0]; 
						_object animate ["barier", 0]; 
						
					}forEach getArray(_config >> "objects"); 
					_code = getText(_config >> "triggerCode");
					if !(_code isEqualTo "") then {call compile _code};
				};
				case (_cp isEqualType []): 
				{
					_checkpoints = _cp;
					{
						_cp = _x;
						if !(isClass (_config >> _cp)) throw format ["Конфигурация '%1' не определена, обратитесь к администратору",_cp];
						_configCP = _config >> _cp;
						if !([getText(_configCP >> "condition")] call RRPClient_util_conditionsCheck) throw format ["У вас нет разрешения на взаимодействие с %1",getText(_configCP >> "displayName")];
						missionNamespace setVariable [format ["MSN_CP_%1",_cp], false, true];
						{ 
							_object = missionNamespace getVariable [_x,objNull]; 
						
							if (isNull _object) then {continue};
							_object animate ["Gate", 0]; 
							_object animate ["barier", 0]; 
							 
						}forEach getArray(_configCP >> "objects"); 
						_code = getText(_configCP >> "triggerCode");
						if !(_code isEqualTo "") then {call compile _code};
					}forEach _checkpoints;
				};
			};
		};
	};
}catch{
	if (isServer) then
	{
		_exception call RRPServer_util_debugConsole;
		["ErrorTitleAndText",["Периметр",_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
	}else{
		["ErrorTitleAndText",["Периметр",_exception]] call SmartClient_gui_toaster_addTemplateToast;
	};
};