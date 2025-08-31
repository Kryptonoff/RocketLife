/*
    Author(s):
    Arrra (original)
    ----
    Сontacts:
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd
*/
private ['_display','_ctrlLb','_amountFinalItem','_finalItemName','_rRecipe','_Readiness','_condition','_conditionmsg','_conditionCompile','_CurCfgName','_curItem','_needetItem','_ctrlBtn','_readyToCreate',"_amountCoef"];

disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 33000;

_rRecipe = uiNamespace getVariable ['ReadyRecipes',[[]]];
_curItem = uiNamespace getVariable ['curItemInfo',[[]]];
_ctrlLb  = _slide controlsGroupCtrl 2505;
_ctrlBtn = _slide controlsGroupCtrl 2508;
_readyToCreate = true;
_ctrlBtn ctrlEnable false;

_Readiness     = _rRecipe select 1;
_finalItemName = _curItem select 0;
_CurCfgName    = _curItem select 1;
_condition     = getText(missionconfigfile >> 'LifeCfgRecipes' >> _CurCfgName >> 'conditions');
_conditionmsg  = getText(missionconfigfile >> 'LifeCfgRecipes' >> _CurCfgName >> 'conditionsMessage');
_amountCoef 	 = getNumber(missionconfigfile >> 'LifeCfgRecipes' >> _CurCfgName >> 'amount');

_amountFinalItem = _rRecipe select 2;
_rRecipe pushBack _amountCoef;

lbClear _ctrlLb;

private ['_item','_type','_amount','_displayName','_image','_itemInfo','_index',"_isPretty"];
{
	_type 		= _x select 0;
	_item 		= _x select 1;
	_amount 	= _x select 2;
	_isPretty = _x select 3;

	if (_type isEqualto 'virtual') then {
	  _displayName = (getText(missionconfigfile >> 'VirtualItems' >> _item >> 'displayName'));
	  _image       = getText(missionConfigFile >> 'VirtualItems' >> _item >> 'icon');
	} else {
	  _itemInfo    = [_item] call RRPClient_util_itemDetails;
	  _displayName = _itemInfo select 1;
	  _image       = _itemInfo select 2;
	};

	_index = _ctrlLb lbAdd _displayName;
	_ctrlLb lbSetPicture [_index,_image];

	if (_isPretty isEqualTo "ready") then {
			_ctrlLb lbSetTextRight [_index,format ["%1шт",_amount]];
			_ctrlLb lbSetTooltip [_index, "Достаточно"]

		} else {
			_ctrlLb lbSetTextRight [_index,format ["Нужно - %1шт",_amount]];
			_ctrlLb lbSetTooltip [_index, "Недостаточно"];
	};
} forEach (_rRecipe select 0);

if (_Readiness isEqualto 'ready') then {
	[ format ['Вы можете создать в кол-ве %2 ед.',_finalItemName,(_amountFinalItem * _amountCoef)],true] call RRPClient_crafting_GUInotification;
} else {
	[format['Для создания %1шт «%2»‎, недостаточно следующих компонентов...',(_amountFinalItem * _amountCoef),_finalItemName],false] call RRPClient_crafting_GUInotification;
	_readyToCreate = false;
};

if !(_condition isEqualTo '') then {
	_conditionCompile = compile _condition;
	if !(call _conditionCompile) then {
		[_conditionmsg,false] call RRPClient_crafting_GUInotification;
		_readyToCreate = false;
	};
};

_needetItem = _CurCfgName call RRPClient_crafting_getRequiredItems;
if !(_needetItem isEqualto '') then {
		[format ['Требуется: %1',_needetItem],false] call RRPClient_crafting_GUInotification;
		_readyToCreate = false;
};

if (_readyToCreate) then {_ctrlBtn ctrlEnable true};
