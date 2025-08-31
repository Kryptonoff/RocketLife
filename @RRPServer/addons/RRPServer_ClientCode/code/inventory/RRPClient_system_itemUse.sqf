/*
    Author(s):
    Arrra (original)
    ----
    Сontacts:
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd
*/
private ["_idc","_index","_item","_target","_isInVehicle"];
_idc    = param [0,control,[controlNull]];
_index  = param [1,0,[0]];
_item   = _idc lbData _index;
_target = cursorObject;

try {
  if (_item isEqualTo "") throw "Предмет не опреден!";
  if (life_action_inUse or (call RRPClient_system_isInterrupted)) throw "Вы уже выполняете действие!";
  _isInVehicle = {if !(isNull objectParent player) throw "Нельзя использовать предметы в технике."};
  closeDialog 0;

  private ["_detectorArtefactList","_detectorRadimetrList","_detectorAnomalyList"];
  _detectorArtefactList = getArray(missionConfigFile >> "LifeCfgAnomaly" >> "detectorArtefactItems");
  _detectorRadimetrList = getArray(missionConfigFile >> "LifeCfgAnomaly" >> "detectorRadimetrItems");
  _detectorAnomalyList = getArray(missionConfigFile >> "LifeCfgAnomaly" >> "detectorAnomalyItems");

  if (["RRPItem_", _item] call RRPClient_util_xString) exitWith {[_item] spawn RRPClient_UseItems_sorter};
  if (_item isEqualTo getText(missionConfigFile >> "LifeCfgArcheology" >> "initItem")) Exitwith {call _isInVehicle; [] spawn RRPClient_archeology_init};
  if (_item isEqualTo "extItem_grinder") Exitwith {call _isInVehicle; [_target] spawn RRPClient_system_boltcutter};
  if (_item isEqualTo "MineDetector") Exitwith {call _isInVehicle; [_target] spawn RRPClient_system_defuseKit;};
  if (_item isEqualTo "extItem_MetalWire" && isNull life_spikestrip) Exitwith {call _isInVehicle; [] spawn RRPClient_system_spikeStrip;};
  if (_item in ["extItem_canteen_empty","extItem_bottle_empty"]) Exitwith {call _isInVehicle; [_item] spawn RRPClient_system_refuelWater;};
  if (_item in ["extItem_canteen_salt","extItem_bottle_salt"] and [getPosATL player, 10] call RRPClient_system_isFireNear) Exitwith {call _isInVehicle; [_item] spawn RRPClient_system_cooking;};
  if (_item isEqualTo "extItem_campFire") Exitwith {call _isInVehicle; [_item] spawn RRPClient_system_campFire};
  if (_item isEqualTo "extItem_Fuelcan_empty") Exitwith {call _isInVehicle; [_item] spawn RRPClient_system_refuelJerrycan};
  if (_item isEqualTo "extItem_Fuelcan") Exitwith {call _isInVehicle; [_item,_target] spawn RRPClient_system_jerryRefuel};
  if (_item in ["extItem_ItemDetoxin","extItem_vitaminbottle","extItem_bandage","extItem_antibiotic","extItem_painkillers","extItem_ItemMorphine"]) Exitwith {[_item] spawn RRPClient_system_healMe;};

  if (_item in _detectorArtefactList) Exitwith {
      [_item] call client_anomaly_detectorArtefact
  };
  if (_item in _detectorRadimetrList) Exitwith {
      [_item] call client_anomaly_detectorRadimetr
  };
  if (_item in _detectorAnomalyList) Exitwith {
      [_item] call client_anomaly_detectorAnomaly
  };

} catch {
 ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
