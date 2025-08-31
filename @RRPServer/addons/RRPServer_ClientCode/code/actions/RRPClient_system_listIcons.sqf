
private _res = [];

(player getVariable ["playerTags",[]]) params [
  ["_icon", "", [""]],
  ["_rank", "", [""]],
  ["_title", "", [""]],
  ["_oraganization", "", [""]]
];

{
    private ["_curIcon","_name","_condition","_conditionMessage"];
	_ret = createHashMap;
	_ret set [_forEachIndex, createHashMap];	
	_curIcon = getText(_x >> "icon");
    _name = getText(_x >> "title");
    _condition = getText(_x >> "conditions");
    _conditionMessage = getText(_x >> "conditionsMessage");

	(_ret get (_forEachIndex)) set ["data",configName _x];
	(_ret get (_forEachIndex)) set ["icon",_curIcon];
	(_ret get (_forEachIndex)) set ["name",_name];
	(_ret get (_forEachIndex)) set ["condition",_condition];
	(_ret get (_forEachIndex)) set ["conditionMessage",_conditionMessage];
	(_ret get (_forEachIndex)) set ["rightPicture", if ([_condition] call RRPClient_util_conditionsCheck) then {
	  "";
	} else {
	  "\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\sessions_locked_ca.paa";
	}];
	(_ret get (_forEachIndex)) set ["current", _icon isEqualTo (configName _x)];
	_res pushBack _ret;

} forEach ("true" configClasses (missionconfigFile >> "playerTags" >> "icons"));

_res

