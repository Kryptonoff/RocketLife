RRPServer_containers_virtual_openMenu = {
params [
	"_sessionId",
	"_box"
];

try
{
	_player = _sessionId call RRPServer_session_getPlayerObject;
	if (isNull _player) throw "Чего-чего-чего?";
	if (isNull _box) throw "Хранилище не определено!";
	["response",_box] remoteExecCall ["RRPClient_containers_virtual_openMenu",remoteExecutedOwner];
}catch{
	["ErrorTitleAndText",["Хранилище",_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
};
true
};

case ([cursorObject] call RRPClient_system_isVehicleKind):
						{
							if (cursorObject in life_vehicles OR {locked cursorObject isEqualTo 0}) then 
							{
								_vehicle = cursorObject;
							};
						};