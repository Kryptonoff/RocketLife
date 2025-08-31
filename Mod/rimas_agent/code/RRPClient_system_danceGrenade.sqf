_proj	= _this # 6;
_mag	= _this # 5;

if !(_mag == "Dr_discoBomb") exitWith {};

_colors = [[1,0.224,0.224],[1,0.224,0.608],[1,0.224,0.992],[0.573,0.224,1],[0.224,0.478,1],[0.224,0.788,1],[0.224,1,0.937],[0.224,1,0.663],[0.224,1,0.463],[0.663,1,0.224],[0.863,1,0.224],[1,0.937,0.224],[1,0.733,0.224],[1,0.424,0.224]];
_lightsPics = getArray(configFile >> "cfgVehicles" >> "Dr_discoBall" >> "rtxLights");
_sounds = [["Dr_disco_songHalogen","Dr_disco_songFlawa","Dr_disco_songspoiler","Dr_disco_songborat"],missionNamespace getVariable ["Dr_disco_soundPack",[]]] select !(isNil "Dr_disco_soundPack");
_anims = [["Dr_disco_sillyDance","Dr_disco_hiphopDance","Acts_Dance_01","Acts_Dance_02"],missionNamespace getVariable ["Dr_disco_animPack",[]]] select !(isNil "Dr_disco_animPack");

UiSleep 1;
_particles = "#particlesource" createVehicle position _proj;
[_particles,[["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,13,2,0],"","Billboard",1,4,[0,0,0],[0,0,0],1,1.3,1,0,[0.11,0.1,0.1,0.1,0.1,0.08,0.08,0.08,0.08,0],[[0.431949,0,0.989591,0.985745],[0,0.235813,1,1],[1,0,0.347341,1],[1,0.624239,0,1],[0.00121837,0,1,-1],[0,1,0,-1],[0,1,1,-1],[1,1,0,-1],[0.970362,0.558861,0.778071,-1]],[1000,0,0,0,0,0,0,0,0],0.1,0.55,"","",_particles,0,false,1,[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]]] remoteExec ["setParticleParams",0];
[_particles,[2.5,[0,0,0],[1,1,1],60,1,[0.562336,0.873847,0.60464,0],0.3,0.15,360,0]] remoteExec ["setParticleRandom",0];
[_particles,[0,[0,0,0]]] remoteExec ["setParticleCircle",0];
[_particles,0.01] remoteExec ["setDropInterval",0];
_particles attachTo [_proj,[0,0,0]];

waitUntil {(speed _proj) == 0};

_projPos = getPosASL _proj;

_discoBall = "Dr_discoBall" createVehicle [0,0,0];
_discoBall setPosASL (_projPos vectorAdd [0,0,-1]);
_moveTime = time;

[_discoBall,"Dr_disco_initDisco"] remoteExec ["say3D",0];
[format["Dr_DiB_DrawEH_MoveDiBo_%1",_moveTime],"onEachFrame",{
	params ["_discoBall","_time","_starttime","_endtime","_startPos","_endPos"];

	_interval 	= linearConversion [_startTime, _endTime, time, 0, 1,true];

	if (_interval == 1) exitWith {
		[format["Dr_DiB_DrawEH_MoveDiBo_%1",_time],"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		_discoBall setVariable ["Moved",true];
	};
	_discoBall setVelocityTransformation [
	_startPos,
	_endPos,
	[0,0,0],
	[0,0,0],
	[0,1,0],
	[0,1,0],
	[0,0,1],
	[0,0,1],
	_interval
	];
},[_discoBall,_moveTime,_moveTime,_moveTime + 2.65,getPosASL _discoBall,(getPosASL _discoBall) vectorAdd [0,0,8]]] call BIS_fnc_addStackedEventHandler;

waitUntil {_discoBall getVariable ["Moved",false]};
for "_i" from 0 to 6 do {
	_discoBall setObjectTextureGlobal [_i,selectRandom _lightsPics];
};
UiSleep 0.1;

_nearUnits = _proj nearObjects ["Man", 8];
_listUnits = [];
{
	if (!(_x getVariable ["Dr_disco_flexing",false]) && (alive _x)) then {
		_x setVariable ["Dr_disco_flexing",true,true];
		[_x,selectRandom _anims] remoteExec ["switchMove",0];
		_info = (getUnitLoadout _x) select [0,3];

		[_x,primaryWeapon _x] remoteExec ["removeWeapon",_x];
		[_x,secondaryWeapon _x] remoteExec ["removeWeapon",_x];
		[_x,handgunWeapon _x] remoteExec ["removeWeapon",_x];
		_listUnits pushback [_x,_info];
	};
} forEach _nearUnits;

_soundSource = "Land_HelipadEmpty_F" createVehicle getPos _discoBall;
_soundSource setPos getPos _discoBall;
[_soundSource,selectRandom _sounds] remoteExec ['say3D',0];

_rotateTime = time;
missionNamespace setVariable [format["Dr_DiB_RotateDiBo_%1",_rotateTime],0];
missionNamespace setVariable [format["Dr_DiB_RotateDiBo_start_%1",_rotateTime],_rotateTime];
missionNamespace setVariable [format["Dr_DiB_RotateDiBo_end_%1",_rotateTime],_rotateTime + 0.5];
[format["Dr_DiB_DrawEH_RotateDiBo_%1",_rotateTime],"onEachFrame",{
	params ["_discoBall","_time"];

	_startTime	= missionNamespace getVariable [format["Dr_DiB_RotateDiBo_start_%1",_time],0];
	_endTime	= missionNamespace getVariable [format["Dr_DiB_RotateDiBo_end_%1",_time],0];
	_interval 	= linearConversion [_startTime, _endTime, time, 0, 1,true];
	_mode		= missionNamespace getVariable [format["Dr_DiB_RotateDiBo_%1",_time],0];
	_dir = [
		[[0,1,0],[1,-4.37114e-008,0]],
		[[1,-4.37114e-008,0],[-8.74228e-008,-1,0]],
		[[-8.74228e-008,-1,0],[-1,1.19249e-008,0]],
		[[-1,1.19249e-008,0],[0,1,0]]
	] select _mode;

	_dir params ["_startdir","_enddir"];

	if (_interval == 1) exitWith {
		_mode = _mode + 1;
		if (_mode > 3) then {_mode = 0};
		missionNamespace setVariable [format["Dr_DiB_RotateDiBo_%1",_time],_mode];
		missionNamespace setVariable [format["Dr_DiB_RotateDiBo_start_%1",_time],time];
		missionNamespace setVariable [format["Dr_DiB_RotateDiBo_end_%1",_time],time + 0.5];
	};

	_discoBall setVelocityTransformation [
	getPosASL _discoBall,
	getPosASL _discoBall,
	[0,0,0],
	[0,0,0],
	_startdir,
	_enddir,
	[0,0,1],
	[0,0,1],
	_interval
	];
},[_discoBall,_rotateTime]] call BIS_fnc_addStackedEventHandler;



_startpos1 = _projPos vectorAdd [3,0,0.3];
_endpos1 = _startpos1 vectorAdd [0,0,1];
_startpos2 = _projPos vectorAdd  [-3,0,0.3];
_endpos2 = _startpos2 vectorAdd  [0,0,1];
_startpos3 = _projPos vectorAdd [0,3,0.3];
_endpos3 = _startpos3 vectorAdd [0,0,1];
_startpos4 = _projPos vectorAdd [0,-3,0.3];
_endpos4 = _startpos4 vectorAdd [0,0,1];

_light1 = objNull;
_light2 = objNull;
_light3 = objNull;
_light4 = objNull;

for "_i" from 1 to 4 do {
	call compile format["
	_light%1 = '#lightpoint' createVehicle _startpos%1;
	_light%1 setPosASL _startpos%1;
	[_light%1,[random 1,random 1,random 1]] remoteExec ['setLightColor',0];
	[_light%1,[random 1,random 1,random 1]] remoteExec ['setLightAmbient',0];
	[_light%1,(linearConversion [0,1,sunormoon,200,400000,true])] remoteExec ['setLightIntensity',0];
	[_light%1,false] remoteExec ['setLightUseFlare',0];
	[_light%1,[1.5,0,1,1]] remoteExec ['setLightAttenuation',0];
	[_light%1,true] remoteExec ['setLightDayLight',0];
	",_i]
};

_time = time;
missionNamespace setVariable [format["Dr_DiB_startTime_%1",_time],_time];
missionNamespace setVariable [format["Dr_DiB_endTime_%1",_time],_time + 0.3];
missionNamespace setVariable [format["Dr_DiB_mode_%1",_time],0];

[format["Dr_DiB_DrawEH_%1",_time],"onEachFrame",{
	params ["_light1","_light2","_light3","_light4","_startpos1","_endpos1","_startpos2","_endpos2","_startpos3","_endpos3","_startpos4","_endpos4","_time"];

	_startTime 	= missionNamespace getVariable format["Dr_DiB_startTime_%1",_time];
	_endTime 	= missionNamespace getVariable format["Dr_DiB_endTime_%1",_time];
	_interval 	= linearConversion [_startTime, _endTime, time, 0, 1,true];
	_mode 		= missionNamespace getVariable format["Dr_DiB_mode_%1",_time];
	missionNamespace setVariable [format["Dr_DiB_interval_%1",_time],_interval];

	if (_interval == 1) exitWith {
		missionNamespace setVariable [format["Dr_DiB_interval_%1",_time],0];
		missionNamespace setVariable [format["Dr_DiB_mode_%1",_time],[0,1] select (_mode == 0)];
		missionNamespace setVariable [format["Dr_DiB_startTime_%1",_time],time];
		missionNamespace setVariable [format["Dr_DiB_endTime_%1",_time],time + 0.3];
	};

	_mode = _mode == 1;

	for "_i" from 1 to 4 do {
		call compile format ["
			_light%1 setVelocityTransformation [
			([_startpos%1,_endpos%1] select _mode),
			([_endpos%1,_startpos%1] select _mode),
			[0,0,0],
			[0,0,0],
			[0,1,0],
			[0,1,0],
			[0,0,1],
			[0,0,1],
			_interval
		];
		",_i];
	};
},[_light1,_light2,_light3,_light4,_startpos1,_endpos1,_startpos2,_endpos2,_startpos3,_endpos3,_startpos4,_endpos4,_time]] call BIS_fnc_addStackedEventHandler;

[_discoBall,_lightsPics,_rotateTime] spawn {
	params ["_discoBall","_lightsPics","_rotateTime"];

	for "_i" from 0 to 1 step 0 do {
		if (isNull _discoBall) exitWith {
			[format["Dr_DiB_DrawEH_RotateDiBo_%1",_rotateTime],"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		};
		UiSleep (random 3) min 1;
		if (_discoBall getVariable ["disable",false]) exitWith {};
		for "_i" from 0 to 6 do {
			_discoBall setObjectTextureGlobal [_i,selectRandom _lightsPics];
		};
	};
};

for "_i" from 0 to 1 step 0 do {
	if (isNull _proj) exitWith {};
	UiSleep 1;
	{
		_color = selectRandom _colors;
		[_x,_color] remoteExec ['setLightColor',0];
		[_x,_color] remoteExec ['setLightAmbient',0];
	} forEach [_light1,_light2,_light3,_light4];
};

[_discoBall,"Dr_disco_SmokeMashine"] remoteExec ['say3D',0];
_particles_end = "#particlesource" createVehicle position _discoBall;
[_particles_end,[["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,13,0],"","Billboard",1,6,[0,0,0],[0,0,3],0,15,7.9,0.1,[6,10,11,15],[[1,1,1,0],[1,1,1,0.381954],[1,1,1,0.224275],[1,1,1,0]],[1,1000,1000,1000],0.1,0,"","",_discoBall,0,false,-1,[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]]] remoteExec ['setParticleParams',0];
[_particles_end,[0,[4,4,3],[15,15,0],20,0.3,[0,0,0,0],0,0,1,0]] remoteExec ['setParticleRandom',0];
[_particles_end,[0,[0,0,0]]] remoteExec ['setParticleCircle',0];
[_particles_end,[0,0,0]] remoteExec ['setParticleFire',0];
[_particles_end,0.01] remoteExec ['setDropInterval',0];

_soundTime = time;
[format["Dr_DiB_DrawEH_SoundDiBo_%1",_soundTime],"onEachFrame",{
	params ["_soundSource","_time","_startPos","_endPos"];

	_interval 	= linearConversion [_time, _time + 15, time, 0, 1,true];

	if (_interval == 1) exitWith {
		[format["Dr_DiB_DrawEH_SoundDiBo_%1",_time],"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		deleteVehicle _soundSource;
	};
	_soundSource setVelocityTransformation [
	_startPos,
	_endPos,
	[0,0,0],
	[0,0,0],
	[0,1,0],
	[0,1,0],
	[0,0,1],
	[0,0,1],
	_interval
	];
},[_soundSource,_soundTime,getPosASL _soundSource,(getPosASL _soundSource) vectorAdd [0,0,200]]] call BIS_fnc_addStackedEventHandler;

{
	_unit = _x # 0;
	_info = _x # 1;
	if !(isNull _unit) then {
		if !(_info isEqualTo [[],[],[]]) then {
			{
				if !(_x isEqualTo []) then {
					[_unit,(_x # 0)] remoteExec ["addWeapon",_unit];
					private _info = _x;
					{
						if !((_info # _forEachIndex) == "") then {
							[_unit,[(_info # 0), _info # _forEachIndex, true]] remoteExec ["addWeaponItem",_unit];
						};
					} forEach [1,2,3,6];

					if !((_x # 4) isEqualTo []) then {
						[_unit,[(_x # 0), _x # 4,true]] remoteExec ["addWeaponItem",_unit];
						[_unit,(_x # 4)] remoteExec ["addMagazine",_unit];
					};
				};
			} forEach _info;
		};

		[_unit,""] remoteExec ['switchMove',0];
		_unit setVariable ["Dr_disco_flexing",false,true];
	};
} forEach _listUnits;

for "_i" from 0 to 6 do {
	_discoBall setObjectTextureGlobal [_i,""];
};
_discoBall setVariable ["disable",true];

UiSleep 3.01;

[format["Dr_DiB_DrawEH_%1",_time], "onEachFrame"] call BIS_fnc_removeStackedEventHandler;

[format["Dr_DiB_DrawEH_RemoveLiDiBo_%1",time],"onEachFrame",{
	params ["_lights","_time"];
	_lights params ["_light1","_light2","_light3","_light4"];

	_interval 	= linearConversion [_time, _time + 20, time, 0, 1,true];

	if (_interval == 1) exitWith {
		[format["Dr_DiB_DrawEH_RemoveLiDiBo_%1",_time],"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		for "_i" from 1 to 4 do {
			call compile format["
				deleteVehicle (_light%1 # 0)
			",_i];
		};
	};
	for "_i" from 1 to 4 do {
		call compile format["
			_light = _light%1 # 0;
			_lightStart = _light%1 # 1;
			_light setVelocityTransformation [
				_lightStart,
				_lightStart vectorAdd [0,0,100],
				[0,0,0],
				[0,0,0],
				[0,1,0],
				[0,1,0],
				[0,0,1],
				[0,0,1],
				_interval
			];
		",_i];
	};
},[[[_light1,getPosASL _light1],[_light2,getPosASL _light2],[_light3,getPosASL _light3],[_light4,getPosASL _light4]],time]] call BIS_fnc_addStackedEventHandler;

deleteVehicle _discoBall;
deleteVehicle _particles;
deleteVehicle _particles_end;

[_time,_rotateTime] spawn {
	params ["_time","_rotateTime"];
	UiSleep 1;
	missionNamespace setVariable [format["Dr_DiB_startTime_%1",_time],nil];
	missionNamespace setVariable [format["Dr_DiB_endTime_%1",_time],nil];
	missionNamespace setVariable [format["Dr_DiB_mode_%1",_time],nil];
	missionNamespace setVariable [format["Dr_DiB_interval_%1",_time],nil];
	missionNamespace setVariable [format["Dr_DiB_RotateDiBo_%1",_rotateTime],nil];
	missionNamespace setVariable [format["Dr_DiB_RotateDiBo_start_%1",_rotateTime],nil];
	missionNamespace setVariable [format["Dr_DiB_RotateDiBo_end_%1",_rotateTime],nil];
};