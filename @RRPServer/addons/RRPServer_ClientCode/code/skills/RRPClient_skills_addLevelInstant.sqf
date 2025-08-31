/*
  Project: Rimas Role Play
  Author: FairyTale5571
  License: CC BY-ND
*/

if !(canSuspend) exitWith {_this spawn RRPClient_skills_addLevelInstant};

waitUntil {missionNamespace getVariable ["life_session_completed",false]};
params ["_prof","_amount"];

try
{	
	private _data = missionNamespace getVariable [(_prof),[0,0]];
	private _name = getText(getMissionConfig "CfgSkills" >> _prof >> "displayName");
	private _maxLevel = getNumber(getMissionConfig "CfgSkills" >> _prof >> "maxLevel");
	_data params ["_level","_exp"];
	if (_level >= _maxLevel) throw "Достиг максимума!";
		
	for "_i" from _level to ((_level + _amount) - 1) do  
	{
		if (_level >= _maxLevel) then {break};
		_level = _level + 1;
		missionNamespace setVariable [_prof,[_level,0]];
	};

	private ["_array","_profs"];
	_array = [];
	{
		_profs = missionNamespace getVariable [(configName _x),[0,0]];
		_array pushBack [configName _x,_profs select 0,_profs select 1];
	} forEach ("true" configClasses (missionConfigFile >> "CfgSkills"));
	[[_array], "skills_saveXP"] call RRPClient_system_hcExec;

}catch{
	_exception call RRPClient_system_log;
};

true
