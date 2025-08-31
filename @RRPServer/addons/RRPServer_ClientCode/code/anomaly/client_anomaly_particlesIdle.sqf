/*

	Filename: 	client_anomaly_particlesIdle.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		http://empyrean.club

*/
params [
	["_trg",objNull],
	["_type",""]
];

if ([_trg,player] call CBA_fnc_getDistance > 1000) exitWith {[]};

_pos = [_trg] call CBA_fnc_getPos;
if (count _pos < 3) then {
	_pos set [2,0];
};

switch (toLower _type) do {
    case "burner": {
		_proxy = "Land_HelipadEmpty_F" createVehicleLocal [0,0,0];
		_proxy enableSimulation false;
		_proxy setPos (_trg modelToWorld [0,0,0]);

		_source = "#particlesource" createVehicleLocal [0,0,0];
		_source setPos _pos;
		_source setParticleCircle [3, [0, 0, 0]];
		_source setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_source setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 10, [0, 0, 0], [0, 0, 0.25], 0, 10, 7.9, 0, [2, 2, 0.01], [[0.1, 0.1, 0.1, 0.5]], [0.08], 1, 0, "", "", _proxy];
		_source setDropInterval 0.1;

		_sound = "fatum_idle_burn" createVehiclelocal [0,0,0];
		_sound setPos _pos;
		
		[_proxy,_source,_sound]
	};
	case "jarka": {
		_source1 = "#particlesource" createVehicleLocal [0,0,0];
		_source1 setPos _pos;
		_source1 setParticleCircle [0, [0, 0, 0]];   
		_source1 setParticleRandom [0, [3, 3, 0], [0.2, 0.2, 0], 0, 0, [0, 0, 0, 0], 0, 0];    
		_source1 setDropInterval 0.1;                                  
		_source1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract",1,0,1,1], "","Billboard", 10, 10, [0,0,-0.131], [0,0,0], 0, 0.3, 0.24, 0, [0.5, 0.4, 0], [[0.3,0.6,0.1,1]], [1], 0, 0, "", "", "",0,true]; 

		_source2 = "#particlesource" createVehicleLocal [0,0,0];
		_source2 setPos _pos;
		_source2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 2, 32, 1],"","Billboard",1,0.7,[0, 0, 0],[0, 0, 5],0,0.05,0.04,0.05,[0.05],[[1, 0.5, 0.4, 1],[1, 0.5, 0.4, 1],[1, 0.5, 0.4, 1], [1,1,1, 1]],[0.8, 0.3, 0.2],0.3,1,"","","", 0,false, 0,[[2000,2000,2000,0]]]; 
		_source2 setParticleRandom [0.4,[3, 3, 0.2],[0.5, 0.5, 0.1],0.2,0.2,[0, 0, 0, 0],0.1,0.5];
		_source2 setDropInterval (0.1);
		
		_sound = "fatum_idle_burn" createVehiclelocal [0,0,0];
		_sound setPos _pos;

		[_source1,_source2,_sound]
	};
	case "jarka_v2": {
		_source1 = "#particlesource" createVehicleLocal [0,0,0];
		_source1 setPos _pos;
		_source1 setParticleCircle [3, [0, 0, 0]];
		_source1 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_source1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 10, [0, 0, 0], [0, 0, 0.25], 0, 10, 7.9, 0, [2, 2, 0.01], [[0.1, 0.1, 0.1, 0.5]], [0.08], 1, 0, "", "", true];
		_source1 setDropInterval 0.1;

		_source2 = "#particlesource" createVehicleLocal [0,0,0];
		_source2 setPos _pos;
		_source2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 2, 32, 1],"","Billboard",1,0.7,[0, 0, 0],[0, 0, 5],0,0.05,0.04,0.05,[0.05],[[1, 0.5, 0.4, 1],[1, 0.5, 0.4, 1],[1, 0.5, 0.4, 1], [1,1,1, 1]],[0.8, 0.3, 0.2],0.3,1,"","","", 0,false, 0,[[2000,2000,2000,0]]]; 
		_source2 setParticleRandom [0.4,[3, 3, 0.2],[0.5, 0.5, 0.1],0.2,0.2,[0, 0, 0, 0],0.1,0.5];
		_source2 setDropInterval (0.1);
		
		_sound = "fatum_idle_burn" createVehiclelocal [0,0,0];
		_sound setPos _pos;

		[_source1,_source2,_sound]
	};
	case "jarka_v3": {
		_source1 = "#particlesource" createVehicleLocal [0,0,0];
		_source1 setPos _pos;
		_source1 setParticleCircle [3, [0, 0, 0]];
		_source1 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_source1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 10, [0, 0, 0], [0, 0, 0.25], 0, 10, 7.9, 0, [2, 2, 0.01], [[0.1, 0.1, 0.1, 0.5]], [0.08], 1, 0, "", "", true];
		_source1 setDropInterval 0.1;

		_source2 = "#particlesource" createVehicleLocal [0,0,0];
		_source2 setPos _pos;
		_source2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 2, 32, 1],"","Billboard",1,0.7,[0, 0, 0],[0, 0, 5],0,0.05,0.04,0.05,[0.05],[[1, 0.5, 0.4, 1],[1, 0.5, 0.4, 1],[1, 0.5, 0.4, 1], [1,1,1, 1]],[0.8, 0.3, 0.2],0.3,1,"","","", 0,false, 0,[[2000,2000,2000,0]]]; 
		_source2 setParticleRandom [0.4,[3, 3, 0.2],[0.5, 0.5, 0.1],0.2,0.2,[0, 0, 0, 0],0.1,0.5];
		_source2 setDropInterval (0.1);
		
		_sound = "fatum_idle_burn" createVehiclelocal [0,0,0];
		_sound setPos _pos;

		[_source1,_source2,_sound]
	};
	
	case "buzz": {
	    private _underWaterParticleSource = "#particlesource" createVehicleLocal [0,0,0];
		_underWaterParticleSource setPos _pos;
	    _underWaterParticleSource setParticleCircle [2, [0, 0, 0]];
	    _underWaterParticleSource setParticleRandom [0, [10, 10, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0]; //[2.5, 2.5, 0]
	    _underWaterParticleSource setDropInterval 0.1;
	    _underWaterParticleSource setParticleParams [["\A3\data_f\ParticleEffects\Universal\UnderWaterSmoke",4,0,15,1], "","Billboard", 10, 10, [0,0,-0.3], [0,0,0], 0, 0.3, 0.2353, 0, [1], [[0.3,0.6,0.1,1]], [1], 0, 0, "", "", "",0,true];

		private _smokeParticleSource = "#particlesource" createVehicleLocal [0,0,0];
		_smokeParticleSource setPos _pos;
	    _smokeParticleSource setParticleCircle [2, [0, 0, 0]];
	    _smokeParticleSource setParticleRandom [0, [10, 10, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
	    _smokeParticleSource setDropInterval 0.1;
	    _smokeParticleSource setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16,12,8,1], "","Billboard", 10, 10, [0,0,0], [0,0,0], 0, 0.3, 0.2353, 0, [1.2], [[0.1,0.8,0,0.1]], [0.5], 0, 0, "", "", "",0,true];

	    private _sound = "fatum_idle_buzz" createVehiclelocal [0,0,0];
		_sound setPos (_trg modelToWorld [0,0,0]);

	    [_underWaterParticleSource, _smokeParticleSource, _sound];
    };
	
	case "buzz_snow": {
		private _underWaterParticleSource = "#particlesource" createVehicleLocal [0,0,0];
		_underWaterParticleSource setPos _pos;
		_underWaterParticleSource setParticleCircle [2, [0, 0, 0]];
		_underWaterParticleSource setParticleRandom [0, [2, 2, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
		_underWaterParticleSource setDropInterval 0.1;
		_underWaterParticleSource setParticleParams [["\A3\data_f\ParticleEffects\Universal\UnderWaterSmoke",4,0,15,1], "","Billboard", 10, 10, [0,0,-0.3], [0,0,0], 0, 0.3, 0.2353, 0, [1], [[1,1,1,1]], [1], 0, 0, "", "", "",0,true];

        private _smokeParticleSource = "#particlesource" createVehicleLocal [0,0,0];
		_smokeParticleSource setPos _pos;
		_smokeParticleSource setParticleCircle [2, [0, 0, 0]];
		_smokeParticleSource setParticleRandom [0, [2, 2, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
		_smokeParticleSource setDropInterval 0.1;
		_smokeParticleSource setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16,12,8,1], "","Billboard", 10, 10, [0,0,0], [0,0,0], 0, 0.3, 0.2353, 0, [1.2], [[1,1,1,1]], [0.5], 0, 0, "", "", "",0,true];

		private _sound = "fatum_idle_buzz" createVehiclelocal _pos;
		_sound setPos (_trg modelToWorld [0,0,0]);

        [_underWaterParticleSource, _smokeParticleSource, _sound];
	};
    //5m
    case "electra": {
		_proxy = "Land_HelipadEmpty_F" createVehicleLocal [0,0,0];
		_proxy enableSimulation false;
		_proxy setPos (_trg modelToWorld [0,0,0]);

		_source = "#particlesource" createVehicleLocal [0,0,0];
		_source setPos _pos;
		_source setParticleCircle [2, [0, 0, 0]];
		_source setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_source setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 1, [0, 0, 0], [0, 0, 0], 0, 10, 7.9, 0.005, [0.05, 0.05, 0.05], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _proxy];
		_source setDropInterval 0.2;
		
		_random = selectRandom ["fatum_idle_electra","fatum_idle_electra2"];
		_sound = _random createVehiclelocal [0,0,0];
		_sound setPos _pos;
		[_proxy,_source,_sound]
	};
	//Чуть по больше 7.5m
    case "electra_big": {
        _source1 = "#particlesource" createVehicleLocal [0,0,0];
		_source1 setPos _pos;
        _source1 setParticleCircle [0.3, [0, 0, 0]];
        _source1 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
        _source1 setDropInterval 0.15;
        _source1 setParticleParams  [["A3\data_f\blesk1", 1, 0, 1],"", "spaceObject",  0.4,  0.4,  [0,0,0.3],  [0,0,0],  0,0.3,0.233,0,  [0.067,0.07,0.067],  [[1,1,1,0.5],[1,1,1,0.1]],  [1],  0,  0,  "",  "",  "",0,true];

        _source2 = "#particlesource" createVehicleLocal [0,0,0];
		_source2 setPos _pos;
        _source2 setParticleCircle [5, [0, 0, 0]];
        _source2 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
        _source2 setDropInterval 0.1;
        _source2 setParticleParams  [["A3\data_f\blesk1", 1, 0, 1],"", "spaceObject",  0.3,  0.3,  [0,0,0.3],  [0,0,0],  0,0.3,0.233,0,  [0.042,0.045,0.042],  [[1,1,1,0.5],[1,1,1,0.1]],  [1],  0,  0,  "",  "",  "",0,true];

        _source3 = "#particlesource" createVehicleLocal [0,0,0];
		_source3 setPos _pos;
        _source3 setParticleCircle [4, [0, 0, 0]];
        _source3 setParticleRandom [0, [0, 0, 1], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
        _source3 setDropInterval 0.075;
        _source3 setParticleParams  [["A3\data_f\blesk1", 1, 0, 1],"", "spaceObject",  0.27,  0.27,  [0,0,0.3],  [0,0,0],  0,0.3,0.233,0,  [0.018,0.02,0.018],  [[1,1,1,0.5],[1,1,1,0.1]],  [1],  0,  0,  "",  "",  "",0,true];

		_random = selectRandom ["fatum_idle_electra","fatum_idle_electra2"];
		_sound = _random createVehiclelocal [0,0,0];
		_sound setPos _pos;
		[_source1,_source2,_source3,_sound]
	};
	//5.5m
	case "electra_shar": {
		_source1 = "#particlesource" createVehicleLocal [0,0,0];
		_source1 setPos _pos;
		_source1 setParticleCircle [0, [0, 0, 0]];
		_source1 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
		_source1 setDropInterval 0.2;
		_source1 setParticleParams  [["A3\data_f\blesk1", 1, 0, 1],"", "spaceObject",  0.4,  0.4,  [0,0,2],  [0,0,0],  0,0.3,0.233,0,  [0.077,0.08,0.077],  [[1,1,1,0.5],[1,1,1,0.1]],  [1],  0,  0,  "",  "",  "",0,true];
        
		_source2 = "#particlesource" createVehicleLocal [0,0,0];
		_source2 setPos _pos;
		_source2 setParticleCircle [0, [0, 0, 0]];
		_source2 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
		_source2 setDropInterval 0.2;
		_source2 setParticleParams  [["A3\data_f\blesk1", 1, 0, 1],"", "spaceObject",  0.4,  0.4,  [0,0,2],  [0,0,0],  0,0.3,0.233,0,  [0.077,0.08,0.077],  [[1,1,1,0.5],[1,1,1,0.1]],  [1],  0,  0,  "",  "",  "",0,true];

        _random = selectRandom ["fatum_idle_electra","fatum_idle_electra2"];
		_sound = _random createVehiclelocal [0,0,0];
		_sound setPos _pos;
        [_source1,_source2,_sound]
	};
	case "meat": {
		_source1 = "#particlesource" createVehicleLocal [0,0,0];
		_source1 setPos _pos;
  		_source1 setParticleCircle [0.5, [0.05, -0.5, 0.1]];  
  		_source1 setParticleRandom [0, [0.1,0.1, 0.1], [0.1,0.1, 0.1], 0, 0, [0, 0, 0, 0], 0, 0];
  		_source1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Meat_ca.p3d", 1, 0, 1], "", "SpaceObject", 1, 0.95, [0, 0, 1], [0, 0, 0], 0.1, 10, 8.3, 0, [1,4,1], [[1, 1, 0.1, 1]], [1], 0.1, 0.03, "", "", ""]; 
  		_source1 setDropInterval 0.01; 
  
  		_source2 = "#particlesource" createVehicleLocal [0,0,0];
		_source2 setPos _pos;
  		_source2 setParticleCircle [0, [0, 0, 0]];  
  		_source2 setParticleRandom [0, [0, 0, 0], [0, 0, 0.1], 0, 0, [0, 0, 0, 0], 0, 0];  
  		_source2 setParticleParams  [["\A3\data_f\ParticleEffects\Universal\Refract", 1, 0, 1],"","Billboard",1,5,[0,0,1.2],[0,0,0],12,0.5,0.395,0,[0.1,1.5,0.5,1],[[1,1,1,1],[1,1,1,0.7],[1,1,1,0]],[0.1,0.8],0,0, "","",""];  
  		_source2 setDropInterval 5; 

  		_sound = "fatum_idle_meat" createVehicleLocal [0,0,0];
		_sound setPos _pos;
  		[_source1,_source2,_sound];
	};
	case "gravi": {
		// искажения
		_source1 = "#particlesource" createVehicleLocal [0,0,0];
		_source1 setPos _pos;
		_source1 setParticleCircle [0, [0, 0, 0.3]];
		_source1 setParticleRandom [0.5, [0.5, 0.5, 0.2], [0.1, 0.1, 0.1], 0.1, 0.1, [0.1, 0.1, 0.1, 0.1], 0.1, 0.1];
		_source1 setParticleParams  [["\A3\data_f\ParticleEffects\Universal\Refract", 1, 0, 1],"","Billboard",1,5,[0,0,1],[0,0,0],12,0.5,0.395,0,[0.3,4,3,4],[[1,1,1,1],[1,1,1,0.7],[1,1,1,0]],[0.1,0.8],0,0,"","",""];
	    _source1 setDropInterval 4;
		
		// листва (медленнно кружатся)
		_source2 = "#particlesource" createVehicleLocal [0,0,0];
		_source2 setPos _pos;
		_source2 setParticleCircle [3.5, [0.7, -1, 0.4]];
		_source2 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
		_source2 setParticleParams [["\A3\data_f\cl_leaf2", 1, 0, 1], "", "SpaceObject", 1, 2.5, [0, 0, 0], [0, 0, 0], 0.2, 10, 7.83, 0, [1,1], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0]], [1], 0.2, 0.05, "", "", ""];
		_source2 setDropInterval 0.1;
	
		//_random = selectRandom ["fatum_idle_gravi","fatum_idle_gravi2"];
		_sound = "fatum_idle_list" createVehicleLocal [0,0,0];
		_sound setPos _pos;
  		[_source1,_source2,_sound];
	};
	case "springboard": {
	    // искажения
	    _source1 = "#particlesource" createVehicleLocal [0,0,0];
		_source1 setPos _pos;
	    _source1 setParticleCircle [0, [0, 0, 0.3]];
	    _source1 setParticleRandom [0.5, [0.5, 0.5, 0.2], [0.1, 0.1, 0.1], 0.1, 0.1, [0.1, 0.1, 0.1, 0.1], 0.1, 0.1];
	    _source1 setParticleParams  [["\A3\data_f\ParticleEffects\Universal\Refract", 1, 0, 1],"","Billboard",1,5,[0,0,1],[0,0,0],12,0.5,0.395,0,[0.3,4,3,4],[[1,1,1,1],[1,1,1,0.7],[1,1,1,0]],[0.1,0.8],0,0,"","",""];
	    _source1 setDropInterval 4;

        // листва (медленнно кружатся)
	    _source2 = "#particlesource" createVehicleLocal [0,0,0];
		_source2 setPos _pos;
		_source2 setParticleCircle [2, [0, 0, 0]];
		_source2 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.5, [0, 0, 0, 0.1], 0, 0];
		_source2 setParticleParams [["\A3\data_f\cl_leaf", 1, 0, 1], "", "SpaceObject", 1, 7, [0, 0, 0], [0, 0, 0.5], 0, 10, 7.9, 0.075, [2, 2, 0.01], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [6, 5, 5], 1, 0, "", "", true];
		_source2 setDropInterval 0.2;
  		
		//_random = selectRandom ["fatum_idle_gravi","fatum_idle_gravi2"];
		_sound = "fatum_idle_list" createVehicleLocal [0,0,0];
		_sound setPos _pos;
  		[_source1,_source2,_sound];
	};
	case "tramplin": {
	    // искажения
	    _source1 = "#particlesource" createVehicleLocal [0,0,0];
		_source1 setPos _pos;
	    _source1 setParticleCircle [0, [0, 0, 0.3]];
	    _source1 setParticleRandom [0.5, [0.5, 0.5, 0.2], [0.1, 0.1, 0.1], 0.1, 0.1, [0.1, 0.1, 0.1, 0.1], 0.1, 0.1];
	    _source1 setParticleParams  [["\A3\data_f\ParticleEffects\Universal\Refract", 1, 0, 1],"","Billboard",1,5,[0,0,1],[0,0,0],12,0.5,0.395,0,[0.3,4,3,4],[[1,1,1,1],[1,1,1,0.7],[1,1,1,0]],[0.1,0.8],0,0,"","",""];
	    _source1 setDropInterval 4;

		// листва (медленнно кружатся)
	    _source2 = "#particlesource" createVehicleLocal [0,0,0];
		_source2 setPos _pos;
	    _source2 setParticleCircle [3.5, [0.7, -1, 0.4]];
	    _source2 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
	    _source2 setParticleParams [["\A3\data_f\cl_leaf2", 1, 0, 1], "", "SpaceObject", 1, 2.5, [0, 0, 0], [0, 0, 0], 0.2, 10, 7.83, 0, [1,1], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0]], [1], 0.2, 0.05, "", "", ""];
	    _source2 setDropInterval 0.1;
		
        _sound = "fatum_idle_list" createVehiclelocal _pos;
		_sound setPos _pos;
  		[_source1,_source2,_sound];
	};
	case "peak": {
  		_source = "#particlesource" createVehicleLocal [0,0,0];
		_source setPos _pos;
  		_source setParticleCircle [0, [0, 0, 0]]; 
  		_source setParticleRandom [0, [10, 10, 0], [0.25, 0.25, 0], 0, 1.5, [0, 0, 0, 0], 0, 0]; 
  		_source setParticleParams [["\a3\data_f\ParticleEffects\Pstone\Pstone.p3d", 8, 3, 1], "", "SpaceObject", 1, 5, [0, 0, 2], [0, 0, -2], 1, 1.17, 1, 0.2, [0.1, 0.3, 0.1], [[1, 1, 1 ,1], [1, 1, 1, 1], [1, 1, 1, 1]], [0, 1], 1, 0, "", "", true]; 
  		_source setDropInterval 0.02;
		
		_sound = "fatum_idle_silovoepole" createVehicleLocal [0,0,0];
		_sound setPos _pos;
  		[_source,_sound];
	};
	case "kostolom": {
	    // искажения
	    _source1 = "#particlesource" createVehicleLocal [0,0,0];
		_source1 setPos _pos;
		_source1 setParticleCircle [2, [0, 0, 0]];
		_source1 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.5, [0, 0, 0, 0.1], 0, 0];
		_source1 setParticleParams [["\A3\data_f\cl_leaf", 1, 0, 1], "", "SpaceObject", 1, 7, [0, 0, 0], [0, 0, 0.5], 0, 10, 7.9, 0.075, [2, 2, 0.01], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [6, 5, 5], 1, 0, "", "", true];
		_source1 setDropInterval 0.2;

		// листва (медленнно кружатся)
        _source2 = "#particlesource" createVehicleLocal [0,0,0];
		_source2 setPos _pos;
        _source2 setParticleCircle [3.5, [0.7, -1, 0.4]];
        _source2 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
        _source2 setParticleParams [["\A3\data_f\cl_leaf2", 1, 0, 1], "", "SpaceObject", 1, 2.5, [0, 0, 0], [0, 0, 0], 0.2, 10, 7.83, 0, [1,1], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0]], [1], 0.2, 0.05, "", "", ""];
        _source2 setDropInterval 0.1;
		
        _sound = "fatum_idle_kostolom" createVehiclelocal [0,0,0];
		_sound setPos _pos;
  		[_source1,_source2,_sound]
	};
	case "teleport": {
	    _source1 = "#particlesource" createVehiclelocal [0,0,0];
		_source1 setPos _pos;
	    _source1 setParticleCircle [0, [0, 0, 0.6]];
	    _source1 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0,0,0,0], 0, 0];
	    _source1 setDropInterval 4;
	    _source1 setParticleParams  [["\A3\data_f\ParticleEffects\Universal\Refract", 1, 0, 1],"","Billboard",1,5,[0,0,1],[0,0,0],  0,  0.5,  0.395,  0,         [2, 3],       [[1,1,1,1],[1,1,1,0.9], [1,1,1,0]],[1],0,0,"","",""];
 
		_source2 = "#particlesource" createVehiclelocal [0,0,0];
		_source2 setPos _pos;
		_source2 setParticleCircle [0, [0, 0, 0]]; 
		_source2 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0]; 
		_source2 setDropInterval 0.1; 
		_source2 setParticleParams  [["A3\data_f\blesk1", 1, 0, 1],"", "spaceObject",  0.4,  5,  [0,0,1.4],  [0,0,0],  0,0.3,0.235,0,  [0.009,0.008,0.009],  [[1,1,1,0.5],[1,1,1,0.1]],  [1],  0,  0,  "",  "",  "",0,true]; 

		_source3 = "#particlesource" createVehiclelocal [0,0,0];
		_source3 setParticleCircle [8, [0, 0, 0]];
		_source3 setParticleRandom [0, [0, 0, 1], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
		_source3 setDropInterval 0.075;
		_source3 setParticleParams  [["A3\data_f\blesk1", 1, 0, 1],"", "spaceObject",  0.27,  0.27,  [0,0,0.6],  [0,0,0],  0,0.3,0.233,0,  [0.011,0.01,0.011],  [[1,1,1,0.5],[1,1,1,0.1]],  [1],  0,  0,  "",  "",  "",0,true];

		_light = "#lightpoint" createVehiclelocal [0,0,0];
		_light setPos _pos;
		_light setLightBrightness 1;  
		_light setLightAmbient[0,0,0];  
		_light setLightColor[0,0.604,0.804];  
		_light lightAttachObject [_source1, [0,0,1.5]];  
		_light setLightUseFlare true;  
		_light setLightFlareSize 5;  
		_light setLightDayLight true;  
		_light setLightFlareMaxDistance 50;

        
		_sound = "fatum_idle_teleport" createVehiclelocal [0,0,0];
		_sound setPos _pos;
  		[_source1,_source2,_sound,_light]
	};
	case "teleport_v2": {
		private _proxy = "Land_HelipadEmpty_F" createVehicleLocal [0,0,0];
		_proxy enableSimulation false;
		_proxy setPos _pos;

		private _source = "#particlesource" createVehicleLocal [0,0,0];
		_source setPos _pos;
		_source setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1,0],"","Billboard",1,    1,    [0,0,.4],[0,0,1],0,1,1,0,[.25,3,.25,0],[[1,1,1,1],[1,1,1,1]],[1.5,0.5],0,0,"","",_proxy]; 
        _source setDropInterval 0.1; 

		private _sound = "fatum_idle_teleport2" createVehiclelocal [0,0,0];
		_sound setPos _pos;
		[_proxy,_source,_sound]
	};
	case "skrimer": {
	    _random = (selectRandom ["fatum_idle_scrimer1","fatum_idle_scrimer2","fatum_idle_scrimer3","fatum_idle_scrimer4"]);
		_sound = _random createVehiclelocal [0,0,0];
		_sound setPos _pos;	
		[_sound]
	};
	/* case "radiation": {
	    _source = "AZ_CUTTER_MEDIUM" createVehiclelocal [0,0,0];
		_source setPos _pos;	
		_source enableSimulation false;
		_source setVariable ["radiationTrigger",_trg]; 
		
		if (isNil {_trg getVariable "radiationLevel"} OR isNil {_trg getVariable "radiationRadius"}) then {
	        _trg setVariable ["radiationLevel",1 + random 1.2];
		    _trg setVariable ["radiationRadius",50];
		};
		
	    []
	};*/
	case "fog": { 
		private _fog1 = "#particlesource" createVehicleLocal [0,0,0];
		_fog1 setPos _pos;
		_fog1 setParticleParams [["\A3\Data_F\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10, [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0, [10,9], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _trg];
		_fog1 setParticleRandom [3, [200, 200, 0.5], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
		_fog1 setParticleCircle [0.001, [0, 0, -0.12]];
		_fog1 setDropInterval 0.01;

		private _fog2 = "#particlesource" createVehicleLocal [0,0,0];
		_fog2 setPos _pos;
		_fog2 setParticleParams [["\A3\Data_F\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10, [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0, [10,9], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _trg];
		_fog2 setParticleRandom [3, [200, 200, 0.5], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
		_fog2 setParticleCircle [0.001, [0, 0, -0.12]];
		_fog2 setDropInterval 0.01;
		
		private _fog3 = "#particlesource" createVehicleLocal [0,0,0];
		_fog3 setPos _pos;
		_fog3 setParticleParams [["\A3\Data_F\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10, [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0, [10,9], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _trg];
		_fog3 setParticleRandom [3, [200, 200, 0.5], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
		_fog3 setParticleCircle [0.001, [0, 0, -0.12]];
		_fog3 setDropInterval 0.01;
		
		private _fog4 = "#particlesource" createVehicleLocal [0,0,0];
		_fog4 setPos _pos;
		_fog4 setParticleParams [["\A3\Data_F\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10, [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0, [10,9], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _trg];
		_fog4 setParticleRandom [3, [200, 200, 0.5], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
		_fog4 setParticleCircle [0.001, [0, 0, -0.12]];
		_fog4 setDropInterval 0.01;
		
		private _fog5 = "#particlesource" createVehicleLocal [0,0,0];
		_fog5 setPos _pos;
		_fog5 setParticleParams [["\A3\Data_F\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10, [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0, [10,9], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _trg];
		_fog5 setParticleRandom [3, [200, 200, 0.5], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
		_fog5 setParticleCircle [0.001, [0, 0, -0.12]];
		_fog5 setDropInterval 0.01;
		
		private _fog6 = "#particlesource" createVehicleLocal [0,0,0];
		_fog6 setPos _pos;
		_fog6 setParticleParams [["\A3\Data_F\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10, [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0, [10,9], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _trg];
		_fog6 setParticleRandom [3, [200, 200, 0.5], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
		_fog6 setParticleCircle [0.001, [0, 0, -0.12]];
		_fog6 setDropInterval 0.01;
		
		life_anomalyFogActive = true;
		
		[{
            {
                deleteVehicle _x; 
                nil
            } count _this;
            life_anomalyFogActive = false;
        },[_fog1,_fog2,_fog3,_fog4,_fog5,_fog6],30] call CBA_fnc_waitAndExecute;

		[_fog1,_fog2,_fog3,_fog4,_fog5,_fog6]
	};
	case "jarka_invis": {
		/* _sound = "fatum_idle_burn" createVehiclelocal [0,0,0];
		_sound setPos _pos;
		[_sound] 
		_source = "AZ_CUTTER_SMALL" createVehicleLocal [0,0,0];
		_source setPos _pos;
  		[_source]*/
		[]
	};
	case "electra_invis": {
		/* _source = "AZ_CUTTER_SMALL" createVehicleLocal [0,0,0];
		_source setPos _pos;
  		[_source] */
		[]
	};
	case "meat_invis": {
  		/* _sound = "fatum_idle_meat" createVehicleLocal [0,0,0];
		_sound setPos _pos;
  		[_sound] */
		
		/* _source = "AZ_CUTTER_SMALL" createVehicleLocal [0,0,0];
		_source setPos _pos;
  		[_source] */
		[]
	};
	case "gravi_invis": {
		/* _random = selectRandom ["fatum_idle_gravi","fatum_idle_gravi2"];
		_sound = _random createVehicleLocal [0,0,0];
		_sound setPos _pos;
  		[_sound]; */
		/* _source = "AZ_CUTTER_SMALL" createVehicleLocal [0,0,0];
		_source setPos _pos;
  		[_source] */
		[]
	};
	case "springboard_invis": {
		/* _random = selectRandom ["fatum_idle_gravi","fatum_idle_gravi2"];
		_sound = _random createVehicleLocal [0,0,0];
		_sound setPos _pos;
  		[_sound]; */
		
		/* _source = "AZ_CUTTER_SMALL" createVehicleLocal [0,0,0];
		_source setPos _pos;
  		[_source] */
		[]
	};
	case "tramplin_invis": {
		/* _random = selectRandom ["fatum_idle_gravi","fatum_idle_gravi2"];
		_sound = _random createVehicleLocal [0,0,0];
		_sound setPos _pos;
  		[_sound]; */
		/* _source = "AZ_CUTTER_SMALL" createVehicleLocal [0,0,0];
		_source setPos _pos;
  		[_source] */
		[]
	};
	case "teleport_invis": {
	    /* _source = "AZ_CUTTER_SMALL" createVehicleLocal [0,0,0];
		_source setPos _pos;
  		[_source] */
		[]
	};
	default {[]};
};