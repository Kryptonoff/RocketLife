/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_createMenu", "_colorDropdown", "_buttonControl", "_statusControl", "_linesLabel", "_linesStatus"];
_createMenu = uiNamespace getVariable ['RscMapCreatePoly', controlNull];
_colorDropdown = _createMenu controlsGroupCtrl 4000;
_buttonControl = _createMenu controlsGroupCtrl 4002;
_statusControl = _createMenu controlsGroupCtrl 4001;
_linesLabel = _createMenu controlsGroupCtrl 4004;
_linesStatus = _createMenu controlsGroupCtrl 4003;
lbClear _colorDropdown;
_linesLabel ctrlSetText "Линий:";
_linesLabel ctrlCommit 0;
_linesStatus progressSetPosition 0;
_linesStatus ctrlCommit 0;
_buttonControl ctrlEnable false;
_buttonControl ctrlCommit 0;
_colorDropdown ctrlEnable true;
_colorDropdown ctrlCommit 0;
_createMenu ctrlShow false;
RRPClientMapPolyMode = false;
RRPClientGroupMapLineRenderArray = [];
RRPClientLineLastRenderPos = [0,0,0];
RRPClientGroupMapLineCompleated = false;