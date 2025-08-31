
private _target = param [0,objNull,[objNull]];
private _anim = param [1,"",[""]];

if ((isNull _target) || !((isPlayer _target) && ((typeOf _target) isEqualTo 'I_Survivor_F'))) exitWith {};
if (_anim isEqualTo "") exitWith {};

//any check
if !((vehicle player) isEqualTo player) exitWith {};
if !((vehicle _target) isEqualTo _target) exitWith {};

if ((player distance _target) > 3) exitWith {};

if !(_target getVariable ['lifeState',''] isEqualTo 'HEALTHY') exitWith {};
if (_target getVariable ['restrained',false]) exitWith {};
if (_target getVariable ["knoked",false]) exitWith {};
if (_target getVariable ["tazed",false]) exitWith {};
if (_target getVariable ["surrender", false]) exitWith {};

if (life_action_inUse) exitWith {};
if (call RRPClient_system_isInterrupted) exitWith {};

[player,_anim] remoteExec ["RRPClient_anims_sync",_target];
