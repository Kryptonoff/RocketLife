/*
	Author:	Arrra
	SteamID: 76561198090549826
	Discord: merkava#9745
	My VK:https://vk.com/id478482025
*/
#include "..\..\script_macros.hpp"
disableSerialization;

private _pointX_Start = ctrlText (CONTROL(8800,8801));
private _pointY_Start = ctrlText (CONTROL(8800,8802));
private _pointX_Finish = ctrlText (CONTROL(8800,8804));
private _pointY_Finish = ctrlText (CONTROL(8800,8805));
private _MessageEvent = ctrlText (CONTROL(8800,8812));
private _RadiusEventZone = sliderPosition 8807;
private _StepEventZone = sliderPosition 8809;


try
{   
	if !(isNil "ClientEventInfo") throw "Ивент-зона уже запущена!";
	if (_pointX_Start isEqualto "" or isNil "_pointX_Start") throw "Неверно указана координата Х точки старта ивента!";
	if (_pointY_Start isEqualto "" or isNil "_pointY_Start") throw "Неверно указана координата У точки старта ивента!";
	
	if (_pointX_Finish isEqualto "" or isNil "_pointX_Finish") throw "Неверно указана координата Х точки финиша ивента!";
	if (_pointY_Finish isEqualto "" or isNil "_pointY_Finish") throw "Неверно указана координата У точки финиша ивента!";
	
	if (_MessageEvent isEqualto "" or isNil "_MessageEvent") throw "Заполните пожалуйста текст для сообщения!";
	
	
	_pointX_Start = parseNumber _pointX_Start;
	_pointY_Start = parseNumber _pointY_Start;
	_pointX_Finish = parseNumber _pointX_Finish;
	_pointY_Finish = parseNumber _pointY_Finish;

	_MarkerArray = [[_pointX_Start,_pointY_Start],[_pointX_Finish,_pointY_Finish], _RadiusEventZone,  ["Маршрут ивента", "mil_arrow", "colorRed"]] call BIS_fnc_markerPath;

	_posMarkersArray = [];
	_NumbMarker = 0;
	_MarkerBooferName = "";
	
	{
		_NumbMarker = _NumbMarker + 1;
		_time = round((_StepEventZone * _NumbMarker) / 60);
		_pos = getMarkerPos _x;
		_posMarkersArray pushBack _pos;
		_MarkerBooferName = _x;
		deleteMarker _x;
		createMarkerLocal [_MarkerBooferName, _pos];
		_MarkerBooferName setMarkerColorLocal "ColorRed";
		_MarkerBooferName setMarkerTypeLocal "mil_pickup";
		_MarkerBooferName setMarkerTextLocal format ["Траектория Ивента || чекпоинт #%1 || Время прибытия на точку %2 мин",_NumbMarker,_time];
		
	} forEach _MarkerArray;
	
	diag_log format ["%1 || %2 || %3 || %4 ||  %5  || %6 || %7",_pointX_Start,_pointY_Start,_pointX_Finish,_pointY_Finish,_StepEventZone,_RadiusEventZone,steamid];
	[_pointX_Start,_pointY_Start,_pointX_Finish,_pointY_Finish,_StepEventZone,_RadiusEventZone,steamid,_posMarkersArray] remoteExec ["RRPServer_system_addEventZone",2];
	closeDialog 0;
	["Отправка запроса на сервер..."] call hints;
	["start",_MessageEvent] remoteExec ["RRPClient_events_notificationEvent",-2];
	xc_start = nil;
	yc_start = nil;
	xc_finish = nil;
	yc_finish = nil;
}
catch
{
	["ErrorTitleAndText",["Ошибка",_exception]] call SmartClient_gui_toaster_addTemplateToast;
	closeDialog 0;
	xc_start = nil;
	yc_start = nil;
	xc_finish = nil;
	yc_finish = nil;
};
