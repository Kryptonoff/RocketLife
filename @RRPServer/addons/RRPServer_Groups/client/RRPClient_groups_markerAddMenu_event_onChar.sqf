/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_control", "_textControl", "_text"];
_control = uiNamespace getVariable ['RscMapCreateMenu', controlNull];
_textControl = _control controlsGroupCtrl 4000;
_text = ctrlText _textControl;
_textControl ctrlSetText (_text + toString [_this select 1]);
call RRPClient_groups_markerAddMenu_addPreviewMarker;