
params [
	["_player",objNull,[objNull]],
	"_category",
	"_item"
];
try{
	if (isNull _player) throw "Не определенная ошибка, попробуйте перезайти";
	_player setVariable ["TRXMutex",nil];
	if(_player getVariable ["TRXMutex",false]) throw "Предыдущий запрос еще не обработан";

	private _config = missionConfigFile >> "CfgTRX" >> _category >> "items" >> _item;
	if (!isClass _config) throw "Неверный товар, обратитесь к администрации";
	if (getText(_config >> "item") isEqualTo "") throw "Неверный товар, обратитесь к администрации!";

	private _price = getNumber(_config >> "price");
	if(_price < 1) throw "Неверный товар, обратитесь к администрации";
	_currency = getText(_config >> "currency");
	_money = _player getVariable [_currency,0];
	if(_money < _price) throw "Недостаточно средств";
	_cur = call {
		if ((toLower _currency) isEqualTo "rrpcash") exitWith {"cash"};
		if ((toLower _currency) isEqualTo "rrpatm") exitWith {"atm"};
		if ((toLower _currency) isEqualTo "rrppoint") exitWith {"point"};
		if ((toLower _currency) isEqualTo "rrpdcash") exitWith {"dcash"};
		if ((toLower _currency) isEqualTo "rrptrx") exitWith {"trx"};
		""
	};
	if (_cur isEqualTo "") throw "Не определена валюта";
	format["item: %1", (getText(_config >> "buyType"))] call RRPServer_util_debugConsole;
	switch (getText(_config >> "buyType")) do 
	{
		case "item":
		{
			[
				"__SERVER__",
				[
					getPlayerUID _player,
					[
						[
							getText(_config >> "item"),
							getNumber(_config >> "count")
						]
					]
				]
			] call RRPServer_rewards_addRewardsRequest;
			["TRX Store", "Вы успешно купили товар! Забрать его можно в тайнике!"] remoteExecCall ["toastSuccess",_player];
		};
		case "rent":
		{
			format ["addSecretShopItemsRent:%1:%2:%3",getPlayerUID _player,getText(_config >> "item"),getNumber(_config >> "count")] call RRPServer_DB_fireAndForget;
			[getText(_config >> "item")] remoteExecCall ["RRPClient_trx_buyResponse",_player];
			["TRX Store", format["Вы успешно купили товар! Он будет доступен для покупки в магазинах на протяжении %1 дней!",getNumber(_config >> "count")]] remoteExecCall ["toastSuccess",_player];
		};
		case "permanent":
		{
			format ["addSecretShopItems:%1:%2",getPlayerUID _player,getText(_config >> "item")] call RRPServer_DB_fireAndForget;
			[getText(_config >> "item")] remoteExecCall ["RRPClient_trx_buyResponse",_player];
			["TRX Store", "Вы успешно купили товар! Он будет доступен для покупки в магазинах на постоянной основе!"] remoteExecCall ["toastSuccess",_player];

		};
		default {
			throw "type item is undefined";
		};
	};
	[
		"TRX","","","",false,
		[
			[
				"Steam профиль",
				[
					format ["**Игрок:** %2 - (%1)",getPlayerUID _player, _player call getFullName],
					format ["**Купил:** %1 - %2",getText(_config >> "item"),_item],
					format ["**Стоимость**: %1 %2",_price, _cur]
				] joinString "\n",
				"https://steamcommunity.com/profiles/" + getPlayerUID _player,
				"e20af6",false,"","",[],[]
			]
		]
	] call DiscordEmbedBuilder_fnc_buildSqf;

	[_player,_cur,"take",_price] call RRPServer_system_moneyChange;
	
}catch{
	format ["TRX_LOG ERROR: %1",_exception] call RRPServer_DB_log;
	["TRX Store", _exception] remoteExecCall ["toastError",_player];
};
_player setVariable ["TRXMutex",nil];