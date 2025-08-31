params [
	["_task_name",[],[[]]],
	["_task_pos",[],[[]]],
	["_task_desc",[],[[]]]
];
private _task = player createSimpleTask _task_name; 

_task setSimpleTaskDestination _task_pos; 
_task setSimpleTaskDescription _task_desc;
_task setTaskState "CREATED"; 
_task setSimpleTaskType _task_desc#2; 
player setCurrentTask _task;
[_task_desc#0] call toastInfo;
_task
