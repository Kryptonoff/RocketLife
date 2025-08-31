/*

    Filename: 	RRPClient_system_getStackChance.sqf
	Project: 	Rimas Altis Life RPG

	["restrain_break",10,5,180] call RRPClient_system_getStackChance;
*/
params [
	["_name","",[""]],
	["_default_chance",-1,[0]],
	["_add_chance",-1,[0]],
	["_time_check",120,[0]]
];

if ((_name isEqualTo "") || (_default_chance isEqualTo -1) || (_add_chance isEqualTo -1)) exitWith {0};

private _return = _default_chance;
private _old_chance = (missionNameSpace getVariable [format["gsc_old_chance_%1",_name],0]);
private _old_time = (missionNameSpace getVariable [format["gsc_old_time_%1",_name],0]);

if ((time - _old_time) < _time_check) then {
	_return = _old_chance + _add_chance;
	missionNameSpace setVariable [format["gsc_old_chance_%1",_name],_return];
	missionNameSpace setVariable [format["gsc_old_time_%1",_name],time];
} else {
	missionNameSpace setVariable [format["gsc_old_chance_%1",_name],_return];
	missionNameSpace setVariable [format["gsc_old_time_%1",_name],time];
};
_return;
