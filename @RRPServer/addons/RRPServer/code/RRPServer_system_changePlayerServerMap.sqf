params [
    ["_uid","",[""]],
    ["_newMap","",[""]],
	["_unit",objNull,[objNull]]
];

if (isNull _unit || _newMap isEqualTo "" || _uid isEqualTo "") exitWith {
	life_playerTrasnferDone = false;
    owner _unit publicVariableClient "life_playerTrasnferDone";
};

format ["changePlayerServerMap:%1:%2",_uid,_newMap] call RRPServer_DB_fireAndForget;
//uiSleep 0.5;

//if (_newMap isEqualTo _worldOk) exitWith {
	life_playerTrasnferDone = true;
    owner _unit publicVariableClient "life_playerTrasnferDone";
//};