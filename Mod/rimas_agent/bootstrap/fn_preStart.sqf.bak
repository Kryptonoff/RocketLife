/**
 * Pre-Start
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 *
 * --------------------------
 *
 * Eichi: 
 * Do not use "with uiNameSpace do" here or you will collect mini dumps.
 * Also, do not call or spawn shit here. Serialization does not work. FSMs
 * are not executed at all. onEachFrame never fires. onDraw does not fire.
 * onLoad fires for all, onUnload only fires for some. And CT_ANIMATED_TEXTURE
 * looks ugly. If I ever have to touch this again, I will kill myself.
 *
 * 2017-05-07: Killed myself.
 *
 */

if !(hasInterFace) exitWith {false};

///////////////////////////////////////////////////////////////////////////////
// Reset loading screen data
///////////////////////////////////////////////////////////////////////////////
uiNameSpace setVariable ["RRPClient_gui_loadingScreen_reset",
{
	//Это все в preStart'e
	uiNameSpace setVariable ["RRPLoadingScreenBackgroundPicture", nil];
	uiNameSpace setVariable ["RRPLoadingScreenMapData", nil];
	uiNameSpace setVariable ["RRPLoadingScreenMissionData", nil];
	uiNameSpace setVariable ["RRPClientLoadingScreenDisplays", nil];
	uiNameSpace setVariable ["RscDisplayLoading_display", nil];
}];

///////////////////////////////////////////////////////////////////////////////
// Constructor of our loading screen
//
// Eichi: Careful! Passing the display to call or spawn DOES NOT WORK!
// I had this split into multiple functions, but serializing them is 
// obivously not possible. Means we have a big booty functio now :(
///////////////////////////////////////////////////////////////////////////////

uiNameSpace setVariable ["RRPClient_gui_loadingScreen_load",
{
	disableSerialization;

	private ["_spinnerTextControl", "_newsControl", "_cookie", "_cookieAlphabet"];
	private [ "_loadingText", "_loadingTextTemplates", "_loadingTextTemplate"];

	params ["_display", "_displayType"];

	// Seems to be required so the core engine functions work
	uiNameSpace setVariable ["RscDisplayLoading_display", _display];

	// So BIS_fnc_progressLoadingScreen works
	RscDisplayLoading_progress = (_display displayCtrl 104);

	// Update the text to either loading map or mission
	_spinnerTextControl = _display displayCtrl 66002;
	switch (_displayType) do 
	{
		case "RscDisplayMultiplayerSetup":
		{
			_spinnerTextControl ctrlSetStructuredText (parseText "<t shadow='1' font='SFCompactTextBold'>Подключение...</t>");
		};

		case "RscDisplayClient":
		{
			_spinnerTextControl ctrlSetStructuredText (parseText "<t shadow='1' font='SFCompactTextBold'>Соединение...</t>");
		};

		case "RscMPSetupMessage":
		{
			_spinnerTextControl ctrlSetStructuredText (parseText "<t shadow='1' font='SFCompactTextBold'>Скачиваем данные...</t>");
		};

		default
		{
			// 1 out of 10 is link
			if ((floor (random 10)) < 1) then 
			{
				_loadingText = "<t shadow='1' font='SFCompactTextBold'>Наш сайт: </t><t shadow='1' color='#126AE6' font='SFCompactTextBold'>rocket-rp.fun</t>";
			}
			else 
			{
				_loadingTextTemplates = getArray (configFile >> "CfgLoadingScreen" >> "templates");
				_loadingTextTemplate = selectRandom _loadingTextTemplates;			
				_loadingText = format ["<t shadow='1' font='SFCompactTextBold'>%1</t>", _loadingTextTemplate select 0];
			};

			_spinnerTextControl ctrlSetStructuredText (parseText _loadingText);
		};
	};

	///////////////////////////////////////////////////////////////////////////
	// Find out if the current mission / world is a cutscene

	private ["_isCutscene", "_cutscenes"];

	_isCutscene = true;

	// World must be set and not VR
	// Never show a loading screen for VR
	if !(worldName in ["", "VR"]) then
	{
		// As we have a world, we should be able to read the map config
		_cutscenes = [];

		{
			_cutscenes pushBackUnique (toLower _x);	
		}
		forEach getArray (configFile >> "CfgWorlds" >> worldName >> "cutscenes");

		// Add these to the test array
		_cutscenes pushBackUnique "tempmissionsp";
		_cutscenes pushBackUnique "";

		// If the mission name is empty, tempMissionSP or in the world cutscenes,
		// it is a cutscene. If not, this sets it to false
		_isCutscene = ((toLower missionName) in _cutscenes);
	};

	///////////////////////////////////////////////////////////////////////////

	private ["_backgroundPicture", "_backgroundPictureControl"];

	// If we do not have a background image yet, choose a random one
	_backgroundPicture = uiNameSpace getVariable ["RRPLoadingScreenBackgroundPicture", false];

	// Update the background picture. This is not needed to be done
	// in the loop below, since onLoad fires at least once for all 
	// of them and the background image does not depend on mission
	// or map info
	if (_backgroundPicture isEqualTo false) then 
	{
		_backgroundPicture = selectRandom 
		[
			"rimas_agent\texture\loading\screen_1.paa",
			"rimas_agent\texture\loading\screen_2.paa",
			"rimas_agent\texture\loading\screen_3.paa",
			"rimas_agent\texture\loading\screen_4.paa"
		];	

		uiNameSpace setVariable ["RRPLoadingScreenBackgroundPicture", _backgroundPicture];
	};

	_backgroundPictureControl = _display displayCtrl 66000;
	_backgroundPictureControl ctrlSetText _backgroundPicture;

	///////////////////////////////////////////////////////////////////////////

	private ["_mapData", "_mapConfig", "_mapName", "_mapAuthor", "_mapPicture"];
	private ["_mapControl", "_mapNameControl", "_mapAuthorControl", "_mapPictureControl"];

	// Do we have map data already?
	_mapData = uiNameSpace getVariable ["RRPLoadingScreenMapData", false];

	if (_mapData isEqualTo false) then
	{
		// Ignore cutscenes
		if !(_isCutscene) then
		{
			// Access the map config
			_mapConfig = configFile >> "CfgWorlds" >> worldName;

			// Get the map name
			_mapName = getText (_mapConfig >> "description");
			
			// Fall back to the config name of this map
			if (_mapName isEqualTo "") then 
			{
				_mapName = worldName;
			};

			// Extract the map author...
			_mapAuthor = getText (_mapConfig >> "author");

			// ...or default to "Unknown Community Author"
			if (_mapAuthor isEqualTo "") then 
			{
				_mapAuthor = localize "STR_AUTHOR_UNKNOWN";
			};

			// Update the map picture
			_mapPicture = getText (_mapConfig >> "pictureShot");

			// Because VR is utterly broken. It only has a white image
			if (_mapPicture isEqualTo "A3\Map_VR\data\ui_VR_ca.paa") then 
			{
				_mapPicture = "";
			};

			if (_mapPicture isEqualTo "") then 
			{
				_mapPicture = getText (_mapConfig >> "pictureMap");
			};

			// Default to Arma 3 logo if there is no map picture
			if (_mapPicture isEqualTo "") then 
			{
				_mapPicture = "a3\ui_f\data\Logos\arma3_white_ca.paa"
			};

			// Tanoa does not have a good pictureMap
			if (worldName isEqualTo "Tanoa") then 
			{
				_mapPicture = "rimas_agent\texture\map\tanoa_co.paa"
			};

			// Save the map data for later use
			_mapData = 
			[
				_mapName,
				_mapAuthor,
				_mapPicture
			];

			uiNameSpace setVariable ["RRPLoadingScreenMapData", _mapData];
		};
	};

	///////////////////////////////////////////////////////////////////////////

	private ["_missionData", "_missionName", "_missionAuthor", "_missionPicture"];
	private ["_missionControl", "_missionPictureControl", "_missionNameControl", "_missionAuthorControl"];

	_missionData = uiNameSpace getVariable ["RRPLoadingScreenMissionData", false];

	// If we do not have a mission data, try to extract it
	if (_missionData isEqualTo false) then 
	{
		// Ignore cutscenes
		if !(_isCutscene) then
		{
			// Get the defined mission name or briefing name
			_missionName = getMissionConfigValue ["onLoadName", briefingName];

			// If there is no mission name, use "Unnamed Mission"
			if (_missionName isEqualTo "") then 
			{
				_missionName = localize "STR_a3_rscdisplay_loading_noname";
			};

			// Get the defined mission author or "Unknown Community Author"
			_missionAuthor = getMissionConfigValue ["author", localize "STR_AUTHOR_UNKNOWN"];

			// Try to get a community logo first
			_missionPicture = getText (missionConfigFile >> "loadScreen");

			// If there is no community logo, try another, older property
			if (_missionPicture isEqualTo "") then 
			{
				_missionPicture = getText (missionConfigFile >> "overviewPicture");
			};

			// If that still is not defined, use our logo
			if (_missionPicture isEqualTo "") then 
			{
				_missionPicture = "rimas_agent\texture\mod\logo.paa";
			};

			// Keep this in mind :D
			_missionData = 
			[
				_missionName,
				_missionAuthor,
				_missionPicture
			];

			// Store the data so we can access it later (where missionConfig is not there)
			uiNameSpace setVariable ["RRPLoadingScreenMissionData", _missionData];
		};
	};
}];

///////////////////////////////////////////////////////////////////////////////
// A spawned thread to animate the spinning wheel of our loading screen
//
// -----
// 
//_animationThread = uiNameSpace getVariable ["ExileLoadingScreenSpinnerThread", scriptNull];
// 
// if (isNull _animationThread) then 
// {
// 	// We cannot pass _spinner here :(
// 	_animationThread = [] spawn (uiNameSpace getVariable ["ExileClient_gui_animateLoadingScreen", scriptNull]);
// 
// 	uiNameSpace setVariable ["ExileLoadingScreenSpinnerThread", _animationThread];
// };
// 
// uiNameSpace setVariable ["ExileLoadingScreenSpinnerThread", _animationThread];
///////////////////////////////////////////////////////////////////////////////

uiNameSpace setVariable ["RRPClient_gui_loadingScreen_animate",
{
	disableSerialization;

	private ["_spinner", "_startTime"];

	_spinner = (uiNameSpace getVariable ["RscRRPLoadingScreen", controlNull]) displayCtrl 66001;
	_startTime = diag_tickTime;

	while {true} do // until terminate on unload fires
	{
		_spinner ctrlSetAngle [(diag_tickTime - _startTime) * 360, 0.5, 0.5];

		// 1/60 results in underflow = the spinner lags
		// minimum in Arma is 3ms, but this works:
		uiSleep 0.016; 
	};
}];

///////////////////////////////////////////////////////////////////////////////
// Deconstruct the loading screen
///////////////////////////////////////////////////////////////////////////////

uiNameSpace setVariable ["RRPClient_gui_loadingScreen_unload",
{
	disableSerialization;

	private ["_animationThread"];

	_animationThread = uiNameSpace getVariable ["RRPLoadingScreenSpinnerThread", scriptNull];

	if !(isNull _animationThread) then 
	{
		terminate _animationThread;
		uiNameSpace setVariable ["RRPLoadingScreenSpinnerThread", scriptNull]
	};
}];

true
