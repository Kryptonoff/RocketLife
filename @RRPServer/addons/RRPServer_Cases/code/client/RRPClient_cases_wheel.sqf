if !(canSuspend) exitWith {_this spawn RRPClient_cases_wheel};
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 39200;
if (isNull _display) exitWith {};
if !(isNil "RRPClientWaitCase") exitWith {};
params [["_id",-1]];
if (_id isEqualTo -1) exitWith {};
RRPClientWaitCase = true;
private _lootBoxesBackgroundGroup = _display displayCtrl 39206;
private _lootBoxItemsLineGroup = _lootBoxesBackgroundGroup controlsGroupCtrl 39207;
_lootBoxItemsLineGroup ctrlSetPositionX 0;
_lootBoxItemsLineGroup ctrlCommit 0;
{ctrlDelete _x} forEach (allControls _lootBoxItemsLineGroup);

private _openLootBox = _display displayCtrl 39205;
_openLootBox ctrlEnable false;

private _case = _display getVariable ["CaseSelected",createHashMap];
private _caseCfg = missionConfigFile >> "CfgCases" >> (_case get "class");
private _caseItems = getArray(_caseCfg >> "items");

private _itemsHashMap = _caseItems createHashMapFromArray [];
{
	_itemsHashMap set [_x, getNumber(missionConfigFile >> "CfgCasesItems" >> _x >> "chance")];
} forEach _itemsHashMap;

private _chance = random 100;

private _closestChance = 101;
private _wonItem = "";
{
	if (_chance < _y AND _closestChance > _y) then {_closestChance = _y; _wonItem = _x};
} forEach _itemsHashMap;

private _itemsWithOneChance = [];
{
  if (_y isEqualTo _closestChance) then {_itemsWithOneChance pushBack _x};
} forEach _itemsHashMap;

_wonItem = selectRandom _itemsWithOneChance;

[_wonItem, player, getText(missionConfigFile >> "CfgCasesItems" >> _wonItem >> "quality"), _id] remoteExecCall ["RRPServer_case_giveWin",2];


for "_i" from 0 to 100 do {
	_lootBoxItem = _display ctrlCreate ["CaseLootboxItem", -1, _lootBoxItemsLineGroup];
	_lootBoxItemBackgroundCtrl = _lootBoxItem controlsGroupCtrl 1000;
	_lootBoxItemTextCtrl = _lootBoxItem controlsGroupCtrl 1001;
	_lootBoxItemImageCtrl = _lootBoxItem controlsGroupCtrl 1002;

	_lootBoxItem ctrlSetPositionX (0.14 * _i);
	_lootBoxItem ctrlCommit 0;

	_item = [_wonItem, selectRandom _caseItems] select (_i isNotEqualTo 95);
	
	_lootBoxItemQuality = getText(missionConfigFile >> "CfgCasesItems" >> _item >> "quality");
	_lootBoxItemName = getText(missionConfigFile >> "CfgCasesItems" >> _item >> "name");
	_lootBoxItemImage = getText(missionConfigFile >> "CfgCasesItems" >> _item >> "image");
	_lootBoxItemBackgroundCtrl ctrlSetText format ["\rimas_agent\assets\cases\gradients\%1.paa",_lootBoxItemQuality];
	_lootBoxItemTextCtrl ctrlSetStructuredText parseText format ["<t align='center' size='0.6'>%1</t>",_lootBoxItemName];
	_lootBoxItemImageCtrl ctrlSetText _lootBoxItemImage;
};

private _finishPos = (-13.01 - random (0.11));
_lootBoxItemsLineGroup ctrlSetPositionX _finishPos;
_lootBoxItemsLineGroup ctrlCommit 5;
uiSleep 2.5;

for "_i" from 1 to 8 do {
	_lootBoxItemsLineGroup ctrlSetPositionX _finishPos;
	_lootBoxItemsLineGroup ctrlCommit 2;
	uiSleep 0.5;
};

uiSleep 2;
_openLootBox ctrlEnable true;
RRPClientWaitCase = nil;
