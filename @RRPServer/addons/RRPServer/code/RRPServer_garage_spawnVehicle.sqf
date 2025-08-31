/*
	Project: Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private ["_tick","_servIndex","_player","_query","_alive","_active","_spname","_nearVehicles"];
params [
    ["_sessionId","",[""]],
	["_vid",-1,[0]],
    ["_sp",[],[[],""]],
	["_price",0,[0]],
	["_dir",0,[0]],
	["_sp_name","",[""]],
	["_keyMode",0]
];
_tick = diag_tickTime;
if (_vid in serv_sv_use) exitWith {diag_log "Эта техника уже в очереди на получение"};
serv_sv_use pushBack _vid;
_servIndex = serv_sv_use find _vid;
try
{
	if (_vid isEqualTo -1) throw "ID техники не определено, попробуйте еще раз!";
	_player = _sessionId call RRPServer_session_getPlayerObject;
	format ["updateLastUseVehicle:%1",_vid] call RRPServer_DB_fireAndForget;
	_query = format ["selectSpawnVeh:%1",_vid] call RRPServer_DB_selectSingle;
	_alive = _query param [3,0,[-1]];
	_active = _query param [4,0,[-1]];
	_spname = _query param [15,"",[""]];
	if (_alive isEqualTo 0) throw "Эта техника уничтожена";
	if (_active isEqualTo 1) throw "Эта техника уже на острове!";
	if !((_sp_name isEqualTo _spname) OR {_spname isEqualTo ""} OR {_spname isEqualTo "none"}) then
	{
		if (isClass (getMissionConfig "LifeCfgGarages" >> worldName >> _spname) && {!(getMarkerPos _spname isEqualTo [0,0,0])}) then
		{
			throw format ["Эта тенхика находиться в гараже %1",getText(getMissionConfig "LifeCfgGarages" >> worldName >> _spname >> "displayName")];
		}else{
			format ["setGarage:none:%1",_vid] call RRPServer_DB_fireAndForget;
		};
	};
	_nearVehicles = if (!(_sp_name isEqualType "")) then {nearestObjects[_sp_name,["Car","Air","Ship"],10]} else {[]};
	if !(_nearVehicles isEqualTo []) then 
	{
		throw "Место выдачи возле гаража уже занято.";
	};
	[_vid,_query,_dir,_sp,_keyMode] remoteExec ["RRPClient_garage_SpawnVehicle",remoteExecutedOwner];
	[_player,"atm","take",_price] call RRPServer_system_moneyChange;
	[_player,"serverbank","add",_price] call RRPServer_system_moneyChange;
	format ["setVehicleActive:%1",_vid] call RRPServer_DB_fireAndForget;
	[
		"Garages","","","",false,
		[
			[
				"Steam профиль",
				[
					"**"+name _player+" Достал с гаража**: "+ (_query select 0),
					getText(configFile >> "CfgVehicles" >> (_query select 0) >> "displayName"),
					"**Номера**: "+ (_query select 6),
					"**ID в БД**: " + str _vid
				] joinString "\n",
				"https://steamcommunity.com/profiles/" +  getPlayerUID _player,
				"1FFF00",false,"","",[],[]
			]
		]
	] call DiscordEmbedBuilder_fnc_buildSqf;
	serv_sv_use deleteAt _servIndex;
}catch{
	serv_sv_use deleteAt _servIndex;
	["ErrorTitleAndText",["Гараж",_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
};
diag_log "------------- Vehicle Get ID: "+ str(_vid) +" -------------";
diag_log format ["Time to complete: %1 (in seconds) FPS: "+str(diag_fps)+"---",(diag_tickTime - _tick)];
diag_log "---------------------------------------------------------";

true