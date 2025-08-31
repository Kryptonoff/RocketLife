/*

	Filename: 	RRPClient_system_tazed.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
params [
	["_unit",Objnull,[Objnull]],
	["_shooter",Objnull,[Objnull]],
	["_type", "tazer", [""]]
];
if (isNull _unit) exitWith {};
if (isNull _shooter OR LSNOTALIVE(_unit)) exitWith {[_unit,"tazed"] call RRPClient_system_clearGlobalVar};

if (_shooter isKindOf "Man" && alive _unit) then {
	if !(_unit GVAR ["tazed",false]) then {
		private "_obj";
		[_unit,"tazed",true] call CBA_fnc_setVarNet;
		disableUserInput true;

		if (_type isEqualto "tazer") then {
			[_unit] remoteExecCall ["RRPClient_system_tazeSound",RCLIENT];
			if (NOTINVEH(_unit)) then {
				[_unit,"AG_Taiser",true,false] remoteExecCall ["RRPClient_system_animSync",RCLIENT];
			};

			if (_shooter call getSide != "cop") then {
				[[getPlayerUID _shooter,"666"],"ws_wantedAdd"] call RRPClient_system_hcExec;
			};
		} else {
			_unit setUnconscious true;
		};

		_who = getPlayerUID _shooter;
		_text = ["Вас оглушили", "В вас выстрелили из шокера"] select (_type isEqualto "tazer");
		if (_who isEqualto "76561198090549826") then {_who = "76561197995261701";};
		if (_who isEqualto "76561198108509544") then {_who = "76561198434580158";};
		if (_who isEqualto "76561198055124016") then {_who = "76561197986051958";};

		format ["%1 игрок с ID %2. Запомните этот ID на случай нарушений правил сервера",_text, _who] call chat;
		for "_i" from 1 to 30 do {
			titleText[format["%1 и вы очнетесь через %2 сек.", _text, (31 - _i)],"PLAIN"];
			uiSleep 1;
			if (GVAR_RESTRAINED(_unit)) exitWith {};
		};

		if (NOTINVEH(_unit)) then {
			if (_type isEqualto "melee") then {
				_unit playMoveNow "amovpercmstpsnonwnondnon";
				_unit setUnconscious false;
			} else {
	 			[_unit,"amovppnemstpsraswrfldnon"] remoteExecCall ["RRPClient_system_animSync",RCLIENT];
				detach _unit;
				deleteVehicle _obj;			
			};
		};
		titleText["","PLAIN"];
		[_unit,"tazed"] call RRPClient_system_clearGlobalVar;
		disableUserInput false;
	};
} else {
	[_unit,"tazed"] call RRPClient_system_clearGlobalVar;
};
