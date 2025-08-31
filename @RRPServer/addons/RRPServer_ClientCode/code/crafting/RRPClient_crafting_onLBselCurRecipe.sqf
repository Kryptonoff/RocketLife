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
private ['_itemInfo','_selectionPath','_display','_ctrldesc','_title','_CurCfgName','_typeItem','_desciption','_finalItem','_displayName','_image','_ctrlimage','_ctrlEdit','_recipe','_ctrlnotif','_Welctitle','_timeAction'];

disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 33000;

_selectionPath = _this select 1;

_ctrldesc   = _slide controlsGroupCtrl 2507;
_ctrlimage  = _slide controlsGroupCtrl 2506;
_ctrlEdit   = _slide controlsGroupCtrl 2512;
_ctrlnotif  = _slide controlsGroupCtrl 2516;
_Welctitle  = _slide controlsGroupCtrl 2517;
_CurCfgName = (_slide controlsGroupCtrl 646) tvData _selectionPath;
if (_CurCfgName isEqualTo '') exitWith {};
{
	[_display, _x, ctrlPosition _x, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;
} forEach (allControls _display);

{
	[_display, _x, ctrlPosition _x, 1, 0.5] call RRPClient_gui_util_animateAllCtrl;
} forEach [_ctrlnotif,_Welctitle];

_typeItem   = getText(missionconfigfile >> 'LifeCfgRecipes' >> _CurCfgName >> 'typeItem');
_finalItem  = getText(missionconfigfile >> 'LifeCfgRecipes' >> _CurCfgName >> 'finalItem');
_desciption = getText(missionconfigfile >> 'LifeCfgRecipes' >> _CurCfgName >> 'desctiption');
_recipe     = getArray(missionconfigfile >> 'LifeCfgRecipes' >> _CurCfgName >> 'recipe');
_timeAction = getNumber(missionconfigfile >> 'LifeCfgRecipes' >> _CurCfgName >> 'timeAction');
_displayName = getText(missionconfigfile >> 'LifeCfgRecipes' >> _CurCfgName >> 'displayName');



if (_typeItem isEqualto 'virtual') then {
  _displayName = if !(_displayName isEqualTo "") then {_displayName} else {(getText(missionconfigfile >> 'VirtualItems' >> _finalItem >> 'displayName'))};
  _image       = getText(missionConfigFile >> 'VirtualItems' >> _finalItem >> 'icon');
} else {
  _itemInfo    = [_finalItem] call RRPClient_util_itemDetails;
	_displayName = if !(_displayName isEqualTo "") then {_displayName} else {_itemInfo # 1};
  _image       = _itemInfo # 2;
};

_ctrldesc ctrlSetStructuredText parseText format ['<t size=''0.85'' align=''center'' font=''RobotoCondensedLight''> %1 </t>',_desciption];
_ctrlimage ctrlSetText _image;
_ctrlEdit  ctrlSetText '1';
uiNamespace setVariable ['CraftnigRecipe',_recipe];
uiNamespace setVariable ['curItemInfo',[_displayName,_CurCfgName,_typeItem,_finalItem,_timeAction]];

call RRPClient_crafting_updateRecipe;
call RRPClient_crafting_updateLBrequiredItems;
