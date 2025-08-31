/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _uid = _this;
private _query = format ["queryLTD:%1",_uid] call RRPServer_DB_selectSingleField;
if (_query isEqualTo "") exitWith 
{
	missionNamespace setVariable [format ["ltd_%1",_uid],[]];
};
_dataCompany = missionNamespace getVariable [format ["ltdData_%1",_query],[]];
if (_dataCompany isEqualTo [] or {isNil "_dataCompany"}) exitWith 
{
	missionNamespace setVariable [format ["ltd_%1",_uid],[]];
};
_dataCompany params ["_owner","_name","_bank","_members"];

missionNamespace setVariable [format ["ltd_%1",_uid],[_query,_name]];