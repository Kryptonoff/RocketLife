try {
	private ["_unit","_mode","_pos", "_title", "_time"];

	if (!alive player) throw "";
	if (vehicle player != player) throw "";

	_unit = param [0,objNull,[objNull]];
	_mode = param [1,"",[""]];

	if !(isClass(missionConfigFile >> "teleportCfg" >> _mode)) throw "";
	_pos = getArray(missionConfigFile >> "teleportCfg" >> _mode >> "position");
	_title = getText(missionConfigFile >> "teleportCfg" >> _mode >> "title");
	_time = getNumber(missionConfigFile >> "teleportCfg" >> _mode >> "time");

	[
		(findDisplay 46),
		{
			titleCut ["", "BLACK FADED", 999];
			titleText [(_this # 1),"PLAIN"];
			titleFadeOut (_this # 2);
			uiSleep (_this # 2);
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [6];
			"dynamicBlur" ppEffectCommit 0;
			"dynamicBlur" ppEffectAdjust [0.0];
			"dynamicBlur" ppEffectCommit 5;
			player setPos (_this # 0);

			titleCut ["", "BLACK IN", 5];
		},
		[_pos,_title,_time],
		_title,
		""
	] call RRPClient_util_prompt;


} catch {
	["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
