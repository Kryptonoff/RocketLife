private _mode = param [0,"",[""]];
try
{
	switch _mode do
	{
		case "request": {
			private["_unit"];
			if((call life_adminlevel) == 0) exitWith {closeDialog 0;throw "ВЫ НЕ АДМИН"};
			_unit = (lbData[2902,lbCurSel 2902]);
			_unit = call compile format["%1", _unit];
			if(isNil "_unit" OR isNull _unit) throw "Никого не выбрали";

			["send",player] remoteExecCall ["RRPClient_admin_getProcesses",_unit];
		};
		case "send": {
			private["_admin"];
			_admin = param [1,objNull,[objNull]];

			if (isNull _admin) exitWith {};

			_list = call getProcessList;
			["response",_list] remoteExecCall ["RRPClient_admin_getProcesses",_admin];
		};
		case "response": {
			disableSerialization;
			private _procs = param [1,[],[[]]];
			if (_procs isEqualTo []) throw "Ошибка получения процессов";
			private _procList = ((findDisplay 2900) displayCtrl 2915);

			lbClear _procList;

			{
				_procList lbAdd _x;
			} foreach _procs;
		};
		case "dumpToDB": {
			_procs = call getProcessList;
			
			[format ["insertProcLog:%1:%2:%3:%4",serverid,name player,getPlayerUID player,_procs],"DB_lk_fireAndForget"] call RRPClient_system_hcExec;

		};
	};
}catch{
	[_exception] call hints;
};
