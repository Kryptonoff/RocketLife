/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND 
*/

private ["_player"];
params ["_id","_paramaters"];
_player = _id call RRPServer_session_getPlayerObject;
_paramaters params [
	["_chars",[],[[]]],
	["_params",[],[[]]]
];

try
{
	if (_chars isEqualTo []) throw "Chars is empty";
	if (_params isEqualTo []) throw "Params is empty";
	_uid = getPlayerUID _player;
	_params params [
		"_type",
		"_value",
		"_valid",
		"_count"
	];
	//format["generatePromocode:%1:%2:%3:%4:%5:%6",toString(_chars),_type,_value,_valid,_count,_uid] call RRPServer_DB_fireAndForget;
	[format["%1 (%2) сгенерировал промокод %3 |%4|%5|%6|%7",name _player,getPlayerUID _player,toString(_chars),_type,_value,_valid,_count],"PromosLog"] call RRPServer_system_logIt;
}catch{
	"GeneratedPromoCode" + _exception call RRPServer_util_log;
};
true
