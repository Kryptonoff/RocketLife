/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
disableSerialization;
params[
    ["_mode", "", [""]], ["_this", []]
];

switch _mode do {
    case "SEND":
        {
            curTarget = param[0, objNull, [objNull]];
            format["RRPClient_system_licenseControl LOG SEND: %1", curTarget] call RRPClient_system_log;
            if (isNull curTarget) exitWith {};
            if (player distance curTarget < 5 && alive curTarget && curTarget getVariable["lifeState", ""] isEqualTo "HEALTHY") then {
                ["SEARCH", player] remoteExecCall["RRPClient_system_licenseControl", curTarget];
            };
        };
    case "SEARCH":
        {
            private _sender = param[0, objNull, [objNull]];
            format["RRPClient_system_licenseControl LOG SEARCH: %1", _sender] call RRPClient_system_log;
            private _licenses = [];
            {
                if (missionNamespace getVariable[format["license_%1",getText(missionConfigFile >> "LifeCfgLicenses" >> configName _x >> "variable")], false]) then {
                    _licenses pushBack[(configName _x), true];
                } else {
                    _licenses pushBack[(configName _x), false];
                };
            } foreach("true" configClasses(missionConfigFile >> "LifeCfgLicenses"));
            ["RESULT", [_licenses, player getVariable["realname", ""]]] remoteExecCall["RRPClient_system_licenseControl", _sender];
        };
    case "RESULT":
        {
            params[
                ["_licensesArray", [],
                    [
                        []
                    ]
                ], ["_targetName", "", [""]]
            ];
            format["RRPClient_system_licenseControl LOG RESULT: %1", [_licensesArray, _targetName]] call RRPClient_system_log;
            if !(_licensesArray isEqualTo[]) then {
                if (isNull(findDisplay 6500)) then {
                    createDialog "RRPDialog_License_Controls";
                    waitUntil {!isNull(findDisplay 6500) };
                };

                ((findDisplay 6500) displayCtrl 6510) ctrlSetText format["Лицензии %1", _targetName];
                private _unitList = ((findDisplay 6500) displayCtrl 6501);
                private _LicList = ((findDisplay 6500) displayCtrl 6502);
                lbClear _listbox;
                lbClear _mylic; {
                    _x params["_licenses", "_active"];
                    private _gangLicense = getNumber(missionConfigFile >> "LifeCfgLicenses" >> _licenses >> "gang");
                    if (_gangLicense isEqualTo 0) then {
                        if (_active) then {
                            if ([getText(missionConfigFile >> "LifeCfgLicenses" >> _licenses >> "conditionsConfiscation")] call RRPClient_util_conditionsCheck) then {
                                private _index = _unitList lbAdd format["%1", ((getText(missionConfigFile >> "LifeCfgLicenses" >> _licenses >> "displayName")))];
                                _unitList lbSetData[_index, _licenses];
                            };
                        } else {
                            if ([getText(missionConfigFile >> "LifeCfgLicenses" >> _licenses >> "conditionsExtradition")] call RRPClient_util_conditionsCheck) then {
                                private _index = _LicList lbAdd format["%1", ((getText(missionConfigFile >> "LifeCfgLicenses" >> _licenses >> "displayName")))];
                                _LicList lbSetData[_index, _licenses];
                            };
                        };
                    };
                }
                foreach _licensesArray;
            } else {
                [format["У %1 нет лицензий.", _targetName], "info"] call RRPClient_system_hint;
            };
        };
    case "SET":
        {
            params[
                ["_sender", ObjNull, [ObjNull]], ["_licenses", "", [""]], ["_bool", false, [false]]
            ];
            format["RRPClient_system_licenseControl LOG SET: %1", [_sender, _licenses, _bool]] call RRPClient_system_log;
            if (isNull _sender) exitWith { ["Отправитель не определен!"] call hints };
            if (!isClass(missionConfigFile >> "LifeCfgLicenses" >> _licenses)) exitWith { ["Не удалось найти лицензию"] call hints };

            if (_bool) then {
                missionNamespace setVariable[format["license_%1",getText(missionConfigFile >> "LifeCfgLicenses" >> _licenses >> "variable")], true];
                [format["%1 выдал вам лицензию %2", _sender getVariable["realname", ""], getText(missionConfigFile >> "LifeCfgLicenses" >> _licenses >> "displayName")], "info"] call RRPClient_system_hint;
                [format["Вы успешно выдал лицензию %1 для %2", getText(missionConfigFile >> "LifeCfgLicenses" >> _licenses >> "displayName"), player getVariable["realname", ""]], "info"] remoteExecCall["RRPClient_system_hint", remoteExecutedOwner];
            } else {
                missionNamespace setVariable[format["license_%1", getText(missionConfigFile >> "LifeCfgLicenses" >> _licenses >> "variable")], false];
                [format["%1 конфисковал вам лицензию %2", _sender getVariable["realname", ""], getText(missionConfigFile >> "LifeCfgLicenses" >> _licenses >> "displayName")], "info"] call RRPClient_system_hint;
                [format["Вы успешно конфисковал лицензию %1 для %2", getText(missionConfigFile >> "LifeCfgLicenses" >> _licenses >> "displayName"), player getVariable["realname", ""]], "info"] remoteExecCall["RRPClient_system_hint", remoteExecutedOwner];
            };
            call RRPClient_system_setTag;
            call RRPClient_tags_setTags;
            [2] call RRPClient_session_updatePartial;

        };
    case "PUT":
        {
            if ((lbCurSel 6502) isEqualTo - 1) exitWith { titleText["Вы не выбрали лицензиию", "PLAIN"]; };
            private _unitList = ((findDisplay 6500) displayCtrl 6501);
            private _LicList = ((findDisplay 6500) displayCtrl 6502);
            private _licenses = (lbData[6502, lbCurSel 6502]);
            format["RRPClient_system_licenseControl LOG PUT: %1", _licenses] call RRPClient_system_log;
            ["SET", [player, _licenses, true]] remoteExecCall["RRPClient_system_licenseControl", curTarget];
            private _index = _unitList lbAdd format["%1", ((getText(missionConfigFile >> "LifeCfgLicenses" >> _licenses >> "displayName")))];
            _unitList lbSetData[_index, _licenses];
            _LicList lbDelete lbCurSel 6502;
            _LicList lbSetCurSel - 1;
        };
    case "TAKE":
        {
            if ((lbCurSel 6501) isEqualTo - 1) exitWith { titleText["Вы не выбрали лицензиию", "PLAIN"]; };
            private _unitList = ((findDisplay 6500) displayCtrl 6501);
            private _LicList = ((findDisplay 6500) displayCtrl 6502);
            private _licenses = (lbData[6501, lbCurSel 6501]);
            format["RRPClient_system_licenseControl LOG TAKE: %1", _licenses] call RRPClient_system_log;
            ["SET", [player, _licenses, false]] remoteExecCall["RRPClient_system_licenseControl", curTarget];
            private _index = _LicList lbAdd format["%1", ((getText(missionConfigFile >> "LifeCfgLicenses" >> _licenses >> "displayName")))];
            _LicList lbSetData[_index, _licenses];
            _unitList lbDelete lbCurSel 6501;
            _unitList lbSetCurSel - 1;
        };
};
