/*
Author:	Arrra

http://steamcommunity.com/id/sdfsfsdgdfgdgdfg/

My VK:https://vk.com/id478482025
*/
_type = _this select 0;
_box = _this select 1;
if (isNull _box) exitwith {};
uiSleep 180;
deleteVehicle _box;
box_work_port_active = false;
[_type] call BIS_fnc_deleteTask;

