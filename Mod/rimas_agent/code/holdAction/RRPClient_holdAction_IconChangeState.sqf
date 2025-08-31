params[["_target", objNull, [objNull]], ["_actionID", 0, [0]], ["_title", "", [""]], ["_icon", "", [""]], ["_texSet", uiNamespace getVariable['holdAction_texturesIdle', []],[[]]], ["_frame", 0, [0]], ["_hint", "", [""]], ["_isTimer", false, [false]]];
if (_isTimer) then {
	_target setUserActionText[_actionID, _title, _texSet select _frame, "<br/>" + _hint];
} else {
	_target setUserActionText[_actionID, _title, _texSet select _frame, _icon + "<br/><br/>" + _hint];
};