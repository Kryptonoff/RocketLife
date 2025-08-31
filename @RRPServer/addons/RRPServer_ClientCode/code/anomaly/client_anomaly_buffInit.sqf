#include "..\..\macros.hpp"
if !(RRPServerVarAnomalyInit) exitWith {LOG("Server anomaly OFF")};

life_anomaly_viewDistanceFoot = life_viewDistanceFoot;
life_anomaly_viewDistanceCar = life_viewDistanceCar;
life_anomaly_viewDistanceAir = life_viewDistanceAir;

//Создаем атмосферу со звуками
ANOMALY_AMBIENT_PFH = [{
    if (!isNil "ANOMALY_AMBIENT") exitWith {};
	ANOMALY_AMBIENT = true;
	_sound = selectRandom ["anom_sound_ambient_1","anom_sound_ambient_2","anom_sound_ambient_3","anom_sound_ambient_4","anom_sound_ambient_5","anom_sound_ambient_6","anom_sound_ambient_7"];
	_time = switch (_sound) do {
		case "anom_sound_ambient_1": {117};
		case "anom_sound_ambient_2": {258};
		case "anom_sound_ambient_3": {122};
		case "anom_sound_ambient_4": {177};
		case "anom_sound_ambient_5": {348};
		case "anom_sound_ambient_6": {152};
		case "anom_sound_ambient_7": {72};
		default {350};
    };
	playMusic _sound;
	[{playMusic ""; ANOMALY_AMBIENT = nil},[],_time] call CBA_fnc_waitAndExecute;
},10] call CBA_fnc_addPerFrameHandler;
