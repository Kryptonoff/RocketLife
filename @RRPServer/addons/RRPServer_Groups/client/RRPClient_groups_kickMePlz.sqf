/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

["Вас выгнали!", format ["Сожалеем, вас выгнали с организации '%1'!",RRPClientGroupInfo get "name"],10,"red"] call RRPClient_gui_baguetteExt_show; 
RRPClientGroupInfo = createHashMap;
RRPClientGroupLevel = 1;
[RRPClientSalaryHandler] call CBA_fnc_removePerFrameHandler;
call RRPClient_tags_setTags;
call RRPClient_system_setTag;
call RRPClient_groups_setLicense;