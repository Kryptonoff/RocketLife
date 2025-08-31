params [
	["_perk", "", [""]]
];
try{
	private _cfg = missionConfigFile >> "CfgPerks" >> _perk;

	if ([_perk] call RRPClient_perks_hasPerk) then {
		private _name = getText (_cfg >> "displayName");
		private _cost = getNumber (missionConfigFile >> "CfgPerks" >> "removalCost");
		_cost = _cost * getNumber (_cfg >> "removalMultiplier");
		
		if (RRPClientAtmMoney < _cost) throw format ["Вам нужно %1%2 для деактивации перка!", "$", [_cost] call RRPClient_util_numberText];

		[
			uiNamespace getVariable ["RRPDialogTablet",displayNull],
			{
				_this params [ "_perk", "_name", "_cost", "_cfg" ];
				VRP_Perks deleteAt _perk;
				["Перки",format ["<t color='#B92DE0'>%1</t> деактивация будет стоить вам <t color='#B92DE0'>%2%3</t>.", _name, "$", [_cost] call RRPClient_util_numberText]] call toastSuccess;
				
				false call compile getText (_cfg >> "onChanged");
				call RRPClient_tablet_app_perksUp_onOpen;

				[player, "atm","take", _cost] remoteExecCall ["RRPServer_system_moneyChange",2];

			}, [_perk, _name, _cost, _cfg],
			"Подтвердите действие",
			format ["Вы уверены, что хотите потратить %1%2 на удаление %3?", "$", [_cost] call RRPClient_util_numberText, _name]
		] call RRPClient_util_prompt;

	} else {
		if !(isClass _cfg) then {
			throw "This perk no longer exists and has been automatically removed";
		};

		private _limit = [] call RRPClient_perks_getPerkLimit;
		if ((count VRP_Perks) >= _limit) then {
			throw format ["Не может быть активных <t color='#B92DE0'>%1</t> перков одновременно!", _limit]
		};

		VRP_Perks set [_perk, [1, 0]];
		["Перки",format ["<t color='#B92DE0'>%1</t> был активирован!", getText (_cfg >> "displayName")]] call toastSuccess;
		call RRPClient_perks_update;
		true call compile getText (_cfg >> "onChanged");
		call RRPClient_tablet_app_perksUp_onOpen;
	};
}catch{
	["Перки", _exception] call toastError;
};
true