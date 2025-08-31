
if !(canSuspend) exitWith {_this spawn RRPClient_anims_pose};
private _anim = param [0,"",[""]];

try
{
	if !(isNull objectParent player) throw "Вам нужно покинуть транспорт";
	if !(isNull life_DraggedBody) throw false;
	if (call RRPClient_system_isInterrupted) throw false;
	if (RRPClientActiveAnim) throw false;

	private _config = missionConfigFile >> "CfgPoses" >> _anim;
	private _animLoop = getText(_config >> "action");
	private _animIn = getText(_config >> "actionIn");
	private _animOut = getText(_config >> "actionOut");
	private _animInTime = getNumber(_config >> "actionInTime");
	private _animOutTime = getNumber(_config >> "actionOutTime");
	private _weapon = getText(_config >> "weapon");
	private _condition = getText(_config >> "condition");
	if !([_condition] call condition) throw (getText(_config >> "error"));

	RRPClientActiveAnim = true;
	_oldWeap = binocular player;
	if (_weapon isNotEqualTo "") then 
	{
		_oldWeap = binocular player;
		player removeWeapon _oldWeap;
		player addWeapon _weapon;
	};

	[player, _animIn, true, false] remoteExecCall ["RRPClient_system_animSync",-2];
	uiSleep _animInTime;
	[player, _animLoop, true, false] remoteExecCall ["RRPClient_system_animSync",-2];
	
	waitUntil {
		["<t color='#ffffff' font='Overwatch' shadow='1' size = '0.8'>Нажмите [F] чтобы закончить анимацию</t>",0,1.2,8,0,0,5000] spawn BIS_fnc_dynamicText;
		(call RRPClient_system_isInterrupted) || {!RRPClientActiveAnim}};
	["",0,1.2,8,0,0,5000] spawn BIS_fnc_dynamicText;
	[player,_animOut,true,false] remoteExecCall ["RRPClient_system_animSync",-2];
	uiSleep _animOutTime;
	if (_weapon isNotEqualTo "") then 
	{
		player removeWeapon _weapon;
		player addWeapon _oldWeap;
	};
	[player,"amovpercmstpsnonwnondnon",true,false] remoteExecCall ["RRPClient_system_animSync",-2];

}catch{
	if (_exception isEqualType "") then 
	{
		["Позы",_exception] call toastError;
	};
};
true
