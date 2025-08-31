/* ----------------------------------------------------------------------------
Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	DiscordRichPresence_fnc_init

Description:
	Initialises the discord rich presence application with default values

Parameters:
	None

Return:
	Nothing
---------------------------------------------------------------------------- */

private _manuallyDisabled = profileNamespace getVariable ["DiscordRichPresence_disabled",false];
if _manuallyDisabled exitWith {};

private _isExitingMission = _this isEqualTo 0;

([
        "1381211243393716295",
        "rocketrp.ru",
        "Main menu",
        "_256_256",
        "Real life is real!",
        "_256_256",
        "This is easter egg!",
        ["Aurora RP","https://rocketrp.ru/", "Aurora Discord", "https://discord.gg/ARYgChYK"],
        true
]) params [
	"_applicationID","_defaultDetails","_defaultState",
	"_defaultLargeImageKey","_defaultLargeImageText",
	"_defaultSmallImageKey","_defaultSmallImageText",
	"_defaultButtons","_showTimeElapsed"
];

private _curLoadSuccess = uiNameSpace getVariable ["DiscordRichPresence_LoadSuccess",false];
private _curApplicationID = uiNamespace getVariable ["DiscordRichPresence_ApplicationID",""];
if (!_curLoadSuccess || _applicationID != _curApplicationID) then {
	private _ret = "DiscordRichPresence" callExtension ["init",[text _applicationID]];
	_curLoadSuccess = _ret#1 == 1;
	uiNameSpace setVariable ["DiscordRichPresence_LoadSuccess",_curLoadSuccess];
};

missionNamespace setVariable ["DiscordRichPresence_LoadSuccess",_curLoadSuccess];

if _curLoadSuccess then {
	uiNamespace setVariable ["DiscordRichPresence_ApplicationID",_applicationID];


	private _settings = [
		["UpdateDetails",_defaultDetails],
		["UpdateState",_defaultState],
		["UpdateLargeImageKey",_defaultLargeImageKey],
		["UpdateLargeImageText",_defaultLargeImageText],
		["UpdateSmallImageKey",_defaultSmallImageKey],
		["UpdateSmallImageText",_defaultSmallImageText],
		["UpdateButtons",_defaultButtons]
	];
	if _showTimeElapsed then {_settings pushback ["UpdateStartTimestamp",[0,0]]};

	_settings call RRPClient_discord_drpc_update;


	[] spawn {
		private _display = displayNull;
		waitUntil {
			_display = if is3DEN then {findDisplay 313} else {findDisplay 46};
			!isNull _display
		};

		_display displayAddEventHandler ["Unload",{

			0 call RRPClient_discord_drpc_Init;
		}];
	};
};

nil
