/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/
private ["_crew","_msgClass"];

try {
  if (isNil "_this") throw "Нет техники!";
  if (isNull _this) throw "Нет техники!!";
  if (_this distance player > 300) throw "Дистанция слишком велика нас не услышат!";
  if (vehicle player isEqualto vehicle _this) throw "Дружище, это же твоя техника!";
  if (!alive _this) throw "Эта груда металлолома уже никуда не уедет!";

  _crew = crew _this;
  if (_crew isEqualto []) throw "";

  _msgClass = "";
  {
    if (call (compile (getText(_x >> "condition")))) exitWith {_msgClass = (configName _x)};
  } forEach ('true' configClasses (missionConfigFile >> 'RRP_messages' >> 'warningMessages'));
  if (_msgClass isEqualto "") then {_msgClass = "default"};
  {_msgClass remoteExecCall ["RRPClient_warning_requestIn",_x]} forEach _crew;
  ["successTitleAndText", ["Предупреждение", "Успешно отправлено!"]] call SmartClient_gui_toaster_addTemplateToast;
} catch {
	if !(_exception isEqualTo "") then {
		["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
	};
};
