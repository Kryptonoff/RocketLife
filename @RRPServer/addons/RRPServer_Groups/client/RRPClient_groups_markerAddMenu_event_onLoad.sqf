/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_control", "_colorDropdown", "_index", "_iconDropbox", "_cancleButton"];
_control = _this;
if(!isNull _control)then
{
	_colorDropdown = _control controlsGroupCtrl 4002;
	{
		_index = _colorDropdown lbAdd (_x select 0);
		_colorDropdown lbSetColor [_index,_x select 1];
	}
	forEach RRPClientMapDrawColors;
	_colorDropdown lbSetCurSel -1;
	_iconDropbox = _control controlsGroupCtrl 4001;
	{
		_index = _iconDropbox lbAdd (_x select 0);
		_iconDropbox lbSetPictureRight [_index, _x select 1];
	}	
	forEach RRPClientAllMarkerIcons;
	_iconDropbox lbSetCurSel -1;
	call RRPClient_groups_markerAddMenu_addPreviewMarker;
	_cancleButton = _control controlsGroupCtrl 4006;
	ctrlSetFocus _cancleButton;
};
RRPClientMapKeyUpEH = (findDisplay 12) displayAddEventHandler ["KeyUp",{call RRPClient_groups_markerAddMenu_addPreviewMarker;false}];
true