
{
	_fnc = format ["TFAR_fnc_%1", _x];
	_code = compileFinal (preprocessFileLineNumbers format["\life_TFRtell\Code\%1.sqf", _x]);
	missionNamespace setVariable [_fnc, _code, true];
} forEach [
	 "phoneCall"
	,"phoneCallTo"
	,"phoneCallEnd"
	,"phoneCallTake"
	,"sendFrequencyInfo2"
	,"getAllTheSounds"
	,"getVolumePhone"
	,"checkTFRCall"
	,"hungUp"
	,"clickCall"
];