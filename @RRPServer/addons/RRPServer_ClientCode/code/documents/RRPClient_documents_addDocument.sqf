
params [["_documentsData",[],[]]];

life_documents = [];
life_documentsData = [];

if (_documentsData isEqualTo []) exitWith {};

private ["_cfgType","_cfgName","_cfgDescription","_cfgIsEdit"];
_documentsData params ["_id","_pid","_className","_name","_description","_give_name","_give_pid","_insert_date","_stop_date"];

life_documents pushBack _className;
_cfgType = getText(missionConfigFile >> "LifeCfgDocuments" >> _className >> "type");
_cfgName = getText(missionConfigFile >> "LifeCfgDocuments" >> _className >> "name");
_cfgDescription = getText(missionConfigFile >> "LifeCfgDocuments" >> _className >> "description");
_cfgIsEdit = (getNumber(missionConfigFile >> "LifeCfgDocuments" >> _className >> "edit") == 1);

if (!_cfgIsEdit && _description isEqualTo "") then {
    life_documentsData pushBack [_id,_pid,_className,_cfgName,_cfgDescription,_give_name,_give_pid,_insert_date,_stop_date];
} else {
    life_documentsData pushBack [_id,_pid,_className,_name,_description,_give_name,_give_pid,_insert_date,_stop_date];
};

if (!isNull (findDisplay 55200)) then {
    [] call Client_documents_shopUpdate;
    life_docBuyReq = true;
};

true;
