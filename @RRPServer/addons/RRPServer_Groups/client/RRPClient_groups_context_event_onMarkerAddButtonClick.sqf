/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_createMenu", "_offset"];
_createMenu = uiNamespace getVariable ['RscMapCreateMenu', controlNull];
if (RRPClientGroupInfo isEqualTo []) exitWith {false};
if(!isNull _createMenu)then
{
	_offset = 0.1;
	_createMenu ctrlSetPosition
	[
		(RRPClientMapScreenPos select 0) + (_offset * 3),
		(RRPClientMapScreenPos select 1) - _offset
	];
	_createMenu ctrlCommit 0;
	_createMenu ctrlShow true;
	_createMenu call RRPClient_groups_markerAddMenu_event_onLoad;
};
true