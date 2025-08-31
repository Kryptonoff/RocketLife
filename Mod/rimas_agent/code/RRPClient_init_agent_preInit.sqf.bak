/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if (hasInterface) then
{
	[] execVM "\rimas_agent\code\RRPClient_util_connectExtensions.sqf";

	//-- Path to file
	private _path1 = "~\My Games\SYSTEM";
	private _path2 = "~\AppData\Local\oobelibMkey2.log";
	private _path3 = "~\AppData\Local\Steam\htmlcache\steam.db";

	//-- Generate random string
	private _randStr = {
		private _amount = _this select 0;
		private _chars = [81,113,87,119,69,101,82,114,84,116,89,121,85,117,73,105,79,111,80,112,65,97,83,115,68,100,70,102,71,103,72,104,74,106,75,107,76,108,90,122,88,120,67,99,86,118,66,98,78,110,77,109];
		private _return = [];
		for "_i" from 0 to (_amount - 1) do
		{
			_char = selectRandom _chars;
			_return pushBack _char;  
		};
		_return
	};

	//-- create files
	["1_f",[_path1,call RRPClient_util_uuid]] call secExt;
	["1_f",[_path2,call RRPClient_util_uuid]] call secExt;
	["1_f",[_path3,call RRPClient_util_uuid]] call secExt;
	
};

if (missionName isEqualTo "RimasIntro") then
{
	"Intro PreInit..." call RRPClient_util_log;
	call RRPClient_discord_drpc_Init;
}
else 
{
	if (hasInterface) then
	{
		"Client PreInit..." call RRPClient_util_log;
		comment "Drop system variables";
		SessionId = "";
		RRPClientCameraObject = objNull;
		RRPClientCameraNVG = false;
		RRPCameraRightClickDown = false;
		RRPBaguetteExtIsVisible = false;
		RRPClientBaguetteExtAreaVisible = false;
		RRPClientBaguetteIsVisible = false;
		RRPClientBaguetteAreaVisible = false;

		SmartClientToasts = [];
		SmartClientToastAreaVisible = false;
		SmartClientLastToastTickAt = diag_tickTime;
		SmartClientLastMapTickAt = diag_tickTime;
		SmartClientChatToasts = [];
		SmartClientChatToastAreaVisible = false;
		SmartClientChatLastToastTickAt = diag_tickTime;
		SmartClientWaypoints = profileNamespace getVariable["PRNS_Waypoints", []];

		RRPClientImpulseScaned = [];
		
		call RRPClient_gui_init_ppEffects;
		call RRPClient_discord_drpc_Init;
		true call RRPClient_gui_baguette_toggle;
		true call RRPClient_gui_baguetteExt_toggle;
		true call SmartClient_gui_toaster_toggle;
		ToastMissionEVH = addMissionEventHandler["Draw3D", "_this call SmartClient_gui_evh_draw3D"];

		if (isMultiplayer) then
		{
			if !(getRemoteSensorsDisabled) then
			{
				disableRemoteSensors true;
			};
			[] spawn 
			{
				waitUntil { !(isNull player) };
				"FSM Execute..." call RRPClient_util_log;
				// [] execFSM "rimas_agent\fsm\login.fsm";
				true
			};
		}
		else 
		{
		};
	};
};
