/*
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/
private ['_zone','_resourceZones','_CurCFG','_resourceZones'];
try {
  if !(isNil 'InfoList') throw 'Миссия уже запущена!';
  _zone = '';
  {

    _CurCFG = configName _x;
    _resourceZones = getArray(missionConfigFile >> 'LifeCfgHerbs' >> 'resourseCfg' >> _CurCFG >>'zones');
    {
      if ((player distance (getMarkerPos (_x # 0))) < (_x # 1)) exitWith {_zone = (_x # 0); zones = _x};
    } forEach _resourceZones;
    if (_zone != '') exitWith {};
  } forEach ('true' configClasses (missionConfigFile >> 'LifeCfgHerbs' >> 'resourseCfg'));

  if (_zone isEqualTo "") exitWith {};
  if !([getText(missionConfigFile >> 'LifeCfgHerbs' >> 'resourseCfg' >> _CurCFG >> 'condition')] call RRPClient_util_conditionsCheck) throw (getText(missionConfigFile >> 'LifeCfgHerbs' >> 'resourseCfg' >> _CurCFG >> 'errorMessage'));
  [] spawn RRPClient_herbalist_createItems;
  curHerbs = _CurCFG;
} catch {
  closeDialog 0;
  ['WarningTitleAndText', ['Внимание!', _exception]] call SmartClient_gui_toaster_addTemplateToast;
}
