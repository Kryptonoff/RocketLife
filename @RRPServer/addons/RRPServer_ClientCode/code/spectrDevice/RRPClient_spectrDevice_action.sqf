/*
    Сontacts:
      SteamID: 76561198090549826
      Discord: arrra#9745
      cc by-nc-nd
*/
params ["_primaryWeapon","_currentMuzzle","_viewingAngle"];
private ["_yMin","_yMax","_xMin","_xMax","_maxRangeDevice","_isMountain"];

_yMin = missionNamespace getVariable ["#EM_SMin", -1];
_yMax = missionNamespace getVariable ["#EM_SMax", -1];

_xMin = missionNamespace getVariable ["#EM_FMin", -1];
_xMax = missionNamespace getVariable ["#EM_FMax", -1];

private _searchObject = [];
{_searchObject pushBack (configName _x)} forEach ("true" configClasses (missionConfigFile >> "spectrumDeviceCfg" >> "frequencyEmitterObjects"));
_maxRangeDevice = getNumber (missionConfigFile >> "spectrumDeviceCfg" >> "antenna" >> _currentMuzzle >> "maxRange");
_viewingAngle = getNumber (missionConfigFile >> "spectrumDeviceCfg" >> "viewingangle");

while {RRPClientSpectrDeviceEnable AND {(currentWeapon player) isEqualTo "hgun_esd_01_F"}} do {
  private ["_frequencyArray","_nearObject","_terrainCoef","_positionPeack"];
     _frequencyArray = [];
     _nearObject = nearestObjects [getPosASL player, _searchObject, _maxRangeDevice];
    {
      private _FrequencyObject_X = 0;
      private _actualFrequency_Y = 0;
      private ["_classObject","_FrequencyObject_X","_positionObject","_positionPlayer"];
      _classObject = typeOf _x;
      _FrequencyObject_X = getNumber(missionConfigFile >> "spectrumDeviceCfg" >> "frequencyEmitterObjects" >> _classObject >> "frequency");
      _positionObject = getPosASL _x;
      _positionPlayer = getPosASL player;

      if ((_FrequencyObject_X < _xMax) OR {(_FrequencyObject_X > _xMin)}) then {
        private ["_dirObject","_dirPlayer","_verticalSpectrCoef"];
        _dirObject = player getDir _x;
        _dirPlayer = getDir player;

        _isMountain = [_positionObject,_positionPlayer] call RRPClient_spectrDevice_calcTerrainFade;
        _terrainCoef = _isMountain # 0;
        _positionPeack = _isMountain # 1;
        if (_terrainCoef < 1) then {_positionObject set [2,(_positionPeack + (_positionObject # 2))]};

          _verticalSpectrCoef = ([_positionObject] call RRPClient_spectrDevice_checkVerticalAngle);
          if (([_positionPlayer,_dirPlayer,_viewingAngle,_positionObject] call BIS_fnc_inAngleSector) AND (_verticalSpectrCoef > 0)) then {
            _actualFrequency_Y = floor(_yMax/(_viewingAngle/2));
            private _difDir =  abs(_dirObject - _dirPlayer);
            _actualFrequency_Y = (_yMax - (_actualFrequency_Y * _difDir));
            _actualFrequency_Y = _actualFrequency_Y * _verticalSpectrCoef;
          };
        _frequencyArray pushBack _FrequencyObject_X;
        _frequencyArray pushBack _actualFrequency_Y;
      };
    } forEach _nearObject;

  missionNamespace setVariable ["#EM_Values",_frequencyArray];
  uiSleep 0.2;
};
RRPClientSpectrDeviceEnable = false;
