#define CONTROLS [1037,1038,1039,1040,1041]

params ["_control", "_selectedIndex"];
disableSerialization;

try
{
	private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
	private _mainGroup = _display displayCtrl 24001;
	private _slide = _mainGroup controlsGroupCtrl 38000;
	switch (_selectedIndex) do
	{
		case 0: 
		{
			{
				
				(_slide controlsGroupCtrl _x) ctrlSetFade 1;  
				(_slide controlsGroupCtrl _x) ctrlCommit 0.4; 
				ctrlShow [_x,false];
				ctrlEnable [_x,false];
			}forEach CONTROLS;
			(_slide controlsGroupCtrl 1037) ctrlSetFade 0;  (_slide controlsGroupCtrl 1037) ctrlCommit 0.4;
			ctrlShow [1037,true];
			ctrlEnable [1037,true];
			uiNamespace setVariable ["lastTab",_selectedIndex];
		};
		case 1: 
		{
			if (((allMissionObjects "Land_rrp_panel") select {_x getVariable ["ltdOwner",-1] isEqualTo RRPClientLTDsData#0}) isEqualTo []) throw "Компания не владеет никаким магазином";
			{
				(_slide controlsGroupCtrl _x) ctrlSetFade 1;  (_slide controlsGroupCtrl _x) ctrlCommit 0.4; 
				ctrlShow [_x,false];
				ctrlEnable [_x,false];
			}forEach CONTROLS;
			(_slide controlsGroupCtrl 1038) ctrlSetFade 0;  (_slide controlsGroupCtrl 1038) ctrlCommit 0.4;
			ctrlShow [1038,true];
			ctrlEnable [1038,true];
			uiNamespace setVariable ["lastTab",_selectedIndex];
		};
		case 2: {
			//if (((allMissionObjects "fuels") select {_x getVariable ["ltdOwner",-1] isEqualTo RRPClientLTDsData#0}) isEqualTo []) throw "Компания не владеет никакой станцией АЗС";
			throw "Станции АЗС в разработке";
			{
				(_slide controlsGroupCtrl _x) ctrlSetFade 1;  (_slide controlsGroupCtrl _x) ctrlCommit 0.4; 
				ctrlShow [_x,false];
				ctrlEnable [_x,false];
			}forEach CONTROLS;
			(_slide controlsGroupCtrl 1040) ctrlSetFade 0;  (_slide controlsGroupCtrl 1040) ctrlCommit 0.4;
			ctrlShow [1040,true];
			ctrlEnable [1040,true];
			uiNamespace setVariable ["lastTab",_selectedIndex];
		};
		case 3: {
			//if (((allMissionObjects "fuels") select {_x getVariable ["ltdOwner",-1] isEqualTo RRPClientLTDsData#0}) isEqualTo []) throw "Компания не владеет никаким игровым автоматом";
			throw "Недоступно";
			{
				(_slide controlsGroupCtrl _x) ctrlSetFade 1;  (_slide controlsGroupCtrl _x) ctrlCommit 0.4; 
				ctrlShow [_x,false];
				ctrlEnable [_x,false];
			}forEach CONTROLS;
			(_slide controlsGroupCtrl 1039) ctrlSetFade 0;  (_slide controlsGroupCtrl 1039) ctrlCommit 0.4;
			ctrlShow [1039,true];
			ctrlEnable [1039,true];
			uiNamespace setVariable ["lastTab",_selectedIndex];
		};
		default {};
	};
}catch{
	[_exception, "OK"] call RRPClient_tablet_showWarning;
	_control lbSetCurSel (uiNamespace getVariable ["lastTab",0]); 
	[_control,uiNamespace getVariable ["lastTab",0]] call RRPClient_groups_onToolBoxChanged;
};
true
