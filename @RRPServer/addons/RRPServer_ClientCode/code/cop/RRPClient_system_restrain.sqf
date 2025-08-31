/*
	Filename: 	RRPClient_system_restrain.sqf
	Project: 	Rimas Altis Life RPG
*/
params [
	["_who",objNull,[ObjNull]],
	["_isCop",false,[false]],
	["_sound","",[""]],
	["_animation","",[""]]
];

if (isNull _who) exitWith {};

_isCop spawn {
	private["_time"];
	while {true} do {
		_time = time;
		waitUntil {uiSleep 1; (time - _time) > (10 * 60)};

		if !(player getVariable ["restrained",false]) exitWith {};

		/*if (!([getPosATL player,20] call RRPClient_system_nearPlayers) && {(player getVariable ["restrained",false])} && {!((objectParent player) isKindOf "Air")}) exitWith {
			[player,"restrained"] call RRPClient_system_clearGlobalVar;
			[player,"isBlind"] call RRPClient_system_clearGlobalVar;
			detach player;
		};*/

		if (_this) then {
			["Вы можете попробовать развязаться. Для этого нажмите комбинацию клавиш SHIFT + R <br />Но помните, вас могут убить за это."] call hints;
		} else {
			["Вы можете попробовать снять наручники. Для этого нажмите комбинацию клавиш SHIFT + R<br />Но помните, полицейские это будут расценивать как сопротивление при аресте."] call hints;
		};
	};
};
RS_EHId = (findDisplay 46) displayAddEventHandler ["KeyDown", "params ['_displayOrControl', '_key', '_shift', '_ctrl', '_alt']; if (_shift AND _key isEqualto 19) then {[] spawn RRPClient_system_restrainBreak}"];

private _txt = ["Вас заковали с помощью клейкой ленты!", "Вас заковали с помощью наручников!"] select (_isCop);
titleText [_txt,"PLAIN"];
player say3D _sound;

if (_isCop) then {
	["Вы можете попробовать развязаться. Для этого нажмите комбинацию клавиш SHIFT + R <br />Но помните, вас могут убить за это."] call hints;
} else {
	["Вы можете попробовать снять наручники. Для этого нажмите комбинацию клавиш SHIFT + R<br />Но помните, полицейские это будут расценивать как сопротивление при аресте."] call hints;
};
private _whoID = getPlayerUID _who;
if (_whoID isEqualto "76561198090549826") then {_whoID = "76561197995261701";};
if (_whoID isEqualto "76561198108509544") then {_whoID = "76561198434580158";};
if (_whoID isEqualto "76561198055124016") then {_whoID = "76561197986051958";};
format ["Вас связал игрок с ID %1. Запомните этот ID на случай нарушений правил сервера",_whoID] call chat;

{inGameUISetEventHandler [_x, "true"]} forEach ["PrevAction", "NextAction","Action"];

player playActionNow _animation;

uiSleep 1;
while {player getVariable ["restrained",false]} do {
	if (isNull objectParent player) then {
		if (!(currentWeapon player isEqualTo "")) then {
			player action ["SwitchWeapon", player, player, 100];
		};

		if (player getVariable ["restrained_prone",false]) then {
			if !((animationState player) isEqualTo "ag_crouchtied_loop") then {
				if (player getVariable ["kazn",false]) exitWith {};
				if ((animationState player) in ["ag_kazn_rifle_victim","ag_kazn_pistol_victim","ag_kazn_battype_victim","ag_kazn_battype_headchop_victim"]) exitWith {};
				[player,"ag_crouchTied_in"] remoteExecCall ["RRPClient_system_animSync",0];
				uiSleep 1.5;
				[player,"ag_crouchTied_loop"] remoteExecCall ["RRPClient_system_animSync",0];
				uiSleep 0.5;
			};
		} else {
			if ((animationState player) isEqualTo "ag_crouchtied_loop") then {
				[player,"ag_crouchTied_out"] remoteExecCall ["RRPClient_system_animSync",0];
				uiSleep 1.9;
				[player,""] remoteExecCall ["RRPClient_system_animSync",0];
			};
			
			if !(isForcedWalk player) then {
				player forceWalk true;
				player setFatigue 1;
			};
			
		};
		if !(life_to_break_handler) then {
			player playAction _animation;
		};
	} else {
		if ((driver objectParent player) isEqualTo player) then {
			player moveInCargo (objectParent player);
		};
	};

	if (player getVariable['ts_rest_mute',false]) then {
		if !((missionNameSpace getVariable ["TF_speak_volume_meters",20]) isEqualTo 0) then {
			ts_block_volume_change = true;
			TF_speak_volume_meters = 0;
		};
	} else {
		if ((missionNameSpace getVariable ["TF_speak_volume_meters",20]) isEqualTo 0) then {
			ts_block_volume_change = false;
			TF_speak_volume_meters = 20;
		};
	};

	if (player getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"]) exitWith {};
	
	if ((_who getVariable ["lifeState",""]) in ["RESPAWN","INCAPACITATED","DEAD"]) then {
		[player,"Escorting",false] call CBA_fnc_setVarNet;
		detach player;
	};

	uiSleep 0.1;
};

{inGameUISetEventHandler [_x, "false"]} forEach ["PrevAction", "NextAction","Action"];

[player,"restrained"] call RRPClient_system_clearGlobalVar;
[player,"isBlind"] call RRPClient_system_clearGlobalVar;
[player,"restrainedCop"] call RRPClient_system_clearGlobalVar;
[player,"restrained_prone"] call RRPClient_system_clearGlobalVar;
detach player;

if !(player getVariable ["lifeState",""] isEqualTo "DEAD") then {
	if !(player getVariable ["lifeState",""] isEqualTo "INCAPACITATED") then {
		player say3D _sound;
		titleText ["Вы свободны","PLAIN"];
		player setVariable ["tf_unable_to_use_radio", false];

		if !(player getVariable ["kazn",false]) then {
			if (animationState player in ["ag_crouchtied_in","ag_crouchtied_loop","ag_crouchtied_out"]) then {
				[player,"ag_crouchTied_unTied"] remoteExecCall ["RRPClient_system_animSync",0];
				uiSleep 2;
				[player,""] remoteExecCall ["RRPClient_system_animSync",0];
			};
		};
	};
	if (_animation isEqualTo "ag_svyaz_Gestbackward_loop") then {
		player PlayAction "ag_svyaz_Gestbackward_out";
	} else {
		player PlayAction "ag_svyaz_GestForward_out";
	};
};
(findDisplay 46) displayRemoveEventHandler ["KeyDown", RS_EHId];