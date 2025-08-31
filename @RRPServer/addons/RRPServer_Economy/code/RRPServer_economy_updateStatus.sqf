/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_mode","_res","_value","_index","_resource","_newValue","_localize","_instance"];
_mode = param [0,"",[""]];
try
{
	switch _mode do
	{
		case "addSelled": {
			_res = param [1,"",[""]];
			_value = param [2,1,[-1]];
			_index = [RRPPublicEconomyArray,_res] call RRPClient_util_find;
			if (_index isEqualTo -1) throw format ["Не обнаружен ресурс %1 в массиве!",_res];
			_resource = RRPPublicEconomyArray # _index;
			_resource params ["_resName", "_localize", "_sellprice", "_selled", "_max_selled", "_legal", "_prem", "_locked_time", "_locked_until"];
			_newValue = _selled + _value;
			_resource set [3,_newValue];
			missionNamespace setVariable ["RRPPublicEconomyArray",RRPPublicEconomyArray,true];
			format ["updateEconomySelled:%1:%2",_newValue,_resName] call RRPServer_DB_fireAndForget;
			
		};
		case "addToLock": {
			_res = param [1,"",[""]];
			_localize = param [2,"",[""]];
			_instant = param [3,false,[false]];
			if (_instant) exitWith 
			{
				_index = [RRPPublicEconomyArray,_res] call RRPClient_util_find;
				if (_index isEqualTo -1) throw format ["Не обнаружен ресурс %1 в массиве!",_res];
				_res = RRPPublicEconomyArray # _index;
				_res params ["_resName", "_localize", "_sellprice", "_selled", "_max_selled", "_legal", "_prem", "_locked_time", "_locked_until"];
				_res set [8,["Minutes",_locked_time] call RRPServer_util_addDate];
				missionNamespace setVariable ["RRPPublicEconomyArray",RRPPublicEconomyArray,true];
				format ["updateEconomyLockStatus:%1:%2",_locked_time,_resName] call RRPServer_DB_fireAndForget;
				["InfoTitleAndText",
					format["Ресурс %1, достиг своего лимита, скупщик его более не принимает!",_localize]
				] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",-2];
				
				throw format ["%1 был заблокирован немедленно",_resName];	
			};
			if !(_res in RRPPublicEconomyArrayEnded) then
			{
				RRPPublicEconomyArrayEnded pushBackUnique _res;
				missionNamespace setVariable ["RRPPublicEconomyArrayEnded",RRPPublicEconomyArrayEnded,true];
				_timeupdate = [((900 - ((serverTime - RRPPublicEconomyLastUpdate)))/60), "ARRAY"] call BIS_fnc_timeToString;
				["InfoTitleAndText",
					format["Ресурс %1, достиг своего лимита! Прием ресурса будет завершен через %2 минут!",_localize,_timeupdate#0]
				] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",-2];
				format ["Ресурс - %1, достиг своего лимита! Прием ресурса будет завершен через %2 минут! #1001",_localize,_timeupdate#0] call RRPServer_util_debugConsole;
			};
		};
		case "unlock": {
			_res = param [1,"",[""]];
			_index = [RRPPublicEconomyArray,_res] call RRPClient_util_find;
			if (_index isEqualTo -1) throw format ["Не обнаружен ресурс %1 в массиве!",_res];
			_resource = RRPPublicEconomyArray # _index;
			_resource params ["_resName", "_localize", "_sellprice", "_selled", "_max_selled", "_legal", "_prem", "_locked_time", "_locked_until"];
			_resource set [8,""];
			missionNamespace setVariable ["RRPPublicEconomyArray",RRPPublicEconomyArray,true];
			format ["dropDirectEconomyLockStatus:%1",_resName] call RRPServer_DB_fireAndForget;
		};
		case "updatePrice":
		{
			missionNamespace setVariable ["RRPLockToSellResource",true,true];
			_res = param [1,"",[""]];
			_value = param [2,1,[0]];
			_index = [RRPPublicEconomyArray,_res] call RRPClient_util_find;
			if (_index isEqualTo -1) throw format ["Не обнаружен ресурс %1 в массиве!",_res];
			_resource = RRPPublicEconomyArray # _index;
			_resource params ["_resName", "_localize", "_sellprice", "_selled", "_max_selled", "_legal", "_prem", "_locked_time", "_locked_until"];
			_resource set [2,_value];
			missionNamespace setVariable ["RRPPublicEconomyArray",RRPPublicEconomyArray,true];
			format ["updateEconomyPrice:%1:%2",_value,_resName] call RRPServer_DB_fireAndForget;
			missionNamespace setVariable ["RRPLockToSellResource",false,true];
		};
		case "refresh" : {
			call RRPServer_economy_updatePrices;
			call RRPServer_economy_loadPage;
		};
	};
}catch{
	format ["Ресурс - %1 #1001",_exception] call RRPServer_util_debugConsole;
};
true
