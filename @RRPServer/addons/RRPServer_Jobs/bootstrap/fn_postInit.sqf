/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/
/*
_stand = createVehicle ["Land_InfoStand_V2_F", [10903.3,9860.53,0.00144577], [], 0, "NONE"];

[_stand, ["Биржа труда",RRPClient_jobs_jobSelection,nil,0,true,true]] remoteExec ["addAction", 0, true];
[_stand, ["Теневая работа",RRPClient_darkjobs_jobSelection,nil,0,true,true]] remoteExec ["addAction", 0, true];
[_stand, ["Взять работу курьером",RRPClient_ds_orderTake,nil,0,true,true]] remoteExec ["addAction", 0, true];
/////////////////////////////////////////////////////////////////////////////////////////

_marker = createMarker ["dlv_marker", [10903.9,9860.16,0.00142479]];
_marker setMarkerType "hd_dot";
_marker setMarkerText "Офис дальнобой";

_marker = createMarker ["dlv_office_car", [10875.4,9864.45,0.00148201]];
_marker setMarkerType "hd_dot";
_marker setMarkerText "Спавн машины дальнобой";

[_stand, ["Получить служебный автомобиль дальнобойщика",RRPClient_jobs_spawnVehicle,"dlv",0,true,true,"","",5]] remoteExec ["addAction", 0, true];
[_stand, ["Вернуть служебный автомобиль",RRPClient_jobs_returnVehicle,"dlv",0,true,true,"","",5]] remoteExec ["addAction", 0, true];

/////////////////////////////////////////////////////////////////////////////////////////

_marker = createMarker ["bus_marker", [10903.9,9860.16,0.00142479]];
_marker setMarkerType "hd_dot";
_marker setMarkerText "Офис автобус";

_marker = createMarker ["bus_office_car", [10875.4,9864.45,0.00148201]];
_marker setMarkerType "hd_dot";
_marker setMarkerText "Спавн машины автобус";

[_stand, ["Купить униформу водителя",RRPClient_jobs_clothSpawn,"bus",0,true,true,"","",5]] remoteExec ["addAction", 0, true];
[_stand, ["Получить служебный автомобиль водителя",RRPClient_jobs_spawnVehicle,"bus",0,true,true,"","",5]] remoteExec ["addAction", 0, true];
[_stand, ["Вернуть служебный автомобиль",RRPClient_jobs_returnVehicle,"bus",0,true,true,"","",5]] remoteExec ["addAction", 0, true];

/////////////////////////////////////////////////////////////////////////////////////////

_marker = createMarker ["eln_marker", [10903.9,9860.16,0.00142479]];
_marker setMarkerType "hd_dot";
_marker setMarkerText "Офис электрик";

_marker = createMarker ["eln_office_car", [10875.4,9864.45,0.00148201]];
_marker setMarkerType "hd_dot";
_marker setMarkerText "Спавн электрик";

[_stand, ["Купить униформу электрика",RRPClient_jobs_clothSpawn,"eln",0,true,true,"","",5]] remoteExec ["addAction", 0, true];
[_stand, ["Получить служебный автомобиль электрика",RRPClient_jobs_spawnVehicle,"eln",0,true,true,"","",5]] remoteExec ["addAction", 0, true];
[_stand, ["Вернуть служебный автомобиль",RRPClient_jobs_returnVehicle,"eln",0,true,true,"","",5]] remoteExec ["addAction", 0, true];

/////////////////////////////////////////////////////////////////////////////////////////

_marker = createMarker ["dhl_marker", [10903.9,9860.16,0.00142479]];
_marker setMarkerType "hd_dot";
_marker setMarkerText "Офис дхл";

_marker = createMarker ["dhl_office_car", [10875.4,9864.45,0.00148201]];
_marker setMarkerType "hd_dot";
_marker setMarkerText "Спавн дхл";

[_stand, ["Купить униформу DHL",RRPClient_jobs_clothSpawn,"dhl",0,true,true,"","",5]] remoteExec ["addAction", 0, true];
[_stand, ["Получить служебный автомобиль DHL",RRPClient_jobs_spawnVehicle,"dhl",0,true,true,"","",5]] remoteExec ["addAction", 0, true];
[_stand, ["Вернуть служебный автомобиль",RRPClient_jobs_returnVehicle,"dhl",0,true,true,"","",5]] remoteExec ["addAction", 0, true];

/////////////////////////////////////////////////////////////////////////////////////////

_marker = createMarker ["ecolog_marker", [11198.8,10139.6,0.00183797]];
_marker setMarkerType "hd_dot";
_marker setMarkerText "Офис эколог";

_marker = createMarker ["ecolog_office_car", [11195.2,10129.6,0.00111032]];
_marker setMarkerType "hd_dot";
_marker setMarkerText "Спавн машины эколог земля";

_stand = createVehicle ["Land_InfoStand_V2_F", [11198.8,10139.6,0.00183797], [], 0, "NONE"];

[_stand, ["Купить униформу пробоотборщика грунта",RRPClient_jobs_clothSpawn,"eco_gs",0,true,true,"","life_eco_gs_readyToWork",5]] remoteExec ["addAction", 0, true];
[_stand, ["Получить служебный автомобиль пробоотборщика грунта",RRPClient_jobs_spawnVehicle,"eco_gs",0,true,true,"","life_eco_gs_readyToWork",5]] remoteExec ["addAction", 0, true];
[_stand, ["Вернуть служебный автомобиль",RRPClient_jobs_returnVehicle,"eco_gs",0,true,true,"","life_eco_gs_readyToWork",5]] remoteExec ["addAction", 0, true];

_marker = createMarker ["ecolog_office_boat", [11249.6,10191.5, 0]];
_marker setMarkerType "hd_dot";
_marker setMarkerText "Спавн лодки эколог вода";

[_stand, ["Купить униформу пробоотборщика воды",RRPClient_jobs_clothSpawn,"eco_ws",0,true,true,"","life_eco_ws_readyToWork",5]] remoteExec ["addAction", 0, true];
[_stand, ["Получить служебную лодку пробоотборщика воды",RRPClient_jobs_spawnVehicle,"eco_ws",0,true,true,"","life_eco_ws_readyToWork",5]] remoteExec ["addAction", 0, true];
[_stand, ["Вернуть служебную лодку",RRPClient_jobs_returnVehicle,"eco_ws",0,true,true,"","life_eco_ws_readyToWork",5]] remoteExec ["addAction", 0, true];

/////////////////////////////////////////////////////////////////////////////////////////

_marker = createMarker ["depo_kavala", [9617.29,8881.25,0.00155354]];
_marker setMarkerType "hd_dot";
_marker setMarkerText "Депо Кавала";

depo_kavala = createVehicle ["Land_InfoStand_V2_F", getMarkerPos _marker, [], 0, "NONE"];
depo_kavala setVehicleVarName "depo_kavala";
publicVariable "depo_kavala";

[depo_kavala, ["Взять заказ на доставку груза",RRPClient_dlv_getMissionMenu,nil,0,true,true,"LeanRight","isNull objectParent player"]] remoteExec ["addAction", 0, true];
[depo_kavala, ["Сдать заказ на доставку груза",RRPClient_dlv_finishMission,nil,0,true,true,"LeanRight","isNull objectParent player && !life_action_inUse"]] remoteExec ["addAction", 0, true];

/////////////////////////////////////////////////////////////////////////////////////////

_marker = createMarker ["depo_alps", [9995.28,9219.08,0.001297]];
_marker setMarkerType "hd_dot";
_marker setMarkerText "Депо Альпы";

depo_alps = createVehicle ["Land_InfoStand_V2_F", getMarkerPos _marker, [], 0, "NONE"];
depo_alps setVehicleVarName "depo_alps";
publicVariable "depo_alps";

[depo_alps, ["Взять заказ на доставку груза",RRPClient_dlv_getMissionMenu,nil,0,true,true,"LeanRight","isNull objectParent player"]] remoteExec ["addAction", 0, true];
[depo_alps, ["Сдать заказ на доставку груза",RRPClient_dlv_finishMission,nil,0,true,true,"LeanRight","isNull objectParent player && !life_action_inUse"]] remoteExec ["addAction", 0, true];

/////////////////////////////////////////////////////////////////////////////////////////

_marker = createMarker ["depo_north", [10315.6,9606.57,0.00238037]];
_marker setMarkerType "hd_dot";
_marker setMarkerText "Депо Север";

depo_north = createVehicle ["Land_InfoStand_V2_F", getMarkerPos _marker, [], 0, "NONE"];
depo_north setVehicleVarName "depo_north";
publicVariable "depo_north";

[depo_north, ["Взять заказ на доставку груза",RRPClient_dlv_getMissionMenu,nil,0,true,true,"LeanRight","isNull objectParent player"]] remoteExec ["addAction", 0, true];
[depo_north, ["Сдать заказ на доставку груза",RRPClient_dlv_finishMission,nil,0,true,true,"LeanRight","isNull objectParent player && !life_action_inUse"]] remoteExec ["addAction", 0, true];

/////////////////////////////////////////////////////////////////////////////////////////

_marker = createMarker ["depo_east", [10081.9,9745.28,0.00163555]];
_marker setMarkerType "hd_dot";
_marker setMarkerText "Депо Восток";

depo_east = createVehicle ["Land_InfoStand_V2_F", getMarkerPos _marker, [], 0, "NONE"];
depo_east setVehicleVarName "depo_east";
publicVariable "depo_east";

[depo_east, ["Взять заказ на доставку груза",RRPClient_dlv_getMissionMenu,nil,0,true,true,"LeanRight","isNull objectParent player"]] remoteExec ["addAction", 0, true];
[depo_east, ["Сдать заказ на доставку груза",RRPClient_dlv_finishMission,nil,0,true,true,"LeanRight","isNull objectParent player && !life_action_inUse"]] remoteExec ["addAction", 0, true];
*/
true