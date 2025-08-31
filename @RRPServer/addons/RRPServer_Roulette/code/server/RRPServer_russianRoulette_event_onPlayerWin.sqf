
private["_playerObject", "_playerMoney", "_positionBefore", "_directionBefore"];
_playerObject = _this;
["Russian Roulette: %1 has won the game and $%2!", name _playerObject, RRPServerRussianRoulettePotValue] call RRPServer_util_debugConsole;
["InfoTitleAndText",["Русская рулетка",format ["%1 выиграл в Русскую Рулетку!", name _playerObject]]] remoteExecCall ["toast",-2];
[_playerObject, "atm","add",RRPServerRussianRoulettePotValue] call RRPServer_system_moneyChange;

[
	"Roulette","","","",false,
	[
		[
			"Игра сыгранна",
			"",
			"",
			"03f8fc",true,
			"","",[],[],
			[
				[
					"**Победитель:**",
					([
						name _playerObject,
						format["Выиграл: $%1",[RRPServerRussianRoulettePotValue] call RRPClient_util_numberText],
						format["Сыгранно раундов: %1",RRPServerRussianRouletteCurrentShot]
						] apply {_x} joinString "\n"),
					true
				],
				[
					"**Почтим память:**",
					(RRPServerRussianRouletteDiedPlayers apply {_x} joinString "\n"),
					true
				]
			]
		]
	]
] call DiscordEmbedBuilder_fnc_buildSqf;

_positionBefore = _playerObject getVariable ["SavedRussianRoulettePosition", [0, 0, 0]];
_directionBefore = _playerObject getVariable ["SavedRussianRouletteDirection", 0];
_playerObject setVariable ["IsPlayingRussianRoulette", nil];
_playerObject setVariable ["SavedRussianRoulettePosition", nil];
_playerObject setVariable ["SavedRussianRouletteDirection", nil];
_playerObject setVariable ["RussianRouletteProbabilities", nil];
_playerObject setVariable ["RussianRouletteCurrentShot", nil];
_playerObject setVariable ["CurrentPlayer",nil,true];
[_positionBefore, _directionBefore, RRPServerRussianRoulettePotValue] remoteExecCall ["RRPClient_russianRoulette_winRussianRouletteRequest",_playerObject];
call RRPServer_russianRoulette_initialize;
