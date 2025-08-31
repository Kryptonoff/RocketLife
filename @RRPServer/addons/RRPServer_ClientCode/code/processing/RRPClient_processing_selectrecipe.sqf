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
private ['_display','_control','_index','_allRecipes','_curRecipe','_btn'];
_display    = uiNamespace getVariable ['ProcessingDialog',displayNull];
_control    = param [0,controlNull,[controlNull]];
_index      = param [1,-1,[-1]];
_allRecipes = missionNamespace getVariable ['readyRecipes',[]];
_curRecipe  = [];
_btn = _display displayCtrl 1998;

if (_control isEqualto controlNull || _index isEqualto -1 || _allRecipes isEqualTo []) exitWith {_btn ctrlEnable false};
_this spawn RRPClient_processing_nonification;

{
  if ((_x select 2)  isEqualto _index) exitWith {_curRecipe = _x}
} forEach (_allRecipes select 0);

if (_curRecipe isEqualTo []) exitWith {_btn ctrlEnable false};

missionNamespace setVariable ['curRecipe', _curRecipe];
_btn ctrlEnable true;
