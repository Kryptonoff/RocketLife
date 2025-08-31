params ["","_keyCode"];
private _result = false;
if (_keyCode isEqualTo 0x01) then
{
	_result = true;
};
if (_keyCode in [0x1C,0x9C,0x39]) then
{
	[] spawn RRPClient_spawn_confirmSpawn;
	_result = true;
};
_result
