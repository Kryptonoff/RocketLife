/*

	Filename: 	client_anomaly_meatSplash.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		http://empyrean.club

*/
params [
    ["_body",objNull,[objNull]],
	["_type",0,[0]]
];

if (isNull _body) exitWith {};
if (isServer) then {
    _body hideObjectGlobal true;
};
if (_body distance player > 1000 OR isServer OR _type != 2) exitWith {};

private _skeleton = "Land_HumanSkeleton_F" createVehicleLocal [0,0,0];
private _blood_splatter = "BloodSplatter_01_Medium_New_F" createVehicleLocal [0,0,0];
		
_skeleton setPosATL [getPos _body select 0,getPos _body select 1,1.5];
_blood_splatter setPosATL [getPos _body select 0,getPos _body select 1,0];
		
private  _blood_splash = "#particlesource" createVehicleLocal [0,0,0];
_blood_splash setPos (getPos _body);
_blood_splash setParticleCircle [0, [0, 0, 0]];
_blood_splash setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_blood_splash setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 13, 1], "", "Billboard", 1, 0.5, [0, 0, 0], [0, 0, 0.5], 2, 10, 7.9, 0.075, [1, 3, 7], [[1, 0, 0.1, 1], [1, 0, 0.1, 1],[1, 1, 0.1, 0]], [0.08], 1, 0, "", "",_skeleton];
_blood_splash setDropInterval 60;

private _meat_pieces = "#particlesource" createVehicleLocal [0,0,0];
_meat_pieces setPos (getPos _body);
_meat_pieces setParticleCircle [0, [0, 0, 0]];
_meat_pieces setParticleRandom [0, [0.25, 0.25, 0.25], [9, 9, 10], 0, 1.5, [0, 0, 0, 0.1], 0, 0];
_meat_pieces setParticleParams [["\A3\data_f\ParticleEffects\Universal\Meat_ca.p3d", 1, 0, 1], "", "SpaceObject", 1, 10, [0, 0, 0], [0, 0, 0.75], 0, 19, 7.9, 0.1, [2, 2, 2], [[1, 0.1, 0.1, 1], [1, 0.25, 0.25, 0.5], [1, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _skeleton,0,true,0.25,[[0,0,0,0]]];
_meat_pieces setDropInterval 0.005;
		
_skeleton setVectorUp [0,-1,1];
		
_body say3D "blood_splash";

[{deleteVehicle _this},_meat_pieces,0.25] call CBA_fnc_waitAndExecute;
[{_this say3D "bones_drop"},_blood_splatter,0.3] call CBA_fnc_waitAndExecute;
[{deleteVehicle _this},_blood_splash,1] call CBA_fnc_waitAndExecute;
[{deleteVehicle _this},_skeleton] call CBA_fnc_waitAndExecute;