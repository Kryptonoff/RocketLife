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
private ["_index_r","_ThemeName","_subThemeName","_displayName","_itemInfo","_index_q","_index_w","_index_e","_curcheald","_category","_curRecipe","_cheald","_curSelection","_ctrlTree","_display","_ctrlnotification","_ctrldesc","_ctrlBtn","_title","_ctrlEdit","_ctrlframe","_ctrlTRecipe","_ctrlImage","_ctrlExitBtn","_ctrlExitImg" ];
if !(createDialog "RRPCraftingMenu") exitWith {};
_display  = uiNamespace getVariable ["RRPCraftingMenu",displayNull];
_ctrlnotification  = _display displayCtrl 2515;
_ctrlTree  = _display displayCtrl 2518;
_title       = _display displayCtrl 2517;
_ctrlEdit    = _display displayCtrl 2512;
_ctrlBtn     = _display displayCtrl 2508;
_ctrldesc    = _display displayCtrl 2516;
_ctrlframe   = _display displayCtrl 2510;
_ctrlTRecipe = _display displayCtrl 2513;
_ctrlImage 	 = _display displayCtrl	2506;
_ctrlExitBtn = _display displayCtrl	2501;
_ctrlExitImg = _display displayCtrl	2502;
_ctrlBtn ctrlEnable false;

_ctrlTRecipe ctrlSetFont "gtav";
_title ctrlSetFont "gtav";
_ctrldesc ctrlSetFont "RobotoCondensedLight";

_ctrlImage 	 ctrlSetPosition 	[ 0.520937 * safezoneW + safezoneX , 0.2970 * safezoneH + safezoneY , 0.108281 * safezoneW , 0.143 * safezoneH ];
_ctrlExitBtn ctrlSetPosition [ 0.689 * safezoneW + safezoneX ,0.225 * safezoneH + safezoneY , 0.020625 * safezoneW ,0.033 * safezoneH ];
_ctrlExitImg ctrlSetPosition [ 0.689 * safezoneW + safezoneX ,0.225 * safezoneH + safezoneY , 0.020625 * safezoneW ,0.033 * safezoneH ];

{
	[_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
} forEach (allControls _display);

{
	if !(_x in [_ctrlnotification,_ctrlBtn,_ctrlEdit,_ctrlframe,_ctrlTRecipe]) then {
		[_display, _x, ctrlPosition _x, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;
	}
} forEach (allControls _display);

_title ctrlSetText format ["Привет, %1",player call getNickName];
_ctrldesc ctrlSetStructuredText parseText "<t size='1' align='center'  font='RobotoCondensedLight' >Крафт - означает возможность создать один предмет с помощью нескольких других. Данная система позволит создавать продукты питания, одежду, оружие, медецинские препараты и много других полезных вещей. Посмотрите на список слева чтобы ознакомится со всеми рецептами!</t>";

_ctrlTree = _display ctrlCreate [ "RscTreeSearch" , 646];
_ctrlTree ctrlSetFont  "RobotoCondensed" ;
_ctrlTree ctrlSetFontHeight 0.03;
_ctrlTree ctrlSetPosition [ 0.298906 * safezoneW + safezoneX , 0.302 * safezoneH + safezoneY , 0.149531 * safezoneW , 0.462 * safezoneH ];
_ctrlTree ctrlSetBackgroundColor [0,0,0,1];
_ctrlTree ctrlCommit 0;
_ctrlTree ctrlSetBackgroundColor [0,0,0,0];
_ctrlTree ctrlSetTextColor [1,1,1,1];

_ctrlFrame = _display ctrlCreate [ "RscFrame" , -1];
_ctrlFrame ctrlSetPosition [ 0.298906 * safezoneW + safezoneX , 0.302 * safezoneH + safezoneY , 0.149531 * safezoneW , 0.462 * safezoneH ];
_ctrlFrame ctrlCommit 0;

private _getImage = {
	_itemInfo    = [_this] call RRPClient_util_itemDetails;
	(_itemInfo select 2)
};

_index_q = _ctrlTree tvAdd [[], "Рецепты"];
{
	_curSelection = configName _x;
	_cheald 	 = [(missionconfigFile >> "LifeSettingCrafting" >> "CraftingTree" >> _curSelection), 1 ] call BIS_fnc_returnChildren;
	_ThemeName = getText(missionconfigFile >> "LifeSettingCrafting" >> "CraftingTree" >> _curSelection >> "name");
	_index_w 	 = _ctrlTree tvAdd [[_index_q], _ThemeName];
		{
			_curcheald    = configName _x;
			_subThemeName = getText(missionconfigFile >> "LifeSettingCrafting" >> "CraftingTree" >> _curSelection >> _curcheald >> "name");
			_index_e      =_ctrlTree tvAdd [[_index_q,_index_w], _subThemeName];
				{
						_curRecipe = configName _x;
						_category  = getText(missionconfigfile >> "LifeCfgRecipes" >> _curRecipe >> "category");
						if (_curcheald isEqualTo _category) then {
							_itemInfo = [(getText(missionconfigfile >> "LifeCfgRecipes" >> _curRecipe >> "finalItem"))] call RRPClient_util_itemDetails;
							if !(_itemInfo isEqualTo [] ) then {
								_displayName = _itemInfo select 1;
								_index_r = _ctrlTree tvAdd [[_index_q,_index_w,_index_e], _displayName];
								_ctrlTree tvSetData [[_index_q,_index_w,_index_e,_index_r], _curRecipe];
								_ctrlTree tvSetPicture [[_index_q,_index_w,_index_e,_index_r], (getText(missionconfigfile >> "LifeCfgRecipes" >> _curRecipe >> "finalItem")) call _getImage];
								str ((getText(missionconfigfile >> "LifeCfgRecipes" >> _curRecipe >> "finalItem")) call _getImage) call debugConsole;
							} else {format ["Ошибка! Рецепт %1 не найден",_curRecipe] call chat};
						};
				} forEach  ("true" configClasses (missionconfigFile >> "LifeCfgRecipes"));
		} forEach  _cheald;
} forEach ("true" configClasses (missionconfigFile >> "LifeSettingCrafting" >> "CraftingTree"));

_ctrlTree ctrlAddEventHandler ["TreeSelChanged", {_this call RRPClient_crafting_onLBselCurRecipe}];
