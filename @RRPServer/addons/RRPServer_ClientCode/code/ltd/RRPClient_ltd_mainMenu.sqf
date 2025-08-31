/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if (RRPClientLTDsData isEqualTo []) exitWith {["ErrorTitleOnly", [_exception]] call SmartClient_gui_toaster_addTemplateToast;};
disableSerialization;
createDialog "RRPDialogCompanyMenu";
private 				_display = uiNamespace getVariable ["RRPDialogCompanyMenu",displayNull];
ctrlSetText [7301, getText (missionConfigFile >> "LifeCfgPadSkins" >> life_myPadSkinID >> "image")];
private _status = 		_display displayCtrl 9410;
private _memberList = 	_display displayCtrl 9418;
private _infList = 		_display displayCtrl 9424;
private _allPlr = 		_display displayCtrl 9409;
private _storeList = 	_display displayCtrl 9411;
private _discountList = _display displayCtrl 9415;
private _delComp = 		_display displayCtrl 9412;
lbClear _memberList;

{
	private _ctrl = _display displayCtrl _x;
	_ctrl ctrlShow false;
}forEach [9425,9426,9427];

RRPClientLTDsData params ["_id","_name"];
_dataCompany = missionNamespace getVariable [format["ltdData_%1",_id],[]];
_dataCompany params ["_owner","_name","_bank","_members"];
["RRPDialogCompanyMenu",[9402,9405,9406,9407,9413,9414,9415,9416,9417,9420,9421,9422,9424]] spawn RRPClient_gui_util_hideControls;

if !((getPlayerUID player) isEqualTo _owner) then
{
	{
		private _ctrl = _display displayCtrl _x;
		_ctrl ctrlShow false;
	}forEach [9403,9404,9408,9409];
	_delComp ctrlSetText "Покинуть компанию";
	_delComp ctrlSetEventHandler ["ButtonClick","[] spawn RRPClient_ltd_leaveFromCompany"];
};

RRPClient_NetID_Stores = [];
{
	_idOwner = _x getVariable ["ltdOwner",0];
	if (_id isEqualTo _idOwner) then 
	{
		RRPClient_NetID_Stores pushBack (netId _x);
	};	
}forEach allMissionObjects "LtdsStore";


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
		_name = name _x;
		_allPlr lbAdd format["%1", _name];
		_allPlr lbSetdata [(lbSize _allPlr)-1,netId _x];
	};
} forEach allPlayers;
lbSort [_allPlr,"ASC"];

lbClear _storeList;
{
	if !(_x isEqualTo "") then
	{
		_store = objectFromNetId _x;
		_name = _store getVariable ["ltdName",""];
		_index = _storeList lbAdd _name;
		_storeList lbSetData [_index,_x];
	};
} forEach RRPClient_NetID_Stores;

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

lbClear _discountList;
for "_i" from 1 to 7 step 1 do
{
	_discountList lbAdd format ["На %1 суток",_i];
	_discountList lbSetData [(lbSize _discountList)-1,str(_i)];
};
