/*
  Project: Rimas Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

params ["","_keyCode"];
private _result = false;
if (_keyCode isEqualTo 0x01) then
{
	_result = true;
};
if (_keyCode in [0x1C,0x9C]) then
{
	[] spawn RRPClient_spawn_confirm;
	_result = true;
};
_result
