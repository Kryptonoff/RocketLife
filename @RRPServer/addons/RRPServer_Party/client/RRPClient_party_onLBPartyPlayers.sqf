/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
	
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 36000;

private _lb = _this select 0;
private _index = _this select 1;
private _selected = objectFromNetId (_lb lbData _index);
private _kickButon = 	_slide controlsGroupCtrl 36003;
private _leader = 		_slide controlsGroupCtrl 36002;
_kickButon ctrlEnable (if (!(_selected isEqualTo player) AND {(player isEqualTo (leader group player))}) then {true}else{false});
_leader ctrlEnable (if (!((leader group player) isEqualTo _selected) and {(player isEqualTo (leader group player))}) then {true}else{false});
