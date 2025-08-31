/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _resources = "loadEconomySorted" call RRPServer_DB_selectFull;// sort by selled

private _toLog = [];
private _affectedSectors = createHashMap;
{
	_x params ["_resource", "_sellprice", "_selled", "_min_sellprice", "_max_sellprice", "_priceFactor", "_sector"];
	if (_selled > 0) then {
		_newSellPrice = (_sellprice - round (_priceFactor * _selled)) max _min_sellprice;
		format ["updateEconomyPriceAndResetSelled:%1:%2", _newSellPrice, _resource] call RRPServer_DB_fireAndForget;
		format ["Lowering price - %1 = %2 -> %3", _resource, _sellPrice, _newSellPrice] call RRPServer_util_debugConsole;
		_toLog pushBack [_resource, _newSellPrice,"Lowering price"];

		_sectorSelled = _affectedSectors getOrDefault [_sector, 0, true];
		_affectedSectors set [_sector, _sectorSelled + _selled];
	} else {
		if (_sector in _affectedSectors) then {
			_selledInSector = _affectedSectors get _sector;

			_newSellPrice = switch (true) do { 
				case ((_sellPrice / _min_sellprice) <= 1.1) : {(_sellPrice + round (_priceFactor * _selledInSector)) min _max_sellprice}; 
				case ((_sellPrice / _max_sellprice) >= 0.9) : {(_sellprice - round (_priceFactor * _selledInSector)) max _min_sellprice}; 
				default {(_sellPrice + round (_priceFactor * (_selledInSector * 0.25))) min _max_sellprice}; 
			};

			_upOrDown = ["Lowering price", "Raising price"] select (_newSellPrice > _sellPrice);
			format ["%1 - %2 = %3 -> %4", _upOrDown, _resource, _sellPrice, _newSellPrice] call RRPServer_util_debugConsole;
			_toLog pushBack [_resource, _newSellPrice,_upOrDown];
			format ["updateEconomyPrice:%1:%2", _newSellPrice, _resource] call RRPServer_DB_fireAndForget;	
		};
	};
} forEach _resources;

if (_toLog isEqualTo []) exitWith {};
private _resText = "";
private _priceText = "";
{
	_x params ["_resource","_price","_upOrDown"];
	_icon = switch _upOrDown do
	{
		case "Raising price": {":green_circle:"};
		case "Lowering price": {":red_circle:"};
		default {":blue_circle:"};
	};
	_resText = _resText + format ["%1\n",getText(getMissionConfig "VirtualItems" >> _resource >> "displayName")], 
	_priceText = _priceText + format ["%2 - $%1\n",[_price] call RRPClient_util_numberText, _icon], 
} forEach _toLog;

[
	"Economy",
	"",
	"",
	"",
	false,
	[
		[
			"Обновление цен",
			"Цены обновляются каждые 15 минут.",
			"",
			"32e9e4",
			true,
			"",
			"",
			[],
			[],
			[
				[
					"Ресурс",
					_resText,
					true
				],
				[
					"Актуальная цена",
					_priceText,
					true
				]
			]
		]
	]
] call DiscordEmbedBuilder_fnc_buildSqf;
