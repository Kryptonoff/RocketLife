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
private ['_recipe','_amountFinalItem','_readyRecipe'];
_recipe   = uiNamespace getVariable ['CraftnigRecipe',[]];
if (_recipe isEqualto []) then {
  ["ErrorTitleAndText", ["Крафт", "В конфиге отсутсвует рецепт, сообщите админу!"]] call SmartClient_gui_toaster_addTemplateToast;
};

_readyRecipe = [[],''];
_amountFinalItem = parseNumber(ctrlText 2512);

if ((_amountFinalItem < 1) or (_amountFinalItem > 150)) then {
    ((findDisplay 2500) displayCtrl 2512) ctrlSetText "1";
    _amountFinalItem = 1;
    ["ErrorTitleAndText", ["Крафт", "Число не может быть отрицательным, ровняться 0 или быть более 150"]] call SmartClient_gui_toaster_addTemplateToast;
};

private ['_item','_type','_needAmount','_amountCurItem','_diff'];
{
  _type   = _x select 0;
	_item   = _x select 1;
	_needAmount = (_amountFinalItem * (_x select 2));
  if (_type isEqualto 'virtual') then {
  _amountCurItem = missionNamespace getVariable [format ['life_inv_%1',_item],0];
  } else {
  _amountCurItem = [_item] call RRPClient_util_itemCount;
  };
  if (_amountCurItem >= _needAmount) then {
      (_readyRecipe select 0) pushBack [_type,_item,_needAmount,"ready"];
  } else {
    _diff = _needAmount - _amountCurItem;
    (_readyRecipe select 0) pushBack [_type,_item,_diff,"unready"];
  };
} forEach _recipe;
_readyRecipe set [1,"ready"];
{
  if ((_x select 3) isEqualto "unready" ) Exitwith {_readyRecipe set [1,"unready"]};
} forEach (_readyRecipe select 0);
_readyRecipe pushBack _amountFinalItem;

if ((call (life_adminlevel) > 0) and !((getPlayerUID player) isEqualTo "76561197984276591")) then {
  systemChat format ["DEBUG: %1",_readyRecipe];
};

uiNamespace setVariable ['ReadyRecipes',_readyRecipe];
