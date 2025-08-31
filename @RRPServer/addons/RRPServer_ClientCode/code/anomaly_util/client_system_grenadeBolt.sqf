/*

	Filename: 	client_system_grenadeBolt.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	VK:		    https://vk.com/id194667034
	Web:		http://empyrean.club

*/
#include "..\..\macros.hpp"
private _grenade = param [0,objNull,[objNull]];
if (isNull _grenade) exitWith {};

[{vectorMagnitude velocity _this < 0.2},{
    _this setVelocity [0,0,0];

    {
		private _type = _x GVAR ["anomaly_type", nil];
		private _source = _x GVAR ["anomaly_particle_source", []];
		if (!(isNil "_type") && {!(_x GVAR "anomaly_cooldown")}) then {
			switch (_type) do {
			    case "Teleport";
				case "Teleport_v2": {
				    [_x,[_this]] call client_anomaly_activateTeleport;
					if !(_x in life_anomalyArtefactArray) then {
					    if (round(random(100)) <= 15 && {(_x getVariable ["house_cooldown", serverTime]) <= serverTime}) then {
							[_x,getPosATL _x,6] remoteExec ["client_anomaly_lootCreate",RCLIENT];
			            };
					};
				};
				case "Gravi": {
				    [_x,[_this]] call client_anomaly_activateGravi;
					if !(_x in life_anomalyArtefactArray) then {
					    if (round(random(100)) <= 15 && {(_x getVariable ["house_cooldown", serverTime]) <= serverTime}) then {
							[_x,getPosATL _x,6] remoteExec ["client_anomaly_lootCreate",RCLIENT];
			            };
					};
				};
				case "Meat": {
				    [_x,[_this]] call client_anomaly_activateMeat;
				    if !(_x in life_anomalyArtefactArray) then {
					    if (round(random(100)) <= 15 && {(_x getVariable ["house_cooldown", serverTime]) <= serverTime}) then {
							[_x,getPosATL _x,6] remoteExec ["client_anomaly_lootCreate",RCLIENT];
			            };
					};
				};
				case "Tramplin";
				case "Springboard": {
				    [_x,[_this]] call client_anomaly_activateSpringboard;
					if !(_x in life_anomalyArtefactArray) then {
					    if (round(random(100)) <= 15 && {(_x getVariable ["house_cooldown", serverTime]) <= serverTime}) then {
							[_x,getPosATL _x,6] remoteExec ["client_anomaly_lootCreate",RCLIENT];
			            };
					};
				};
                case "Jarka";
                case "Jarka_v2";
				case "Burner";
				case "Electra";
				case "Electra_Shar";
				case "Electra_Big": {
				    [_x,[_this]] call client_anomaly_activateDefault;
					if !(_x in life_anomalyArtefactArray) then {
					    if (round(random(100)) <= 15 && {(_x getVariable ["house_cooldown", serverTime]) <= serverTime}) then {
							[_x,getPosATL _x,6] remoteExec ["client_anomaly_lootCreate",RCLIENT];
			            };
					};
				};
                case "Skrimer_invis": {
					if (_source isEqualTo []) then {
						_source = [_x,"Skrimer"] call client_anomaly_particlesIdle;
						if !(_source isEqualTo []) then {
						    _x SVAR ["anomaly_particle_source",_source];
							[{[_this] call client_anomaly_particlesDelete},_x,10 + random 5] call CBA_fnc_waitAndExecute;
						};
					};
				};
				case "Teleport_invis";
				case "Teleport_v2_invis": {
				    if (_source isEqualTo []) then {
						_source = [_x,"Teleport"] call client_anomaly_particlesIdle;
						if !(_source isEqualTo []) then {
						    _x SVAR ["anomaly_particle_source",_source];
							[{[_this] call client_anomaly_particlesDelete},_x,10 + random 5] call CBA_fnc_waitAndExecute;
						};
					} else {
					    if !(_x in life_anomalyArtefactArray) then {
							if (round(random(100)) <= 15 && {(_x getVariable ["house_cooldown", serverTime]) <= serverTime}) then {
								[_x,getPosATL _x,6] remoteExec ["client_anomaly_lootCreate",RCLIENT];
			                };
					    };
                        [_x,[_this]] call client_anomaly_activateTeleport
					};
				};
				case "Gravi_invis": {
					if (_source isEqualTo []) then {
						_source = [_x,"Gravi"] call client_anomaly_particlesIdle;
						if !(_source isEqualTo []) then {
						    _x SVAR ["anomaly_particle_source",_source];
							[{[_this] call client_anomaly_particlesDelete},_x,10 + random 5] call CBA_fnc_waitAndExecute;
						};
					} else {
					    if !(_x in life_anomalyArtefactArray) then {
							if (round(random(100)) <= 15 && {(_x getVariable ["house_cooldown", serverTime]) <= serverTime}) then {
								[_x,getPosATL _x,6] remoteExec ["client_anomaly_lootCreate",RCLIENT];
			                };
					    };
                        [_x,[_this]] call client_anomaly_activateGravi;
					};
				};
				case "Meat_invis": {
					if (_source isEqualTo []) then {
						_source = [_x,"Meat"] call client_anomaly_particlesIdle;
						if !(_source isEqualTo []) then {
						    _x SVAR ["anomaly_particle_source",_source];
							[{[_this] call client_anomaly_particlesDelete},_x,10 + random 5] call CBA_fnc_waitAndExecute;
						};
					} else {
                        [_x,[_this]] call client_anomaly_activateMeat;
						if !(_x in life_anomalyArtefactArray) then {
							if (round(random(100)) <= 15 && {(_x getVariable ["house_cooldown", serverTime]) <= serverTime}) then {
							    [_x,getPosATL _x,6] remoteExec ["client_anomaly_lootCreate",RCLIENT];
			                };
					    };
					};
				};
				case "Tramplin_invis": {
					if (_source isEqualTo []) then {
						_source = [_x,"Tramplin"] call client_anomaly_particlesIdle;
						if !(_source isEqualTo []) then {
						    _x SVAR ["anomaly_particle_source",_source];
							[{[_this] call client_anomaly_particlesDelete},_x,10 + random 5] call CBA_fnc_waitAndExecute;
						};
					} else {
                        [_x,[_this]] call client_anomaly_activateSpringboard;
						if !(_x in life_anomalyArtefactArray) then {
							if (round(random(100)) <= 15 && {(_x getVariable ["house_cooldown", serverTime]) <= serverTime}) then {
							    [_x,getPosATL _x,6] remoteExec ["client_anomaly_lootCreate",RCLIENT];
			                };
					    };
					};
				};
				case "Springboard_invis": {
					if (_source isEqualTo []) then {
						_source = [_x,"Springboard"] call client_anomaly_particlesIdle;
						if !(_source isEqualTo []) then {
						    _x SVAR ["anomaly_particle_source",_source];
							[{[_this] call client_anomaly_particlesDelete},_x,10 + random 5] call CBA_fnc_waitAndExecute;
						};
					} else {
					if !(_x in life_anomalyArtefactArray) then {
							if (round(random(100)) <= 15 && {(_x getVariable ["house_cooldown", serverTime]) <= serverTime}) then {
							    [_x,getPosATL _x,6] remoteExec ["client_anomaly_lootCreate",RCLIENT];
			                };
					    };
                        [_x,[_this]] call client_anomaly_activateSpringboard;
					};
				};
                case "Jarka_invis": {
					if (_source isEqualTo []) then {
						_source = [_x,"Jarka"] call client_anomaly_particlesIdle;
						if !(_source isEqualTo []) then {
						    _x SVAR ["anomaly_particle_source",_source];
							[{[_this] call client_anomaly_particlesDelete},_x,10 + random 5] call CBA_fnc_waitAndExecute;
						};
					} else {
                        [_x,[_this]] call client_anomaly_activateDefault;
						if !(_x in life_anomalyArtefactArray) then {
							if (round(random(100)) <= 15 && {(_x getVariable ["house_cooldown", serverTime]) <= serverTime}) then {
							    [_x,getPosATL _x,6] remoteExec ["client_anomaly_lootCreate",RCLIENT];
			                };
					    };
					};
				};
				case "Burner_invis": {
					if (_source isEqualTo []) then {
						_source = [_x,"Burner"] call client_anomaly_particlesIdle;
						if !(_source isEqualTo []) then {
						    _x SVAR ["anomaly_particle_source",_source];
							[{[_this] call client_anomaly_particlesDelete},_x,10 + random 5] call CBA_fnc_waitAndExecute;
						};
					} else {
                        [_x,[_this]] call client_anomaly_activateDefault;
						if !(_x in life_anomalyArtefactArray) then {
							if (round(random(100)) <= 15 && {(_x getVariable ["house_cooldown", serverTime]) <= serverTime}) then {
							    [_x,getPosATL _x,6] remoteExec ["client_anomaly_lootCreate",RCLIENT];
			                };
					    };
					};
				};
				case "Electra_invis": {
					if (_source isEqualTo []) then {
						_source = [_x,"Electra"] call client_anomaly_particlesIdle;
						if !(_source isEqualTo []) then {
						    _x SVAR ["anomaly_particle_source",_source];
							[{[_this] call client_anomaly_particlesDelete},_x,10 + random 5] call CBA_fnc_waitAndExecute;
						};
					} else {
                        [_x,[_this]] call client_anomaly_activateDefault;
						if !(_x in life_anomalyArtefactArray) then {
							if (round(random(100)) <= 15 && {(_x getVariable ["house_cooldown", serverTime]) <= serverTime}) then {
							    [_x,getPosATL _x,6] remoteExec ["client_anomaly_lootCreate",RCLIENT];
			                };
					    };
					};
				};
				default {};
			};
		};
	} forEach ((getPos _this) nearObjects ["EmptyDetector", 16]);

	[{deleteVehicle _this},_this,5] call CBA_fnc_waitAndExecute;
},_grenade] call CBA_fnc_waitUntilAndExecute;

nil
