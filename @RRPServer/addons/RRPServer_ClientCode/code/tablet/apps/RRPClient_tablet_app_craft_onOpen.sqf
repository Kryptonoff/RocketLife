private ["_index_r","_ThemeName","_subThemeName","_displayName","_itemInfo","_index_q","_index_w","_index_e","_curcheald","_category","_curRecipe","_cheald","_curSelection","_ctrlTree","_display","_ctrlnotification","_ctrldesc","_ctrlBtn","_title","_ctrlEdit","_ctrlframe","_ctrlTRecipe","_ctrlImage","_ctrlExitBtn","_ctrlExitImg" ];

disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 33000;

_ctrlnotification  = _slide controlsGroupCtrl 2515;
_ctrlTree    = _slide controlsGroupCtrl 646;
_ctrlEdit    = _slide controlsGroupCtrl 2512;
_ctrlBtn     = _slide controlsGroupCtrl 2508;
_ctrldesc    = _slide controlsGroupCtrl 2516;
_ctrlTRecipe = _slide controlsGroupCtrl 2513;
_ctrlImage 	 = _slide controlsGroupCtrl	2506;
_ctrlBtn ctrlEnable false;

_ctrldesc ctrlSetFont "SFCompactText";

_ctrldesc ctrlSetStructuredText parseText "<t size='1' align='center'  font='SFCompactText' >Крафт - означает возможность создать один предмет с помощью нескольких других. Данная система позволит создавать продукты питания, одежду, оружие, медецинские препараты и много других полезных вещей. Посмотрите на список слева чтобы ознакомится со всеми рецептами!</t>";

private _getImage = {
	_itemInfo    = [_this] call RRPClient_util_itemDetails;
	(_itemInfo select 2)
};
tvClear _ctrlTree;
{
	_curSelection = configName _x;
	_cheald 	 = [(missionconfigFile >> "LifeSettingCrafting" >> "CraftingTree" >> _curSelection), 1 ] call BIS_fnc_returnChildren;
	_ThemeName = getText(missionconfigFile >> "LifeSettingCrafting" >> "CraftingTree" >> _curSelection >> "name");
	_index_w 	 = _ctrlTree tvAdd [[], _ThemeName];
	{
		_curcheald    = configName _x;
		_subThemeName = getText(missionconfigFile >> "LifeSettingCrafting" >> "CraftingTree" >> _curSelection >> _curcheald >> "name");
		_index_e      =_ctrlTree tvAdd [[_index_w], _subThemeName];
		{
			_curRecipe = configName _x;
			_category  = getText(missionconfigfile >> "LifeCfgRecipes" >> _curRecipe >> "category");
			if (_curcheald isEqualTo _category) then {
				_itemInfo = [(getText(missionconfigfile >> "LifeCfgRecipes" >> _curRecipe >> "finalItem"))] call RRPClient_util_itemDetails;
				if !(_itemInfo isEqualTo [] ) then {
					_displayName = _itemInfo select 1;
					_index_r = _ctrlTree tvAdd [[_index_w,_index_e], _displayName];
					_ctrlTree tvSetData [[_index_w,_index_e,_index_r], _curRecipe];
					_ctrlTree tvSetPicture [[_index_w,_index_e,_index_r], (getText(missionconfigfile >> "LifeCfgRecipes" >> _curRecipe >> "finalItem")) call _getImage];
					str ((getText(missionconfigfile >> "LifeCfgRecipes" >> _curRecipe >> "finalItem")) call _getImage) call debugConsole;
				} else {format ["Ошибка! Рецепт %1 не найден",_curRecipe] call chat};
			};
		} forEach  ("true" configClasses (missionconfigFile >> "LifeCfgRecipes"));
	} forEach  _cheald;
} forEach ("true" configClasses (missionconfigFile >> "LifeSettingCrafting" >> "CraftingTree"));

_ctrlTree ctrlAddEventHandler ["TreeSelChanged", {_this call RRPClient_crafting_onLBselCurRecipe}];
