#include "common_defines.inc"
disableSerialization;

// setMousePosition [safeZoneW+200, safeZoneH+200];

params ["_running", "_allAliens", "_nextSimulationTime", "_simulationCounter", "_maxAliens", "_startTime"];

if (AlienInvasion getVariable "IsIntro") exitWith
{
	private _ctrlUFO = UIGetVal(UIUFOCtrl);
	
	if !(_ctrlUFO getVariable "CommitStarted") exitWith
	{
		_ctrlUFO setVariable ["CommitStarted", true];
		_ctrlUFO ctrlShow true;
		_ctrlUFO ctrlCommit UFO_DESCEND_TIME;
		
		playSound "UFODescend";
	};

	private _ctrlBG = UIGetVal(UIBGCtrl);
	
	if (!ctrlCommitted _ctrlUFO) exitWith 
	{
		// shake BG
		if (random 1 < 0.3) then
		{
			_offset = (0.015 - linearConversion [_startTime, _startTime + UFO_DESCEND_TIME, time, 0, 0.013, true]) * UIGetVal(UIInterfaceSize);
			_ctrlBG getVariable "Position" params ["_x", "_y", "_w", "_h"];
			_ctrlBG ctrlSetPosition [_x - (random (_offset * 2) - _offset), _y - (random (_offset * 2) - _offset), _w, _h];
			_ctrlBG ctrlCommit 0;
		};		
	};

	private _ctrlUFORamp = UIGetVal(UIUFORampCtrl);
	
	if !(_ctrlUFORamp getVariable "CommitStarted") exitWith
	{
		// restore BG
		_ctrlBG ctrlSetPosition (_ctrlBG getVariable "Position");
		_ctrlBG ctrlCommit 0;
		
		ctrlPosition _ctrlUFO params ["_x", "_y", "_w", "_h"];
		_ctrlUFORamp ctrlSetPosition [_x, _y, _w, _h];
		_ctrlUFORamp ctrlcommit 0;
		_ctrlUFORamp ctrlShow true;
		_ctrlUFORamp ctrlSetPosition [_x, _y + 0.085 * UIGetVal(UIInterfaceSize), _w, _h];
		_ctrlUFORamp ctrlCommit UFO_RAMP_TIME;
		_ctrlUFORamp setVariable ["CommitStarted", true];
		
		playSound "UFORamp";
	};
	
	if (!ctrlCommitted _ctrlUFORamp) exitWith {};

	UIGetVal(UICatcherScoreCtrl) ctrlShow true;
	UIGetVal(UICatcherLivesCtrl) ctrlShow true;
	UIGetVal(UICatcherCtrl) ctrlShow true;
	
	SIMSetVal(SIMRunning, true);
	
	call KK_fnc_playTrack;
	
	AlienInvasion setVariable ["IsIntro", false];
};

if (!_running) exitWith 
{
	private _ctrlGameOver = UIGetVal(UIGameOverCtrl);
	if (ctrlCommitted _ctrlGameOver) then
	{
		_ctrlGameOver getVariable "Position" params ["_x", "_y", "_w", "_h"];
		_ctrlGameOver ctrlSetPosition [_x, _y + 0.01 * UIGetVal(UIInterfaceSize) * ([1, -1] select (ctrlPosition _ctrlGameOver select 1 >= _y)), _w, _h];
		_ctrlGameOver ctrlCommit 10;
	};
};

private _ctrlCatchFail = UIGetVal(UIFailEffectCtrl);

if (ctrlShown _ctrlCatchFail) exitWith
{
	if (!ctrlCommitted _ctrlCatchFail) exitWith {};
	if (_ctrlCatchFail getVariable "HoldControl") exitWith 
	{
		_ctrlCatchFail setVariable ["HoldControl", false];
		_ctrlCatchFail ctrlCommit 0.3;
	};
	_ctrlCatchFail ctrlShow false;
};

if (diag_tickTime >= _nextSimulationTime) then
{
	if (call KK_fnc_updateScore) exitWith { call KK_fnc_gameOver };
		
	if (_simulationCounter == 0 && { { !(_x isEqualto []) } count _allAliens < _maxAliens }) then
	{
		_allAliens deleteAt (_allAliens find []);
		_allAliens pushBack call KK_fnc_createAlien;
	};
		
	private _alien = _allAliens deleteAt 0;
	_allAliens pushBack ([_alien, []] select  (_alien call KK_fnc_simulateAlien));
	
	_this set [2, diag_tickTime + SIMULATION_FRAME_TIME - linearConversion [_startTime, _startTime + MAX_ESCALATION_TIME, time, 0, SIMULATION_FRAME_TIME, true]];
	_this set [3, (_simulationCounter + 1) % 5];
};