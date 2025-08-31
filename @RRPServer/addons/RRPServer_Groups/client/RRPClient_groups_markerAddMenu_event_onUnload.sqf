/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_control", "_textSizeControl", "_iconSizeControl", "_colorDropdown", "_iconDropbox"];
_control = uiNamespace getVariable ['RscMapCreateMenu', controlNull];
_textSizeControl  = _control controlsGroupCtrl 4005;
_iconSizeControl = _control controlsGroupCtrl 4004;
_textSizeControl sliderSetPosition (getNumber (configfile >> "RscMapCreateMenu" >> "controls" >> "TextSizeSlider" >> "sliderPosition"));
_iconSizeControl sliderSetPosition (getNumber (configfile >> "RscMapCreateMenu" >> "controls" >> "IconSizeSlider" >> "sliderPosition"));
(_control controlsGroupCtrl 4000) ctrlSetText "";
(_control controlsGroupCtrl 4003) ctrlSetText "";
_colorDropdown = _control controlsGroupCtrl 4002;
_iconDropbox = _control controlsGroupCtrl 4001;
lbClear _colorDropdown;
lbClear _iconDropbox;
RRPClientGroupMapIconPreviewArray = [];
(findDisplay 12) displayRemoveEventHandler ["KeyUp",RRPClientMapKeyUpEH];
_control ctrlShow false;