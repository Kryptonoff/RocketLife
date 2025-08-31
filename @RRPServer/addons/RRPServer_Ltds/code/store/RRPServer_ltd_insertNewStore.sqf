/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params
[
	["_data",[],[[]]],
	["_store",objNull,[objNull]],
	["_player",objNull,[objNull]],
	["_id",0,[0]]
];

try
{
	if (isNull _store) throw "Store NUUUL";
	if (isNull _player) throw "Player NUUUL";
	if (_data isEqualTo []) throw "Данные магазина не были получены";
	if (_id isEqualTo 0) throw "LTD Error";
	private _hash = missionNamespace getVariable [format ["ltdData_%1",_id],[]];
	if (_hash isEqualTo []) throw "Какие-то проблемы с компанией!";
	
	_className = (_data select 0) select 0;
	_license = (_data select 0) select 1;
	_name = _data select 1;
	
	if (_name isEqualTo "") throw "Нет имени магазина!";
	if (_license isEqualTo "") throw "Какие-то проблемы с лицензией магазина!";
	
	_store setVariable ["ltdName",_name,true];
	_store setVariable ["ltdLicense",_license,true];
	_store setVariable ["ltdOwner",_id,true];
	_store setVariable ["ltdTax",3,true];
	_store setVariable ["ltdActive",true,true];
	_store setVariable ["ltdPayedUntil",["Day",30] call RRPServer_util_addDate,true];
	_store setVariable ["ltdMaxGds",20,true];
	_store setVariable ["ltdDiscount",0,true];
	_store setVariable ["ltdDiscountDate",[],true];
	_store setVariable ["ltdMode",true,true];
	
	_position = getPosATL _store;
	_vectorDir = vectorDir _store;
	_vectorUp = vectorUp _store;
	_data = 
	[
		_name,
		_id,
		_license,
		typeOf _store,
		_position,
		_vectorDir,
		_vectorUp
	];	
	_message = ["insertNewStore",_data] call RRPServer_DB_createMessage;
	_insert = _message call RRPServer_DB_insertSingle;
	
	_store setVariable ["ltdID",_insert,true];
	
	private _marker = createMarker [format ["LTDStore_%1",_insert],getPos _store];
	_marker setMarkerText format["%1",_name];
	_marker setMarkerType "welmen_shop_grey_local_business";
	[true] remoteExecCall ["RRPClient_ltd_placeStoreResponse",_player];
	[_store,[format ["%1",(_store getVariable ["ltdName",""])],RRPClient_ltd_shopMenu,"",0,false,false,"","(!isNull cursorObject) && (isNull objectParent player) && (cursorObject isKindOf 'LtdsStore')"]] remoteExecCall ["addAction",-2,"ActionLTD"];
		
}catch{
	_exception call RRPServer_util_log;
	["ErrorTitleAndText", ["Отказ",_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	deleteVehicle _store;
};