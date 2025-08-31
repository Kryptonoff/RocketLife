
params [
	"_unit"
];
if (RRPClientIsPlayingRussianRoulette) exitWith {};
[
	findDisplay 46,
	{
		params ["_target"];
		_nickName = _target call getNickName;
		_uid = getPlayerUID _target;

		_indexInIds = [_uid,life_ids] call RRPClient_system_index;
		if (_indexInIds isEqualTo -1) then {
			life_ids pushBack [_uid,time,1];
		} else {
			(life_ids select _indexInIds) params ["","","_type"];
			if (_type isEqualTo 2) then {
				life_ids set [_indexInIds,[_uid,time,3]];
			}else{
				life_ids set [_indexInIds,[_uid,time,1]];
			};
		};

		[getPlayerUID player] remoteExecCall ["RRPClient_id_nickResponse",_target];
		[format["Вы познакомились с ""%1""",player call getNickName]] remoteExecCall ["hints",_target];
		[format["Вы познакомились с ""%1""",_nickName]] call hints;
	
		if !((vehicle player) isEqualTo player) exitWith {};
		if !((vehicle _target) isEqualTo _target) exitWith {};
		
		if ((player distance _target) > 3) exitWith {};
		
		if !(_target getVariable ['lifeState',''] isEqualTo 'HEALTHY') exitWith {};
		if (_target getVariable['restrained',false]) exitWith {};
		if (_target getVariable ["knoked",false]) exitWith {};
		if (_target getVariable ["tazed",false]) exitWith {};
		if (_target getVariable ["surrender", false]) exitWith {};
		
		if (life_action_inUse) exitWith {};
		if (call RRPClient_system_isInterrupted) exitWith {};
		
		_animTarget = "AG_ShakeHands_two_victim";
		_animPlayer = "AG_ShakeHands_two_main";
		_sleepTime = 2.66;
		_attachArray = [0,1.2,0];
	
		_dir = getDir _target;
		[_target,_animTarget,true,false] remoteExecCall ["RRPClient_system_animSync",-2];
		[player,_animPlayer,true,false] remoteExecCall ["RRPClient_system_animSync",-2];
		_target attachTo [player, _attachArray];
		uiSleep _sleepTime;
		detach _target;
		[_target,_dir] remoteExecCall ["RRPClient_system_setDir",-2];
		[_target,"AmovPercMstpSnonWnonDnon",false,false,true] remoteExecCall ["RRPClient_system_animSync",-2];
		[player,"AmovPercMstpSnonWnonDnon",false,false,true] remoteExecCall ["RRPClient_system_animSync",-2];

	},[_unit],
	"Новые знакомства",
	"С вами хотят познакомиться, хотите ли Вы?"
] call RRPClient_util_prompt;
