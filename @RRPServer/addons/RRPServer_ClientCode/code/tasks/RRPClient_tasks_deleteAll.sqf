private _tasks = [player] call BIS_fnc_tasksUnit;
{
	[_x] call BIS_fnc_deleteTask;
} forEach _tasks;
