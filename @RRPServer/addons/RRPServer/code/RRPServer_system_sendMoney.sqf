
params ["_player","_toPlayer","_amount"];
try{
	if (_amount > _player getVariable ["RRPCash",0]) throw "У вас недостаточно наличности.";
	[format["Вам передали $%1",[_amount] call RRPClient_util_numberText]] remoteExecCall ["toastInfo",_toPlayer];
	[_player,"cash","take",_amount] call RRPServer_system_moneyChange;
	[_toPlayer,"cash","add",_amount] call RRPServer_system_moneyChange;

	[format["Вы передали $%1",[_amount] call RRPClient_util_numberText]] remoteExecCall ["toastInfo",_player];

	[
			"SendMoney","","","",false,
			[
				[
					format["Передал деньги: %1",name _player],
					"",
					"https://steamcommunity.com/profiles/" + getPlayerUID _player,
					"FBFF00",true,
					"","",[],[],
					[
						[
							"**Игрок:**",
							[
								format ["**Игрок:** %1 (%2)",_player call getNickFullName, getPlayerUID _player],
								format ["**Передал:** $%1",[_amount] call RRPClient_util_numberText],
								format ["**Игроку:** %1 (%2)",_toPlayer call getNickFullName, getPlayerUID _toPlayer]
							] joinString "\n",
							true
						]
					]
				]
			]
		] call DiscordEmbedBuilder_fnc_buildSqf;

}catch{
	["Деньги", _exception] remoteExecCall ["toastError",_player];
};
true