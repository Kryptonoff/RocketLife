/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private ["_code", "_function", "_file"];
[
	//Ltd
	["ltd","RRPServer_ltd_invite"],
	["ltd","RRPServer_ltd_kickFromCompany"],
	["ltd","RRPServer_ltd_leaderRequest"],
	["ltd","RRPServer_ltd_leave"],
	["ltd","RRPServer_ltd_queryPlayer"],
	["ltd","RRPServer_ltd_regAction"],
	["ltd","RRPServer_ltd_removeLtd"],
	["ltd","RRPServer_ltd_takeCash"],
	["ltd","RRPServer_ltd_withdraw"],

	// New ltds
	["ltds","RRPServer_ltds_ltd_actions"],
	["ltds","RRPServer_ltds_stores_actions"],

	//Fuels

	//Slots
	["slots","RRPServer_ltd_slots_loadPage"],
	["slots","RRPServer_ltd_slots_updateRequest"],

	//Store
	["store","RRPServer_ltd_activeStore"],
	["store","RRPServer_ltd_addDays"],
	["store","RRPServer_ltd_addItemToShopDatabase"],
	["store","RRPServer_ltd_addSlots"],
	["store","RRPServer_ltd_blacklistManage"],
	["store","RRPServer_ltd_calculateTaxAndReceipts"],
	["store","RRPServer_ltd_changeMode"],
	["store","RRPServer_ltd_deleteStore"],
	["store","RRPServer_ltd_getAllLtdData"],
	["store","RRPServer_ltd_getAllLtdObject"],
	["store","RRPServer_ltd_insertNewStore"],
	["store","RRPServer_ltd_newTax"],
	["store","RRPServer_ltd_removeItemFromShopDatabase"],
	["store","RRPServer_ltd_removeItemFromTrash"],
	["store","RRPServer_ltd_renameStore"],
	["store","RRPServer_ltd_setDiscount"],
	["store","RRPServer_ltd_trashManage"]
]apply
{
	_x params ["_path","_function"];
	diag_log str _x;
	missionNamespace setVariable[_function, compile preprocessFileLineNumbers format["\RRPServer_Ltds\code\%1\%2.sqf",_path,_function]];
};

true
