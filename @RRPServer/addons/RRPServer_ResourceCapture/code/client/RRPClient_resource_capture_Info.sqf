
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogResCapture",displayNull];
private _list = _display displayCtrl 4501;
private _value = _list lbValue (lbCurSel 4501);
private _mapControl = _display displayCtrl 4504; 
private _data = enabledCaptures select _value;
_data params ["_objectString","_procName","_groupOwner", ["_groupName",""],"_earned","_applics","_nextBattle","_captured", "_applicantsNames","_applicantsIDs"];
if ((RRPClientGroupInfo get "name") in _appIds) then {
    ctrlSetText[4505, "Отказаться от участия в битве"];
} else {
    ctrlSetText[4505, "Принять участие в битве за этот ресурс"];
};
(_display displayCtrl 4502) ctrlSetStructuredText parseText format["<t size='1'>
<t underline='true'>Переработка:</t> %1<br/>		
<t underline='true'>Владелец:</t> %2<br/>
<t underline='true'>Заработано:</t> %3<br/>
<t underline='true'>Претенденты:</t> %4<br/>
<t underline='true'>Следующая битва:</t> %5<br/>
<t underline='true'>Захвачена:</t> %6<br/>",
_procName,_groupName, [_earned] call RRPClient_util_numberText,_applicantsNames,_nextBattle,_captured];
