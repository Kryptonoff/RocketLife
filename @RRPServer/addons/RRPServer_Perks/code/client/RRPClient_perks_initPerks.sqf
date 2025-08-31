/*
** Author: Jack "Scarso" Farhall
** Description: 
*/
scopeName "fn_initPerks";


["SoldVirtualItem", {
	_this params [ "_soldItem", "_amount", "_sellPrice", "_illegal" ];

	if (_sellPrice > 0) then {
		// We've already got the sell price, we just need to activate the perk for leveling here...
		if !(_illegal) then {
			["LegalTrader", _sellPrice, true] call RRPClient_perks_activatePerk;
		};
		if (_illegal) then {
			["ShadyTrader", _sellPrice, true] call RRPClient_perks_activatePerk;
		};
	};
}] call VRP_fnc_addEventHandler;