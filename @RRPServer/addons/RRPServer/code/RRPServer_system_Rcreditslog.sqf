/*
Filename: 	RRPServer_system_Rcreditslog.sqf
*/

private ["_Type","_RcreditsPrise","_PlayerUID","_className","_side","_TypeBuy"];
params
[
	["_Type","",[""]],
	["_RcreditsPrise",0,[0]],
	["_PlayerUID","",[""]],
	["_className","",[""]],
	["_TypeBuy","",[""]]
];

_rub =  round (_RcreditsPrise / 6.6);

diag_log format ["(%1_Type ) ( %2 _RcreditsPrise ) ( %3 _PlayerUID )  ( %4 _rub )  ( %5  _className ) ( %6  _TypeBuy )",_Type,_RcreditsPrise,_PlayerUID,_rub, _className,_TypeBuy];
if (_Type isEqualTo "" or  {_PlayerUID isEqualTo ""} or {_className isEqualTo ""} or {_TypeBuy isEqualTo ""}) exitWith {diag_log "Error RRPServer_system_Rcreditslog.sqf"};

format ["BuyForRcredits:%1:%2:%3:%4:%5:%6",_Type,_RcreditsPrise,_PlayerUID,_rub,[_className] call RRPClient_util_stripChars,_TypeBuy] call RRPServer_DB_fireAndForget;