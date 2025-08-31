
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 39000;
private _group = _slide controlsGroupCtrl 39003;
{ctrlDelete _x}forEach (allControls _group);
RRPClientBackButton = "caseStore";

RRPClientCaseLoaded = false;
[player] remoteExecCall ["RRPServer_case_loadAll",2];
[
	"Кейсы",
	"Загружаем доступные кейсы...",
	[1,1,1,1],
	"\rimas_agent\assets\tablet\apps\case.paa",
	{RRPClientCaseLoaded},
	{},
	[],
	9999
] call RRPClient_gui_createLoadingScreen;
