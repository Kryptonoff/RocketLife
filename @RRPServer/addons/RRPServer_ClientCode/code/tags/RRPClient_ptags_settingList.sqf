/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    License: cc by-nc-nd
*/
private ["_display","_ctrlCbIcon","_ctrlCbTitle"];

disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 35000;

_ctrlCbIcon = _slide controlsGroupCtrl 35026;
_ctrlCbTitle = _slide controlsGroupCtrl 35024;

(player getVariable ["playerTags",[]]) params [
  ["_icon", "", [""]],
  ["_rank", "", [""]],
  ["_title", "", [""]],
  ["_oraganization", "", [""]]
];

lbClear _ctrlCbIcon;
{
    private ["_curIcon","_name","_condition","_conditionMessage"];
    _curIcon = getText(_x >> "icon");
    _name = getText(_x >> "title");
    _condition = getText(_x >> "conditions");
    _conditionMessage = getText(_x >> "conditionsMessage");

    private _index = _ctrlCbIcon lbAdd _name;
    _ctrlCbIcon lbSetPicture [_index,_curIcon];
    if ([_condition] call RRPClient_util_conditionsCheck) then {
      _ctrlCbIcon lbSetData [_index,(configName _x)];

      if (_icon isEqualTo (configName _x)) then {
        _ctrlCbIcon lbSetCurSel _index;
      };
    } else {
      _ctrlCbIcon lbSetData [_index,""];
      _ctrlCbIcon lbSetTooltip [_index,_conditionMessage];
      _ctrlCbIcon lbSetPictureRight [_index,"\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\sessions_locked_ca.paa"];
    };
} forEach ("true" configClasses (missionconfigFile >> "playerTags" >> "icons"));

lbClear _ctrlCbTitle;
{
    private ["_name","_condition","_conditionMessage"];
    _name = getText(_x >> "title");
    _condition = getText(_x >> "conditions");
    _conditionMessage = getText(_x >> "conditionsMessage");
    private _index = _ctrlCbTitle lbAdd _name;
    if ([_condition] call RRPClient_util_conditionsCheck) then {
      _ctrlCbTitle lbSetData [_index,(configName _x)];

      if (_title isEqualTo (configName _x)) then {
        _ctrlCbTitle lbSetCurSel _index;
      };
    } else {
      _ctrlCbTitle lbSetData [_index,""];
      _ctrlCbTitle lbSetTooltip [_index,_conditionMessage];
      _ctrlCbTitle lbSetPictureRight [_index,"\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\sessions_locked_ca.paa"];
    };
} forEach ("true" configClasses (missionconfigFile >> "playerTags" >> "Title"));
tagsFirstUse = true;
