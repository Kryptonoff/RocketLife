/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private _total = 0;
private _difficulty = (getArray (missionConfigFile >> "CfgLtdSlots" >> "slot_difficulty")) call BIS_fnc_arrayShuffle;
private _first = (_difficulty select 0);
private _second = (_difficulty select ((count _difficulty) - 1));
private _reel = [_first select 0, _second select 0];

(_difficulty select 0) set [1, ((_difficulty select 0) select 1) - 1];
(_difficulty select ((count _difficulty) - 1)) set [1, ((_difficulty select ((count _difficulty) - 1)) select 1) - 1];
	
for "_i" from 0 to 200 do 
{
	_difficulty = _difficulty select {(_x select 1) > 0};

	private _compatible_next = (_difficulty select {
		(_x select 0) != (_reel select ((count _reel) - 1)) &&
		(_x select 0) != (_reel select ((count _reel) - 2))
	});

	if (_compatible_next isEqualTo []) exitWith {};

	private _next = (selectRandom _compatible_next) select 0;

	_reel pushBack _next;

	
	private _index = (_difficulty findIf {(_x select 0) isEqualTo _next});

	if !(_index isEqualTo -1) then 
	{
		_difficulty set [
			_index, [((_difficulty select _index) select 0), ((_difficulty select _index) # 1) - 1]
		];
	};
};
_reel