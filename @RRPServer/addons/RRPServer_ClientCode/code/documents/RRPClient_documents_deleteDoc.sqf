
params [
    ["_netID", "", [""]],
    ["_mod",-1,[-1]]
];

if (curDocID isEqualTo []) exitWith {
    ["ErrorTitleAndText", ["Документ", "Вы не выбрали документ"]] call SmartClient_gui_toaster_addTemplateToast;
};
curDocID params ["_curDocID","_class"];

if (_mod isEqualTo 0) then {
    [[_curDocID],"doc_deleteDocument"] call RRPClient_system_hcExec;
    ["ErrorTitleAndText", ["Документы", "Документ удален"]] call SmartClient_gui_toaster_addTemplateToast;
    [_curDocID] call RRPClient_documents_updateDocData
} else {
    if ([getText(missionConfigFile >> "LifeCfgDocuments" >> _class >> "conditions")] call RRPClient_util_conditionsCheck) then {
        [[_curDocID],"doc_deleteDocument"] call RRPClient_system_hcExec;
        [_curDocID] remoteExec ["RRPClient_documents_updateDocData",objectFromNetId _netID];
        ["ErrorTitleAndText", ["Документы", "Документ удален"]] call SmartClient_gui_toaster_addTemplateToast;
    } else {
        ["ErrorTitleAndText", ["Документы", "Изымать документ могут только те, кто его может выдавать!"]] call SmartClient_gui_toaster_addTemplateToast;
    };
};
closeDialog 0;
