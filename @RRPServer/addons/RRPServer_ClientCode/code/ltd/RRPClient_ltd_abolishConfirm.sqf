/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params [["_name","",[""]]];
RRPClientLTDsData = [];
["InfoTitleOnly", [format ["Компания '%1' была упразднена. Благодарим за сотрудничество!",_name]]] call SmartClient_gui_toaster_addTemplateToast;