
private["_gameStatus", "_potAmount", "_players", "_currentPlayerNetID", "_currentShot", "_countDownEndTime", "_display", "_potValue", "_shotValue", "_playerListString", "_playerNetID", "_playerName", "_playerShot", "_player", "_playerList", "_timer", "_hint"];
disableSerialization;
params ["_gameStatus","_potAmount","_players","_currentPlayerNetID","_currentShot","_countDownEndTime"];

if !(RRPClientRussianRouletteHudVisible) then 
{
	call RRPClient_russianRoulette_show;
};
_display = uiNameSpace getVariable ["RscExileRussianRoulette", displayNull];
_potValue = _display displayCtrl 4007;
_potValue ctrlSetStructuredText (parseText (format ["<t size='1.6' font='RobotoCondensed' align='center' shadow='false'>$%1<t color='#3fd4fc'></t></t>", [_potAmount] call RRPClient_util_numberText]));
_shotValue = _display displayCtrl 4008;
_playerListString = "<t shadow='false'>";
{
	_x params ["_playerNetID","_playerName","_playerShot"];
	_player = objectFromNetid _playerNetID;
	if (isNull _player) then 
	{
		_playerListString = _playerListString + format ["<t color='#808080'>%1</t><br/>", _playerName];
	}
	else 
	{
		if (alive _player) then 
		{
			if (_playerNetID isEqualTo _currentPlayerNetID) then 
			{
				_playerListString = _playerListString + format ["<t align='left' color='#3fd4fc'>%1</t><t color='#3fd4fc' align='right'>%2/6</t><br/>", _playerName, _playerShot];
			}
			else 
			{
				_playerListString = _playerListString + format ["<t align='left'>%1</t><t align='right'>%2/6</t><br/>", _playerName, _playerShot];
			};
		}
		else 
		{
			_playerListString = _playerListString + format ["<t color='#808080'>%1</t><br/>",_playerName];
		};
	};
}
forEach _players;
_playerListString = _playerListString + "</t>";
_playerList = _display displayCtrl 4006;
_playerList ctrlSetStructuredText (parseText _playerListString);
if (_countDownEndTime isEqualTo -1) then 
{
	call RRPClient_russianRoulette_stopCountDown;
	_timer = _display displayCtrl 4009;
	_timer ctrlSetFade 0;
	_timer ctrlCommit 0;
	_timer ctrlSetStructuredText (parseText "<t align='center' size='0.8' shadow='false' font='RobotoCondensedLight'>00:00</t>");
}
else 
{
	_countDownEndTime call RRPClient_russianRoulette_startCountDown;
};
_hint = _display displayCtrl 4003;
_hint ctrlShow false;
RRPClientRussianRouletteCanEscape = false;
RRPClientRussianRouletteCanFire = false;
switch (_gameStatus) do 
{
	case 0:
	{
		if ((count _players) isEqualTo 1) then 
		{
			_hint ctrlSetStructuredText (parseText "<t align='center' size='2' color='#ffffff' shadow='false'>Нажмите <t color='#3fd4fc'>ESCAPE</t> чтобы выйти</t>");
			_hint ctrlShow true;
			RRPClientRussianRouletteCanEscape = true;
		};
		_shotValue ctrlSetStructuredText (parseText "<t align='center' size='2' color='#ffffff' shadow='false' font='RobotoCondensed'>-</t>");
	};
	case 1:
	{
		_shotValue ctrlSetStructuredText (parseText (format ["<t align='center' size='2' color='#ffffff' shadow='false' font='RobotoCondensed'>%1</t>", _currentShot]));
	};
};
