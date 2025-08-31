/*
	Project: Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

params ["_control", "_selectedIndex"];
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 37000;

_slideFalse = {
	(_slide controlsGroupCtrl _this) ctrlSetFade 1;  
	(_slide controlsGroupCtrl _this) ctrlCommit 0.4; 
	(_slide controlsGroupCtrl _this) ctrlShow false;
	(_slide controlsGroupCtrl _this) ctrlEnable false;
};

_slideTrue = {
	(_slide controlsGroupCtrl _this) ctrlSetFade 0;  
	(_slide controlsGroupCtrl _this) ctrlCommit 0.4;
	(_slide controlsGroupCtrl _this) ctrlShow true;
	(_slide controlsGroupCtrl _this) ctrlEnable true;
};

private _allControls = [1037,1038,1039,1040,1041,1042,1043];

switch (_selectedIndex) do
{
	case 0: {
		{
			_x call _slideFalse;
		}forEach _allControls;
		1037 call _slideTrue;
	};
	case 1: {
		{
			_x call _slideFalse;
		}forEach _allControls;
		1038 call _slideTrue;
	};
	case 2: {
		if !(call RRPClient_groups_isPrem) exitWith {
			["Организация", "Этот раздел доступен только премиальным организациям"] call toastError;
			false;
		};
		{
			_x call _slideFalse;
		}forEach _allControls;
		1039 call _slideTrue;
	};
	case 3: {
		{
			_x call _slideFalse;
		}forEach _allControls;
		1041 call _slideTrue;
	};
	case 4: {
		if (true) exitWith {["Организация","Раздел в разработке"] call toastError; false};
		{
			_x call _slideFalse;
		}forEach _allControls;
		1042 call _slideTrue;
	};
	case 5: {
		if !(call RRPClient_groups_isPrem) exitWith {
			["Организация", "Этот раздел доступен только премиальным организациям"] call toastError;
			false;
		};
		{
			_x call _slideFalse;
		}forEach _allControls;
		1043 call _slideTrue;
	};
	case 6: {
		{
			_x call _slideFalse;
		}forEach _allControls;
		1040 call _slideTrue;
	};
	default {};
};
true