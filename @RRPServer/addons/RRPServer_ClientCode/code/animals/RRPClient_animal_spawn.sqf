/*
	Project: Rimas Role Play
	Author: Exile Mod
	License: CC BY-ND
	
	Desc:
		Exiled, if you read this, I am so sorry, but your code is beatiful!
*/

private ["_animalType", "_position", "_animalConfig", "_animalClass", "_animal"];
_animalType = _this select 0;
_position = _this select 1;
_animalConfig = configFile >> "CfgVehicles" >> _animalType >> "RRP";
_animalClass = selectRandom (getArray (_animalConfig >> "variations"));
_animal = createAgent [_animalClass, _position, [], 0, "FORM"];
_animal setVariable ["SpawnedAt", time];
_animal setVariable ["IsScared", false];
_animal setVariable ["LastDangerSoundAt", 0];
_animal setVariable ["NextIdleSoundAt", time + (random 10)];
_animal setVariable ["CanBeGutted", false];
_animal addEventHandler ["FiredNear", 	{ _this call RRPClient_animal_event_onFiredNear; 	}];
_animal addEventHandler ["Hit", 		{ _this call RRPClient_animal_event_onHit; 		}];
_animal addEventHandler ["Killed", 		{ _this call RRPClient_animal_event_onKilled; 		}];
[[netId _animal,player],"object_animal_animalRequest"] call RRPClient_system_hcExec; 
RRPClientCurrentAnimal = _animal;
["InfoTitleOnly", [format ["Обнаружено животное в %1м от Вас!",round(player distance RRPClientCurrentAnimal)]]] call SmartClient_gui_toaster_addTemplateToast;
_code =
{
	if !(isNull RRPClientCurrentAnimal) then
	{
		["InfoTitleOnly", [format ["Животное в %1м от Вас!",round(player distance RRPClientCurrentAnimal)]]] call SmartClient_gui_toaster_addTemplateToast;
	};
};
AlarmAboutAnimal = [10, _code, [], true] call RRPClient_system_thread_addtask;