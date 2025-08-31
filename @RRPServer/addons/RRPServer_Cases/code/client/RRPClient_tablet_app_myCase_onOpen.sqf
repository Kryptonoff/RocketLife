
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 39100;
private _group = _slide controlsGroupCtrl 39102;
{ctrlDelete _x}forEach (allControls _group);
RRPClientBackButton = "myCase";

RRPClientCaseLoaded = false;
[player] remoteExecCall ["RRPServer_case_loadPlayerCases",2];
[
	"Кейсы",
	"Загружаем ваши кейсы...",
	[1,1,1,1],
	"\rimas_agent\assets\tablet\apps\case.paa",
	{RRPClientCaseLoaded},
	{},
	[],
	9999
] call RRPClient_gui_createLoadingScreen;
