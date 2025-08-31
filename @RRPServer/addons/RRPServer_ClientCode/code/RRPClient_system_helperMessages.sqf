while {true} do
{
	if !(player getVariable ["RRPVariablePartyMeatActive", false]) then {
		uiSleep getNumber(missionConfigFile >> "RRP_messages" >>  "CfgHelperMessages" >> "timeout");
		_msg = getArray(missionConfigFile >> "RRP_messages" >>  "CfgHelperMessages" >> "msgs");
		[format["<t color='#ffffff' font='SFCompactTextItalic'>%1</t>",selectRandom _msg],getNumber(missionConfigFile >> "RRP_messages" >> "CfgHelperMessages" >> "showTime")] spawn RRPClient_gui_showHelperMessages;
	};
};
