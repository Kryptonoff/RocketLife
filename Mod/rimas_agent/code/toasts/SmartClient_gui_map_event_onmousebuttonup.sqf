/*
	Project: Rimas Role Play
	License: CC BY-ND
	Author: FairyTale#5571
*/

private["_mapControl", "_mouseButton", "_position", "_shift", "_ctrl", "_alt", "_stopPropagation", "_maxLines", "_control", "_buttonControl", "_statusControl", "_colorDropdown", "_render", "_color", "_renderPosition", "_lines", "_count", "_text", "_linesLabel", "_linesStatus", "_clickPosition", "_display", "_contextControl"];
_mapControl = _this select 0;
_mouseButton = _this select 1;
_position = [_this select 2,_this select 3];
_shift = _this select 4;
_ctrl = _this select 5;
_alt = _this select 6;
_stopPropagation = false;
if (RRPClientMapPolyMode) then
{
	_maxLines = getNumber(getMissionConfig "CfgGroups" >> "maximumPolyNode");
	_control = uiNamespace getVariable ["RscMapCreatePoly",controlNull];
	_buttonControl = _control controlsGroupCtrl 4002;
	_statusControl = _control controlsGroupCtrl 4001;
	_colorDropdown = _control controlsGroupCtrl 4000;
	if(_mouseButton isEqualTo 0)then
	{
		if((count RRPClientGroupMapLineRenderArray) < _maxLines)then
		{
			if(!RRPClientGroupMapLineCompleated)then
			{
				_render = [];
				_color = (_colorDropdown lbColor (lbCursel _colorDropdown));
				_renderPosition = _mapControl ctrlMapScreenToWorld _position;
				_renderPosition pushback 0;
				if(_renderPosition call RRPClient_groups_polyAddMenu_isCompleatedPoly)then
				{
					_buttonControl ctrlEnable true;
					_buttonControl ctrlCommit 0;
					_statusControl ctrlSetBackGroundColor [160/255, 223/255, 59/255, 1];
					_statusControl ctrlCommit 0;
					_render = [RRPClientLineLastRenderPos,((RRPClientGroupMapLineRenderArray select 0) select 0),_color];
					RRPClientGroupMapLineRenderArray pushback _render;
					RRPClientGroupMapLineCompleated = true;
				}
				else
				{
					if(RRPClientLineLastRenderPos isEqualTo [0,0,0])then
					{
						_colorDropdown ctrlEnable false;
					}
					else
					{
						_render = [RRPClientLineLastRenderPos,_renderPosition,_color];
						RRPClientGroupMapLineRenderArray pushback _render;
					};
					RRPClientLineLastRenderPos = _renderPosition;
				};
			};
		}
		else
		{
			_buttonControl ctrlEnable false;
			_buttonControl ctrlCommit 0;
		};
	}
	else
	{
		if(RRPClientLastMapDown + 0.1 > diag_tickTime)then
		{
			_lines = count RRPClientGroupMapLineRenderArray;
			if(_lines > 0)then
			{
				if(RRPClientGroupMapLineCompleated)then
				{
					_buttonControl ctrlEnable false;
					_buttonControl ctrlCommit 0;
					_statusControl ctrlSetBackGroundColor [221/255, 38/255, 38/255, 1];
					_statusControl ctrlCommit 0;
					RRPClientGroupMapLineCompleated = false;
				};
				if(count RRPClientGroupMapLineRenderArray > 1)then
				{
					RRPClientLineLastRenderPos = (RRPClientGroupMapLineRenderArray select (_lines - 1)) select 0;
				}
				else
				{
					_colorDropdown ctrlEnable true;
					RRPClientLineLastRenderPos = [0,0,0];
				};
				RRPClientGroupMapLineRenderArray deleteAt (_lines -1);
			};
		};
	};
	_count = count RRPClientGroupMapLineRenderArray;
	_text = format ["%1/%2",_count,_maxLines];
	_linesLabel = _control controlsGroupCtrl 4004;
	_linesLabel ctrlSetText _text;
	_linesLabel ctrlCommit 0;
	_linesStatus = _control controlsGroupCtrl 4003;
	_linesStatus progressSetPosition (_count/_maxLines);
	_linesStatus ctrlCommit 0;
}
else
{
	switch (_mouseButton) do 
	{
		case 0:
		{
			if (_shift) then 
			{
				_clickPosition = _mapControl ctrlMapScreenToWorld _position;
				_clickPosition pushBack 0;
				SmartClientWaypoints pushBack _clickPosition;
				if ((count SmartClientWaypoints) > 5) then {
					SmartClientWaypoints deleteAt 0;
				};
				profileNamespace setVariable ["PRNS_Waypoints",SmartClientWaypoints];
				_stopPropagation = true;
			};
		};
		case 1:
		{
			if !(_shift || _alt || _ctrl) then				
			{
				if(RRPClientLastMapDown + 0.1 > diag_tickTime)then
				{
					_display = ctrlParent _mapControl;
					if (count RRPClientGroupInfo isNotEqualTo 0)then
					{
						if ("canMarker" call RRPClient_groups_util_permCheck) then
						{
							_contextControl = _display ctrlCreate ["RscMapContextMenu",24032];
							_contextControl ctrlSetPosition _position;
							_contextControl ctrlCommit 0;
						};
					};
					RRPClientMapPositionClick = _mapControl ctrlMapScreenToWorld _position;
					RRPClientMapScreenPos = _position;
				};
			};
			_stopPropagation = true;
		};
	};
};
_stopPropagation