/*
  Project: Rimas Role Play
  Author: FairyTale5571
  License: CC BY-ND
*/

private ["_level","_exp","_data","_name","_nextLevel","_maxLevel"];
disableSerialization;
params ["_prof","_amount", ["_ignoreMultipliers", false]];
try {
	_data = missionNamespace getVariable [(_prof),[0,0]];
	_name = getText(getMissionConfig "CfgSkills" >> _prof >> "displayName");
	_maxLevel = getNumber(getMissionConfig "CfgSkills" >> _prof >> "maxLevel");
	_level = _data select 0;
	_exp = _data select 1;
	if (_level >= _maxLevel) throw "Достиг максимума!";

	if !(_ignoreMultipliers) then {
		_amount = ["skillXP",_amount] call RRPClient_system_VIP;
		if (["QuickLearner"] call perk) then {_amount = _amount + (_amount * 0.1)};
	};

	[_prof,_amount] call RRPClient_skills_addXPUI;
	_exp = _exp + _amount;
	_nextLevel = 0;
	_nextLevel = _level * (_level - 1) * 1500;
	if (_nextLevel < 1) then {_nextLevel = 1500;};
	if (_exp >= _nextLevel) then {
		if (_level == (_maxLevel - 1)) then {
			missionNamespace setVariable [_prof,[(_data select 0) + 1,0]];
			_level = (_data select 0) + 1;
			["InfoTitleAndText", ["Новый уровень!", format["<t size='25' color='#20B2AA'>Поздравляем!</t><br />Вы достигли максимального: %1 уровня %2",_level,_name]]] call SmartClient_gui_toaster_addTemplateToast;
			playSound "levelup";
			[parseText format["<t align='center' size='1.4'><t font='PuristaBold' size='3' color='#FFFFFF'>Уважаемый, %1<br/><br/></t>Вы подняли свой уровень мастерства в сфере<br/> %2 до %3",player call getNickName,_name,_level],[0,0,1,1], nil, 10, 0.5, 0] spawn BIS_fnc_textTiles;
		}else{
			_exp = _exp - _nextLevel;
			if (_exp < 0) then{_exp = 0;};
			missionNamespace setVariable [_prof,[(_data select 0) + 1,(_exp)]];
			_level = (_data select 0) + 1;
			["InfoTitleAndText", ["Новый уровень!", format["<t size='25' color='#20B2AA'>Поздравляем!</t><br />Вы достигли %1 уровня %2",_level,_name]]] call SmartClient_gui_toaster_addTemplateToast;
			playSound "levelup";
			[parseText format["<t align='center' size='1.4'><t font='PuristaBold' size='3' color='#FFFFFF'>Уважаемый, %1<br/><br/></t>Вы подняли свой уровень мастерства в сфере<br/> %2 до %3",player call getNickName,_name,_level],[0,0,1,1], nil, 10, 0.5, 0] spawn BIS_fnc_textTiles;
		};
	}else{
		missionNamespace setVariable [_prof,[(_data select 0),(_exp)]];
	};

	private ["_array","_profs"];
	_array = [];
	{
		_profs = missionNamespace getVariable [(configName _x),[0,0]];
		_array pushBack [configName _x,_profs select 0,_profs select 1];
	} forEach ("true" configClasses (missionConfigFile >> "CfgSkills"));
	[[getPlayerUID player,_array], "skills_saveXP"] call RRPClient_system_hcExec;
}catch{
	_exception call RRPClient_system_log;
};
