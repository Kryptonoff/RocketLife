/*
  Project: Rimas Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private ["_spCfg","_sp","_ctrl"];
disableSerialization;

if (life_is_arrested) exitWith {
	call RRPClient_system_respawned;
};

if (life_respawned) then {
	call RRPClient_system_respawned;
};

0 cutText ["","BLACK IN"];

private _randCamX = 75 - floor(random 360);
private _randCamY = 75 - floor(random 360);

spawn_camera = "CAMERA" camCreate (getPosWorld player);
camUseNVG false;
showCinemaBorder true;
spawn_camera cameraEffect ["Internal","Back"];
if (!(createDialog "RRPSpawnDialog")) exitWith {call RRPClient_spawn_Menu;};
false call RRPClient_hud_show;
spawn_camera camSetTarget player;
spawn_camera camSetRelPos [0,3.5,4.5];
spawn_camera camSetFOV .90;
spawn_camera camSetFocus [150,0];
spawn_camera camCommit 0;

["DynamicBlur", 400, [0.4]] spawn {
    params ["_name", "_priority", "_effect", "_handle"];
    while {
        cl_spawnmenu_blur = ppEffectCreate [_name, _priority];
        cl_spawnmenu_blur < 0
    } do {
        _priority = _priority + 1;
    };
    cl_spawnmenu_blur ppEffectEnable true;
    cl_spawnmenu_blur ppEffectAdjust _effect;
    cl_spawnmenu_blur ppEffectCommit 0.1;
};

(findDisplay 38500) displaySetEventHandler ["keyDown","_this call RRPClient_spawn_evh_onKeyDown"];

_spCfg = [player call getSide] call RRPClient_spawn_PointCfg;

_ctrl = ((findDisplay 38500) displayCtrl 38510);
{
    _ctrl lbAdd ((_spCfg select _ForEachIndex) select 1);
    _ctrl lbSetPicture [_ForEachIndex,(_spCfg select _ForEachIndex) select 2];
    _ctrl lbSetData [_ForEachIndex,(_spCfg select _ForEachIndex) select 0];
} forEach _spCfg;

_sp = _spCfg select 0;
_ctrl lbSetCurSel 0;

[((findDisplay 38500) displayCtrl 38502),1,0.1,getMarkerPos (_sp select 0)] call RRPClient_spawn_SetMapPosition;
life_spawn_point = _sp;

ctrlSetText[38501,format ["%2: %1",_sp select 1,"Текущая точка отключения"]];
