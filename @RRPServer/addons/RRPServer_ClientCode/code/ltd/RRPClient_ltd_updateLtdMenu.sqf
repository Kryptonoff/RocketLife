/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;
private _display = 		uiNamespace getVariable ["RRPDialogCompanyMenu",displayNull];
if (isNull _display) exitWith {};
private _status = 		_display displayCtrl 9410;
private _memberList = 	_display displayCtrl 9418;
private _allPlr = 		_display displayCtrl 9409;
private _delComp = 		_display displayCtrl 9412;

_hide = ["RRPDialogCompanyMenu",[9410,9418,9409,9403,9404,9408,9412,9419]] spawn RRPClient_gui_util_hideControls;
waitUntil {scriptDone _hide};
["RRPDialogCompanyMenu",[9410,9418,9409,9403,9404,9408,9412,9419]] spawn RRPClient_gui_util_showControls;

RRPClientLTDsData params ["_id","_name"];
_dataCompany = missionNamespace getVariable [format["ltdData_%1",_id],[]];
_dataCompany params ["_owner","_name","_bank","_members"];

if !((getPlayerUID player) isEqualTo _owner) then
{
	{
		private _ctrl = _display displayCtrl _x;
		_ctrl ctrlShow false;
	}forEach [9403,9404,9408,9409];
	
	_delComp ctrlSetText "Покинуть компанию";
	_delComp ctrlSetEventHandler ["ButtonClick","[] spawn RRPClient_ltd_leaveFromCompany"];
};

_status ctrlSetStructuredText parseText format [
	"
		<t color='#FFFFFF'><t size='1.2'>%1</t>
		<br/>
		<t size='1'>Баланс: $%2
		<br/>
		Сотрудников: %3
		<br/>
		Магазинов: %4
		</t>
		</t>
	",
	_name,[_bank] call RRPClient_util_numberText,((count _members) -1),(count RRPClient_NetID_Stores)
];

lbClear _allPlr;
{
	if (!(_x call getSide isEqualTo "cop") OR !(_x call getSide isEqualTo "med")) then
	{
		_name = _x getVariable ["realname",""];
		_allPlr lbAdd format["%1", _name];
		_allPlr lbSetdata [(lbSize _allPlr)-1,netId _x];
	};
} forEach allPlayers;
lbSort [_allPlr,"ASC"];

lbClear _memberList;
_text = "";
{
	_name = _x select 0;
	_playerUID = _x select 1;
	_text = format ["%1 (%2)",_name, _playerUID];
	_index = _memberList lbAdd _text;
	_memberList lbSetData [_index,_playerUID];
	
	if (_playerUID isEqualTo _owner) then
	{
		_memberList lbSetColor [_forEachIndex, [0/255, 178/255, 205/255, 1]];
	};
} forEach _members;
lbSort [_memberList,"ASC"];