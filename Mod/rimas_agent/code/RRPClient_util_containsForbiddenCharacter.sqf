private["_string", "_allowedCharacters", "_stringLength", "_forbiddenCharacter", "_i", "_character"];
_string = _this select 0;
_allowedCharacters = _this select 1;
_stringLength = count _string;
_forbiddenCharacter = -1;
for "_i" from 0 to (_stringLength - 1) do
{
	_character = _string select [_i, 1];
	if ((_allowedCharacters find _character) isEqualTo -1) exitWith
	{
		_forbiddenCharacter = _character;
	};
};
_forbiddenCharacter