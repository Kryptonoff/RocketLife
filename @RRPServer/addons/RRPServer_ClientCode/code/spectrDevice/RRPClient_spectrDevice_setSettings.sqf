/*
      SteamID: 76561198090549826
      Discord: arrra#9745
      cc by-nc-nd
*/

try {
    private ["_xMin","_xMax","_yMin","_yMax","_primaryWeapon","_currentMuzzle"];
    _primaryWeapon = currentWeapon player;
    _currentMuzzle = ((player weaponAccessories currentWeapon player) select 0);

    if !(_primaryWeapon isEqualTo "hgun_esd_01_F") throw "Вам нужно деражать в руках спектральное устройство!";
    if (_currentMuzzle isEqualTo "") throw "Для начала работа необхдимо ycтановить антену на спектральное устройство";
    if !(_currentMuzzle in ["muzzle_antenna_01_f","muzzle_antenna_02_f","muzzle_antenna_03_f"]) throw "Данная антена не подходит!";
    if !(isClass (missionConfigFile >> "spectrumDeviceCfg" >> "antenna" >> _currentMuzzle)) throw "";
    if (RRPClientSpectrDeviceEnable) throw "";

    _xMin = getNumber (missionConfigFile >> "spectrumDeviceCfg" >> "antenna" >> _currentMuzzle >> "xMin");
    _xMax = getNumber (missionConfigFile >> "spectrumDeviceCfg" >> "antenna" >> _currentMuzzle >> "xMax");

    _yMin = getNumber (missionConfigFile >> "spectrumDeviceCfg" >> "antenna" >> _currentMuzzle>> "yMin");
    _yMax = getNumber (missionConfigFile >> "spectrumDeviceCfg" >> "antenna" >> _currentMuzzle >> "yMax");

    missionNamespace setVariable ["#EM_SMin", _yMin];
    missionNamespace setVariable ["#EM_SMax", _yMax];

    missionNamespace setVariable ["#EM_FMin", _xMin];
    missionNamespace setVariable ["#EM_FMax", _xMax];

    missionNamespace setVariable ["#EM_SelMin", (_xMax/2)];
    missionNamespace setVariable ["#EM_SelMax", (_xMax/2 + (_xMax/50))];
    [_primaryWeapon,_currentMuzzle] spawn RRPClient_spectrDevice_action;
} catch {
  RRPClientSpectrDeviceEnable = false;
  ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
