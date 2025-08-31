#include "common_defines.inc"
disableSerialization;

if (_this isEqualTo []) exitWith { false };

params ["_path", "_step"];

// hide previous sprite
if (_step > 0) then { UIGetVal(UIGameDisplay) getvariable (_path select (_step - 1)) ctrlShow false };

if (_step < 5) exitWith 
{
	// move to next sprite	
	_this call KK_fnc_showAlienSprite;
	_step = _step + 1;
	_this set [1, _step];
	
	false // do not remove from array
};

// ------ last row, check catcher pos

AlienInvasion getVariable "Catcher" call 
{
	params ["_catcherScore", "_catcherLives", "_catcherPosition"];

	if (_catcherPosition == _path select 4) then // last step
	{
		// caught, reward
		_catcherScore = _catcherScore + 1;
		_this set [0, _catcherScore]; // add score
		_catcherPosition call KK_fnc_playCatchEffect; // flash catch// play sound zap
	}
	else 
	{
		// missed, punish
		_catcherLives = _catcherLives - 1;
		_this set [1, _catcherLives];
		_catcherLives call KK_fnc_playFailEffect;
	};
};

true // remove from array