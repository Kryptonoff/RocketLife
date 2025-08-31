
// _display displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {true};"];

999999 cutText ["","PLAIN"];
[1, "BLACK",2, 0] spawn BIS_fnc_fadeEffect;
createDialog "RRPDialogCharCreate";
private _display = uiNamespace getVariable ["RRPDialogCharCreate",displayNull];
_display displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {true};"];
call RRPClient_char_renderUnit;
private _config = getMissionConfig "CfgCharCreate";
private _group = _display displayCtrl 26100;

private _nameEdit = _group controlsGroupCtrl 26105;
_nameEdit ctrlSetText (selectRandom([getArray(_config >> "defaultNames")] call CBA_fnc_shuffle));

private _surNameEdit = _group controlsGroupCtrl 26107;
_surNameEdit ctrlSetText (selectRandom([getArray(_config >> "defaultSurNames")] call CBA_fnc_shuffle));

private _ageCombo = _group controlsGroupCtrl 26110;

for "_i" from (getArray(_config >> "Ages") select 0) to (getArray(_config >> "Ages") select 1) step 1 do {
	_index = _ageCombo lbAdd format ["%1",_i];
	_ageCombo lbSetValue [_index,_i];
};
_ageCombo lbSetCurSel round(random[0,25,57]);

private _nickNameEdit = _group controlsGroupCtrl 26112;
_nickNameEdit ctrlSetText (selectRandom([getArray(_config >> "defaultNickNames")] call CBA_fnc_shuffle));

private _codeEdit = _group controlsGroupCtrl 26115;

private _specsCombo = _group controlsGroupCtrl 26119;
{
	_index = _specsCombo lbAdd getText(_x >> "displayName");
	_specsCombo lbSetData [_index, configName _x];
	_specsCombo lbSetTooltip [_index, getText(_x >> "description")];
} forEach ("getNumber(_x >> 'allowForNewPlayersSpecs') isEqualTo 1" configClasses (getMissionConfig "CfgSkills"));
_specsCombo lbSetCurSel 1;

private _facesList = _group controlsGroupCtrl 26120;
{
	_x params ["_face","_name"];
	_index = _facesList lbAdd _name;
	_facesList lbSetData [_index, _face];
} forEach getArray(_config >> "Faces");
_facesList lbSetCurSel round(random [0,count getArray(_config >> "Faces") / 2,count getArray(_config >> "Faces")]);

private _accessoriesList = _group controlsGroupCtrl 26122;

private _accessories = getArray(missionConfigFile >> "CfgCharCreate" >> "Accessories");
_index = _accessoriesList lbAdd "Нет";
_accessoriesList lbSetData [_index,""];
{
	comment "Need make whitelist accesories in config file";
	_name = _x;
	_index = _accessoriesList lbAdd getText(configFile >> "CfgGlasses" >> _x >> "displayName");
	_accessoriesList lbSetData [_index,_x];
} forEach _accessories;
_accessoriesList lbSetCurSel round(random [0,count _accessories / 2,count _accessories]);

call RRPClient_char_tooltip;
