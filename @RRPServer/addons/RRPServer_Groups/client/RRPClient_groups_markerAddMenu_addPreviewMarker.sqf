/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
 
private["_control", "_iconCombo", "_colorCombo", "_textControl", "_textSizeControl", "_iconSizeControl"];
_control = uiNamespace getVariable ['RscMapCreateMenu', controlNull];
if(!isNull _control)then
{
	_iconCombo = _control controlsGroupCtrl 4001;
	_colorCombo = _control controlsGroupCtrl 4002;
	_textControl = _control controlsGroupCtrl 4000;
	_textSizeControl  = _control controlsGroupCtrl 4005;
	_iconSizeControl = _control controlsGroupCtrl 4004;
	RRPClientGroupMapIconPreviewArray = 
	[
		_iconCombo lbPictureRight (lbCursel _iconCombo),
		_colorCombo lbColor (lbCursel _colorCombo),
		RRPClientMapPositionClick,
		sliderPosition _iconSizeControl,
		ctrlText _textControl,
		sliderPosition _textSizeControl
	];
};