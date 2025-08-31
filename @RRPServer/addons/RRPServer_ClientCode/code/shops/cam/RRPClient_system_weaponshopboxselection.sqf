
#include "..\..\..\script_macros.hpp"
params [
	["_control",controlNull,[controlNull]],
	["_index",-1,[0]]
];
if (isNull _control OR EQUAL(_index,-1)) exitWith {}; //Bad data
private _item = CONTROL_DATAI(_control,_index);
private _itemInfo = [_item] call RRPClient_util_itemDetails;
[_item,_itemInfo select 4] spawn RRPClient_system_shopBoxWeaponRotate;
