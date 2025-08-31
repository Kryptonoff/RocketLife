#include "common_defines.inc"
disableSerialization;

params ["_disp", "_key", "_shift", "_ctrl", "_alt"];

if (SIMGetVal(SIMRunning)) exitWith
{
	// move left
	if (_key in [DIK_LEFT, DIK_A]) exitWith 
	{	
		_disp getVariable "CatcherSpriteInfo" call 
		{
			params ["_curSpriteIndex", "_firstSpriteIndex", "_lastSpriteIndex", "_allSprites"];
			if (_curSpriteIndex > _firstSpriteIndex) then 
			{
				_curSprite = _allSprites select _curSpriteIndex;
				_curSpriteIndex = _curSpriteIndex - 1;
				_nextSprite = _allSprites select _curSpriteIndex;
				_curSprite ctrlShow false;
				_nextSprite ctrlShow true;
				_this set [0, _curSpriteIndex];
				AlienInvasion getVariable "Catcher" set [2, _nextSprite getVariable "Position"];
				UISetVal(UICatcherCtrl, _nextSprite);
			};
		};
	};

	// move right
	if (_key in [DIK_RIGHT, DIK_D]) exitWith 
	{
		_disp getVariable "CatcherSpriteInfo" call 
		{
			params ["_curSpriteIndex", "_firstSpriteIndex", "_lastSpriteIndex", "_allSprites"];
			
			if (_curSpriteIndex < _lastSpriteIndex) then 
			{
				_curSprite = _allSprites select _curSpriteIndex;
				_curSpriteIndex = _curSpriteIndex + 1;
				_nextSprite = _allSprites select _curSpriteIndex;
				_this set [0, _curSpriteIndex];
				_curSprite ctrlShow false;
				_nextSprite ctrlShow true;
				AlienInvasion getVariable "Catcher" set [2, _nextSprite getVariable "Position"];
				UISetVal(UICatcherCtrl, _nextSprite);
			};
		};
	};
};

// play again
if (_key in [DIK_SPACE, DIK_RETURN, DIK_NUMPADENTER]) exitWith 
{
	if (!SIMGetVal(SIMRunning)) then 
	{
		private _ctrlGameOver = UIGetVal(UIGameOverCtrl);
		
		_ctrlGameOver ctrlShow false;
		_ctrlGameOver ctrlSetPosition (_ctrlGameOver getVariable "Position");
		_ctrlGameOver ctrlCommit 0;
		
		{ _x ctrlShow false } forEach (_disp getVariable "AlienSpriteInfo");
		call KK_fnc_initAlienInvasion;
	};
};
