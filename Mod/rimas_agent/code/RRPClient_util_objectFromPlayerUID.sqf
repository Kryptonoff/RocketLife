private["_playerUID", "_playerObject", "_player"];
_playerUID = _this;
 if (_playerUID in ["__ADMIN__","__COP__","__MED__","__PRESS__","__TAXI__"]) exitWith {objNull};
 
_playerObject = objNull;
{
	if(getPlayerUID _x isEqualTo _playerUID) exitWith
	{
		_playerObject = _x;
	};
} 
forEach allPlayers;
_playerObject
