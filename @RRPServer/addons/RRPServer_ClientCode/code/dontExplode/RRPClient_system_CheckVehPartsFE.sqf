/*
	Project: Rimas Role Play
	Author: ???
	License: CC BY-ND
*/

params ["_veh", ["_retInfo", false]];
private ["_return","_isHull","_isEng","_cWheels","_cBrokeWheels","_cCrashWheels","_resultDam","_dams"];
_return = false;
_isHull = false;
_isEng = false;
_cWheels = 0;
_cBrokeWheels = 0;
_cCrashWheels = 0;
_resultDam = 0.2;
_dams = ((getAllHitPointsDamage _veh) select 0);
{
	private _hit = _veh getHitPointDamage _x;
	if (_x == "hithull") then {
		if (_hit > .78) then {
			_isHull = true;
		};
	} else {
		if (toLower(_x) find "engine" > -1) then {
			if (_hit > .99) then {
				_isEng = true;
			};
		} else {
			if (toLower(_x) find "wheel" > -1) then {
				if (_hit > .95) then {
					_cCrashWheels = _cCrashWheels + 1;
				} else {
					if (_hit > .68) then {
						_cBrokeWheels = _cBrokeWheels + 1;
					};
				};
				_cWheels = _cWheels + 1;
			};
		};
	};

	_resultDam = _resultDam + _hit;
} forEach _dams;

_resultDam = _resultDam / (count _dams);
_return = _isHull || (_resultDam > .7) || (_isEng && (_cCrashWheels >= ((_cWheels * .75) min 4)) && ((_cCrashWheels + _cBrokeWheels) isEqualTo _cWheels));

_return
