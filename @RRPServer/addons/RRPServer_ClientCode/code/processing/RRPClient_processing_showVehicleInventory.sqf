/*
    Author(s):P
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
private ['_btn','_mod','_display','_lbCtrlItems','_lbCtrlVeh','_indexLB','_netID','_vehicle','_lbdata','_allVitems','_amount','_itemName','_image','_index'];
disableSerialization;
_display = uiNamespace getVariable ["ProcessingDialog",displayNull];
_btn     = _display displayCtrl 1998;
if (isNull _display) exitWith {};
_btn ctrlEnable false;

_lbCtrlItems = _display displayCtrl 1993;
_lbCtrlVeh   = param [0,controlNull,[controlNull]];
_indexLB 	 = param [1,-1,[-1]];
_lbdata = call compile (_lbCtrlVeh lbData _indexLB);
_netID       = _lbdata select 0;
_mod         = _lbdata select 1;
_vehicle     = objectFromNetId _netID;
_allVitems = if (_indexLB isEqualTo 0) then {player getVariable ["plrTrunk",[]]} else {((_vehicle getVariable ["Trunk",[[],0]] )select 0)};

lbClear _lbCtrlItems;
_index = -1;
{
	_amount 	 =  format ["%1x",_x select 1];
	_itemName    = (getText(missionConfigFile >> "VirtualItems" >> _x select 0 >> "displayName"));
	_image 	     = getText(missionConfigFile >> "VirtualItems" >> _x select 0 >> "icon");
	_index 	     = lbSize _lbCtrlItems;
	_lbCtrlItems lbAdd _itemName;
	_lbCtrlItems lbSetTextRight [_index, _amount];
	_lbCtrlItems lbSetPicture [_index,_image];
} foreach _allVitems;

if (_index isEqualTo -1) then {
    ["info",if (_mod isEqualTo 'player') then {"Ваш рюказк пуст"} else {"У данного автомобиля инвентарь пуст"}] call RRPClient_processing_nonification;
    } else {
    ["info","Нажмите на рецепт для подробной информации"] call RRPClient_processing_nonification;
};
