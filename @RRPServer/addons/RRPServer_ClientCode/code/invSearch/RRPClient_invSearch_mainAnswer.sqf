
if !(canSuspend) exitWith {_this spawn RRPClient_invSearch_mainAnswer};
params [
	["_mode",false],
	["_target",objNull,[objNull]]
];



try{

	if !(_mode) throw "Кто то уже обыскивает";
	if (isNull _target) throw "Цель не определена";
	_exit = [_target] call RRPClient_invSearch_condition;
	if (_exit isEqualTo "") throw _exit;

	_sleepTime = 3.6; 
	_dir = getDir _target; 
	_attachArray = [0,0.6,0]; 
	
	[_target,"AG_otherSearching_victim",true,false] remoteExecCall ["RRPClient_system_animSync",0]; 
	[player,"AG_otherSearching_main",true,false] remoteExecCall ["RRPClient_system_animSync",0]; 
	_target attachTo [player, _attachArray]; 
	
	sleep _sleepTime; 
	detach _target; 
	
	[_target,_dir] remoteExecCall ["life_fnc_setDir",-2]; 
	[_target,"AmovPercMstpSnonWnonDnon",true,false] remoteExecCall ["RRPClient_system_animSync",0]; 
	[player,"AmovPercMstpSnonWnonDnon",true,false] remoteExecCall ["RRPClient_system_animSync",0];
	
	_exit = [_target] call RRPClient_invSearch_condition;
	if (_exit isEqualTo "") throw _exit;
	// TODO:
	createGearDialog [_target,'RscDisplayInventory'];
}catch{
	["Обыск",_exception] call toastError;
};