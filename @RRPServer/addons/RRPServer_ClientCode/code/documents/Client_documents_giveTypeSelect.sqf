
disableSerialization;
params [
    ["_control",controlNull,[controlNull]],
    ["_index",-1,[0]]
];

if (isNull _control) exitWith {};
if (_index isEqualTo -1) exitWith {};


private _type = _control lbData _index;

if (isClass (missionConfigFile >> "LifeCfgDocumentsType" >> _type)) then {
    _type = format["getText(_x >> 'type') isEqualTo '%1' && [getText(_x >> 'conditions')] call RRPClient_util_conditionsCheck",_type];
} else {
    _type = "[getText(_x >> 'conditions')] call RRPClient_util_conditionsCheck";
};
 private _docList = ((findDisplay 7700) displayCtrl 2652);
lbClear _docList;



{

    _docList lbAdd getText(_x >> "name");
    _docList lbSetData [(lbSize _docList)-1,configName _x];
} forEach (_type configClasses (missionConfigFile >> "LifeCfgDocuments"));

_docList ctrlRemoveAllEventHandlers "LBSelChanged";
_docList ctrlAddEventHandler ["LBSelChanged","_this call Client_documents_giveDocSelect"];

_docList lbSetCurSel -1;
_docList ctrlEnable true;
