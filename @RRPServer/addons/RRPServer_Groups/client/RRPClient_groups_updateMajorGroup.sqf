/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

RRPClientGroupInfo = _this select 0;
call RRPClient_groups_updateListMembers;
[RRPClientSalaryHandler] call CBA_fnc_removePerFrameHandler;
call RRPClient_groups_salaryHandler;