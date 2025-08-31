#include "common_defines.inc"
disableSerialization; 

isNil 
{
	if (isNil "AlienInvasion" || { isNull AlienInvasion }) then
	{
		params [["_size", 1, [1]], "_display", "_ctrlGroup"];
		_size = _size / (getResolution select 5);
		
		AlienInvasion = createLocation ["Invisible", [0,0,0], 0, 0];
		AlienInvasion setVariable ["UI", [_size]]; // UI vars
		AlienInvasion setVariable ["EH", []]; // EH vars
		AlienInvasion setVariable ["Catcher", []];
		AlienInvasion setVariable ["IsIntro", true];
		AlienInvasion setVariable ["GAME", [cameraOn, isObjectHidden cameraOn, simulationEnabled cameraOn, cameraView, shownHUD]];

		private _EHDraw = addMissionEventHandler ["Draw3D", { AlienInvasion getVariable "Simulation" call KK_fnc_gameLoop }];
		AlienInvasion getVariable "EH" set [0, ["mission", "Draw3D", _EHDraw]];
		
		private _EHMusic = addMusicEventHandler ["MusicStop", { playMusic (_this select 0) }];
		AlienInvasion getVariable "EH" set [1, ["music", "MusicStop", _EHMusic, musicVolume]];

		[_display, _ctrlGroup] call KK_fnc_setUserInterface;
		
		// play ship landing
	};

	// reset defaults
	AlienInvasion getVariable "Catcher" set [0, 0];
	AlienInvasion getVariable "Catcher" set [1, MAX_LIVES];
	AlienInvasion setVariable ["Simulation", [!(AlienInvasion getVariable "IsIntro"), [[],[],[],[],[]], 0, 0, 1, time]]; //default start values
	UIGetVal(UICatcherScoreNumber3Ctrl) ctrlSetText "";
	
	call KK_fnc_playTrack;
};