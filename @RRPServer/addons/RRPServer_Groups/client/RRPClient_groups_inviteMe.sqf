/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/


[
	(findDisplay 46),
	{
		["inviteConfirmRequest",[true]] call RRPClient_system_send
	},[],
		"Приглашение в организацию",
		format ["%1 пригласил Вас в организацию '%2'", _this select 0, _this select 1],
	{
		["inviteConfirmRequest",[false]] call RRPClient_system_send
	},[]
] call RRPClient_util_prompt;