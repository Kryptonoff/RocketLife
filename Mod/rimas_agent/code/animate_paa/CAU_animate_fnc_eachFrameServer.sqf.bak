/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

if (diag_tickTime > (missionNameSpace getVariable ["CAU_animate_fnc_eachFrameServer_update_tick",0])) then 
{
	CAU_animate_fnc_eachFrameServer_update_tick = diag_tickTime + 0.25;
	private _remove = [];
	{
		_x params ["_target"];
		private _deleted = switch true do 
		{
			case (_target isEqualType objNull):{isNull _target};
			case (_target isEqualType ""):{!(_target in allMapMarkers)};
			default {true};
		};
		if _deleted then {_remove pushBack _x};
	} foreach CAU_animate_list_global;


	{
		_x call CAU_animate_fnc_removeGlobal;
	} forEach _remove;
};