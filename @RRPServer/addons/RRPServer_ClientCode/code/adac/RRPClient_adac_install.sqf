
params ["_upgrade"];

try{

	private _display = uiNamespace getVariable ["RRPDialogAdacs",displayNull];
	private _config = getMissionConfig "LifeCfgAdac" >> "AdacSettings" >> _upgrade;

	private _vehicle = _display getVariable ["vehicle",objNull];
	if (isNull _vehicle) throw "Техника не определена";

	if (_upgrade isEqualTo "nitro") then {
		if (getNumber(getMissionConfig "LifeCfgAdac" >> typeOf _vehicle >> "nitro") isNotEqualTo 1) throw "Это улучшение не поддерживается этой техникой";
	};

	if (_upgrade isEqualTo "boxes") then {
		if (getNumber(getMissionConfig "LifeCfgAdac" >> typeOf _vehicle >> "boxes") isEqualTo 0) throw "Это улучшение не поддерживается этой техникой";
	};

	if ((getNumber(_config >> "levels") > 1)) then {
		if ((_vehicle getVariable [getText(_config >> "variable"),0]) >= (getNumber(_config >> "levels"))) throw "Установлен макс. уровень";
	}else{
		if !(isNil {_vehicle getVariable getText(_config >> "variable")}) throw "Это улучшение уже установлено";
	};
	
	if !([getText(_config >> "item")] call RRPClient_system_removeItem) throw "Вам необходимо приобрести комплект для установки модификации";

	_type = call {
		if (getText(_config >> "type") isEqualTo "INT") exitWith {(_vehicle getVariable [getText(_config >> "variable"),0]) + 1};
		true
	};

	[_vehicle,getText(_config >> "variable"),_type] call CBA_fnc_setVarNet;
	
	_save = [];
	[_vehicle,"Trunk"] call RRPClient_system_clearGlobalVar;
	
	{
		if (!isNil {_vehicle getVariable (getText(_x >> "variable"))}) then 
		{
			if (getText(_config >> "type") isEqualTo "INT") then {
				_save pushBackUnique [(configName _x),_vehicle getVariable [(getText(_config >> "variable")),0]];
				continue;
			};
			_save pushBackUnique [(configName _x)]
		};
	} forEach ("true" configClasses (getMissionConfig "LifeCfgAdac" >> "AdacSettings"));

	[_vehicle,_save] call RRPClient_adac_setup;
	[_vehicle,_save] remoteExecCall ["RRPServer_adac_vehicleAdacUpdate",2];
	["SuccessTitleAndText",["ADAC",format["Улучшение '%1' установлено!",getText(_config >> _upgrade >> "displayName")]]] call toast;
	[25,"установку улучшения"] call addXP;

}catch{
	["ErrorTitleAndText",["ADAC",_exception]] call toast;
};
true

