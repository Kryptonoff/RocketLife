/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_display","_lb","_index","_page","_titleNameBox","_titles","_config","_cb","_text"];
_display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
_lb = _this select 0;
_index = _this select 1;
_value = _lb lbValue _index;
_page = _display displayCtrl 1039;
_titleNameBox = _page controlsGroupCtrl 13036;
_permGroups = _display displayCtrl 13031;
_titles = (RRPClientGroupInfo get "ranks") select _value;
if (isNil "_titles") exitWith {};

_titles params ["_number","_name",["_permissions",[],[[]]]];
_titleNameBox ctrlSetText _name;

{
  _config = _x;
  _cb = _permGroups controlsGroupCtrl (getNumber(_x >> "idcCB"));
  _cb cbSetChecked (toUpper(configName _config) in _permissions); 
}forEach ("true" configClasses (getMissionConfig "CfgGroups" >> "permissions"));
