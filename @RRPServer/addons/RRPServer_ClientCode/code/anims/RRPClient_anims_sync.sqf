
private _target = param [0,objNull,[objNull]];
private _anim = param [1,"",[""]];
if (RRPClientIsPlayingRussianRoulette) exitWith {};
private _animTarget = "";
private _animPlayer = "";
private _sleepTime = 0;
private _attachArray = +[];
private _text = "";
private _name = "Неизвестный";

if ((_target in (units group player)) && {!((_target call getSide) isEqualTo "cop")}) then {
	_name = _target call getNickName;
};

switch (_anim) do {
	case "ShakeHands": {
		_animTarget = "AG_ShakeHands_two_victim";
		_animPlayer = "AG_ShakeHands_two_main";
		_sleepTime = 2.66;
		_attachArray = [0,1.2,0];
		_text = "хочет пожать вам руку";
	};
	case "HighFive": {
		_animTarget = "AG_HighFive_two_victim";
		_animPlayer = "AG_HighFive_two_main";
		_sleepTime = 1.59;
		_attachArray = [0,1.17,0];
		_text = "хочет дать вам пять";
	};
	case "Hugging": {
		_animTarget = "AG_Hugging_two_victim";
		_animPlayer = "AG_Hugging_two_main";
		_sleepTime = 2.39;
		_attachArray = [0,0.82,0];
		_text = "хочет вас обнять";
	};
	case "KissChin": {
		_animTarget = "AG_Kiss_Chin_two_victim";
		_animPlayer = "AG_Kiss_Chin_two_main";
		_sleepTime = 2.69;
		_attachArray = [0,0.69,0];
		_text = "хочет вас поцеловать";
	};
	case "Kulachok": {
		_animTarget = "AG_kulachok_two_victim";
		_animPlayer = "AG_kulachok_two_main";
		_sleepTime = 1.59;
		_attachArray = [0,1.01,0];
		_text = "хочет дать вам кулачёк";
	};
};

[
	findDisplay 46,
	{
		params ["_target","_sleepTime","_animTarget","_animPlayer"];
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
		
		_dir = getDir _target;
		[_target,_animTarget,true,false] remoteExecCall ["RRPClient_system_animSync",-2];
		[player,_animPlayer,true,false] remoteExecCall ["RRPClient_system_animSync",-2];
		_target attachTo [player, _attachArray];
		uiSleep _sleepTime;
		detach _target;
		[_target,_dir] remoteExecCall ["RRPClient_system_setDir",-2];
		[_target,"AmovPercMstpSnonWnonDnon",false,false,true] remoteExecCall ["RRPClient_system_animSync",-2];
		[player,"AmovPercMstpSnonWnonDnon",false,false,true] remoteExecCall ["RRPClient_system_animSync",-2];
	},[
		_target,
		_sleepTime,
		_animTarget,
		_animPlayer
	],
	"Вам предлагают действие",
	format ["%1 %2",_name,_text]
] call RRPClient_util_prompt;
