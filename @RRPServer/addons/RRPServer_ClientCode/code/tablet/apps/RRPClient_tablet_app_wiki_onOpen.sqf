
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 20000;

private _tree = _slide controlsGroupCtrl 20006;
private _itemTitle = _slide controlsGroupCtrl 20007;
_itemTitle ctrlSetStructuredText parseText format ["<t size='1.5'>%1</t>", "RimasWiki"];

tvClear _tree;

{
	_index = _tree tvAdd [[],getText(_x >> "displayName")];
	
	{
		_category = _tree tvAdd [[_index],getText(_x >> "displayName")];
		{
			_x params ["_icon","_title","_text"];
			_item = _tree tvAdd [[_index,_category],_title];
			_tree tvSetPicture [[_index,_category,_item], _icon];
			_tree tvSetData [[_index,_category,_item], str[_title, _text]];
		} forEach (getArray(_x >> "pages"));
	} forEach ("true" configClasses _x);
} forEach ("true" configClasses (getMissionConfig "CfgWiki"));

_tree ctrlRemoveAllEventHandlers "TreeSelChanged";
_tree ctrlAddEventHandler ["TreeSelChanged",{
	params ["_control", "_selectionPath"];
	disableSerialization;
	private _display = ctrlParent _control;
	private _mainGroup = _display displayCtrl 24001;
	private _slide = _mainGroup controlsGroupCtrl 20000;
	private _itemText = (_slide controlsGroupCtrl 20005) controlsGroupCtrl 20015;
	private _titleCtrl = _slide controlsGroupCtrl 20007;
	private _ctrlData = (_control tvData _selectionPath);
	if (_ctrlData isEqualTo "") exitWith {};
	_ctrlData = parseSimpleArray (_control tvData _selectionPath);
	_ctrlData params ["_title","_text"];
	private _pos = ctrlPosition _itemText;
	_pos params ["_dx", "_dy", "_dw", "_dh"];
	[_itemText,_titleCtrl] apply {
		_x ctrlSetFade 1;
		_x ctrlCommit 0;
		_itemText ctrlSetStructuredText parseText format ["<br/><t size='1.2'>%1</t>", _text];
		_titleCtrl ctrlSetStructuredText parseText format ["<t size='1.5'>%1</t>", _title];
		_height = ctrlTextHeight _itemText;
		_itemText ctrlSetPositionH _height;
		_x ctrlSetFade 0;
		_x ctrlCommit 0.35;
	};
}];
