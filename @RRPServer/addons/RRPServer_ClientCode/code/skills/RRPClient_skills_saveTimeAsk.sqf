/*
  Project: Rimas Role Play
  Author: FairyTale5571
  License: CC BY-ND
*/

RRPClientSkillsTempData = param [0,"",[""]];
private _name = getText(getMissionConfig "CfgSkills" >> RRPClientSkillsTempData >> "displayName");
private _xpPerRc = getNumber(getMissionConfig "CfgSkills" >> RRPClientSkillsTempData >> "xpPerRc");

(missionNamespace getVariable [RRPClientSkillsTempData, [0,0]]) params ["_currentLvl", "_currentXp"];
private _nextLevelXp = _currentLvl * (_currentLvl - 1) * 1500;
if (_nextLevelXp < 1) then {_nextLevelXp = 1500;};

private _neededXpToBuy = _nextLevelXp - _currentXp;
private _cost = ceil(_neededXpToBuy / _xpPerRc);

[
  (uiNamespace getVariable ["RRPDialogTablet",displayNull]),
  {
    [RRPClientSkillsTempData] call RRPClient_skills_buyTimeSaverRequest;
  },[],
  "Сохранить время?",
  format ["Сохранить ваше время и получить следующий уровень умения %1? Стоимость улучшения составит %2 RC",_name,[_cost] call RRPClient_util_numberText]
] call RRPClient_util_prompt;
true
