showCinemaBorder false;
enableSaving [ false, false ];

"MainMenuDummy" cutRsc ["RscDisplayMainMenuBackground","plain"]; //--- Register empty layer, because layer 0 is the same as no layer (bug?)
"MainMenu" cutRsc ["RscDisplayMainMenuBackground","plain"];
if !(primaryweapon PreviewUnit isEqualTo "") then {
    PreviewUnit switchMove "Acts_AidlPercMstpSlowWrflDnon_warmup04";
} else {
    PreviewUnit switchMove "Acts_CivilIdle_1";
};
player setUnitLoadout (profileNamespace getVariable "GearForIntr");
[
	{	
		//Fiesta
		["InitDummy",["Altis",[14457.2,17587.1,1.21521],152.195,0.75,[-4.72027,0],1.54886,0,1065.33,0.729273,1,1,0,1.00536]] call bis_fnc_camera;
		PreviewUnit setPosWorld [14457.7,17584.8,20.6551];
		setviewdistance 300;
	},
	{
		//Crimea
		["InitDummy",["Altis",[11102.9,7330.8,1.47536],358.699,0.75,[-6.34374,0],2.02312,0,720.021,0.297165,1,1,0,1]] call bis_fnc_camera;
		PreviewUnit setPosWorld [11103.4,7333.14,193.718];
		PreviewUnit setDir 187.75;
		setviewdistance 700;
	},
	{
		//House
		["InitDummy",["Altis",[20812.6,6784.35,4.99011],124.241,0.75,[-1.95193,0],1.07459,0,1338.51,0.992754,1,1,0,1]] call bis_fnc_camera;
		PreviewUnit setPosWorld [20814.7,6783.57,39.5319];
		PreviewUnit setDir 304.658;
		setviewdistance 100;
	},
	{
		//Salt
		["InitDummy",["Altis",[24678.5,18887.7,1.01792],93.429,0.75,[-1.21996,0],1.63763,0,326.973,0.3,1,0.996097,0.00137269,1.00275]] call bis_fnc_camera;
		PreviewUnit setPosWorld [24680.6,18888.3,3.19144];
		PreviewUnit setDir 240.751;
		setviewdistance 100;
	},
	{
		//Police, station
		["InitDummy",["Altis",[14171.4,16545.5,1.26896],138.09,0.75,[-0.551598,0],1.21562,0,1139.77,0.41697,1,1,0,1]] call bis_fnc_camera;
		PreviewUnit setPosWorld [14172.9,16544.4,16.1931];
		PreviewUnit setDir 332.121;
		setviewdistance 100;
	}
] call BIS_fnc_initWorldScene;

0 spawn {
	while {true} do
	{
		setTimeMultiplier 24;
		uiSleep 30;
	};
};

disableSerialization;
_display = uiNamespace getVariable ["RscDisplayMain",displayNull];
_mouseArea = _display displayCtrl 999;

MouseButton = false;
_display displayAddEventHandler ["MouseButtonDown",{if (_this select 1 isEqualTo 0) then {MouseButton = true;};}];
_display displayAddEventHandler ["MouseButtonUp", {if (_this select 1 isEqualTo 0) then {MouseButton = false;};}];
_display displayAddEventHandler ["MouseMoving", {if (MouseButton && {!isNil "PreviewUnit"}) then {params ["", "_x", "_y"];private _dir = getDir PreviewUnit;PreviewUnit setDir (_dir + (_x * ((1.2 max 1) min 10)));};}];
