disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 39200;

private _case = _display getVariable ["CaseSelected",createHashMap]; 

private _backButton = _mainGroup controlsGroupCtrl 39201;
_backButton ctrlRemoveAllEventHandlers "ButtonClick";
_backButton ctrlAddEventHandler ["ButtonClick", {[RRPClientBackButton,0] call RRPClient_tablet_slide}];
private _openButton = _mainGroup controlsGroupCtrl 39205;
_openButton ctrlRemoveAllEventHandlers "ButtonClick";
_openButton ctrlAddEventHandler ["ButtonClick", format ["[""request"",""%1""] call RRPClient_cases_openCase", _case get "type"]];

private _caseNameCtrl = _slide controlsGroupCtrl 39202;
private _caseDescCtrlGroup = _slide controlsGroupCtrl 39203;
private _caseDescCtrl = _caseDescCtrlGroup controlsGroupCtrl 39204;
private _caseImageCtrl = _slide controlsGroupCtrl 39208;

private _openButton = _slide controlsGroupCtrl 39205;

private _wheel = _slide controlsGroupCtrl 39206;
private _wheelItems = _wheel controlsGroupCtrl 39207; 
private _config = getMissionConfig "CfgCases" >> (_case getOrDefault ["class","case_1"]);
private _price = (_case getOrDefault ["cost",0]);
private _currency = (_case getOrDefault ["currency","RC"]);

_caseImageCtrl ctrlSetText (getText(_config >> "image"));
private _caseName = getText (_config >> "displayName");
_caseNameCtrl ctrlSetStructuredText parseText format ["<t align='center' size='1.5' color='#ffffff'>%1</t>",_caseName];

private _text = format ["<t align='center'>Содержимое кейса <t underline='1'>%1</t></t><br/>",_caseName];
if ((_case get "type") isNotEqualTo "owned") then 
{
	_text = _text + format ["<t align='center'>Стоимость кейса -  <t underline='1'>%1 %2</t></t><br/>",[_price] call RRPClient_util_numberText,_currency];
};

// sort items by chance
private _items = getArray (_config >> "items");
_items = _items apply {[_x,getNumber (getMissionConfig "CfgCasesItems" >> _x >> "chance")]};
_items = [_items, 1, true] call CBA_fnc_sortNestedArray;

{
	_x params ["_item","_chance"];
	_cfg = getMissionConfig "CfgCasesItems" >> _item;
	_text = _text + format ["<t underline='1' size='.8'><t align='left'>%1</t><t align='right'>%2%3</t></t><br/>",
		getText (_cfg >> "name"),
		_chance,
		"%"
	];
} forEach _items;

_caseDescCtrl ctrlSetStructuredText parseText _text;
_positionText = ctrlPosition _caseDescCtrl;
_hText = ctrlTextHeight _caseDescCtrl;
_caseDescCtrl ctrlSetPositionH _hText;
_caseDescCtrl ctrlCommit 0;

_wheelItems ctrlSetPositionX 0;
_wheelItems ctrlCommit 0;
{ctrlDelete _x} forEach (allControls _wheelItems);

private _caseItems = getArray(_config >> "items");

for "_i" from 0 to 100 do {
	_lootBoxItem = _display ctrlCreate ["CaseLootboxItem", -1, _wheelItems];
	_lootBoxItemBackgroundCtrl = _lootBoxItem controlsGroupCtrl 1000;
	_lootBoxItemTextCtrl = _lootBoxItem controlsGroupCtrl 1001;
	_lootBoxItemImageCtrl = _lootBoxItem controlsGroupCtrl 1002;

	_lootBoxItem ctrlSetPositionX (0.14 * _i);
	_lootBoxItem ctrlCommit 0;

	_item = selectRandom _caseItems;
	_lootBoxItemQuality = getText(missionConfigFile >> "CfgCasesItems" >> _item >> "quality");
	_lootBoxItemName = getText(missionConfigFile >> "CfgCasesItems" >> _item >> "name");
	_lootBoxItemImage = getText(missionConfigFile >> "CfgCasesItems" >> _item >> "image");
	_lootBoxItemBackgroundCtrl ctrlSetText format ["\rimas_agent\assets\cases\gradients\%1.paa",_lootBoxItemQuality];
	_lootBoxItemTextCtrl ctrlSetStructuredText parseText format ["<t align='center' size='0.6'>%1</t>",_lootBoxItemName];
	_lootBoxItemImageCtrl ctrlSetText _lootBoxItemImage;
};

private _finishPos = (-13.01 - random (0.11));
_wheelItems ctrlSetPositionX _finishPos;
_wheelItems ctrlCommit 500;
