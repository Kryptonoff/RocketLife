/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private ["_code", "_function", "_file"];
private _headerNoDebug = '
	private _fnc_scriptNameParent = if (isNil "_fnc_scriptName") then {"%1"} else {_fnc_scriptName};
	private _fnc_scriptName = "%1";
	scriptName _fnc_scriptName;
';
private _is_dev = serverName isEqualTo "[RU] Aurora Role Play #DEV | rimasrp.life";

[
	"RRPServer_inventory_save",
	"RRPServer_inventory_checkConnection",
	"RRPServer_inventory_saveContainer"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Inventory\code\server\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Inventory\code\server\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code];
};

[
	"RRPClient_inventory_addItems",
	"RRPClient_inventory_addItemToInventory",
	"RRPClient_inventory_addToBox",
	"RRPClient_inventory_addToSlot",
	"RRPClient_inventory_allowedSlots",
	"RRPClient_inventory_canAddItem",
	"RRPClient_inventory_canAddVirtItem",
	"RRPClient_inventory_closeRightMenu",
	"RRPClient_inventory_colorSlots",
	"RRPClient_inventory_convertMagazines",
	"RRPClient_inventory_drag",
	"RRPClient_inventory_dragStop",
	"RRPClient_inventory_emptyUniformVest",
	"RRPClient_inventory_filterBackpack",
	"RRPClient_inventory_filterExternal",
	"RRPClient_inventory_getContainerLoad",
	"RRPClient_inventory_getContainerLoadAbs",
	"RRPClient_inventory_getContainerMaxMass",
	"RRPClient_inventory_getContainerMaxMassVirt",
	"RRPClient_inventory_getInventoryItems",
	"RRPClient_inventory_getItemMass",
	"RRPClient_inventory_getMuzzleMagazines",
	"RRPClient_inventory_inControl",
	"RRPClient_inventory_itemAction",
	"RRPClient_inventory_linkGrenades",
	"RRPClient_inventory_linkItem",
	"RRPClient_inventory_load",
	"RRPClient_inventory_open",
	"RRPClient_inventory_removeAllItemsFromGround",
	"RRPClient_inventory_removeAllItemsFromInventory",
	"RRPClient_inventory_removeFromBox",
	"RRPClient_inventory_removeFromInventory",
	"RRPClient_inventory_removeFromSlot",
	"RRPClient_inventory_removeItems",
	"RRPClient_inventory_removeMagazineCargo",
	"RRPClient_inventory_repackMagazines",
	"RRPClient_inventory_rightClick",
	"RRPClient_inventory_save",
	"RRPClient_inventory_saveContainer",
	"RRPClient_inventory_setTitle",
	"RRPClient_inventory_unlinkItem",
	"RRPClient_inventory_update",
	"RRPClient_inventory_itemCount",
	"RRPClient_inventory_onPutItem",
	"RRPClient_inventory_onTakeItem",
	"RRPClient_inventory_itemDetailsShort",
	"RRPClient_inventory_checkConnection",
	"RRPClient_inventory_onUnload"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Inventory\code\client\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Inventory\code\client\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code,true];
};

[
	"RRPClient_inventory_replaceArray",
	"RRPClient_inventory_removeMagazine",
	"RRPClient_inventory_removeItem",
	"RRPClient_inventory_packArray",
	"RRPClient_inventory_itemType",
	"RRPClient_inventory_itemActionDo",
	"RRPClient_inventory_inArray",
	"RRPClient_inventory_holsterWeapon",
	"RRPClient_inventory_handleVehInv",
	"RRPClient_inventory_handleInv",
	"RRPClient_inventory_getPlayerItems",
	"RRPClient_evh_onAction",
	"RRPClient_inventory_getItemName"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Inventory\code\client\utils\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Inventory\code\client\utils\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code,true];
};
true