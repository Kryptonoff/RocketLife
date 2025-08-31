
life_suppr_mainArray = [];
life_suppr_suppressed = false;
life_suppr_Threshold = 0;
life_suppr_lastShotAt = 0;// The time the player got shot at last time (Just creates the variable)
life_suppr_intensity = 1;//Overall intensity of the suppression effect
life_suppr_buildupFactor = 1;//How fast the player will get suppressed
life_suppr_flybyIntensity = 1;//Overall intensity of the flyby effect
life_suppr_recoverFactor = 1;//How slow or quick you recover from being suppressed. Lower value = longer lasting effects
life_suppr_haltRecovery = true;//When turned on, recovery of suppression effects stagnates for a while when being shot at again.

// Color Correction
life_suppr_cc = ppEffectCreate ["colorCorrections", 1501];
life_suppr_cc ppEffectAdjust [1, 1, 0, [0,0,0,0], [1,1,1,1],[1,1,1,0]];
life_suppr_cc ppEffectEnable true;
life_suppr_cc ppEffectCommit 0;

// Blur
life_suppr_blur = ppEffectCreate ["DynamicBlur", 800];
life_suppr_blur ppEffectAdjust [0];
life_suppr_blur ppEffectCommit 0.3;
life_suppr_blur ppEffectEnable true;

// RBlur
life_suppr_rBlur = ppEffectCreate ["RadialBlur", 1003];
life_suppr_rBlur ppEffectAdjust [0, 0, 0, 0];
life_suppr_rBlur ppEffectCommit 0;
life_suppr_rBlur ppEffectEnable true;


life_suppr_impactCC = ppEffectCreate ["colorCorrections", 1499];
life_suppr_impactCC ppEffectAdjust [1, 1, 0, [0,0,0,0], [1,1,1,1],[1,1,1,0]];
life_suppr_impactCC ppEffectEnable true;
life_suppr_impactCC ppEffectCommit 0;

life_suppr_impactBlur = ppEffectCreate ["RadialBlur", 1002];
life_suppr_impactBlur ppEffectAdjust [0, 0, 0, 0];
life_suppr_impactBlur ppEffectCommit 0;
life_suppr_impactBlur ppEffectEnable true;

// Check if active, exec script if so
[RRPClient_suppression_mainHandler] call CBA_fnc_addPerFrameHandler;
[RRPClient_suppression_main, 1] call CBA_fnc_addPerFrameHandler;
[RRPClient_suppression_pinnedDown, 0.5] call CBA_fnc_addPerFrameHandler;