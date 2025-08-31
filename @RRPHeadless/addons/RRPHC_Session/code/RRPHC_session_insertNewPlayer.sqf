/*
	Project: Event Heandlers for RRP
	Author: FairyTale5571
	License: CC BY-ND
*/

params ["_id", "_uid", "_name", "_jip", "_owner"];
if !(_uid in ["", "__SERVER__", "__HEADLESS__", "__HC__"]) then 
{
	private _hasAccount = format["hasPlayerAccount:%1",_uid] call RRPHC_DB_selectSingleField;
	if !(_hasAccount) then
	{
		private _name = [_name] call RRPHC_DB_mresString;
		format ["insertPlayerProfile:%1:%2:%3",_name,_uid,worldName] call RRPHC_DB_insertSingle;
		format ["insertPlayerSettings:%1",_uid] call RRPHC_DB_insertSingle;

		//format ["insertNewPlayerData:%1:%2",_name,_uid] call RRPHC_DB_insertSingle;
	}else{
		//format ["startAccountSession:%1", _uid] call RRPHC_DB_fireAndForget;
	};
	private _hasProfile = format["hasPlayerSettings:%1",_uid] call RRPHC_DB_selectSingleField;
	if !(_hasProfile) then
	{
		format ["insertPlayerSettings:%1",_uid] call RRPHC_DB_insertSingle;
	};
};

true
