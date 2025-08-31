/*
  Project: Rimas Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

disableSerialization;
private ["_spCfg","_sp"];
params [
    ["_control",controlNull,[controlNull]],
    ["_selection",0,[0]]
];

_spCfg = [player call getSide] call RRPClient_spawn_PointCfg;
_sp = _spCfg select _selection;
[((findDisplay 38500) displayCtrl 38502),1,0.1,getMarkerPos (_sp select 0)] call RRPClient_spawn_SetMapPosition;
life_spawn_point = _sp;
_sps = life_spawn_point select 0;

spawn_camera camSetPos [
    ((getMarkerPos _sps) select 0) + 400, 
    ((getMarkerPos _sps) select 1) + 100,
    ((getMarkerPos _sps) select 2) + 500
    ];
spawn_camera camSetTarget (getMarkerPos _sps);
spawn_camera camCommit 0;
["#(argb,8,8,3)color(0,0,0,1)",false,nil,0,[0,1]] call bis_fnc_textTiles;
ctrlSetText[38501,format ["%2: %1",life_spawn_point select 1,"Текущая точка отключения"]];
