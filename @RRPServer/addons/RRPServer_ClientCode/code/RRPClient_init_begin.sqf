/*
    Filename:   RRPClient_init_begin.sqf
    Project:    Union Altis Life RPG
*/
#include "..\script_macros.hpp"

life_firstSpawn = true;
life_session_completed = false;

uiNamespace setVariable ["loading_desc_text","Настройка клиента, пожалуйста подождите..."];
private _timeStamp = diag_tickTime;
"Starting RRP Client..." call RRPClient_system_log;
waitUntil {!isNull player && player == player}; //Wait till the player is ready
waitUntil {!(isNull (findDisplay 46))};
"Display 46 Found" call RRPClient_system_log;
DEH_INIT = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

{
	(findDisplay 46 displayCtrl _x) ctrlShow false;
} forEach [1000, 1001, 1002, 1200, 1202];

"Check Client" call RRPClient_system_log;
uiNamespace setVariable ["loading_desc_text","Проверка клиента..."];

call RRPClient_spyglass_clientValidator;

if (SessionId isEqualTo "") then {["startSessionRequest", [netId player]] call RRPClient_system_send;};
"Start session request" call RRPClient_system_log;
uiNamespace setVariable ["loading_desc_text","Регистрация сессии..."];

waitUntil {SessionId != ""};

"Setting up Vars" call RRPClient_system_log;
uiNamespace setVariable ["loading_desc_text","Настройка переменных..."];
call RRPClient_system_configuration;
"Setting up Eventhandlers" call RRPClient_system_log;
uiNamespace setVariable ["loading_desc_text","Настройка триггеров..."];

call RRPClient_evh_init;
"Setting up user actions" call RRPClient_system_log;
uiNamespace setVariable ["loading_desc_text","Настройка действий..."];
uiNamespace setVariable ["loading_desc_text","Подождите, сервер загружается... Это может занять до 2-х минут..."];

"Waiting for the server to be ready.." call RRPClient_system_log;
waitUntil{!isNil "life_server_isReady"};

call RRPClient_session_dataQuery;
uiNamespace setVariable ["loading_desc_text","Запрашиваем данные с сервера..."];

"Waiting for data from the server..." call RRPClient_system_log;
waitUntil {life_session_completed};

uiNamespace setVariable ["loading_desc_text","Загрузка клиентской части..."];
"Set player variables" call RRPClient_system_log;
uiNamespace setVariable ["loading_desc_text","Настройка переменных..."];
[player] call RRPClient_system_clearAllLifeVars;
[player,"lifeState","LOADING"] call CBA_fnc_setVarNet;
"Emptying all world fuel pumps.." call RRPClient_system_log;
uiNamespace setVariable ["loading_desc_text","Настройка бензоколонок..."];

call RRPClient_system_emptyGasStation;
"Set realname" call RRPClient_system_log;
uiNamespace setVariable ["loading_desc_text","Настройка имен..."];

call RRPClient_system_setTag;
call RRPClient_system_setTitle;
call RRPClient_tags_setTags;
"Update Passport Config" call RRPClient_system_log;
uiNamespace setVariable ["loading_desc_text","Настройка скинов..."];

call RRPClient_system_passportConfig;
call RRPClient_system_padSkinConfig;
"Update Face Config" call RRPClient_system_log;
uiNamespace setVariable ["loading_desc_text","Настройка внешности..."];

call RRPClient_surgery_Init;
"Update Face Config" call RRPClient_system_log;
uiNamespace setVariable ["loading_desc_text","Настройка карты..."];

call RRPClient_markers_init;
{
	[_x, 15, ["ColorWhite", 1]] call RRPClient_util_drawToMap;
} forEach getArray(missionConfigFile >> "RRPConfig_mapMarkers" >> "DrawToMap");

[] spawn RRPClient_system_interactionHint;
call RRPClient_tasks_DeleteAll;
call RRPClient_forBeginner_init;

"Past Settings Init" call RRPClient_system_log;
[] spawn RRPClient_system_paymentHandler;
"Executing client fsm" call RRPClient_system_log;

[
	"ConnectLog","","","",false,
	[
		[
			format["Steam профиль: %1",name player],
			"",
			"https://steamcommunity.com/profiles/" + getPlayerUID player,
			"FBFF00",true,
			"","",[],[],
			[
				[
					"**Игрок присоединился:**",
					[
						format ["**Имя:** %1",name player],
						format ["**UID:** %1",getPlayerUID player],
						format ["**ID:** %1",call RRPClientPlayerID],
						format ["**SessionID:** %1",SessionId],
						format ["**TFAR:** %1",player getVariable ["tsNickName",name player]]
					] joinString "\n",
					true
				]
			]
		]
	]
] remoteExecCall ["DiscordEmbedBuilder_fnc_buildSqf",2];

(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call RRPClient_evh_onKeyDown"];
(findDisplay 46) displayAddEventHandler ["KeyUp", "_this call RRPClient_evh_onKeyUp"];
// (findDisplay 46) displayAddEventHandler ["MouseButtonDown", "_this call RRPClient_evh_onMouseDown"];
// (findDisplay 46) displayAddEventHandler ["MouseButtonUp", "_this call RRPClient_evh_onMouseUp"];

(findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["MouseButtonDblClick", {
	0 = [] spawn {
		disableSerialization;
		private _display = findDisplay 54;
		waitUntil {!isNull _display};
		if (!isNull _display) then
		{
			private _ctrlMarkerChannel = _display displayCtrl 103;
			private _indexOffset = 0;
			for "_i" from 0 to 5 do {
				if !(( channelEnabled _i ) select 0 )  then {
					_ctrlMarkerChannel lbDelete (_i - _indexOffset);
					_indexOffset = _indexOffset + 1;
				};
			};
			private _lbItem = _ctrlMarkerChannel lbAdd "Группа";
			_ctrlMarkerChannel lbSetData [_lbItem, "3"];
			_ctrlMarkerChannel lbSetCurSel 0;
			_buttonOK = _display displayctrl 1;
			_buttonOK ctrlEnable true;
		};
	};
}];

LIFE_HANDLE_EFFECTS = [] spawn RRPClient_effects_Init;
LIFE_HANDLE_WATER_FOOD_EFFECT = [] spawn RRPClient_system_foodwaterEffect;
"create" call RRPClient_system_createCursor;
"hide" call RRPClient_system_createCursor;

if (LIFE_SETTINGS(getNumber,"life_enableFatigue") isEqualTo 0) then {player enableFatigue false};
player addRating 99999999;

5 fadeSound 1;
0 fadeMusic 1;
0 fadeRadio 1;
showHud true;
showChat false;
showCommandingMenu "";
enableRadio false;
enableSentences false;
call RRPClient_hotkeys_hudWeaponUpdate;

"Init faction settings" call RRPClient_system_log;

switch (player call getSide) do {
	case "cop": {[] spawn RRPClient_init_cop};
	case "civ": {[] spawn RRPClient_init_civ};
	case "med": {[] spawn RRPClient_init_medic};
	case "reb": {[] spawn RRPClient_init_reb};
};


// [] spawn RRPClient_system_roostersAntiSniper;

(findDisplay 46) displayRemoveEventHandler ["KeyDown", DEH_INIT];
life_loading_completed = true;

[] spawn {
	waitUntil {!isNil "RRPServerVarAnomalyInit"};
	LIFE_HANDLE_ANOMALY = [client_cycle_anomaly,2] call CBA_fnc_addPerFrameHandler;
	"Start Anomaly hendler" call RRPClient_system_log;
};

call RRPClient_fishing_init;
format["End of RRP Client Init :: Total Execution Time %1 seconds",(diag_tickTime - _timeStamp)] call RRPClient_system_log;
