
params ["_player"];
_player setVariable ["CountVehicles",(getPlayerUid _player) call RRPServer_garage_countVehicles,true];
