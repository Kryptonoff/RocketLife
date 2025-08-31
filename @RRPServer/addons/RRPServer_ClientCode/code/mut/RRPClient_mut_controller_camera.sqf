_unit = _this select 0;
_creature = _this select 1;



showcinemaBorder false;
_camera = "camera" camcreate position player;
_camera cameraeffect ["internal", "back"];




_camera camPrepareTarget _creature;
_camera camPreparePos [getPosATL _unit select 0,(getPosATL _unit select 1) - 0.5, (getPosATL _unit select 2) + 1.7];
_camera camPrepareFOV 0.974;
_camera camCommitPrepared 0;



_camera camPrepareTarget _creature;
_camera camPreparePos [getPosATL _unit select 0, (getPosATL _unit select 1) - 0.5, (getPosATL _unit select 2) + 1.7];
_camera camPrepareFOV 0.176;
_camera camCommitPrepared 0.35;

uiSleep 1.5;

_camera camPrepareTarget _creature;
_camera camPreparePos [getPosATL _unit select 0, (getPosATL _unit select 1) - 0.5, (getPosATL _unit select 2) + 1.7];
_camera camPrepareFOV 0.176;
_camera camCommitPrepared 0;



_camera camPrepareTarget _creature;
_camera camPreparePos [getPosATL _unit select 0,(getPosATL _unit select 1) - 0.5, (getPosATL _unit select 2) + 1.7];
_camera camPrepareFOV 1.2;
_camera camCommitPrepared 0.2;

uiSleep 0.2;

titleCut ["", "WHITE IN", 2];
player cameraEffect ["terminate","back"];

PP_radial = ppEffectCreate ["radialBlur",100];
PP_radial ppEffectEnable true;
PP_radial ppEffectAdjust [0.02,0.07,0.42,0.34];
PP_radial ppEffectCommit 0;
PP_chrom = ppEffectCreate ["ChromAberration",200];
PP_chrom ppEffectEnable true;
PP_chrom ppEffectAdjust [0.05,0.05,true];
PP_chrom ppEffectCommit 0;
PP_wetD = ppEffectCreate ["WetDistortion",300];
PP_wetD ppEffectEnable true;
PP_wetD ppEffectAdjust [1,0.2,0.2,1,1,1,1,0.05,0.01,0.05,0.01,0.1,0.1,0.2,0.2];
PP_wetD ppEffectCommit 0;
PP_film = ppEffectCreate ["FilmGrain",2000];
PP_film ppEffectEnable true;
PP_film ppEffectAdjust [0.2,1,1,0.5,0.5,true];
PP_film ppEffectCommit 0;
addCamShake [4, 20, 15];
