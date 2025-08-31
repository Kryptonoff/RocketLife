/*

	Filename: 	client_anomaly_detectorArtefactDetected.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		http://empyrean.club

*/
#include "..\..\macros.hpp"
disableSerialization;
params [
	["_detected",false,[false]],
    ["_artefact",objNull,[objNull]],
	["_radius",0,[0]]
];

private _display = GVAR_UINS ["FatumRscDetector",displayNull];
if (isNull _display) exitWith {};
private _control =  (allControls _display) select 0;

switch (life_detectorArtefactItem) do {
	case "ftmItem_det_otklick" : {
	    if (!_detected OR isNull _artefact) exitWith {
			_control ctrlSetText "\fatum_item\Data\Images\otklick\respond_off.paa";
			life_detectorTarget = objNull;
		};

		if (isNull life_detectorTarget) then {
		    life_detectorTarget = _artefact;
		    life_detectorLastBeep = 0;

		    [{
		        params ["_control","_radius"];
		        _distance = player distance life_detectorTarget;
		        _sleep = (0.1 * _distance + (0.1 - (0.1 * 5)));
		        if (_sleep < 0.1) then {
				    _sleep = 0.1;
		        } else {
				    if (_sleep > 3) then {
				        _sleep = 3;
				    };
		        };

		        if ((CBA_missionTime - life_detectorLastBeep) >= _sleep && {_distance <= _radius}) then {
				    playSound "detector_1";
				    _control ctrlSetText "\fatum_item\Data\Images\otklick\respond_on.paa";
				    life_detectorLastBeep = CBA_missionTime;
		        };

		        (isNull life_detectorTarget OR LSNOTALIVE(player) OR !life_detectorArtefactActive OR !([player, life_detectorArtefactItem] call client_system_hasItem))
		    },{},[_control,_radius]] call CBA_fnc_waitUntilAndExecute;
		};
	};

	case "ftmItem_det_medved" : {
		if (!_detected OR isNull _artefact) exitWith {
			_control ctrlSetText "\fatum_item\Data\Images\medved\clear.paa";
			life_detectorTarget = objNull;
		};

		if (isNull life_detectorTarget) then {
		    life_detectorTarget = _artefact;
		    life_detectorLastBeep = 0;

		    [{
		        params ["_control","_radius"];
		        _distance = player distance life_detectorTarget;
		        _sleep = (0.1 * _distance + (0.1 - (0.1 * 5)));
		        if (_sleep < 0.1) then {
				    _sleep = 0.1;
		        } else {
				    if (_sleep > 3) then {
				        _sleep = 3;
				    };
		        };

		        if ((CBA_missionTime - life_detectorLastBeep) >= _sleep && {_distance <= _radius}) then {
				    playSound "detector_2";
				    life_detectorLastBeep = CBA_missionTime;
		        };

		        (isNull life_detectorTarget OR LSNOTALIVE(player) OR !life_detectorArtefactActive OR !([player, life_detectorArtefactItem] call client_system_hasItem))
		    },{},[_control,_radius]] call CBA_fnc_waitUntilAndExecute;
		};

		private _relDir = player getRelDir _artefact;

		try {
			if ((_relDir >= 337.5 && _relDir <= 360) || (_relDir >= 0 && _relDir <= 22.5)) throw ("\fatum_item\Data\Images\medved\north.paa");
			if (_relDir > 292.5 && _relDir <= 337.5) throw ("\fatum_item\Data\Images\medved\northwest.paa");
			if (_relDir > 247.5 && _relDir <= 292.5) throw ("\fatum_item\Data\Images\medved\west.paa");
			if (_relDir > 202.5 && _relDir <= 247.5) throw ("\fatum_item\Data\Images\medved\southwest.paa");
			if (_relDir > 157.5 && _relDir <= 202.5) throw ("\fatum_item\Data\Images\medved\south.paa");
			if (_relDir > 112.5 && _relDir <= 157.5) throw ("\fatum_item\Data\Images\medved\southeast.paa");
			if (_relDir > 67.5 && _relDir <= 112.5) throw ("\fatum_item\Data\Images\medved\east.paa");
			if (_relDir > 22.5 && _relDir <= 67.5) throw ("\fatum_item\Data\Images\medved\northeast.paa");
		} catch {
			_control ctrlSetText _exception;
		};
	};

	case "ftmItem_det_svarog" : {
		if (!_detected OR isNull _artefact) exitWith {
			_control ctrlSetText "\fatum_item\Data\Images\svarog\clear.paa";
			life_detectorTarget = objNull;
		};

		if (isNull life_detectorTarget) then {
		    life_detectorTarget = _artefact;
		    life_detectorLastBeep = 0;

		    [{
		        params ["_control","_radius"];
		        _distance = player distance life_detectorTarget;
		        _sleep = (0.1 * _distance + (0.1 - (0.1 * 5)));
		        if (_sleep < 0.1) then {
				    _sleep = 0.1;
		        } else {
				    if (_sleep > 3) then {
				        _sleep = 3;
				    };
		        };

		        if ((CBA_missionTime - life_detectorLastBeep) >= _sleep && {_distance <= _radius}) then {
				    playSound "detector_2";
				    life_detectorLastBeep = CBA_missionTime;
		        };

		        (isNull life_detectorTarget OR LSNOTALIVE(player) OR !life_detectorArtefactActive OR !([player, life_detectorArtefactItem] call client_system_hasItem))
		    },{},[_control,_radius]] call CBA_fnc_waitUntilAndExecute;
		};

		private _relDir = player getRelDir _artefact;
		private _distance = player distance _artefact;

		try {
			if ((_relDir >= 270 && _relDir < 315) && (_distance > 0 && _distance <= 5)) throw   ("\fatum_item\Data\Images\svarog\3_m90.paa");
			if ((_relDir >= 270 && _relDir < 315) && (_distance > 5 && _distance <= 10)) throw   ("\fatum_item\Data\Images\svarog\6_m90.paa");
			if ((_relDir >= 270 && _relDir < 315) && (_distance > 10 && _distance <= 20)) throw   ("\fatum_item\Data\Images\svarog\9_m90.paa");
			if ((_relDir >= 270 && _relDir < 315) && (_distance > 20 && _distance <= 40)) throw  ("\fatum_item\Data\Images\svarog\12_m90.paa");
			if ((_relDir >= 270 && _relDir < 315) && (_distance > 40 && _distance <= 60)) throw ("\fatum_item\Data\Images\svarog\15_m90.paa");
			if ((_relDir >= 270 && _relDir < 315) && (_distance > 60 && _distance <= 80)) throw ("\fatum_item\Data\Images\svarog\18_m90.paa");
			if ((_relDir >= 270 && _relDir < 315) && (_distance > 80 && _distance <= 100)) throw ("\fatum_item\Data\Images\svarog\20_m90.paa");

			if ((_relDir >= 315 && _relDir <= 360) && (_distance > 0 && _distance <= 5)) throw   ("\fatum_item\Data\Images\svarog\3_m45.paa");
			if ((_relDir >= 315 && _relDir <= 360) && (_distance > 5 && _distance <= 10)) throw   ("\fatum_item\Data\Images\svarog\6_m45.paa");
			if ((_relDir >= 315 && _relDir <= 360) && (_distance > 10 && _distance <= 20)) throw   ("\fatum_item\Data\Images\svarog\9_m45.paa");
			if ((_relDir >= 315 && _relDir <= 360) && (_distance > 20 && _distance <= 40)) throw  ("\fatum_item\Data\Images\svarog\12_m45.paa");
			if ((_relDir >= 315 && _relDir <= 360) && (_distance > 40 && _distance <= 60)) throw ("\fatum_item\Data\Images\svarog\15_m45.paa");
			if ((_relDir >= 315 && _relDir <= 360) && (_distance > 60 && _distance <= 80)) throw ("\fatum_item\Data\Images\svarog\18_m45.paa");
			if ((_relDir >= 315 && _relDir <= 360) && (_distance > 80 && _distance <= 100)) throw ("\fatum_item\Data\Images\svarog\20_m45.paa");

			if ((_relDir >= 0 && _relDir < 45) && (_distance > 0 && _distance <= 5)) throw   ("\fatum_item\Data\Images\svarog\3_p45.paa");
			if ((_relDir >= 0 && _relDir < 45) && (_distance > 5 && _distance <= 10)) throw   ("\fatum_item\Data\Images\svarog\6_p45.paa");
			if ((_relDir >= 0 && _relDir < 45) && (_distance > 10 && _distance <= 20)) throw   ("\fatum_item\Data\Images\svarog\9_p45.paa");
			if ((_relDir >= 0 && _relDir < 45) && (_distance > 20 && _distance <= 40)) throw  ("\fatum_item\Data\Images\svarog\12_p45.paa");
			if ((_relDir >= 0 && _relDir < 45) && (_distance > 40 && _distance <= 60)) throw ("\fatum_item\Data\Images\svarog\15_p45.paa");
			if ((_relDir >= 0 && _relDir < 45) && (_distance > 60 && _distance <= 80)) throw ("\fatum_item\Data\Images\svarog\18_p45.paa");
			if ((_relDir >= 0 && _relDir < 45) && (_distance > 80 && _distance <= 100)) throw ("\fatum_item\Data\Images\svarog\20_p45.paa");

			if ((_relDir >= 45 && _relDir <= 90) && (_distance > 0 && _distance <= 5)) throw ("\fatum_item\Data\Images\svarog\3_p90.paa");
			if ((_relDir >= 45 && _relDir <= 90) && (_distance > 5 && _distance <= 10)) throw ("\fatum_item\Data\Images\svarog\6_p90.paa");
			if ((_relDir >= 45 && _relDir <= 90) && (_distance > 10 && _distance <= 20)) throw ("\fatum_item\Data\Images\svarog\9_p90.paa");
			if ((_relDir >= 45 && _relDir <= 90) && (_distance > 20 && _distance <= 40)) throw ("\fatum_item\Data\Images\svarog\12_p90.paa");
			if ((_relDir >= 45 && _relDir <= 90) && (_distance > 40 && _distance <= 60)) throw ("\fatum_item\Data\Images\svarog\15_p90.paa");
			if ((_relDir >= 45 && _relDir <= 90) && (_distance > 60 && _distance <= 80)) throw ("\fatum_item\Data\Images\svarog\18_p90.paa");
			if ((_relDir >= 45 && _relDir <= 90) && (_distance > 80 && _distance <= 100)) throw ("\fatum_item\Data\Images\svarog\20_p90.paa");
		} catch {
			_control ctrlSetText _exception;
		};
	};

	default {};
};
