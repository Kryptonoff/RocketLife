private["_unit"];
_unit = cursorTarget;
if (isNull _unit OR 
	!((isPlayer _unit) && 
	((typeOf _unit) isEqualTo 'C_man_1'))
   ) exitWith {};
   
if(!(_unit getVariable ["restrained",false])) exitWith {};

if (_unit getVariable ["restrained_prone",false]) then {
	[_unit,"restrained_prone",false] call CBA_fnc_setVarNet;
} else {
	[_unit,"restrained_prone",true] call CBA_fnc_setVarNet;
};