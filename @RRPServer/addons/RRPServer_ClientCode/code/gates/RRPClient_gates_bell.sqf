/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/
private ["_sound","_soundObjects","_timeout"];
_sound = _this select 0;
_soundObjects = _this select 1;
_timeout = _this select 2;
if !(time - (missionNamespace getVariable ["bell_timer",0]) > _timeout) exitWith {};
{[(missionNamespace getVariable [_x, objNull]),_sound,140] remoteExecCall ["RRPClient_util_globalSound",-2]} forEach _soundObjects;
bell_timer = time;
