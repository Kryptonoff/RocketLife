/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
    {
        if ((_x # 0) isEqualTo _item) then {

        };
    } forEach _toolBoxsArr;
*/
private ["_player","_wpnStorageObj", "_amount", "_item","_toolBoxsArr"];
try {
    _player = param [0,objNull,[objNull]];
    _amount = param [1,-1,[0]];
    _item = param [2,"",[""]];
    _wpnStorageObj =  param [3,objNull,[objNull]];

    if (isNull _player || isNull _wpnStorageObj) throw "Ошибка данных";
    if (wpnStorageObj getVariable ["dontUse", false]) throw "Уже кто-то использует";

    _toolBoxsArr = "getToolBoxsArray" call RRPServer_DB_selectSingleField;


} catch {

};
