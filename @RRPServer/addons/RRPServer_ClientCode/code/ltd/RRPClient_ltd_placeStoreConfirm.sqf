/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _object = life_container_activeObj;
private _position = getPosATL _object;
try
{
	if (isNull _object) throw "Объект NULL.";
	if (RRPClientCredits < 6600) throw "Для установки собственного магазина требуется 6600 RCredits";	
	if (isOnRoad [_position select 0, _position select 1, 0]) throw "Объект на дороге...";
	if ([_position,250] call RRPClient_ltd_world_isStoreInRange) throw "В радиусе 250 метров уже есть магазин, выберите другое место!";
	
	detach _object;
	_object setVectorDirAndUp [vectorDir _object,vectorUp _object];
	_object setPosATL _position;
	["SuccessTitleOnly", ["Запрос на установку магазина отправлен серверу..."]] call SmartClient_gui_toaster_addTemplateToast;
	[RRPClientLTDsStoreData,_object,player,(RRPClientLTDsData select 0)] remoteExecCall ["RRPServer_ltd_insertNewStore",2];
	RRPClientLTDsStoreData = [];
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", keyDownEHId];
	
}catch{
	["ErrorTitleOnly", [_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
