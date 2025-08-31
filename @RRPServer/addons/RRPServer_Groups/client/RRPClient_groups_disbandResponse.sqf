
params ["_name"];
RRPClientGroupInfo = createHashMap;
RRPClientGroupLevel = 1;
call RRPClient_tags_setTags;
call RRPClient_system_setTag;
call RRPClient_groups_setLicense;
["Организация", format["Организация %1 была распущена...",_name]] call toastInfo;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
if (isNull _display) exitWith {};
["MainMenu",0] call RRPClient_tablet_slide;