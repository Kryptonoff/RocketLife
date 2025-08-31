/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

[getNumber(configFile >> "refreshEconomy"), {["refresh"] call RRPServer_economy_updateStatus}, [], true] call RRPServer_system_thread_addTask;
true