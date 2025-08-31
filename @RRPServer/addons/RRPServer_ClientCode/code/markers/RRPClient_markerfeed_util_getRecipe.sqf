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
private ["_curproc","_recipes","_text","_text","_recipe","_finalitem","_ingridient","_amount","_displayName","_image","_curText","_displayNameFinalItem","_imageFinalItem"];
_curproc = _this;
_recipes = getArray (missionConfigFile >> "CFGProcessing" >> _curproc >> "Recipes");

_text = "";
{
    _recipe = _x select 3;
    _finalitem = ((_x select 0) select 0);
    {
        _ingridient  = _x select 0;
        _amount      = _x select 1;
        _displayName = (getText(missionconfigfile >> 'VirtualItems' >> _ingridient >> 'displayName'));
        _image       = getText(missionConfigFile >> 'VirtualItems' >> _ingridient >> 'icon');
        _curText = if (_forEachIndex >= ((count _recipe) - 1 )) then {format ["<img image='%3'/>%1 X%2",_displayName,_amount,_image]} else {format ["%1 X%2 + ",_displayName,_amount]};
        _text = _text + _curText;
    } forEach _recipe;

  _displayNameFinalItem = (getText(missionconfigfile >> 'VirtualItems' >> _finalitem >> 'displayName'));
  _imageFinalItem       = getText(missionConfigFile >> 'VirtualItems' >> _finalitem >> 'icon');
  _curText = format [" =  <img image='%2'/>%1",_displayNameFinalItem,_imageFinalItem];
  _text = _text + _curText;
  _text = _text + "<br/>";
} forEach _recipes;


_text
