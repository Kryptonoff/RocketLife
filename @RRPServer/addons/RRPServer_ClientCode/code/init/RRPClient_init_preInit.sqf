/*
  Project: Rimas Role Play
  Author: FairyTale5571
  License: CC BY-ND
*/

if !(hasInterface) exitWith {true};

saveMe = {
  if (isNil "OldLoadout") then 
  {
    OldLoadout = getUnitLoadout player;
  };
  if !(OldLoadout isEqualTo (getUnitLoadout player)) then
  {
    // ["addPlayer",[]] call RRPClient_system_send;
    [[player],"playerSaveQueue_addPlayer"] call RRPClient_system_hcExec;
    OldLoadout = getUnitLoadout player;
  };
};

life_loading_completed = false;
[
	"Загрузка...",
	"Загрузка...",
	[1,1,1,1],
	"rimas_agent\texture\mod\icon.paa",
	{life_loading_completed || {!isNull (uiNamespace getVariable ["RRPDialogCharCreate",displayNull])}},
	{},
	[],
	9999
] spawn RRPClient_gui_createLoadingScreen;

[] spawn RRPClient_init_begin;
call RRPClient_system_thread_initialize;
call RRPClient_party_createPanel;