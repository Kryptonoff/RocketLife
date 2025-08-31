/*

	Filename: 	RRPClient_system_progressBarCustom.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
params [
	["_title","",[""]],
	["_p_secs",0,[-1]],
	["_sound","",[""]],
	["_customAnim","",[""]],
	["_kneelAnim",false,[false]],
	["_customConditions",{false},[{}]]
];

call RRPCLient_actions_inUse;
if !(_sound isEqualTo "") then {player say3D _sound};

disableSerialization;
["life_progress_custom","PLAIN"] call RRPCLient_gui_CreateRscLayer;
private _ui = uiNamespace getVariable "life_progress_custom"; 
private _p_bar = _ui displayCtrl 38201; 
private _p_text = _ui displayCtrl 38202; 
_p_text ctrlSetStructuredText parseText format ["<t size='1' align='center' shadow='2'>%1</t>", _title];	
	
private _p_count = 0;
while {true} do {
	uiSleep 0.1;
	_p_count = _p_count + (0.1/_p_secs);
	_p_bar progressSetPosition _p_count;
	if (_p_count >= 1 OR life_interrupted OR (call RRPCLient_system_isInterrupted)) exitWith {};	
	if (call _customConditions) exitWith {};	
	if !(_customAnim isEqualTo "") then {player playActionNow _customAnim};
	if (_kneelAnim) then {call RRPCLient_animation_kneelWork};	
};
["life_progress_custom"] call RRPCLient_gui_DestroyRscLayer;
life_action_inUse = false;