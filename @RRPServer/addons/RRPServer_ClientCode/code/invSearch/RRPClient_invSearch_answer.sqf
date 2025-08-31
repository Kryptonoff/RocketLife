
if !(canSuspend) exitWith {_this spawn RRPClient_invSearch_answer};
params [
	["_target",objNull,[objNull]],
	["_action",false]
];

_exit = [_target] call RRPClient_invSearch_condition;

try{
	if (_exit isNotEqualTo "") throw _exit;
	if (_action) then {
		_sleepTime = 3.6; 
		_dir = getDir _target; 
		_attachArray = [0,0.6,0]; 
		
		[_target,"AG_otherSearching_victim",true,false] remoteExecCall ["RRPClient_system_animSync",0]; 
		[player,"AG_otherSearching_main",true,false] remoteExecCall ["RRPClient_system_animSync",0]; 
		_target attachTo [player, _attachArray]; 
		sleep _sleepTime; 
		detach _target; 
		[_target,_dir] remoteExecCall ["RRPClient_system_setDir",-2]; 
		[_target,"AmovPercMstpSnonWnonDnon",true,false] remoteExecCall ["RRPClient_system_animSync",0]; 
		[player,"AmovPercMstpSnonWnonDnon",true,false] remoteExecCall ["RRPClient_system_animSync",0];
		
		if (_exit isNotEqualTo "") throw _exit;
		createGearDialog [_target,'RscDisplayInventory'];
	}else{
		throw "Осматриваемый отказался от досмотра!"
	};
}catch{
	["Обыск",_exception] call toastError;
};
true
