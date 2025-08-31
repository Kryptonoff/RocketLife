/*
	Project: Smart house system
	Author: FairyTale5571
	License: CC BY-ND
*/

disableSerialization;

private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 22000;

_listBox = _this select 0;
_index = _this select 1;
private _house = objectFromNetId (_listBox lbData _index);
RRPClientSelectedHouse = _house;
private _memberList = 	_slide controlsGroupCtrl 22002;
private _sellBtn = 		_slide controlsGroupCtrl 22003;
private _upgradeBtn = 	_slide controlsGroupCtrl 22004;
private _kickBtn = 		_slide controlsGroupCtrl 22005;
private _inviteBtn = 	_slide controlsGroupCtrl 22006;
private _houseCombo = 	_slide controlsGroupCtrl 22007;
private _payTimeText = 	_slide controlsGroupCtrl 22008;
private _payBtn = 		_slide controlsGroupCtrl 22009;
private _lightsBtn = 	_slide controlsGroupCtrl 22010;
private _secBtn = 		_slide controlsGroupCtrl 22011;
private _trunkBtn = 	_slide controlsGroupCtrl 22012;
private _listAllPlayer =_slide controlsGroupCtrl 22013;
private _setNameBtn = 	_slide controlsGroupCtrl 22014;
private _setNameBox = 	_slide controlsGroupCtrl 22015;
_numberCrates = 0;
_secCost = 0;
private _numberCrates = getNumber (missionConfigFile >> "LifeCfgHousing" >> worldName >> typeOf _house >> "numberCrates");
private _secCost = getNumber(missionConfigFile >> "LifeCfgHousing" >> worldName >> typeOf _house >> "securityCost");

_name = _house getVariable ["house_name",""];
_puid = getPlayerUID player;
_date = [(_house getVariable ["HouseMaintanceDate",[0,0,0,0,0,0]])] call RRPClient_util_dateToString;
_payTimeText ctrlSetStructuredText parseText (format ["<t size='.8'>ДАТА ОПЛАТЫ: %1</t>",_date]);

_cost = round(getNumber(missionConfigFile >> "LifeCfgHousing" >> worldName >> typeOf _house >> "price") * 0.02);
_neigh = _house getVariable ["Neighs",[]];

if (_house getVariable ["security",false]) then
{
	_cost = ['priceSell',((_secCost / 8) + _cost) * count _neigh] call RRPClient_system_VIP;
}else{
	_cost = ['priceSell',_cost * count _neigh] call RRPClient_system_VIP;
};

_houseOwner = (_house getVariable "house_owner") select 0;
_house setVariable ["cost_house",_cost];
if !(getPlayerUID player isEqualTo _houseOwner) then {_cost = _cost * 2;};
_house_box = _house getVariable ["house_box",objNull];
_house_box_slots = _house_box getVariable ["house_box_slots",0];
_text = [_house_box_slots,"ЗАКРЫТО"] select (isNull _house_box);
_houseInform ctrlSetStructuredText parseText (format ["Слотов: %1 | К оплате: %2$",_text,[_cost] call RRPClient_util_numberText]);
_house call RRPClient_houses_fillNeighsCtrl;
if (isNull (_house getVariable ["lightSource",ObjNull])) then
{
	_lightsBtn ctrlSetText "Освещение ВКЛ";
} else {
	_lightsBtn ctrlSetText "Освещение ВЫКЛ";
};

if (!isNull _house_box) then {
	if (_house_box_slots < _numberCrates) then {
		_upgradeBtn ctrlEnable true;
	} else {
		_upgradeBtn ctrlEnable false;
	};
} else {_upgradeBtn ctrlEnable false;};
if (_houseOwner != _puid) then
{
	_sellBtn ctrlSetText "Уйти из дома!";
	_sellBtn ctrlSetEventHandler ["ButtonClick","call RRPClient_houses_leaveFromHouse; closeDialog 0;"];

	_kickBtn ctrlEnable false;
	_inviteBtn ctrlEnable false;
	_setNameBox ctrlEnable false;
	_setNameBtn ctrlEnable false;
};
_payBtn ctrlEnable (if !(_house getVariable ["PayTimeDude",false]) then { false }else{ true });
private _canGarage = (getNumber (missionConfigFile >> "LifeCfgHousing" >> worldName >> typeOf RRPClientSelectedHouse >> "canGarage") isEqualTo 1);
_secBtn ctrlEnable (if (_numberCrates isEqualTo 0 OR _canGarage) then { false }else{ true });

if (_house getVariable ["locked",false]) then
{
	_trunkBtn ctrlSetText "Хранилище ОТКР";
} else {
	_trunkBtn ctrlSetText "Хранилище ЗАКР";
};

if (_house getVariable ["security",false]) then
{
	_secBtn ctrlSetText "УБРАТЬ ОХРАНУ";
}else{
	_secBtn ctrlSetText "УСТАНОВИТЬ ОХРАНУ";
};
