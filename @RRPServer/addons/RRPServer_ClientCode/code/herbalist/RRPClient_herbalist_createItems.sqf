/*
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/
private ['_CurCFG','_CurCFG','_CurCFG','_Image','_profName','_Obj','_FinalItem','_typeItem','_Zones','_defaultAmount','_defaultTime','_markerZoneLocal'];

_CurCFG  = curHerbs;
_Zones   = zones;
curHerbs = nil;
zones    = nil;
closeDialog 0;
_Image     = getText (missionConfigFile >> 'LifeCfgHerbs' >> 'resourseCfg' >> _CurCFG >> 'Image');
_profName  = getText (missionConfigFile >> 'LifeCfgHerbs' >> 'resourseCfg' >> _CurCFG >> 'profName');
_Obj       = getText (missionConfigFile >> 'LifeCfgHerbs' >> 'resourseCfg' >> _CurCFG >> 'object');
_FinalItem = getText (missionConfigFile >> 'LifeCfgHerbs' >> 'resourseCfg' >> _CurCFG >> 'FinalItem');
_typeItem  = getText (missionConfigFile >> 'LifeCfgHerbs' >> 'resourseCfg' >> _CurCFG >> 'TypeItem');
_defaultAmount = getNumber (missionConfigFile >> 'LifeCfgHerbs' >> 'resourseCfg' >> _CurCFG >>'amount');
_defaultTime   = getNumber (missionConfigFile >> 'LifeCfgHerbs' >> 'resourseCfg' >> _CurCFG >>'time');
systemChat str _Zones;
_markerZoneLocal = createMarkerLocal ['CollectGerbs',(markerPos (_Zones select 0))];
_markerZoneLocal setMarkerColorLocal 'ColorGreen';
_markerZoneLocal setMarkerTypeLocal 'Empty';
_markerZoneLocal setMarkerShapeLocal 'ELLIPSE';
_markerZoneLocal setMarkerBrushLocal 'Border';
_markerZoneLocal setMarkerSizeLocal [_Zones select 1, _Zones select 1];
InfoList   = [_Image,_profName,_FinalItem,_typeItem,_Zones,_Obj,_defaultAmount,_defaultTime,_markerZoneLocal];

[25,_Obj] call RRPClient_herbalist_create;
[] call RRPClient_herbalist_check;
