showCinemaBorder false;
enableSaving [ false, false ];
"MainMenuDummy" cutRsc ["RscDisplayMainMenuBackground","plain"]; //--- Register empty layer, because layer 0 is the same as no layer (bug?)
"MainMenu" cutRsc ["RscDisplayMainMenuBackground","plain"];
player setUnitLoadout (profileNamespace getVariable "GearForIntro2");
[
	{	
		[PreviewUnit,profileNamespace getVariable "GearForIntro2"] call RRPClient_system_loadGearIntro;
		["InitDummy",["RRpMap",[16613.5,12752.1,1.21565],302.241,0.75,[-4.60222,0],2.58953,0,720.022,0,1,1,0,1]] call bis_fnc_camera;
		
		PreviewUnit setPosWorld [16611.8,12753.2,14.3686];
		setviewdistance 450;
		[PreviewUnit,"STAND_U2"] call RRPClient_util_ambientAnim;
		PreviewUnit setDir 117.732;
	}
] call BIS_fnc_initWorldScene;

disableSerialization;
private _display = uiNamespace getVariable ["RscDisplayMain",displayNull];
private _mouseArea = _display displayCtrl 999;

MouseButton = false;
_display displayAddEventHandler ["MouseButtonDown",{
	if (_this select 1 isEqualTo 0) then {
		MouseButton = true;
	};
}];
_display displayAddEventHandler ["MouseButtonUp", {
	if (_this select 1 isEqualTo 0) then {
		MouseButton = false;
	};
}];
_display displayAddEventHandler ["MouseMoving", {
	if (MouseButton && {!isNil "PreviewUnit"}) then {
		params ["", "_x", "_y"];
		private _dir = getDir PreviewUnit;
		PreviewUnit setDir (_dir + (_x * ((1.2 max 1) min 10)));
	};
}];