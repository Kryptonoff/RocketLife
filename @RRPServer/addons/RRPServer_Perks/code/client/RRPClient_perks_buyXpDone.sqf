/*
	Project: Aurora Role Play
	Name: RRPClient_perks_buyXpDone
	Author: FairyTale#5571
	License: CC BY-ND
*/
params [
	["_success", false, [false]],
	["_message", "", [""]],
	["_neededXpToBuy", 0, [0]]
];
if (_success) then {
	[_neededXpToBuy, "", false] call RRPClient_perks_addXP;
	call RRPClient_tablet_app_perksUp_onOpen;
} else {
	["Save time", _message] call toastError;	
};