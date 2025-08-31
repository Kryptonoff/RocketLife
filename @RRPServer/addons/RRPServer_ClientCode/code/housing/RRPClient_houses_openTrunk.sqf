/*
	Project: Smart house system
	Author: FairyTale5571
	License: CC BY-ND
*/
try{
	disableSerialization;
	private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
	private _mainGroup = _display displayCtrl 24001;
	private _slide = _mainGroup controlsGroupCtrl 22000;

	private _upgradeBtn = _slide controlsGroupCtrl 22004;
	private _houseInform = _slide controlsGroupCtrl 9008;
	private _houseDropdown = _slide controlsGroupCtrl 22007;
	private _netID = _houseDropdown lbData (lbCurSel _houseDropdown);
	private _house = objectFromNetId _netID;
	private _trunkBtn = 	_slide controlsGroupCtrl 22012;
	if (isNull _house OR {!(_house isKindOf "House_F")}) exitWith {};
	if (isNil {_house getVariable "house_owner"}) exitWith {};
	if !(_house in life_vehicles OR _house in life_tempHouses) throw "У вас нет ключей от дома";
	private _house_box = _house getVariable ["house_box",objNull];
	if (!isNull _house_box && {[_house_box] call RRPClient_system_isTrunkInUse}) throw "Хранилище используется";
	_cost = _house getVariable ["cost_house",0];
	_uid = (_house getVariable "house_owner") select 0;
	if !(getPlayerUID player isEqualTo _uid) then {_cost = _cost * 4;};

	if (_house getVariable ["locked",false]) then 
	{
		_uid = (_house getVariable "house_owner") select 0;
		_neighs = _house getVariable ["Neighs",[]];
		if (getNumber(missionConfigFile >> "LifeCfgHousing" >> worldName >> typeOf _house >> "numberCrates") isEqualTo 0) throw "В доме нет слотов, нельзя открыть хранилище!";
		if (_house getVariable ["trunk_opened",false]) throw "Хранилище уже открыто!";
		if !(getPlayerUID player in _neighs) throw "Ты кто такой? Давай до свидания!";
		[_house,player] remoteExec ["RRPServer_house_unlockHouseContainer",2];
		_upgradeBtn ctrlEnable true;
		_house setVariable ["trunk_opened",true,true];
		_house setVariable ["locked",false,true];
		_trunkBtn ctrlSetText "Закрыть хранилище";
		_house_box = _house getVariable ["house_box",objNull];
		_house_box_slots = _house_box getVariable ["house_box_slots",0];
		_houseInform ctrlSetText format ["Слотов: %1 | К оплате: %2$",_house_box_slots,[_cost] call RRPClient_util_numberText];
		["SuccessTitleAndText",["Мой дом","Хранилище открыто"]] call toast;

	} else {
		if !(_house getVariable ["trunk_opened",false]) throw "Хранилище уже закрыто";
		if (!isNull _house_box) then {deleteVehicle _house_box;};
		[_house,"house_box"] call RRPClient_system_clearGlobalVar;
		_house setVariable ["locked",true,true];
		_house setVariable ["trunk_opened",false,true];
		_upgradeBtn ctrlEnable false;
		_trunkBtn ctrlSetText "Открыть хранилище";
		_houseInform ctrlSetText format ["Слотов: %1 | К оплате: %2$","ЗАКРЫТО",_cost];
		(format ["setStatusContainer:0:%1",_house getVariable ["house_id",-1]]) remoteExecCall ["RRPServer_DB_fireAndForget",2];
		["SuccessTitleAndText",["Мой дом","Хранилище заблокировано"]] call toast;
	};
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};