/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
*/
life_action_inUse = _this;
RRPClientInDeathZone = _this;
_this call RRPClient_gui_util_blur;

if (isNil "colorCorrectionDZ") then {
  colorCorrectionDZ = ppEffectCreate ["colorCorrections", 2009];
};

if (_this) then {
  colorCorrectionDZ ppEffectEnable true;
  colorCorrectionDZ ppEffectAdjust [1, 1.04, -0.004, [0.5, 0.5, 0.5, 0.0], [0.5, 0.5, 0.5, 0.0],  [0.5, 0.5, 0.5, 0.0]];
  colorCorrectionDZ ppEffectCommit 0;
} else {
  colorCorrectionDZ ppEffectAdjust [1, 1, 0,[ 0, 0, 0, 0],[ 1, 1, 1, 1],[ 0, 0, 0, 0]];
  colorCorrectionDZ ppEffectCommit 5;
  colorCorrectionDZ = -1;
  ppEffectDestroy colorCorrectionDZ;
  colorCorrectionDZ = nil;
};
