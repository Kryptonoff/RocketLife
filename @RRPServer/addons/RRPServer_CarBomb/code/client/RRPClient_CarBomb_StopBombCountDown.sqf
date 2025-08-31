params ["_timeout"];
CarBombCountDownTimer cutText ["", "PLAIN"];
BombIsActivated = false;
terminate CarBombCountdownThread;

[player, CarBambVehicle,_timeout] remoteExecCall ["RRPServer_CarBomb_BlowUpVehicle",2];
