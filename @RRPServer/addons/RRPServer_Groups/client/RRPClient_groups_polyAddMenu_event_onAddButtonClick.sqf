/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_control", "_colorDropdown", "_polyRenderColor", "_positions", "_count", "_color", "_maxAmountOfPolys", "_maxAmountOfPolyLines"];
_control = uiNamespace getVariable ['RscMapCreatePoly', controlNull];
_colorDropdown = _control controlsGroupCtrl 4000;
_polyRenderColor = (_colorDropdown lbColor (lbCursel _colorDropdown));
if !(RRPClientGroupMapLineRenderArray isEqualTo []) then
{
	try
	{
		_positions = RRPClientGroupMapLineRenderArray apply {_x select 0};
		_count  = count _positions;
		_color = (RRPClientGroupMapLineRenderArray select 0) select 2;
		_maxAmountOfPolys = getNumber(missionConfigFile >> "CfgGroups" >> "maximumPolys");
		if(count(RRPClientGroupInfo get "polys") >= _maxAmountOfPolys) throw format ["Одновременно на карте может находится не более %1 линий", _maxAmountOfPolys];
		_maxAmountOfPolyLines = getNumber(missionConfigFile >> "CfgGroups" >> "maximumPolyNode");
		if(count _positions > _maxAmountOfPolyLines) throw format ["Что то пошло не так, попробуйте еще раз!", _maxAmountOfPolyLines];
		["addPolyRequest", [_positions,_color]] call RRPClient_system_send;
		call RRPClient_groups_polyAddMenu_event_onUnload;
	}
	catch
	{
		["ErrorTitleAndText", ["Организация", _exception]] call SmartClient_gui_toaster_addTemplateToast;
	};
};