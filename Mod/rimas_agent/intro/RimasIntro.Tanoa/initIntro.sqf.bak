showCinemaBorder false;
enableSaving [ false, false ];

"MainMenuDummy" cutRsc ["RscDisplayMainMenuBackground","plain"]; //--- Register empty layer, because layer 0 is the same as no layer (bug?)
"MainMenu" cutRsc ["RscDisplayMainMenuBackground","plain"];

["InitDummy",["Tanoa",[7032.89,11608.8,1.08008],70.87,0.75,[3.28505,0],0,0,720.073,0.3,0.5,1,0,1]] call bis_fnc_camera;

_grp = createGroup west;
PreviewUnit = _grp createUnit ["B_Sharpshooter_F",[7034.97,11608.9,0.00135803],[],0,"FORM"];
PreviewUnit setPosATL [7034.97,11608.9,0.00135803];
PreviewUnit switchMove "HubStandingUB_idle2";

removeAllWeapons PreviewUnit;
removeAllAssignedItems PreviewUnit;
removeGoggles PreviewUnit;
removeHeadgear PreviewUnit;
removeVest PreviewUnit;
removeBackpackGlobal PreviewUnit;
removeUniform PreviewUnit;
[PreviewUnit,profileNamespace getVariable "GearForIntro"] call RRPClient_system_loadGearIntro;
setviewdistance 400;

0 fadeMusic 1;
playMusic "AmbientTrack01_F_EXP"; 
addMusicEventHandler ["MusicStop", {0 fadeMusic 1; playMusic "AmbientTrack01_F_EXP"}];

"colorCorrections" ppEffectAdjust [1,1,0,[0,0,0,0],[0,0,0,0.24],[1,1,1,0],[0.7,0.7,0,0,-0.1,0.4,0.8]];
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectCommit 0;

disableSerialization;
_display = uiNamespace getVariable ["RscDisplayMain",displayNull];
_mouseArea = _display displayCtrl 999;

MouseButton = false;
_display displayAddEventHandler ["MouseButtonDown",{if (_this select 1 isEqualTo 0) then {MouseButton = true;};}];
_display displayAddEventHandler ["MouseButtonUp", {if (_this select 1 isEqualTo 0) then {MouseButton = false;};}];
_display displayAddEventHandler ["MouseMoving", {if (MouseButton && {!isNil "PreviewUnit"}) then {params ["", "_x", "_y"];private _dir = getDir PreviewUnit;PreviewUnit setDir (_dir + (_x * ((1.2 max 1) min 10)));};}];
