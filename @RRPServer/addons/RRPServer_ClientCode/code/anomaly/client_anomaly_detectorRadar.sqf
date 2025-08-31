/*

	Filename: 	client_Radar_detectorRadar.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		http://empyrean.club

	["ftmItem_det_otklick"] call client_Radar_detectorRadar

*/
#include "..\..\macros.hpp"
if (life_detectorRadarActive) exitWith {
	[life_detectorRadarPFH] call CBA_fnc_removePerFrameHandler;
	life_detectorRadarActive = false;
	life_detectorRadarItem = "";
	life_detectorRadarPFH = -1;
	titleText ["Детектор Радара был выключен", "PLAIN DOWN"];
};

life_detectorRadarItem = param [0,"",[""]];
if (EQUAL(life_detectorRadarItem,"")) exitWith {};
life_detectorRadarActive = true;
life_detectorSleep = 0;
life_detectorLastBeep = 5;

titleText ["Детектор Радара был включён", "PLAIN DOWN"];

life_detectorRadarPFH = [{
	if (LSNOTALIVE(player) OR {!life_detectorRadarActive} OR {!([player, life_detectorRadarItem] call client_system_hasItem)}) exitWith {
		[life_detectorRadarPFH] call CBA_fnc_removePerFrameHandler;
		life_detectorRadarActive = false;
		life_detectorRadarItem = "";
		life_detectorRadarPFH = -1;
		titleText ["Детектор Аномалий был выключен", "PLAIN DOWN"];
	};

	_objects = (nearestObjects[player,["LandVehicle","Air","Ship"],300])-[_car];
    _objects = _objects select {_x getVariable "ani_radar" == 1};

	if !(_objects isEqualTo []) then {
		_objects = _objects apply {[_x distance player,_x]};
		_objects sort true;

		private _distance = (_objects # 0) # 0;
		private _vehicle = (_objects # 0) # 1;

		private _dir = getDir player;
		private _dirTo = (getPos player) getDir _vehicle;
		private _detected =  acos ([sin _dir, cos _dir, 0] vectorCos [sin _dirTo, cos _dirTo, 0]) <= 120 / 2;

        private _sleep = 3;
        if(_distance < 200) then { _sleep = 1; };
        if(_distance < 150) then { _sleep = 0.5; };
		if(_distance < 100) then { _sleep = 0.5; };
		if(_distance < 70) then { _sleep = 0.2; };

		if (_detected && {(CBA_missionTime - life_detectorLastBeep) >= _sleep}) then {
			playSound "ivory_beep";
			life_detectorLastBeep = CBA_missionTime;
		};
	};
},0.1,[]] call CBA_fnc_addPerFrameHandler;
