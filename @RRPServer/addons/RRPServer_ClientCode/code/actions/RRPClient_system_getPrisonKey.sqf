/*
	Filename: 	RRPClient_system_getPrisonKey.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
if ((["cop"] call RRPClient_system_playerCount) < (LIFE_SETTINGS(getNumber,"life_cop_min"))) exitWith {
	[format["На острове должно быть хотя бы %1 полицейских, иначе ключи хранятся в сейфе Национального Резерва",(LIFE_SETTINGS(getNumber,"life_cop_min"))]] call hints;
};

if (!life_prisonkey) then {
	life_prisonkey = true;
	titleText["Вы взяли ключи от кандалов. Теперь вы можете освободить заключенных!","PLAIN"];
};