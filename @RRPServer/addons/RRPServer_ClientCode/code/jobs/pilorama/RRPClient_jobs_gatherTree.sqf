/*
Author:	Arrra

http://steamcommunity.com/id/sdfsfsdgdfgdgdfg/

My VK:https://vk.com/id478482025
*/

#include "..\..\..\script_macros.hpp"

private["_treeModelNames","_tree","_holder","_newDamage","_curDamage"];
if (isNull cursorObject) exitWith {
	["WarningTitleAndText", ["Внимание!", "Рубить можно только деревья и людей, шутка - только людей!"]] call SmartClient_gui_toaster_addTemplateToast;
};

if (player distance2d cursorObject > 3) exitWith 
{
	["WarningTitleAndText", ["Внимание!", "Подойдите ближе!"]] call SmartClient_gui_toaster_addTemplateToast;
};

private _tree = if (["t_pinuss2s",([cursorObject] call RRPClient_util_getModelName)] call RRPClient_util_xString) then {cursorObject} else {objNull};

if (isNull _tree) exitWith 
{
	["WarningTitleAndText", ["Внимание!", "Данное дерево подойдет только для разведения костра. Вам нужны крупные хвойные деревья!"]] call SmartClient_gui_toaster_addTemplateToast;
};



if (!isNull _tree) then {
	if (alive _tree) then {
		if (EQUAL(_tree,(life_tree_chop select 0))) then {
			_newDamage = (life_tree_chop select 1) + 0.1;
			life_tree_chop set [1,_newDamage];
		} else {
			life_tree_chop set [0,_tree];
			life_tree_chop set [1,0.1];
		};

		_curDamage = life_tree_chop select 1;

		if (_curDamage >= 1) then {
			life_tree_chop = [objNull,0];
			_tree setDamage 1;
			_brevno = createVehicle ["vvv_tronco", position player, [], 0, "NONE"];	
			[
			_brevno,                                                                           
			"Погрузить бревно в грузовик",                                                                       
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                     
			"_this distance _target < 5",                                                        
			"(_caller distance _target < 5) and !( call RRPClient_system_checkVeh)",                                                      
			{},                                                                                  
			{},                                                                                  
			{
			[_target] call RRPClient_jobs_packLogs;
			},                                                
			{},                                                                                  
			[],                                                                              
			12,                                                                            
			0,                                                                          
			true,                                                                            
			false                                                                           
            ] call RRPClient_holdAction_Add;
//remoteExec ["BIS_fnc_holdActionAdd", [0,2] select isDedicated, _brevno]; 			
			/*[_brevno] spawn 
			{
				uiSleep 180;
				deleteVehicle (_this select 0);
			};*/
		};
	};
};
    