/*

	Filename: 	client_system_itemUse.sqf
	Project: 	Empyrean Life RPG
	Author:		Empyrean Team
	E-mail:		support@empyrean.club
	Web:		https://empyrean.club

*/
#include "..\..\macros.hpp"
private _idc = _this select 0;
private _selectedIndex = _this select 1;
private _item = CONTROL_DATAI(_idc,_selectedIndex);
private _itemDisplayName = CONTROL_TEXTI(_idc,_selectedIndex);
private _target = cursorObject;

if (life_action_inUse OR (call client_system_isInterrupted) OR !(isNull life_DraggedBody)) exitWith {};

switch (true) do {
    case (_item in life_detectorArtefactItems): {
		if ([_item] call client_system_itemCount > 0) then {
       		[_item] call client_anomaly_detectorArtefact;
			closeDialog 0;
		};
	};

	case (_item in life_detectorRadimetrItems): {
		if ([_item] call client_system_itemCount > 0) then {
       		[_item] call client_anomaly_detectorRadimetr;
			closeDialog 0;
		};
	};
	default {["Нельзя использовать этот предмет таким образом.", nil,"R"] call client_system_hint};
};
