/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params ["_text"];
RRPClientGroupInfo = createHashMap;
RRPClientGroupLevel = 1;
call RRPClient_tags_setTags;
["Вы покинули организацию!","",10, "red"] spawn RRPClient_gui_baguetteExt_show; 
call RRPClient_system_setTag;
call RRPClient_groups_setLicense;
if (!isNull (uiNamespace getVariable ["RRPDialogTablet",displayNull])) then {closeDialog 0};