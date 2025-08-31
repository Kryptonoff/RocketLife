/*

	Filename: 	client_anomaly_particlesActive.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		http://empyrean.club
	
*/
params [
	["_trg",objNull,[objNull]],
	["_type","",[""]]
];

if (isNull _trg) exitWith {[]};
if ([_trg,player] call CBA_fnc_getDistance > 1200) exitWith {[]};

_pos = [_trg] call CBA_fnc_getPos;
if (count _pos < 3) then {
	_pos set [2,0];
};

switch (toLower _type) do {
    case "burner";
	case "burner_invis": {
		_source1 = "#particlesource" createVehicleLocal [0,0,0];
		_source1 setPos _pos;
		_source1 setParticleCircle [0, [2,2,2]];
		_source1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16,0,32,0],"","billboard",1,1,[0,0,0],[0,0,4],1,0.4,0.45,0,[0.01,0.5,1,1,1.5,0.01,0.001],[[1,1,1,-4],[1,1,1,-3],[1,1,1,-2],[1,1,1,-1],[1,1,1,0]],[1], 0.01, 0.02, "", "", "",0,true,0.6,[[3,3,3,0]]];
		_source1 setParticleRandom [0, [0,0,0], [0,0,0], 0, 0, [0,0,0,0], 5, 1, 0.2];
		_source1 setDropInterval 0.004;
		_sound = (selectRandom ["burn_blowout","burn_blowout2"]);
		_source1 say3d [_sound,200];

		_source2 = "#particlesource" createVehicleLocal [0,0,0];
        _source2 setPos [((_pos select 0) - 2 + (random 2)), ((_pos select 1) - 2 + (random 2)), _pos select 2];
		_source2 setParticleCircle [0, [2,2,2]];
		_source2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16,0,32,0],"","billboard",1,1,[0,0,0],[0,0,4],1,0.4,0.45,0,[0.01,0.5,1,1,1.5,0.01,0.001],[[1,1,1,-4],[1,1,1,-3],[1,1,1,-2],[1,1,1,-1],[1,1,1,0]],[1], 0.01, 0.02, "", "", "",0,true,0.6,[[3,3,3,0]]];
		_source2 setParticleRandom [0, [0,0,0], [0,0,0], 0, 0, [0,0,0,0], 5, 1, 0.2];
		_source2 setDropInterval 0.004;
		_sound = (selectRandom ["burn_blowout","burn_blowout2"]);
		_source2 say3d [_sound,200];

		_light = "#lightpoint" createVehicleLocal [0,0,0];
		_light setPos _pos;
		_light setLightBrightness 1;
		_light setLightAmbient [1, 0.6, 0.6];
		_light setLightColor [1, 0.6, 0.6];
		_light setLightUseFlare false;
		_light setLightFlareSize 100;
		_light setLightFlareMaxDistance 100;
		_light setLightDayLight true;
		
		player say3d "burn_hit";
	
		[{{deleteVehicle _x; nil} count _this;},[_source1, _source2,_light],7] call CBA_fnc_waitAndExecute;
	};
	case "jarka";
	case "jarka_v2";
	case "jarka_invis": {
		_empty = "#particlesource" createVehicleLocal [0,0,0];
		_empty setPos _pos;
		_sound = (selectRandom ["burn_blowout","burn_blowout2"]);
		_empty say3d [_sound,200];
	
	   _source1 = "#particlesource" createVehicleLocal [0,0,0];
	   _source1 setPos _pos;
	   _source1 setParticleCircle [0.1, [0, 0, 0]]; 
	   _source1 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0]; 
	   _source1 setParticleParams [["\fatum_anomalies\anomaly\particles\flame", 1, 0, 1],"", "Billboard", 2,  0.8, [0, 0, 0], [0, 0, 0.75], 0, 2, 7, 1, [0.1, 0.2, 0.1], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 1], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", true]; 
	   _source1 setDropInterval 0.01;
  
	   _source3 = "#particlesource" createVehicleLocal [0,0,0];
	   _source3 setPos _pos;
	   _source3 setParticleCircle [0.01, [0, 0, 0]]; 
	   _source3 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0]; 
	   _source3 setParticleParams [["\A3\data_f\cl_exp", 1, 0, 1], "", "Billboard", 2,  0.8, [0, 0, 0], [0, 0, 0.75], 0, 3, 7, 1, [0.5, 1, 0.5], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 1], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", true]; 
	   _source3 setDropInterval 0.01;

	   _source2 = "#particlesource" createVehicleLocal [0,0,0];
	   _source2 setPos _pos;
	   _source2 setParticleCircle [0.2, [0, 0, 0]]; 
	   _source2 setParticleCircle [0.2, [0, 0, 0]]; 
	   _source2 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0]; 
	   _source2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract", 1, 0, 1],"", "Billboard", 2,  0.8, [0, 0, 0], [0, 0, 0.75], 0, 4, 8, 1, [0.6, 1.4, 1], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 1], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", true]; 
	   _source2 setDropInterval 0.05;
  
	   _light = "#lightpoint" createVehicleLocal [0,0,0];
	   _light setPos _pos;
	   _light setLightBrightness 0.5;
	   _light setLightAmbient[0,20,0];
	   _light setLightColor[1,0.498,0.141];
	   _light lightAttachObject [_source2, [0,0,1]]; 
	   
	   player say3d "burn_hit";

	   [{{deleteVehicle _x; nil} count _this;},[_source1,_source2,_source3,_light,_empty],7] call CBA_fnc_waitAndExecute;
    };
	//5m
	case "electra";
	case "electra_invis": {
	    _empty = "#particlesource" createVehicleLocal [0,0,0];
		_empty setPos _pos;
		_empty say3d [(selectRandom ["electra_blast1","electra_blast2"]),200];
		[{deleteVehicle _this},_empty,4.1] call CBA_fnc_waitAndExecute;

	    _light = "#lightpoint" createVehicleLocal [0,0,0];
		_light setPos _pos;
		_light setLightBrightness 3;
		_light setLightAmbient [0.6, 0.6, 1];
		_light setLightColor [0.6, 0.6, 1];
		_light setLightUseFlare true;
		_light setLightFlareSize 100;
		_light setLightFlareMaxDistance 100;
		_light setLightDayLight true;
		
		_source = "#particlesource" createVehicleLocal [0,0,0];
		_source setPos _pos;
		_source setParticleCircle [0.3, [0, 0, 0]];
		_source setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
		_source setDropInterval 0.01;
		_source setParticleParams  [["A3\data_f\blesk1", 1, 0, 1],"", "spaceObject",  0.3,  0.3,  [0,0,0.3],  [0,0,0],  0,0.3,0.233,0,  [0.055,0.075,0.055],  [[1,1,1,0.5],[1,1,1,0.1]],  [1],  0,  0,  "",  "",  "",0,true];
		
		[{
		    params["_light","_state"];
			if (_state == 0) then {
			    _state = 3;
				_this set[1,_state];
			} else {
			    _state = 0;
				_this set[1,_state];
			};
		    _light setLightBrightness _state;
			isNull _light
		},{},[_light,0]] call CBA_fnc_waitUntilAndExecute;

		[{{deleteVehicle _x; nil} count _this;},[_source,_light],0.65] call CBA_fnc_waitAndExecute;
	};
	//8m
	case "electra_big": {
	    _empty = "#particlesource" createVehicleLocal [0,0,0];
		_empty setPos _pos;
		_empty say3d [(selectRandom ["electra_blast1","electra_blast2"]),200];
		[{deleteVehicle _this},_empty,4.1] call CBA_fnc_waitAndExecute;
		
	    _light = "#lightpoint" createVehicleLocal [0,0,0];
		_light setPos _pos;
		_light setLightBrightness 7;
		_light setLightAmbient [0.6, 0.6, 1];
		_light setLightColor [0.6, 0.6, 1];
		_light setLightUseFlare true;
		_light setLightFlareSize 100;
		_light setLightFlareMaxDistance 100;
		_light setLightDayLight true;
		
		_source1 = "#particlesource" createVehicleLocal [0,0,0];
		_source1 setPos _pos;
		_source1 setParticleCircle [0.3, [0, 0, 0]];
		_source1 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
		_source1 setDropInterval 0.01;
		_source1 setParticleParams  [["A3\data_f\blesk1", 1, 0, 1],"", "spaceObject",  0.3,  0.3,  [0,0,0.3],  [0,0,0],  0,0.3,0.233,0,  [0.087,0.09,0.087],  [[1,1,1,0.5],[1,1,1,0.1]],  [1],  0,  0,  "",  "",  "",0,true];
		
		_source2 = "#particlesource" createVehicleLocal [0,0,0];
		_source2 setPos _pos;
		_source2 setParticleCircle [5, [0, 0, 0]];
		_source2 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
		_source2 setDropInterval 0.01;
		_source2 setParticleParams  [["A3\data_f\blesk1", 1, 0, 1],"", "spaceObject",  0.3,  0.3,  [0,0,0.3],  [0,0,0],  0,0.3,0.233,0,  [0.052,0.065,0.052],  [[1,1,1,0.5],[1,1,1,0.1]],  [1],  0,  0,  "",  "",  "",0,true];
				
		_source3 = "#particlesource" createVehicleLocal [0,0,0];
		_source3 setPos _pos;
		_source3 setParticleCircle [4, [0, 0, 0]];
		_source3 setParticleRandom [0, [0, 0, 1], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
		_source3 setDropInterval 0.01;
		_source3 setParticleParams  [["A3\data_f\blesk1", 1, 0, 1],"", "spaceObject",  0.3,  0.3,  [0,0,0.3],  [0,0,0],  0,0.3,0.233,0,  [0.02,0.03,0.02],  [[1,1,1,0.5],[1,1,1,0.1]],  [1],  0,  0,  "",  "",  "",0,true];
		
		
		[{
		    params["_light","_state"];
			if (_state == 0) then {
			    _state = 7;
				_this set[1,_state];
			} else {
			    _state = 0;
				_this set[1,_state];
			};
		    _light setLightBrightness _state;
			isNull _light
		},{},[_light,0]] call CBA_fnc_waitUntilAndExecute;

		[{{deleteVehicle _x; nil} count _this;},[_source1, _source2, _source3,_light],0.65] call CBA_fnc_waitAndExecute;
	};
	
	//4.5мм
	case "electra_shar": {
	    _empty = "#particlesource" createVehicleLocal [0,0,0];
		_empty setPos _pos;
		_empty say3d [(selectRandom ["electra_blast1","electra_blast2"]),200];
		[{deleteVehicle _this},_empty,4.1] call CBA_fnc_waitAndExecute;
		
	    _source = "#particlesource" createVehicleLocal [0,0,0];
		_source setPos _pos;
	    _source setParticleCircle [0, [0, 0, 0]];
	    _source setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
	    _source setDropInterval 0.01;
	    _source setParticleParams  [["A3\data_f\blesk1", 1, 0, 1],"", "spaceObject",  0.3,  0.3,  [0,0,2],  [0,0,0],  0,0.3,0.233,0,  [0.07,0.07,0.07],  [[1,1,1,0.5],[1,1,1,0.1]],  [1],  0,  0,  "",  "",  "",0,true];

	    _light = "#lightpoint" createVehicleLocal [0,0,0];
		_light setPos _pos;
	    _light setLightBrightness 4;
	    _light setLightAmbient [10,10,10];
	    _light setLightColor [0.8, 0.8, 0.8];
		
		[{
		    params["_light","_state"];
			if (_state == 0) then {
			    _state = 4;
				_this set[1,_state];
			} else {
			    _state = 0;
				_this set[1,_state];
			};
		    _light setLightBrightness _state;
			isNull _light
		},{},[_light,0]] call CBA_fnc_waitUntilAndExecute;

		[{{deleteVehicle _x; nil} count _this;},[_source,_light],0.65] call CBA_fnc_waitAndExecute;
	};
	case "gravi";
	case "gravi_invis": {
		// проигрывание звука аномалии.
		_empty = "#particlesource" createVehicleLocal [0,0,0];
		_empty setPos (_trg modelToWorld [0,0,0]);
		_empty say3d ["gravi_blowout",200];
		[{deleteVehicle _this},_empty,10] call CBA_fnc_waitAndExecute;
		
		// листья (низ)
		private _source1 = "#particlesource" createVehicleLocal [0,0,0];
		_source1 setPos _pos;
		_source1 setParticleCircle [4, [0.2, -4, -0.3]];
		_source1 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
		_source1 setParticleParams [["\A3\data_f\cl_leaf2", 1, 0, 1], "", "SpaceObject", 1, 0.95, [0, 0, 0], [0, 0, 0], 0.1, 10, 10, 0, [1,1], [[1, 1, 0.1, 1]], [1], 0.1, 0.03, "", "", ""];
		_source1 setDropInterval 0.01;
	    // листья (верх)
		private _source2 = "#particlesource" createVehicleLocal [0,0,0];
		_source2 setPos _pos;
		_source2 setParticleCircle [3, [0.5, -1.7, 6.2]];
		_source2 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
		_source2 setParticleParams [["\A3\data_f\cl_leaf2", 1, 0, 1], "", "SpaceObject", 1, 1.01, [0, 0, 0], [0, 0, 0], 0.4, 100, 7.3, 0, [1,1], [[1, 1, 0.1, 1]], [1], 0.1, 0.03, "", "", ""];
		_source2 setDropInterval 0.01;
		
		//удаляем листья перед взрывом
        [{{deleteVehicle _x; nil} count _this},[_source1, _source2],1.6] call CBA_fnc_waitAndExecute;
	

		[{
			// искажение (ударная волна)
	        _source1 = "#particlesource" createVehicleLocal [0,0,0];
			_source1 setPos _this;
	        _source1 setParticleCircle [0, [0, 0, 0.3]];
	        _source1 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0,0,0,0], 0, 0];
	        _source1 setDropInterval 1;
	        _source1 setParticleParams  [["\A3\data_f\ParticleEffects\Universal\Refract", 1, 0, 1],"","Billboard",1,1,[0,0,1.5],[0,0,0],  0,  0.5,  0.395,  0,         [0, 12],       [[1,1,1,1],[1,1,1,0.9], [1,1,1,0]],[1],0,0,"","",""];

	        // листья (много листьев разлетающиеся из центра аномалии)
	        _source2 = "#particlesource" createVehicleLocal [0,0,0];
			_source2 setPos _this;
	        _source2 setParticleCircle [0, [0, 0, 0]];
	        _source2 setDropInterval 0.001;
	        _source2 setParticleParams  [["\A3\data_f\cl_leaf2", 1, 0, 1],"","SpaceObject",1,4,[0,0,1.5],[0,0,0],  0.1,  0.5,  0.38,  0,  [1],  [[1,1,1,1]],[3],0.01,0.8,"","",""];
	

			[{{deleteVehicle _x; nil} count _this},[_source1, _source2],0.6] call CBA_fnc_waitAndExecute;
		},_pos,1.6] call CBA_fnc_waitAndExecute;
		
		
		[{
		    // взрыв в центре аномалии
			private _source = "#particlesource" createVehicleLocal [0,0,0];
			_source setPos _this;
			_source setParticleCircle [0, [0, 0, 0]];
			_source setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
			_source setParticleParams [["fatum_anomalies\particleeffects\AnomalySpriteSet", 16, 3, 8, 1], "", "Billboard", 0.05, 0.4, [0, 0, 1.5], [0, 0, 0], 0, 10, 7.83, 0, [2], [[1, 1, 1, 0.3]], [4], 0, 0, "", "", ""];
			_source setDropInterval 0.4;
			[{deleteVehicle _this},_source,0.4] call CBA_fnc_waitAndExecute;
		},_pos,2] call CBA_fnc_waitAndExecute;
	};
	case "springboard";
	case "springboard_invis": {
		// проигрывание звука аномалии.
		_empty = "#particlesource" createVehicleLocal [0,0,0];
		_empty setPos _pos;
		_empty enableSimulation false;
		//_random = selectRandom ["springboard_blowout1","springboard_blowout2"];
		_empty say3d ["springboard_blowout1",200];
		[{deleteVehicle _this},_empty,5] call CBA_fnc_waitAndExecute;

		_source = "#particlesource" createVehicleLocal [0,0,0];
		_source setPos _pos;
		_source setParticleCircle [0, [0, 0, 0]];
		_source setParticleRandom [0, [0.25, 0.25, 0], [0, 0, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_source setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 2, 1, [0, 0, 1], [0, 0, 0], 0, 10, 7.9, 0.075, [0, 10, 5], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", true];
		_source setDropInterval 0.05;

		[{deleteVehicle _this},_source,1] call CBA_fnc_waitAndExecute;

		[{
			// взрыв в центре аномалии
			private _source = "#particlesource" createVehicleLocal [0,0,0];
			_source setPos _this;
			_source setParticleCircle [0, [0, 0, 0]];
			_source setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
			_source setParticleParams [["fatum_anomalies\particleeffects\AnomalySpriteSet", 16, 3, 8, 1], "", "Billboard", 0.05, 0.4, [0, 0, 1.5], [0, 0, 0], 0, 10, 7.83, 0, [2], [[1, 1, 1, 0.3]], [4], 0, 0, "", "", ""];
			_source setDropInterval 0.4;
			[{deleteVehicle _this},_source,0.2] call CBA_fnc_waitAndExecute;
		},_pos,1] call CBA_fnc_waitAndExecute;
	};
	case "tramplin";
	case "tramplin_invis": {
		_source = "#particlesource" createVehicleLocal [0,0,0];
		_source setPos _pos;
		_source setParticleCircle [0, [0, 0, 0]];
		_source setParticleRandom [0, [0, 0, 0], [0, 0, 0], 2, 0, [0, 0, 0, 0], 0, 0];
		_source setParticleParams [["fatum_anomalies\particleeffects\AnomalySpriteSet", 8, 0, 1], "", "Billboard", 1, 1, [0, 0, 0], [0, 0, 0], 2, 10, 7.83, 0, [2], [[1, 1, 1, 0.4],[1, 1, 1, 0.2],[1, 1, 1, 0]], [1], 0, 0, "", "", ""];
		_source setDropInterval 1.2;
		_source say3d ["gravy_hit",150];
		[{deleteVehicle _this},_source,0.5] call CBA_fnc_waitAndExecute;
	};
	case "kostolom";
	case "kostolom_invis": {
	    // проигрывание звука аномалии.
		_empty = "#particlesource" createVehicleLocal [0,0,0];
		_empty enableSimulation false;
		_empty setPos _pos;
		_empty say3d ["kostolom_activated",150];
		[{deleteVehicle _this},_empty,8] call CBA_fnc_waitAndExecute;
		
	    _source = "#particlesource" createVehicleLocal [0,0,0];
		_source setPos _pos;
		_source setParticleCircle [0, [0, 0, 0]];
		_source setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
		_source setParticleParams [["fatum_anomalies\particleeffects\AnomalySpriteSet", 16, 3, 8, 1], "", "Billboard", 0.05, 0.4, [0, 0, 1.5], [0, 0, 0], 0, 10, 7.83, 0, [2], [[1, 1, 1, 0.3]], [4], 0, 0, "", "", ""];
		_source setDropInterval 0.4;
		[{deleteVehicle _this},_source,0.5] call CBA_fnc_waitAndExecute;
	};
	case "meat";
	case "meat_invis": {
		// проигрывание звука аномалии.
		_empty = "#particlesource" createVehicleLocal [0,0,0];
		_empty enableSimulation false;
		_empty setPos _pos;
		_empty say3d ["meat_hit",200];
		[{_this say3d ["meat_body_tear",175]},_empty,2] call CBA_fnc_waitAndExecute;
		[{deleteVehicle _this},_empty,7] call CBA_fnc_waitAndExecute;
		
		[{
		    // взрыв в центре аномалии
			private _source = "#particlesource" createVehicleLocal [0,0,0];
			_source setPos _this;
			_source setParticleCircle [0, [0, 0, 0]];
			_source setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
			_source setParticleParams [["fatum_anomalies\particleeffects\AnomalySpriteSet", 16, 3, 8, 1], "", "Billboard", 0.05, 0.4, [0, 0, 1.5], [0, 0, 0], 0, 10, 7.83, 0, [2], [[1, 1, 1, 0.3]], [4], 0, 0, "", "", ""];
			_source setDropInterval 0.4;
			[{deleteVehicle _this},_source,0.4] call CBA_fnc_waitAndExecute;
		},_pos,2] call CBA_fnc_waitAndExecute;

		private _source1 = "#particlesource" createVehicleLocal [0,0,0];
		_source1 setPos _pos;
		_source1 setParticleCircle [2, [1.1, -2, 5.3]];
		_source1 setParticleRandom [0, [0.1, 0.1, 0.1], [0.1, 0.1, 0.1], 0, 0, [0, 0, 0, 0], 0, 0];
		_source1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Meat_ca.p3d", 1, 0, 1], "", "SpaceObject", 1, 1.01, [0, 0, 0], [0, 0, 0], 0.4, 150, 6, 0, [0.01,4,5,0.01], [[1, 1, 0.1, 1]], [1], 0.1, 0.03, "", "", ""];
		_source1 setDropInterval 0.01;
 
		private _source2 = "#particlesource" createVehicleLocal [0,0,0];
		_source2 setPos _pos;
		_source2 setParticleCircle [0, [0, 0, 0.6]];
		_source2 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0,0,0,0], 0, 0];
		_source2 setDropInterval 0.1;
		_source2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract", 1, 0, 1],"","Billboard",1,1,[0,0,1],[0,0,0],  0,  0.5,  0.395,  0,[2, 3],[[1,1,1,1],[1,1,1,0.9], [1,1,1,0]],[1],0,0,"","",""];
	    
		//удаляем листья перед взрывом
        [{{deleteVehicle _x; nil} count _this},[_source1, _source2],1.6] call CBA_fnc_waitAndExecute;
		
		// ВЗРЫВ! (на 2 секунде)

		[{
		    // искажение (ударная волна)
	        private _source1 = "#particlesource" createVehicleLocal [0,0,0];
			_source1 setPos _this;
	        _source1 setParticleCircle [0, [0, 0, 0.3]];
	        _source1 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0,0,0,0], 0, 0];
	        _source1 setDropInterval 1;
	        _source1 setParticleParams  [["\A3\data_f\ParticleEffects\Universal\Refract", 1, 0, 1],"","Billboard",1,1,[0,0,1.5],[0,0,0],  0,  0.5,  0.395,  0,         [0, 12],       [[1,1,1,1],[1,1,1,0.9], [1,1,1,0]],[1],0,0,"","",""];
         
	        private _source2 = "#particlesource" createVehicle [0,0,0];
			_source2 setPos _this;
	        _source2 setParticleCircle [0, [0, 0, 0]];
	        _source2 setParticleRandom [0, [0.25, 0.25, 0], [3, 3, 5], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
	        _source2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Meat_ca.p3d", 1, 0, 1], "", "SpaceObject", 0.5, 5, [0, 0, 0.5], [0, 0, 10], 0.5, 50, 7.9, 0.075, [10, 10, 10], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", 0,0,true,0.1];
	        _source2 setDropInterval 0.2;

			[{{deleteVehicle _x; nil} count _this},[_source1, _source2],4] call CBA_fnc_waitAndExecute;
		},_pos,1.6] call CBA_fnc_waitAndExecute;
	};
	//6.5mm
	case "teleport";
	case "teleport_invis": {
	    _empty = "#particlesource" createVehicleLocal [0,0,0];
		_empty enableSimulation false;
		_empty setPos _pos;
		_empty say3d [(selectRandom ["electra_blast1","electra_blast2"]),200];
		[{deleteVehicle _this},_empty,4.1] call CBA_fnc_waitAndExecute;
		
		_source1 = "#particlesource" createVehicleLocal [0,0,0];
		_source1 setPos _pos;
		_source1 setParticleCircle [0.3, [0, 0, 0]];
		_source1 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
		_source1 setDropInterval 0.01;
		_source1 setParticleParams  [["A3\data_f\blesk1", 1, 0, 1],"", "spaceObject",  0.3,  0.3,  [0,0,0.3],  [0,0,0],  0,0.3,0.233,0,  [0.087,0.09,0.087],  [[1,1,1,0.5],[1,1,1,0.1]],  [1],  0,  0,  "",  "",  "",0,true];

        _source2 = "#particlesource" createVehicleLocal [0,0,0];
		_source2 setPos _pos;
        _source2 setParticleCircle [5, [0, 0, 0]];
        _source2 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
        _source2 setDropInterval 0.01;
        _source2 setParticleParams  [["A3\data_f\blesk1", 1, 0, 1],"", "spaceObject",  0.3,  0.3,  [0,0,0.3],  [0,0,0],  0,0.3,0.233,0,  [0.052,0.065,0.052],  [[1,1,1,0.5],[1,1,1,0.1]],  [1],  0,  0,  "",  "",  "",0,true];

        _source3 = "#particlesource" createVehicleLocal [0,0,0];
		_source3 setPos _pos;
        _source3 setParticleCircle [4, [0, 0, 0]];
        _source3 setParticleRandom [0, [0, 0, 1], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
        _source3 setDropInterval 0.01;
        _source3 setParticleParams  [["A3\data_f\blesk1", 1, 0, 1],"", "spaceObject",  0.3,  0.3,  [0,0,0.3],  [0,0,0],  0,0.3,0.233,0,  [0.02,0.03,0.02],  [[1,1,1,0.5],[1,1,1,0.1]],  [1],  0,  0,  "",  "",  "",0,true];

		[{{deleteVehicle _x; nil} count _this},[_source1,_source2,_source3],0.65] call CBA_fnc_waitAndExecute;
	};
	case "skrimer";
	case "skrimer_invis": {
		private _empty = "#particlesource" createVehicleLocal [0,0,0];
		_empty enableSimulation false;
		_empty setPos _pos;
		_empty say3d [(selectRandom ["scrimer_act_1","scrimer_act_2","scrimer_act_3","scrimer_act_4"]),200];
		[{deleteVehicle _this},_empty,5] call CBA_fnc_waitAndExecute;		
	};
	default {};
};