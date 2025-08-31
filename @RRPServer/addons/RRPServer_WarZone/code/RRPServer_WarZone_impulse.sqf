/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
 
format ["WarZone: Impulse: Actions: Parameters - %1 #1111",_this] call RRPServer_util_debugConsole;
private _mode = param [0,""];
private _parameters = param [1,[]];
try
{
	switch _mode do
	{
		case "request": {
			_parameters params ["_player"];
			private _delay = missionNamespace getVariable [format["ImpulseDelay_%1",_id],0];
			if ((time - _delay) < (getNumber(getMissionConfig "CfgWarZone" >> "cooldownImpulse") * 60))  throw "Импульс в куллдауне";
			[] remoteExecCall ["RRPClient_WarZone_impulse",[owner _player,_fncScriptName] call RRPServer_util_safetyOwner];
		};
		case "alert": 
		{
			_parameters params ["_units","_message","_gangName"];
			{
				_unit = objectFromNetId _x;
				if !(isNull _unit) then {
					["Военное положение",_message,8] remoteExecCall ["RRPClient_gui_baguetteExt_show",owner _unit];
				};
			}forEach _units;
		};
		case "alertWhile": 
		{
			_parameters params ["_units","_message","_count"];
			for "_i" from _count to 1 step -1 do 
			{
				{
					if (_x isEqualTo "1:1") then {continue};
					_unit = objectFromNetId _x;
					if !(isNull _unit) then {
						[format["<t color='#D32F2F' size = '1.5'>%1 ЧЕРЕЗ %2 СЕКУНД!</t>",_message,_i],-1,-0.25,1,0,0,789] remoteExec ["BIS_fnc_dynamicText",owner _unit];
						["Alarm"] remoteExecCall ["playSound",owner _unit];
					};
				}forEach _units;
				uiSleep 1;
			};
		};
		case "createMarks": 
		{
			_parameters params ["_units","_enemies","_group"];
			{
				if !(isNull _x) then {
					[_enemies] remoteExecCall ["RRPClient_WarZone_impulseCreateMarker",owner _x];
				};
			}forEach _units;
		};
	};
}catch{
	if (remoteExecutedOwner isEqualTo 0) exitWith {};
	["ErrorTitleAndText",["Военное положение",_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
};
true