/*
  Project: Rimas Role Play
  Author: FairyTale5571
  License: CC BY-ND
*/

params[["_player", objNull, [objNull]], ["_detector", objNull, [objNull]]];
private _detectorColorDefault = getText(missionConfigFile >> "CfgMetalDetector" >> "detector_color_default");
private _detectorColorNotDetected = getText(missionConfigFile >> "CfgMetalDetector" >> "detector_color_notdetected");
private _detectorColorDetected = getText(missionConfigFile >> "CfgMetalDetector" >> "detector_color_detected");
private _detectorSoundNotDetected = getText(missionConfigFile >> "CfgMetalDetector" >> "detector_sound_notdetected");
private _detectorSoundDetected = getText(missionConfigFile >> "CfgMetalDetector" >> "detector_sound_detected");
private _detectMagazines = getNumber(missionConfigFile >> "CfgMetalDetector" >> "detect_magazines");
if (count weapons _player > 0 OR {(_detectMagazines isEqualTo 1 AND count magazines _player > 0)}) then {
    [_detector, _detectorSoundDetected] remoteExec ["RRPClient_md_globalsound", 0];
    _detector setObjectTextureGlobal[1, format["%1%2%3", "#(argb,8,8,3)color(", _detectorColorDetected, ",1.0,co)"]];
    uiSleep 5;
    _detector setObjectTextureGlobal[1, format["%1%2%3", "#(argb,8,8,3)color(", _detectorColorDefault, ",1.0,co)"]];
} else {
    [_detector, _detectorSoundNotDetected] remoteExec["RRPClient_md_globalsound", 0];
    _detector setObjectTextureGlobal[1, format["%1%2%3", "#(argb,8,8,3)color(", _detectorColorNotDetected, ",1.0,co)"]];
    uiSleep 5;
    _detector setObjectTextureGlobal[1, format["%1%2%3", "#(argb,8,8,3)color(", _detectorColorDefault, ",1.0,co)"]];
};
