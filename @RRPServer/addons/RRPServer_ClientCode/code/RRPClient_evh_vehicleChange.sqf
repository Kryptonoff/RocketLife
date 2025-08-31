/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

#include "..\script_macros.hpp"
params ["_playerUnit","_newVehicle"];

if (((typeOf _newVehicle) isEqualto "RRPStaticWeapon_M2miniImperium") and !license_imperium) exitWith {
	unassignVehicle _playerUnit;
	_playerUnit action ["getout",_newVehicle];
	["WarningTitleAndText", ["Внимание!", "У вас нет навыков в использовании этого аппарата"]] call SmartClient_gui_toaster_addTemplateToast;
};

if (player inArea "other_party_meat") then {
	unassignVehicle _playerUnit;
	_playerUnit action ["getout",_newVehicle];
	deleteVehicle _newVehicle;
};

/*
if ((player getVariable ["isBeginner",false]) and (((player getVariable ["rrpvar_questsList",[0,0,0,0,0,0,0,0]]) select 5) isEqualto 0)) exitWith {
	unassignVehicle _playerUnit;
	_playerUnit action ["getout",_newVehicle];
	["WarningTitleAndText", ["Внимание!", "Пользоватся транспортом вы научитесь чуть позже..."]] call SmartClient_gui_toaster_addTemplateToast;
};
*/

if (EQUAL(_newVehicle,_playerUnit)) then {
	life_lastVehicle removeAction AID_VEHOUT;
	life_lastVehicle removeAction AID_VEHNITRO;
	life_lastVehicle removeAction AID_VEHPARA;
	life_lastVehicle removeAction AID_WANTED;

	life_lastVehicle removeAction AID_SEATAT;
	life_lastVehicle removeAction AID_UNSEAT;

	life_lastVehicle removeAction AID_CC_ON;
	life_lastVehicle removeAction AID_CC_OFF;

	if (EQUAL(life_dhl_vehicle,life_lastVehicle)) then {
		life_lastVehicle removeAction AID_VEHDHM;
	};
	if (EQUAL(life_eln_vehicle,life_lastVehicle)) then {
		life_lastVehicle removeAction AID_VEHELN;
	};
	if (EQUAL(life_eco_gs_vehicle,life_lastVehicle)) then {
		life_lastVehicle removeAction AID_VEHECO_GS;
	};
	if (EQUAL(life_eco_ws_vehicle,life_lastVehicle)) then {
		life_lastVehicle removeAction AID_VEHECO_WS;
	};
	if (EQUAL(life_bus_vehicle,life_lastVehicle)) then {
		life_lastVehicle removeAction AID_VEHBUS;
	};


	life_lastVehicle setVariable ["NotActiveVeh",time,true];
	life_seatBelt = false;

	if !(RRPClient_vehicle_AllDistance isEqualTo 0) then
	{RRPClient_temp_curVeh setVariable ["allDistance",RRPClient_vehicle_AllDistance,true];};
	removeMissionEventHandler ["Draw3D",RRPClientDRAW3DVehStat];
	RRPClient_temp_curVeh = objNull;
	RRPClient_temp_consumpt = nil;
	[player,WARNING_HOLDACTION] call BIS_fnc_holdActionRemove;

	if !((typeOf life_lastVehicle) call RRPClient_ptn_vehicleDnkCheck) then
	{
		"Вы не можете завести этот автомобиль" call chat;
		life_lastVehicle engineOn false;
	};

} else {
	life_seatBelt = false;
	life_lastVehicle = _newVehicle;
	call RRPClient_vehicle_distance;

	life_lastVehicle setVariable ["NotActiveVeh",nil,true];

	if (life_is_arrested) exitWith
	{
		unassignVehicle _playerUnit;
		player action ["getout",_newVehicle];
	};

	if (box_work_port_active) then
	{
		box_work_port_active = false;
		life_action_inUse = false;
		call RRPClient_system_stopEscortingAction;
		deleteVehicle port_box;
		[boxQuest] call BIS_fnc_deleteTask;
	};

	if ((typeOf _newVehicle) in (getArray(missionConfigFile >> "LifeCfgSettings" >> "battleVehicle")) && !(_newVehicle GVAR ["FiredEVH",false])) then {
		_newVehicle addEventHandler ["Fired",{_this call RRPClient_system_onVehicleFire}];
		_newVehicle SVAR ["FiredEVH",true];
	};

	AID_SEATAT = _newVehicle addAction ["<t color='#BBBB00'>Пристегнуть ремень</t>", {life_seatbelt=true;},"",3,false,true,"",'(_target getVariable ["adacSeatBelt",false]) && {_target isKindOf "LandVehicle"} && {!life_seatbelt}'];
    AID_UNSEAT = _newVehicle addAction ["<t color='#BBBB00'>Отстегнуть ремень</t>", {life_seatbelt=false;},"",3, false,true,"",'(_target getVariable ["adacSeatBelt",false]) && {_target isKindOf "LandVehicle"} && {life_seatbelt}'];

	AID_WANTED = _newVehicle addAction["<t color='#ff0786e0'>База данных полицейского департамента</t>",RRPClient_police_onOpenMenu,"",0,false,false,"",'getNumber(missionConfigFile >> "LifeCfgVehicles" >> typeOf vehicle player >> "isCop") isEqualTo 1'];

	AID_VEHOUT = _newVehicle addAction ["<img image='\rimas_pack\icons\ui\s_icon_noweapon.paa' /> Выйти с оружием за спиной",RRPClient_system_getOutW,"",0,false,false,"",'(objectParent _this) isEqualTo _target && {(locked _target) != 2} && {!(_this getVariable ["restrained",false])}'];

	AID_VEHNITRO = _newVehicle addAction ["<t color=""#ffba00"">Включить закись азота!</t>",RRPClient_system_nitroUse,"",0,false,false,"",'(objectParent _this) isEqualTo _target && {driver _target isEqualTo _this} && {_target isKindOf "LandVehicle"} && {speed _target > 3} && {_target getVariable ["adacNitroUsed",false]}'];

	AID_CC_ON = _newVehicle addAction ["<t color='#ffba00'>Включить круиз контроль!</t>", RRPClient_vehicle_cruizeControl,"",3, false,true,"",'(_target getVariable ["adacCruize",false]) && (_target getVariable ["cruize",0] == 0) && {_target isKindOf "LandVehicle"}'];
	AID_CC_OFF = _newVehicle addAction ["<t color='#ffba00'>Вылючить круиз контроль!</t>", RRPClient_vehicle_cruizeControl,"",3, false,true,"",'(_target getVariable ["adacCruize",false]) && (_target getVariable ["cruize",0] == 1) && {_target isKindOf "LandVehicle"}'];

	AID_VEHPARA = _newVehicle addAction ["<img image='\rimas_pack\icons\para.paa' /> <t color=""#ff00f6"">Десантирование</t>",RRPClient_system_paraGetOut,"",30,false,false,"",'_target isKindOf "Air" && {((visiblePosition _target) select 2) >= 170} && {!(_this getVariable ["restrained",false])} && {(locked _target) != 2}'];

	if (EQUAL(life_dhl_car,_newVehicle)) then {
		AID_VEHDHM = _newVehicle addAction ["<img image='\rimas_dhl\data\dhl_logo.paa' /> " + "DHL доставка",RRPClient_dhl_menuOpen,nil,0,true,true,"",' !life_dhl_orderInProgress && {(objectParent _this) isEqualTo _target} '];
	};
	WARNING_HOLDACTION = [ player,
		"Выдвинуть требование!",
		"\RRP_icons\holdAction\ha_warning.paa",
		"\RRP_icons\holdAction\ha_warning.paa",
		"(cursorObject isKindOf 'LandVehicle' OR {!(isNil 'warningMsgAction')}) and {(crew cursorObject isNotEqualTo [])}",
		"(cursorObject isKindOf 'LandVehicle' OR {!(isNil 'warningMsgAction')}) and {(crew cursorObject isNotEqualTo [])}",
		{
			warningMsgAction = true;
			cursorVehicleWarningMsg = cursorObject
		},
		{},
		{
			cursorVehicleWarningMsg call RRPClient_warning_requestOut;
			warningMsgAction = nil;
			cursorVehicleWarningMsg = nil
		},
		{
			warningMsgAction = nil;
			cursorVehicleWarningMsg = nil
		},
		[],
		0.5,
		0,
		false,
		false
	] call RRPClient_holdAction_Add;

	if (EQUAL(life_dhl_vehicle,_newVehicle)) then {
		AID_VEHDHM = _newVehicle addAction ["<img image='\rimas_dhl\data\dhl_logo.paa' /> DHL доставка",RRPClient_dhl_menuOpen,nil,0,true,true,"",' !life_job_inProgress && {(objectParent _this) isEqualTo _target} '];
	};
	if (EQUAL(life_eln_vehicle,_newVehicle)) then {
		AID_VEHELN = _newVehicle addAction ["Взять работу электрика",RRPClient_eln_orderTake,nil,0,true,true,"",' !life_job_inProgress && {(objectParent _this) isEqualTo _target} '];
	};
	if (EQUAL(life_eco_gs_vehicle,_newVehicle)) then {
		AID_VEHECO_GS = _newVehicle addAction ["Взять работу пробоотборщика грунта",RRPClient_eco_gs_orderTake,nil,0,true,true,"",' !life_job_inProgress && {(objectParent _this) isEqualTo _target} '];
	};
	if (EQUAL(life_eco_ws_vehicle,_newVehicle)) then {
		AID_VEHECO_WS = _newVehicle addAction ["Взять работу пробоотборщика воды",RRPClient_eco_ws_orderTake,nil,0,true,true,"",' !life_job_inProgress && {(objectParent _this) isEqualTo _target} '];
	};
	if (EQUAL(life_bus_vehicle,_newVehicle)) then {
		AID_VEHBUS = _newVehicle addAction ["Взять работу водителя",RRPClient_bus_orderTake,nil,0,true,true,"",' !life_job_inProgress && {(objectParent _this) isEqualTo _target} '];
	};
};

call RRPClient_system_updateViewDistance;
