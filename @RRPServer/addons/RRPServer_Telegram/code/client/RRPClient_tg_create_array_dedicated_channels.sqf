/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/


private _return = [];
private _config = getMissionConfig "CfgTelegram" >> "CfgDedicatedChanels";

_return = ("[getText(_x >> 'condition')] call RRPClient_util_conditionsCheck and {configName _x isNotEqualTo 'AbstractChannel'}" configClasses _config) apply {
	[
		getText (_x >> "displayName"),
		getNumber (_x >> "id"),
		getText (_x >> "variable"),
		getArray(_x >> "color"),
		getText (_x >> "icon"),
		getNumber (_x >> "show_is_online"),
		getText (_x >> "group_variable")
	]
};
_return	
