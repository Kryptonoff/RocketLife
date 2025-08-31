/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/
#define true 1
#define false 0
class winkey_interaction {
	class fed {
		class lockBox
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Закрыть хранилище";
			action = "closeDialog 0; [curTarget] call RRPClient_fed_lockBox;";
			condition = "(curTarget getVariable ['Unlocked', false]) AND ((missionNamespace getVariable ['RRPPublicRaidStatus', 'process']) isEqualTo 'done') AND ((player call getside) isEqualTo 'cop')";
		};
		class returnGold
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Вернуть золото в хранилище";
			action = "closeDialog 0; [] call RRPClient_fed_returnAward;";
			condition = "(curTarget getVariable ['Unlocked', false]) AND ((missionNamespace getVariable ['RRPPublicRaidStatus', 'process']) isEqualTo 'done') AND ((player call getside) isEqualTo 'cop')";
		};
	};
	class farming {
		class lookup
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Осмотреть растение";
			action = "closeDialog 0; [curTarget] call RRPClient_farming_lookupPlantae;";
			condition = "true";
		};
		class destroy
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Уничтожить растение";
			action = "closeDialog 0; [curTarget] spawn RRPClient_farming_destroyPlantae;";
			condition = "true";
		};
		class harvest
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Собрать урожай";
			action = "closeDialog 0; [curTarget] spawn RRPClient_farming_harvestPlantae;";
			condition = "true";
		};
		class water
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Полить растение";
			action = "closeDialog 0; [curTarget] spawn RRPClient_farming_wateringPlantae;";
			condition = "((curTarget getVariable ['growState', []]) select 4) isNotEqualTo 1";
		};
		class fertilize
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Удобрить растение";
			action = "closeDialog 0; [curTarget] spawn RRPClient_farming_fertilizePlantae;";
			condition = "((curTarget getVariable ['growState', []]) select 5) isEqualTo 0";
		};
	};
	class slots {
		class menu
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Играть";
			action = "closeDialog 0; [curTarget] call RRPClient_slots_run;";
			condition = "true";
		};
		class insertCard
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Изменить ставку";
			action = "closeDialog 0; call RRPClient_slots_changeBetMenu;";
			condition = "true";
		};
	};
	class atm {
		class menu
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Банкомат";
			action = "closeDialog 0; ['openMenu'] call RRPClient_atm_actions;";
			condition = "true";
		};
		class insertCard
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Вставить фальш-карточку";
			action = "closeDialog 0; curTarget spawn RRPClient_atmrob_insertCard;";
			condition = "(player call getSide) in ['civ','reb'] AND !(local curTarget) AND (curTarget getVariable ['ATMRob', 'Work']) isEqualto 'Work'";
		};
		class rob
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Обналичить карточку";
			action = "closeDialog 0; curTarget spawn RRPClient_atmrob_cashOut;";
			condition = "(player call getSide) in ['civ','reb'] AND (curTarget getVariable ['ATMRob', 'Work']) isEqualto 'CardInserted'";
		};
		class repair
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Починить банкомат";
			action = "closeDialog 0; curTarget spawn RRPClient_atmrob_repair;";
			condition = "(player call getSide) in ['cop','med'] AND (curTarget getVariable ['ATMRob', 'Work']) isNotEqualTo 'Work'";
		};
	};
	class ltds_stores
	{
		class rent
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Арендовать";
			action = "closeDialog 0;[] call RRPClient_ltds_store_rent";
			condition = "true";
		};
		class openStore
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Открыть магазин";
			action = "closeDialog 0;";
			condition = "true";
		};
		class moderator
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Модератор";
			action = "closeDialog 0;";
			condition = "true";
		};
		class realize
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Продать товар";
			action = "closeDialog 0;";
			condition = "true";
		};
	};
	class processing_obj {
		class processingAction
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Переработка";
			action = "closeDialog 0; curTarget call RRPClient_processing_defineAndOpen;";
			condition = "true";
		};
		class license_shop
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Магазин лицензий";
			action = "closeDialog 0; [nil, nil, nil, 'business'] call Client_documents_shopMenu;";
			condition = "true";
		};
	};

	class refinery {
		class oil_valve
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Взять ресурс";
			action = "closeDialog 0; [curTarget] call RRPClient_refinery_getOil";
			condition = "('oil_valve' in vehicleVarName curTarget) AND (player distance curTarget < 4)";
		};
		//3
		class refine_machine {
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Кран #2";
			action = "closeDialog 0;  [curTarget, (vehicleVarName curTarget) select [5]] spawn RRPClient_refinery_objectAction;";
			condition = "('refine_machine' in vehicleVarName curTarget) AND (player distance curTarget < 4)";
		};
		//2
		class storage_valve
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Кран #1";
			action = "closeDialog 0; [curTarget, (vehicleVarName curTarget) select [5]] spawn RRPClient_refinery_objectAction;";
			condition = "('storage_valve' in vehicleVarName curTarget) AND (player distance curTarget < 4)";
		};
		//1
		class refine_valve {
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Кран #3";
			action = "closeDialog 0; [curTarget, (vehicleVarName curTarget) select [5]] spawn RRPClient_refinery_objectAction;";
			condition = "('refine_valve' in vehicleVarName curTarget) AND (player distance curTarget < 4)";
		}
		//notebook
		class control {
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Управление конвейером";
			action = "closeDialog 0; [curTarget, (vehicleVarName curTarget) select [5]] spawn RRPClient_refinery_objectAction;";
			condition = "('_control' in vehicleVarName curTarget) AND (player distance curTarget < 4)";
		};
	};

	class gate_lattice {
		class gate_open_lattice
		{
			icon = "\RRP_icons\interaction\open.paa";
			title = "Открыть";
			action = "closeDialog 0; curTarget animate ['GateDoor_3', -1.6]";
			condition = "(typeOf curTarget == 'Land_GateB') AND (curTarget animationPhase 'GateDoor_3' == 0) AND (call RRPClient_gates_conditionCheck)";
		};
		class gate_close_lattice
		{
			icon = "\RRP_icons\interaction\lock.paa";
			title = "Закрыть";
			action = "closeDialog 0; curTarget animate ['GateDoor_3', 0]";
			condition = "(typeOf curTarget == 'Land_GateB') AND (curTarget animationPhase 'GateDoor_3' < 0) AND (call RRPClient_gates_conditionCheck)";
		};
	};

	class gate_anvil {
		class gate_open_anvil
		{
			icon = "\RRP_icons\interaction\open.paa";
			title = "Открыть";
			action = "closeDialog 0; curTarget animate ['GateDoor_3', -1.6]";
			condition = "(typeOf curTarget == 'Land_GateB_DW') AND (curTarget animationPhase 'GateDoor_3' == 0) AND (call RRPClient_gates_conditionCheck)";
		};
		class gate_close_anvil
		{
			icon = "\RRP_icons\interaction\lock.paa";
			title = "Закрыть";
			action = "closeDialog 0; curTarget animate ['GateDoor_3', 0]";
			condition = "(typeOf curTarget == 'Land_GateB_DW') AND (curTarget animationPhase 'GateDoor_3' < 0) AND (call RRPClient_gates_conditionCheck)";
		};
	};

	class gate_sand
	{
		class gate_open
		{
			icon = "\RRP_icons\interaction\open.paa";
			title = "Открыть";
			action = "closeDialog 0; curTarget animate ['Rails_1',1]; curTarget animate ['Rails_2',1]; curTarget animate ['Rails_3',1]; curTarget animate ['Rails_4',1];";
			condition = "(curTarget animationPhase 'Rails_1' == 0) AND (call RRPClient_gates_conditionCheck)";
		};
		class gate_close
		{
			icon = "\RRP_icons\interaction\lock.paa";
			title = "Закрыть";
			action = "closeDialog 0; curTarget animate ['Rails_1',0]; curTarget animate ['Rails_2',0]; curTarget animate ['Rails_3',0]; curTarget animate ['Rails_4',0];";
			condition = "(curTarget animationPhase 'Rails_1' > 0) AND (call RRPClient_gates_conditionCheck)";
		};
		class bell
		{
			icon = "\RRP_icons\interaction\bell.paa";
			title = "Звоночек";
			action = "['welmen_zvonoc_3',(getArray(missionConfigFile >> 'cfg_gates' >> (vehicleVarName curTarget) >> 'objectSound')),30] call RRPClient_gates_bell;";
			condition = "";
		};
	};

	class gate
	{
		class gate_open
		{
			icon = "\RRP_icons\interaction\open.paa";
			title = "Открыть";
			action = "closeDialog 0; curTarget animate [""Gate"", 1];curTarget animate [""window"", 0];curTarget animate [""door"", 0]";
			condition = "!(curTarget getVariable ['isBreaking',false])  AND (curTarget animationPhase ""Gate"" < 0.5) AND (call RRPClient_gates_conditionCheck)";
		};
		class gate_close
		{
			icon = "\RRP_icons\interaction\lock.paa";
			title = "Закрыть";
			action = "closeDialog 0; curTarget animate [""Gate"", 0]";
			condition = "!(curTarget getVariable ['isBreaking',false])  AND (curTarget animationPhase ""Gate"" > 0.5) AND (call RRPClient_gates_conditionCheck)";
		};
		class glass_open
		{
			icon = "\RRP_icons\interaction\window.paa";
			title = "Открыть окно";
			action = "closeDialog 0; curTarget animate [""window"", 1]";
			condition = "!(curTarget getVariable ['isBreaking',false])  AND (curTarget animationPhase ""Gate"" < 0.5) AND (curTarget animationPhase ""window"" < 0.5) AND (call RRPClient_gates_conditionCheck)";
		};
		class glass_close
		{
			icon = "\RRP_icons\interaction\window.paa";
			title = "Закрыть окно";
			action = "closeDialog 0; curTarget animate [""window"", 0]";
			condition = "!(curTarget getVariable ['isBreaking',false])  AND (curTarget animationPhase ""Gate"" < 0.5) AND (curTarget animationPhase ""window"" > 0.5) AND (call RRPClient_gates_conditionCheck)";
		};
		class door_open
		{
			icon = "";
			title = "Открыть дверь";
			action = "closeDialog 0; curTarget animate [""door"", 1]";
			condition = "!(curTarget getVariable ['isBreaking',false])  AND (curTarget animationPhase ""Gate"" < 0.5) AND (curTarget animationPhase ""door"" < 0.5) AND (call RRPClient_gates_conditionCheck)";
		};
		class door_close
		{
			icon = "";
			title = "Закрыть дверь";
			action = "closeDialog 0; curTarget animate [""door"", 0]";
			condition = "!(curTarget getVariable ['isBreaking',false])  AND (curTarget animationPhase ""Gate"" < 0.5) AND (curTarget animationPhase ""door"" > 0.5) AND (call RRPClient_gates_conditionCheck)";
		};
		class otboinick_on
		{
			icon = "\RRP_icons\interaction\barrier.paa";
			title = "Опустить отбойники";
			action = "closeDialog 0; curTarget animate [""barier"", 1]";
			condition = "!(curTarget getVariable ['isBreaking',false]) AND (curTarget animationPhase ""barier"" < 0.5) AND (call RRPClient_gates_conditionCheck)";
		};
		class otboinick_off
		{
			icon = "\RRP_icons\interaction\barrier.paa";
			title = "Поднять отбойники";
			action = "closeDialog 0; curTarget animate [""barier"", 0]";
			condition = "!(curTarget getVariable ['isBreaking',false]) AND (curTarget animationPhase ""barier"" > 0.5) AND (call RRPClient_gates_conditionCheck)";
		};
		class bell
		{
			icon = "\RRP_icons\interaction\bell.paa";
			title = "Звоночек";
			action = "['welmen_zvonoc_3',(getArray(missionConfigFile >> 'cfg_gates' >> (vehicleVarName curTarget) >> 'objectSound')),30] call RRPClient_gates_bell;";
			condition = "";
		};
	};
	class fuelstations
	{
		class sellfuel
		{
			icon = "\RRP_icons\interaction\break.paa";
			title = "Поставить топливо";
			action = "closeDialog 0;";
			condition = "true";
		};
		class fuel
		{
			icon = "\RRP_icons\interaction\break.paa";
			title = "Заправиться";
			action = "closeDialog 0;";
			condition = "true";
		};
		class rentIt
		{
			icon = "\RRP_icons\interaction\break.paa";
			title = "Арендовать колонку";
			action = "closeDialog 0;";
			condition = "true";
		};
		class fillCanister
		{
			icon = "\RRP_icons\interaction\break.paa";
			title = "Заправить канистру";
			action = "closeDialog 0;";
			condition = "true";
		};
	};
	class generator
	{
		class repair
		{
			icon = "\RRP_icons\interaction\break.paa";
			title = "Отключить питание";
			action = "closeDialog 0; [] spawn RRPClient_gates_breakGates;";
			condition = "true";
		};
		class breaking
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Починить";
			action = "closeDialog 0; [] spawn RRPClient_gates_repair;";
			condition = "true";
		};
	};

	class gangTrunk
	{
		condition = "((player distance curTarget) < 5) and ((typeOf curTarget) isEqualTo 'Metal_Locker_F')";
		class items
		{
			icon = "\RRP_icons\interaction\searchAction.paa";
			title = "Снаряжение";
			action = "closeDialog 0; [curTarget] spawn RRPClient_inventory_open";
			condition = "!(curTarget getVariable ['locked',false]) and !(isNull curTarget)";
		};
		class open
		{
			icon = "\RRP_icons\interaction\open.paa";
			title = "Открыть";
			action = "closeDialog 0; call RRPClient_containers_gang_openGangTrunk;";
			condition = "(curTarget getVariable ['locked',false])";
		};
		class close
		{
			icon = "\RRP_icons\interaction\lock.paa";
			title = "Закрыть";
			action = "closeDialog 0; call RRPClient_containers_gang_openGangTrunk;";
			condition = "!(curTarget getVariable ['locked',false])";
		};
		class UpSlots
		{
			icon = "";
			title = "Расширить слоты";
			action = "closeDialog 0; ['request'] call RRPClient_containers_gang_upgrade";
			condition = "!(curTarget getVariable ['locked',false]) and {!(isNull curTarget)}";
		};
		class Manage
		{
			icon = "";
			title = "Управление";
			action = "closeDialog 0; ['openManage',curTarget] call RRPClient_containers_gang_manage";
			condition = "curTarget getVariable ['t_owner','-1'] isEqualTo (getPlayerUID player)";
		};
	};

	class cop
	{
		condition = "(curTarget isKindOf 'CAManBase') and ((player distance curTarget) < 3) and (isPlayer curTarget) and !(curTarget isEqualTo player) and !(curTarget getVariable ['RRPVariablePartyMeatActive',false])";
		class inspection
		{
			title = "Инспекция";
			class licenses
			{
				icon = "\RRP_icons\interaction\licenseControl.paa";
				title = "Проверить лицензию";
				action = "closeDialog 0; [""SEND"",curTarget] spawn RRPClient_system_licenseControl; closeDialog 0;";
				condition = "true";
			};
			class btn_2
			{
				icon = "\RRP_icons\interaction\searchAction.paa";
				title = "Провести обыск";
				action = "closeDialog 0; [curTarget] spawn RRPClient_invSearch_main; closeDialog 0;";
				condition = "true";
			};
			class btn_3
			{
				icon = "\RRP_icons\interaction\searchAction.paa";
				title = "Изъять ресурсы";
				action = "closeDialog 0; [curTarget] spawn RRPClient_system_searchAction; closeDialog 0;";
				condition = "true";
			};
			class btn_10
			{
				icon = "\RRP_icons\interaction\removeWeaponAction.paa";
				title = "Раздеть";
				action = "closeDialog 0; [curTarget] spawn RRPClient_system_dropAllAnimat; closeDialog 0;";
				condition = "true";
			};
			class btn_11
			{
				icon = "\RRP_icons\interaction\dropRadio.paa";
				title = "Забрать телефон";
				action = "closeDialog 0; [curTarget] call RRPClient_system_dropRadio; closeDialog 0;";
				condition = "true";
			};
		};
		class punishment
		{
			title = "Наказание";
			class btn_6
			{
				icon = "\RRP_icons\interaction\ticketAction.paa";
				title = "Выписать штраф";
				action = "[curTarget] call RRPClient_tickets_Action;";
				condition = "true";
			};
			class btn_7
			{
				icon = "\RRP_icons\interaction\update.paa";
				title = "В тюрьму";
				action = "closeDialog 0; 'jail' call RRPClient_cw_openMenu;";
				condition = "([player] call RRPClient_system_checkForSearch)";
			};
			class btn_8
			{
				icon = "\RRP_icons\interaction\cw.paa";
				title = "На общ. работы";
				action = "closeDialog 0; 'cw' call RRPClient_cw_openMenu;";
				condition = "([player] call RRPClient_system_checkForSearch)";
			};
			class btn_12
			{
				icon = "\RRP_icons\interaction\makeHimUnBlind.paa";
				title = "Снять мешок";
				action = "closeDialog 0; [curTarget] call RRPClient_system_makeHimUnBlind; closeDialog 0;";
				condition = "curTarget getVariable ['isBlind',false]";
			};
			class btn_13
			{
				icon = "\RRP_icons\interaction\makeHimBlind.paa";
				title = "Надеть мешок";
				action = "closeDialog 0; [curTarget] call RRPClient_system_makeHimBlind; closeDialog 0;";
				condition = "!(curTarget getVariable ['isBlind',false])";
			};
			// class btn_14
			// {
			// 	title = "Вставить кляп";
			// };
			// class btn_14_1
			// {
			// 	title = "Вытащить кляп";
			// };
		};
		class btn_1
		{
			icon = "\RRP_icons\interaction\unrestrain.paa";
			title = "Отпустить";
			action = "closeDialog 0; [curTarget] call RRPClient_system_unrestrain; closeDialog 0";
			condition = "true";
		};
		class btn_4
		{
			icon = "\RRP_icons\interaction\escortAction.paa";
			title = "Эскорт";
			action = "closeDialog 0; [curTarget] call RRPClient_system_escortAction; closeDialog 0;";
			condition = "isNull attachedTo curTarget";
		};
		class btn_5
		{
			icon = "\RRP_icons\interaction\stopEscorting.paa";
			title = "Остановить эскорт";
			action = "closeDialog 0; [curTarget] call RRPClient_system_stopEscorting; closeDialog 0;";
			condition = "!(isNull attachedTo curTarget)";
		};
		class putInCar
		{
			icon = "\RRP_icons\interaction\putInCar.paa";
			title = "Посадить в машину";
			condition = "true";
			action = "[curTarget] call RRPClient_system_putInCar;";
		};
		
		class btn_14
		{
			icon = "\RRP_icons\interaction\showPassportTo.paa";
			title = "Паспорт";
			action = "[player] remoteExecCall ['RRPClient_id_showTo',curTarget]";
			condition = "true";
		};
		class btn_15
		{
			icon = "\RRP_icons\interaction\showPassportTo.paa";
			title = "Показать паспорт";
			action = "closeDialog 0; [curTarget] call RRPClient_id_showTo";
			condition = "true";
		};
		class btn_16
		{
			icon = "\RRP_icons\interaction\showPassportTo.paa";
			title = "Посмотреть документы";
			action = "remoteExecCall ['RRPClient_documents_showMeDocuments',curTarget]";
			condition = "true";
		};
		class btn_16
		{
			icon = "\RRP_icons\interaction\showPassportTo.paa";
			title = "Выдать награду";
			action = "closeDialog 0;call RRPClient_events_giveRewards";
			condition = "getPlayerUID player in ['76561198055124016','76561198860385638','76561199093304994']";
		};
	};
	class med
	{
		condition = "(curTarget isKindOf 'CAManBase') and ((player distance curTarget) < 3) and (isPlayer curTarget) and !(curTarget isEqualTo player) and !(curTarget getVariable ['RRPVariablePartyMeatActive',false])";
		class putInCar
		{
			icon = "\RRP_icons\interaction\putInCar.paa";
			title = "Посадить в машину";
			condition = "true";
			action = "[curTarget] call RRPClient_system_putInCar;";
		};
		class btn_2
		{
			icon = "\RRP_icons\interaction\unrestrain.paa";
			title = "Отпустить";
			condition = "true";
			action = "[curTarget] call RRPClient_system_unrestrain; closeDialog 0;";
		};
		class btn_3
		{
			icon = "\RRP_icons\interaction\escortAction.paa";
			title = "Эскорт";
			condition = "isNull attachedTo curTarget";
			action = "[curTarget] call RRPClient_system_escortAction; closeDialog 0;";
		};
		class btn_4
		{
			icon = "\RRP_icons\interaction\stopEscorting.paa";
			title = "Остановить эскорт";
			condition = "!(isNull attachedTo curTarget)";
			action = "[curTarget] call RRPClient_system_stopEscorting; closeDialog 0;";
		};
		class btn_5
		{
			icon = "\RRP_icons\interaction\showPassportTo.paa";
			title = "Паспорт";
			condition = "true";
			action = "[player] remoteExecCall ['RRPClient_id_showTo',curTarget]; closeDialog 0";
		};

		class btn_6
		{
			icon = "\RRP_icons\interaction\showPassportTo.paa";
			title = "Посмотреть документы";
			action = "remoteExecCall ['RRPClient_documents_showMeDocuments',curTarget]";
			condition = "true";
		};
	};
	class civ
	{
		condition = "(curTarget isKindOf 'CAManBase') and ((player distance curTarget) < 3) and (isPlayer curTarget) and !(curTarget isEqualTo player) and !(player getVariable ['corrective_work',false]) and !(curTarget getVariable ['RRPVariablePartyMeatActive',false])";
		class btn_1
		{
			icon = "\RRP_icons\interaction\unrestrain.paa";
			title = "Отпустить";
			condition = "true";
			action = "closeDialog 0; [curTarget] call RRPClient_system_unrestrain;";
		};
		class btn_2
		{
			icon = "\RRP_icons\interaction\escortAction.paa";
			title = "Эскорт";
			condition = "isNull attachedTo curTarget";
			action = "closeDialog 0; [curTarget] call RRPClient_system_escortAction;";
		};
		class btn_3
		{
			icon = "\RRP_icons\interaction\stopEscorting.paa";
			title = "Остановить эскорт";
			condition = "!(isNull attachedTo curTarget)";
			action = "closeDialog 0; [curTarget] call RRPClient_system_stopEscorting;";
		};
		class putInCar
		{
			icon = "\RRP_icons\interaction\putInCar.paa";
			title = "Посадить в машину";
			condition = "!(player getVariable ['corrective_work',false])";
			action = "[curTarget] call RRPClient_system_putInCar;";
		};
		class btn_5
		{
			icon = "\RRP_icons\interaction\showPassportTo.paa";
			title = "Паспорт";
			condition = "true";
			action = "[player] remoteExecCall ['RRPClient_id_showTo',curTarget]; closeDialog 0";
		};
		class btn_6
		{
			icon = "\RRP_icons\interaction\makeHimUnBlind.paa";
			title = "Снять мешок";
			condition = "curTarget getVariable ['isBlind',false]";
			action = "[curTarget] call RRPClient_system_makeHimUnBlind; closeDialog 0;";
		};
		class btn_7
		{
			icon = "\RRP_icons\interaction\makeHimBlind.paa";
			title = "Надеть мешок";
			condition = "!(curTarget getVariable ['isBlind',false])";
			action = "[curTarget] call RRPClient_system_makeHimBlind; closeDialog 0;";
		};
		class btn_8
		{
			icon = "\RRP_icons\interaction\robAction.paa";
			title = "Ограбить";
			condition = "!(isNull curTarget) AND !(!isPlayer curTarget AND (curTarget call getSide) isEqualTo 'civ') AND !(curTarget getVariable ['isBeginner',false]) AND !(player getVariable ['isBeginner',false]) AND !(curTarget isEqualTo player)";
			action = "";
			class btn_8_1
			{
				icon = "";
				title = "Деньги";
				condition = "true";
				action = "closeDialog 0; [curTarget] spawn RRPClient_system_robAction;";
			};
			class btn_8_2
			{
				icon = "";
				title = "Телефон";
				condition = "true";
				action = "closeDialog 0; [curTarget] call RRPClient_system_dropRadio;";
			};
			class btn_8_3
			{
				icon = "";
				title = "Снаряжение и ресурсы";
				condition = "true";
				action = "closeDialog 0; [curTarget] spawn RRPClient_system_dropAllAnimat;";
			};
		};
		class btn_9
		{
			icon = "\RRP_icons\interaction\showPassportTo.paa";
			title = "Посмотреть документы";
			action = "remoteExecCall ['RRPClient_documents_showMeDocuments',curTarget]";
			condition = "true";
		};
		class btn_10
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Поднять";
			condition = "(vehicle player isEqualTo player) && curTarget getVariable ['restrained',false] && curTarget getVariable ['restrained_prone',false]";
			action = "[curTarget] call RRPClient_system_upprone; closeDialog 0;";
		};
		class btn_11
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Посадить";
			condition = "(vehicle player isEqualTo player) && curTarget getVariable ['restrained',false] && !(curTarget getVariable ['restrained_prone',false])";
			action = "[curTarget] call RRPClient_system_upprone; closeDialog 0;";
		};
		class btn_12
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Казнить";
			condition = "(curTarget getVariable ['lifeState',''] isEqualTo 'HEALTHY') && !(currentWeapon player isEqualTo '') && curTarget getVariable ['restrained',false] && (curTarget getVariable ['restrained_prone',false])";
			action = "[] call RRPClient_hotkeys_switchWeaponHandler; [curTarget] spawn RRPClient_system_kazn; closeDialog 0;";
		};
	};

	class animation {
		condition = "!(isNull(objectParent player) AND dialog AND !life_dance AND (isNull life_DraggedBody)) AND !life_action_inUse AND (vehicle player isEqualto player) AND ((animationState player find 'unconscious') isEqualTo -1)";
		class stop {
			icon = "";
			title = "Отмена";
			condition = "true";
			action = "call RRPClient_system_animDo;RRPClientActiveAnim = false; closeDialog 0;";
		};
		class Poses {
			icon = "";
			title = "Позы";
			condition = "true";
			action = "closeDialog 0;[missionConfigFile >> ""CfgPoses""] call RRPClient_anims_dialogPoses";
		};
		class Gestures {
			icon = "";
			title = "Жесты";
			condition = "true";
			action = "";
			class Hold
			{
				icon = "";
				title = "Привет!";
				condition = "true";
				action = "closeDialog 0; ['CRPTHSHold'] call RRPClient_gestures_playAction;";
			};
			class Forward
			{
				icon = "";
				title = "Указать дорогу";
				condition = "true";
				action = "closeDialog 0; ['CRPTHSForward'] call RRPClient_gestures_playAction;";
			};
			class Warning
			{
				icon = "";
				title = "Обозначиться";
				condition = "true";
				action = "closeDialog 0; ['CRPTHSWarning'] call RRPClient_gestures_playAction;";
			};
			class Point
			{
				icon = "";
				title = "Укзать пальцем";
				condition = "true";
				action = "closeDialog 0; ['CRPTHSPoint'] call RRPClient_gestures_playAction;";
			};
			class yes
			{
				icon = "";
				title = "Согласится";
				condition = "true";
				action = "closeDialog 0; ['cl3_yes'] call RRPClient_gestures_playAction;";
			};
			class no_way
			{
				icon = "";
				title = "Возразить";
				condition = "true";
				action = "closeDialog 0; ['cl3_no_way'] call RRPClient_gestures_playAction;";
			};
			class thumbs_up
			{
				icon = "";
				title = "Респект";
				condition = "true";
				action = "closeDialog 0; ['cl3_thumbs_up'] call RRPClient_gestures_playAction;";
			};
			class thumbs_down
			{
				icon = "";
				title = "Отстой";
				condition = "true";
				action = "closeDialog 0; ['cl3_thumbs_down'] call RRPClient_gestures_playAction;";
			};
			class clapping
			{
				icon = "";
				title = "Хлопать в ладоши";
				condition = "true";
				action = "closeDialog 0; ['cl3_clapping'] call RRPClient_gestures_playAction;";
			};
		};
		class fun {
			icon = "\RRP_icons\interaction\fun.paa";
			title = "Развлекательные";
			condition = "true";
			action = "";
			class btn_1
			{
				icon = "";
				title = "Bouncer";
				condition = "true";
				action = "[""cl3_bouncer""] call RRPClient_gestures_playAction; closeDialog 0;";
			};
			class btn_2
			{
				icon = "";
				title = "Pray";
				condition = "true";
				action = "[""cl3_bow_pray""] call RRPClient_gestures_playAction; closeDialog 0;";
			};
			class btn_3
			{
				icon = "";
				title = "Clapping";
				condition = "true";
				action = "[""cl3_clapping""] call RRPClient_gestures_playAction; closeDialog 0;";
			};
			class btn_4
			{
				icon = "";
				title = "HandStand";
				condition = "true";
				action = "[""cl3_hand_stand""] call RRPClient_gestures_playAction; closeDialog 0;";
			};
			class btn_5
			{
				icon = "";
				title = "Muscle";
				condition = "true";
				action = "[""cl3_muscle""] call RRPClient_gestures_playAction; closeDialog 0;";
			};
			class btn_6
			{
				icon = "";
				title = "PushUps";
				condition = "true";
				action = "[""cl3_pushups""] call RRPClient_gestures_playAction; closeDialog 0;";
			};
			class btn_7
			{
				icon = "";
				title = "Violin";
				condition = "true";
				action = "[""cl3_violin""] call RRPClient_gestures_playAction; closeDialog 0;";
			};
			class btn_8
			{
				icon = "";
				title = "Wank";
				condition = "true";
				action = "[""cl3_wank""] call RRPClient_gestures_playAction; ['wank',1] call RRPClient_ach_gateway;closeDialog 0;";
			};
			class btn_9
			{
				icon = "";
				title = "Wanker";
				condition = "true";
				action = "[""cl3_wanker""] call RRPClient_gestures_playAction; closeDialog 0;";
			};
			class btn_10
			{
				icon = "";
				title = "ThumbsUp";
				condition = "true";
				action = "[""cl3_thumbs_up""] call RRPClient_gestures_playAction; closeDialog 0;";
			};
			class btn_11
			{
				icon = "";
				title = "ThumbsDown";
				condition = "true";
				action = "[""cl3_thumbs_down""] call RRPClient_gestures_playAction; closeDialog 0;";
			};
		};
		class dance {
			icon = "\RRP_icons\interaction\dance.paa";
			title = "Танцы";
			condition = "true";
			action = "";
			class btn_1_1
			{
				icon = "";
				title = "Ivan";
				condition = "true";
				action = "[""cl3_duoivan""] spawn RRPClient_gestures_danceAction; closeDialog 0;";
			};
			class btn_1_2
			{
				icon = "";
				title = "Stefan";
				condition = "true";
				action = "[""cl3_stephan""] spawn RRPClient_gestures_danceAction; closeDialog 0;";
			};
			class btn_1_3
			{
				icon = "";
				title = "Stefan V";
				condition = "true";
				action = "[""cl3_duostephan""] spawn RRPClient_gestures_danceAction; closeDialog 0;";
			};
			class btn_1_4
			{
				icon = "";
				title = "Night Club";
				condition = "true";
				action = "[""cl3_nightclubdance""] spawn RRPClient_gestures_danceAction; closeDialog 0;";
			};
			class btn_1_5
			{
				icon = "";
				title = "DubStep";
				condition = "true";
				action = "[""cl3_dubstepdance""] spawn RRPClient_gestures_danceAction; closeDialog 0;";
			};
			class btn_1_6
			{
				icon = "";
				title = "DubStep Pop";
				condition = "true";
				action = "[""cl3_dubsteppop""] spawn RRPClient_gestures_danceAction; closeDialog 0;";
			};
			class btn_1_7
			{
				icon = "";
				title = "Hip Hop";
				condition = "true";
				action = "[""cl3_hiphopdance""] spawn RRPClient_gestures_danceAction; closeDialog 0;";
			};
			class btn_1_8
			{
				icon = "";
				title = "Crazy Drunk";
				condition = "true";
				action = "[""cl3_crazydrunkdance""] spawn RRPClient_gestures_danceAction; closeDialog 0;";
			};
			class btn_1_9
			{
				icon = "";
				title = "Robot";
				condition = "true";
				action = "[""cl3_robotdance""] spawn RRPClient_gestures_danceAction; closeDialog 0;";
			};
			class btn_1_10
			{
				icon = "";
				title = "Russian";
				condition = "true";
				action = "[""cl3_russiandance""] spawn RRPClient_gestures_danceAction; closeDialog 0;";
			};
		};
		class tactical {
			icon = "\RRP_icons\interaction\tactical.paa";
			title = "Тактические";
			condition = "true";
			action = "";
			class btn_2_1
			{
				icon = "";
				title = "Forward";
				condition = "true";
				action = "[""CRPTHSForward""] call RRPClient_gestures_playAction; closeDialog 0;";
			};
			class btn_2_2
			{
				icon = "";
				title = "Stop";
				condition = "true";
				action = "[""CRPTHSStop""] call RRPClient_gestures_playAction; closeDialog 0;";
			};
			class btn_2_3
			{
				icon = "";
				title = "Regroup";
				condition = "true";
				action = "[""CRPTHSRegroup""] call RRPClient_gestures_playAction; closeDialog 0;";
			};
			class btn_2_4
			{
				icon = "";
				title = "Engage";
				condition = "true";
				action = "[""CRPTHSEngage""] call RRPClient_gestures_playAction; closeDialog 0;";
			};
			class btn_2_5
			{
				icon = "";
				title = "Point";
				condition = "true";
				action = "[""CRPTHSPoint""] call RRPClient_gestures_playAction; closeDialog 0;";
			};
			class btn_2_6
			{
				icon = "";
				title = "Hold";
				condition = "true";
				action = "[""CRPTHSHold""] call RRPClient_gestures_playAction; closeDialog 0;";
			};
			class btn_2_7
			{
				icon = "";
				title = "Warning";
				condition = "true";
				action = "[""CRPTHSWarning""] call RRPClient_gestures_playAction; closeDialog 0;";
			};
			class btn_2_8
			{
				icon = "";
				title = "Yes";
				condition = "true";
				action = "[""cl3_yes""] call RRPClient_gestures_playAction; closeDialog 0;";
			};
			class btn_2_9
			{
				icon = "";
				title = "No";
				condition = "true";
				action = "[""cl3_no_way""] call RRPClient_gestures_playAction; closeDialog 0;";
			};
			class btn_2_10
			{
				icon = "";
				title = "Finger";
				condition = "true";
				action = "[""cl3_middle_finger""] call RRPClient_gestures_playAction; closeDialog 0;";
			};
			class btn_2_11
			{
				icon = "";
				title = "SuckIt";
				condition = "true";
				action = "[""cl3_suck_it""] call RRPClient_gestures_playAction; closeDialog 0;";
			};
		};
	};
	class agony {
		condition = "(curTarget isKindOf 'CAManBase') and ((player distance curTarget) < 3) and (isPlayer curTarget) and !(curTarget isEqualTo player)";
		class btn_1
		{
			icon = "\RRP_icons\interaction\showPassportTo.paa";
			title = "Паспорт";
			condition = "true";
			action = "[player] remoteExecCall ['RRPClient_id_showTo',curTarget]; closeDialog 0";
		};
		class btn_2
		{
			icon = "\RRP_icons\interaction\dragDeadBody.paa";
			title = "Тащить";
			condition = "!(!(isNull attachedTo curTarget) OR count (call RRPClient_util_attachedObjectsPlayer) > 0 OR !isNull life_DraggedBody OR !isNil {curTarget getVariable 'draggedBy'}) AND !life_dance";
			action = "closeDialog 0; [curTarget] spawn RRPClient_system_dragDeadBody;";
		};
		class btn_3
		{
			icon = "\RRP_icons\interaction\putInCar.paa";
			title = "Посадить в машину";
			condition = "!(curTarget isEqualTo player)";
			action = "closeDialog 0; [curTarget] call RRPClient_system_putInCar;";
		};
		class revive
		{
			icon = "\RRP_icons\interaction\revivePlayer.paa";
			title = "Реанимировать";
			condition = "!(RRPClientGroupInfo isEqualTo []) || license_flightschool_grp_3";
			action = "closeDialog 0; [curTarget] spawn RRPClient_system_revivePlayer;";
		};
		class btn_5
		{
			icon = "\RRP_icons\interaction\robAction.paa";
			title = "Ограбить";
			condition = "true";
			action = "";
			class btn_5_1
			{
				icon = "";
				title = "Деньги";
				condition = "!(player call getSide == 'cop') and {!(player call getSide == 'med')}";
				action = "closeDialog 0; [curTarget] spawn RRPClient_system_robAction;";
			};
			class btn_5_2
			{
				icon = "";
				title = "Телефон";
				condition = "!(player call getSide == 'med')";
				action = "closeDialog 0; [curTarget] call RRPClient_system_dropRadio;";
			};
			class btn_5_3
			{
				icon = "";
				title = "Снаряжение";
				condition = "!(player call getSide == 'med')";
				action = "closeDialog 0; [curTarget] spawn RRPClient_system_dropAllAnimat;";
			};
		};
		class btn_6
		{
			icon = "\RRP_icons\interaction\requestMedic.paa";
			title = "Вызвать доктора!";
			condition = "true";
			action = "[curTarget] remoteExecCall [""RRPClient_system_requestMedic"",curTarget]; closeDialog 0;";
		};
	};
	class free
	{
		cursor = true;
		class btn_1
		{
			icon = "\RRP_icons\interaction\tickets_Action.paa";
			title = "Выставить счет";
			condition = "(player call getSide in ['med','cop'] OR {life_canBill} OR {license_taxi})";
			action = "[curTarget] call RRPClient_tickets_Action";
		};
		class btn_2
		{
			icon = "\RRP_icons\interaction\tickets_Action.paa";
			title = "+ в компанию";
			condition = "false";
			action = "closeDialog 0; ['addManager'] call RRPClient_ltds_ltd_actions";
		};
		class btn_3
		{
			icon = "\RRP_icons\interaction\tickets_Action.paa";
			title = "+ в тусовку";
			condition = "(RRPClientPartyID != '') and {(leader (group player)) isEqualTo player}";
			action = "closeDialog 0; [curTarget] call RRPClient_party_requestInvite";
		};
		class btn_4
		{
			icon = "\RRP_icons\interaction\tickets_Action.paa";
			title = "+ в организацию";
			condition = "(!(RRPClientGroupInfo isEqualTo [])) and {'canInvite' call RRPClient_groups_util_permCheck}";
			action = "closeDialog 0; [curTarget] call RRPClient_groups_iniviteRequest";
		};

		class btn_5
		{
			icon = "\RRP_icons\interaction\tickets_Action.paa";
			title = "Поздороваться";
			condition = "true";
			action = "closeDialog 0; [curTarget] call RRPClient_id_nickName";
		};
		class btn_6
		{
			icon = "\rimas_pack\icons\ui\s_icon_passport.paa";
			title = "Показать паспорт";
			condition = "true";
			action = "closeDialog 0; [curTarget] call RRPClient_id_showTo";
		};
		class btn_7
		{
			icon = "\rimas_pack\icons\ui\s_icon_passport.paa";
			title = "Выдать документы";
			condition = "true";
			action = "closeDialog 0; [curTarget] call Client_documents_giveMenu";
		};
		class Action
		{
			icon = "\RRP_icons\interaction\robAction.paa";
			title = "Действия";
			condition = "((isPlayer curTarget) && ((typeOf curTarget) isEqualTo 'I_Survivor_F')) && (typeOf (vehicle curTarget) isEqualTo 'I_Survivor_F') && (curTarget getVariable ['lifeState',''] isEqualTo 'HEALTHY') && !(curTarget getVariable['restrained',false])";
			action = "";
			class Hands
			{
				icon = "\RRP_icons\interaction\robAction.paa";
				title = "Пожать руки";
				condition = "((player distance curTarget) < 10)";
				action = "closeDialog 0; [curTarget,'ShakeHands'] call RRPClient_anims_request";
			};
			class HighFive
			{
				icon = "\RRP_icons\interaction\robAction.paa";
				title = "Дать пять";
				condition = "((player distance curTarget) < 10)";
				action = "closeDialog 0; [curTarget,'HighFive'] call RRPClient_anims_request";
			};
			class Brofist
			{
				icon = "\RRP_icons\interaction\robAction.paa";
				title = "Кулачки";
				condition = "((player distance curTarget) < 10)";
				action = "closeDialog 0; [curTarget,'Kulachok'] call RRPClient_anims_request";

			};
			class Hugg
			{
				icon = "\RRP_icons\interaction\robAction.paa";
				title = "Обнять";
				condition = "((player distance curTarget) < 10)";
				action = "closeDialog 0; [curTarget,'Hugging'] call RRPClient_anims_request";

			};
			class Kiss
			{
				icon = "\RRP_icons\interaction\robAction.paa";
				title = "Поцеловать";
				condition = "((player distance curTarget) < 10)";
				action = "closeDialog 0; [curTarget,'KissChin'] call RRPClient_anims_request";

			};
		};
		class btn_8
		{
			icon = "\RRP_icons\interaction\tickets_Action.paa";
			title = "Дать деньги";
			condition = "true";
			action = "[curTarget] call RRPClient_system_giveMoneyMenu";
		};
	};
	class HospitalBed {
		condition = "(typeOf curTarget) isEqualTo 'RRPHospitalBed' OR {(typeOf curTarget) isEqualTo 'Rimas_EMS_Stretcher'}";
		class btn_1
		{
			icon = "\RRP_icons\interaction\loadInHB.paa";
			title = "Положить на койку";
			condition = "(crew curTarget) isEqualto []";
			action = "[curTarget] spawn RRPClient_system_loadInHB; closeDialog 0;";
		};
		class btn_2
		{
			icon = "\RRP_icons\interaction\unloadFromHB.paa";
			title = "Вытащить с койки";
			condition = "!((crew curTarget) isEqualto [])";
			action = "[player] remoteExec [""RRPClient_system_unloadFromHB"",(crew curTarget) select 0]; closeDialog 0;";
		};
		class btn_3
		{
			icon = "\RRP_icons\interaction\resHB.paa";
			title = "Лечить";
			condition = "!(curTarget isEqualto [])";
			action = "[curTarget] spawn RRPClient_system_resHB; closeDialog 0;";
		};
	};
	class houseBank {
		cursor = true;
		class btn_1
		{
			icon = "\RRP_icons\interaction\Repair.paa";
			title = "Чинить";
			condition = "true";
			action = "[curTarget] spawn RRPClient_system_repairDoor; closeDialog 0;";
		};
		class btn_2
		{
			icon = "\RRP_icons\interaction\open.paa";
			title = "CloseOpen";
			condition = "true";
			action = "[curTarget] call RRPClient_system_doorAnimate; closeDialog 0;";
		};
	};
	class house {
		condition = "!(player inArea 'stratis_zone')";
		class copHouseOwner
		{
			icon = "\RRP_icons\interaction\licenseControl.paa";
			title = "Владелец дома";
			condition = "player call getSide == 'cop'";
			action = "[curTarget] call RRPClient_system_copHouseOwner;";
		};
		class copBreakDoor
		{
			icon = "\RRP_icons\interaction\breakLock.paa";
			title = "Взломать дверь";
			condition = "player call getSide == 'cop'";
			action = "[curTarget] spawn RRPClient_system_copBreakDoor; closeDialog 0;";
		};
		class raidHouse
		{
			icon = "\RRP_icons\interaction\raidHouseWeapon.paa";
			title = "Обыск ресурсов";
			condition = "player call getSide == 'cop' and (curTarget in life_vehicles)";
			action = "[curTarget] spawn RRPClient_system_raidHouse; closeDialog 0;";
		};
		class raidHouseWeapon
		{
			icon = "\RRP_icons\interaction\raidHouseWeapon.paa";
			title = "Обыск снаряги";
			condition = "player call getSide == 'cop' and (curTarget in life_vehicles)";
			action = "[curTarget] spawn RRPClient_system_raidHouseWeapon; closeDialog 0;";
		};
		class unLockHouse
		{
			icon = "\RRP_icons\interaction\open.paa";
			title = "Открыть хранилище";
			condition = "((getNumber(missionConfigFile >> 'LifeCfgHousing' >> worldName >> (typeOf curTarget) >> 'numberCrates')) > 0) and (curTarget getVariable ['locked',false]) and ((curTarget in life_vehicles) or (curTarget in life_tempHouses))";
			action = "[curTarget] call RRPClient_system_lockHouse; closeDialog 0;";
		};
		class lockHouse
		{
			icon = "\RRP_icons\interaction\lock.paa";
			title = "Закрыть хранилище";
			condition = "(!(curTarget getVariable ['locked',false])) and ((curTarget in life_vehicles) or (curTarget in life_tempHouses))";
			action = "[curTarget] call RRPClient_system_lockHouse; closeDialog 0;";
		};
		class HouseBuy
		{
			icon = "";
			title = "Купить дом";
			condition = "!(curTarget in life_vehicles) and !(curTarget in life_tempHouses) and ((curTarget getVariable ['house_owner','']) isEqualTo '')";
			action = "closeDialog 0; createDialog 'RRPDialogHouseBuy';";
		};
		class HouseMenu_garage
		{
			icon = "";
			title = "Гараж";
			condition = "((getNumber(missionConfigFile >> 'LifeCfgHousing' >> worldName >> (typeOf curTarget) >> 'numberCrates')) isEqualTo 0) and (((curTarget getVariable ['house_owner',[]]) select 0) isEqualTo (getPlayerUID player) or (curTarget in life_houses))";
			action = "closeDialog 0; [curTarget,""Car""] spawn RRPClient_garage_HouseMenu;";
		};
		class storeVehicle
		{
			icon = "";
			title = "Поставить в гараж";
			condition = "((getNumber(missionConfigFile >> 'LifeCfgHousing' >> worldName >> (typeOf curTarget) >> 'numberCrates')) isEqualTo 0) and (((curTarget getVariable ['house_owner',[]]) select 0) isEqualTo (getPlayerUID player))";
			action = "closeDialog 0; [""request_store"",[true]] call RRPClient_garage_actions;";
		};
	};
	class vehicle {
		cursor = true;
		class breakLockCop {
			icon = "\RRP_icons\interaction\deadMoveOut.paa";
			title = "Взломать технику";
			action = "curTarget spawn RRPClient_system_unlockCar; closeDialog 0;";
			condition = "('cop' call RRPClient_groups_getSideLevel > 0)";
		};
		class farm {
			icon = "\RRP_icons\interaction\deadMoveOut.paa";
			title = "Фарм";
			action = "[curTarget,'vehicle'] call RRPClient_farm_miningInit; closeDialog 0;";
			condition = "!(typeOf curTarget in getArray(missionConfigFile >> 'CfgFarm' >> 'minerVehicleList'))";
		};
		class miner {
			icon = "\RRP_icons\interaction\deadMoveOut.paa";
			title = "Фарм";
			action = "[curTarget,'miner'] call RRPClient_farm_miningInit; closeDialog 0;";
			condition = "(typeOf curTarget in getArray(missionConfigFile >> 'CfgFarm' >> 'minerVehicleList'))";
		};
		class dumpPressure {
			icon = "\RRP_icons\interaction\deadMoveOut.paa";
			title = "Спустить давление";
			action = "curTarget call RRPClient_farm_miner_dumpPressure; closeDialog 0;";
			condition = "((typeOf curTarget) in getArray(missionConfigFile >> 'CfgFarm' >> 'minerVehicleList')) AND  (curTarget getVariable ['pressure',1]) > 2";
		};
		class supportsON
		{
			icon = "";
			title = "Выдвинуть опоры";
			action = "closeDialog 0; curTarget animate [""opora_l"", 1];curTarget animate [""opora_r"", 1];curTarget animate [""opora_l_niz"", 1];curTarget animate [""opora_r_niz"", 1]";
			condition = "(curTarget animationPhase ""opora_l"" < 0.5) AND ((typeOf curTarget) isEqualto 'RRP_Dob')";
		};
		class supportsOFF
		{
			icon = "";
			title = "Убрать опоры";
			action = "closeDialog 0; curTarget animate [""opora_l"", 0];curTarget animate [""opora_r"", 0];curTarget animate [""opora_l_niz"", 0];curTarget animate [""opora_r_niz"", 0]";
			condition = "(curTarget animationPhase ""opora_l"" >= 0.5 AND curTarget animationPhase 'strela' < 0.001) AND ((typeOf curTarget) isEqualto 'RRP_Dob')";
		};
		class openDrill
		{
			icon = "";
			title = "Поднять установку";
			action = "closeDialog 0; curTarget animate [""strela"", 1];curTarget animate [""gidra"", 1];curTarget animate [""bur"", 1];curTarget animate [""bur_trans"", 1];curTarget animate [""bur_plate1"", 1];curTarget animate [""bur_plate"", 1];curTarget animate [""basmak"", 1]";
			condition = "(curTarget animationPhase ""strela"" < 0.5 AND curTarget animationPhase 'opora_l' > 0.99) AND ((typeOf curTarget) isEqualto 'RRP_Dob')";
		};
		class closeDrill
		{
			icon = "";
			title = "Свернуть установку";
			action = "closeDialog 0; curTarget animate [""strela"", 0];curTarget animate [""gidra"", 0];curTarget animate [""bur"", 0];curTarget animate [""bur_trans"", 0];curTarget animate [""bur_plate1"", 0];curTarget animate [""bur_plate"", 0];curTarget animate [""basmak"", 0]";
			condition = "(curTarget animationPhase ""strela"" >= 0.5 AND curTarget animationPhase 'bur_plate1' > 0.99) AND ((typeOf curTarget) isEqualto 'RRP_Dob')";
		};
		class gate_open
		{
			icon = "";
			title = "Начать добычу";
			action = "closeDialog 0; [curTarget] spawn RRPClient_farm_pumpingOil";
			condition = "(curTarget animationPhase ""strela"" >= 0.5 AND curTarget animationPhase 'bur_plate1' > 0.99) AND ((typeOf curTarget) isEqualto 'RRP_Dob')";
		};
		class btn_1
		{
			icon = "\RRP_icons\interaction\DLC.paa";
			title = "В DLC машину";
			condition = "([getObjectDLC curTarget] isEqualTypeAll 0) && (crew curTarget isEqualTo [] && {canMove curTarget} && {(locked curTarget) in [0,1]})";
			action = "player moveInDriver curTarget";
		};
		class repair
		{
			icon = "\RRP_icons\interaction\DLC.paa";
			title = "Чинить";
			condition = "('extItem_ItemRepairKit' in (items player) && (damage curTarget < 1))";
			action = "[curTarget] spawn RRPClient_system_repairTruck; closeDialog 0;";
		};
		class writeVehicleNumber
		{
			icon = "\RRP_icons\interaction\writeVehicleNumber.paa";
			title = "Записать номер";
			condition = "player call getSide == 'cop'";
			action = "[curTarget] call RRPClient_system_writeVehicleNumber;";
		};
		class btn_3
		{
			icon = "\RRP_icons\interaction\search.paa";
			title = "Обыскать техинку";
			condition = "player call getSide == 'cop'";
			action = "closeDialog 0; [curTarget] spawn RRPClient_system_vehInvSearch;";
		};
		class btn_4
		{
			icon = "\RRP_icons\interaction\pulloutAction.paa";
			title = "Вытащить человека";
			condition = "((('med' call RRPClient_groups_getSideLevel) > 0) OR {(('cop' call RRPClient_groups_getSideLevel) > 0)} OR {(damage curTarget > 0.6)} OR {(curTarget in life_vehicles)} OR {((curTarget getHitPointDamage 'HitLFWheel' > 0.65) AND (curTarget getHitPointDamage 'HitRFWheel' > 0.65))}) AND {!((crew curTarget) isEqualto [])} AND {!(unitIsUAV curTarget)}";
			action = "[curTarget] spawn RRPClient_system_pulloutAction; closeDialog 0;";
		};
		class btn_5
		{
			icon = "\RRP_icons\interaction\parking_CopMenu.paa";
			title = "На штрафстоянку";
			condition = "player call getSide == 'cop'";
			action = "[curTarget] spawn RRPClient_parking_CopMenu;";
		};
		class btn_6
		{
			icon = "\RRP_icons\interaction\push.paa";
			title = "Толкнуть";
			condition = "(curTarget isKindOf 'ship')";
			action = "[] spawn RRPClient_system_pushObject; closeDialog 0;";
		};
		class btn_7
		{
			icon = "\RRP_icons\interaction\pulloutAction.paa";
			title = "Сесть в машину";
			condition = "(typeOf (curTarget) in ['C_Kart_01_Blu_F','C_Kart_01_Red_F','C_Kart_01_Fuel_F','C_Kart_01_Vrana_F']) and (((crew curTarget) isEqualto []) && {canMove curTarget} &&(locked curTarget isEqualTo 0))";
			action = "player moveInDriver curTarget; closeDialog 0;";
		};
		class btn_8
		{
			icon = "\RRP_icons\interaction\flipOver.paa";
			title = "Перевернуть";
			condition = "((crew curTarget) isEqualto [])";
			action = "_pos = getPosATL curTarget;_pos set [2,(_pos select 2) + 1];curTarget setPosATL _pos;curTarget setVectorUp [0, 0, 1];closeDialog 0;";
		};
		// class btn_9
		// {
		// 	icon = "\RRP_icons\interaction\destroyAction.paa";
		// 	title = "Уничтожить";
		// 	condition = "(player call getSide isEqualTo 'cop') and (('cop' call RRPClient_groups_getSideLevel) > 6) and ([player] call RRPClient_system_checkForSearch)";
		// 	action = "[curTarget] spawn RRPClient_vehicles_destroyAction; closeDialog 0;";
		// };
		class btn_10
		{
			icon = "\RRP_icons\interaction\impoundAction.paa";
			title = "Конфисковать";
			condition = "((player call getSide == 'med') or {(player call getSide isEqualTo 'cop')} or {(license_taxi and ('civ' call RRPClient_groups_getSideLevel) > 3)}) AND {!(player call RRPClient_util_isInStratis)}";
			action = "[curTarget] spawn RRPClient_system_impoundAction; closeDialog 0;";
		};
		class btn_11
		{
			icon = "\RRP_icons\interaction\adac_Menu.paa";
			title = "Модификации";
			condition = "('med' call RRPClient_groups_getSideLevel) >= 6";
			action = "closeDialog 0; [curTarget] spawn RRPClient_adac_Menu;";
		};
		class btn_12
		{
			icon = "\RRP_icons\interaction\deadMoveOut.paa";
			title = "Вытащить трупы";
			condition = "!(unitIsUAV curTarget)";
			action = "closeDialog 0; [curTarget] spawn RRPClient_system_deadMoveOut;";
		};
		class new_lockpick
		{
			icon = "\RRP_icons\interaction\deadMoveOut.paa";
			title = "Взломать технику";
			condition = "('extItem_lockpick' in (magazines player)) and {!(curTarget in life_vehicles)} and {!(player call getSide in ['cop','med'])} and {((typeOf curTarget) isKindOf 'car') || ((typeOf curTarget) isKindOf 'Air')}";
			action = "[curTarget] spawn RRPClient_lockpick_request; closeDialog 0;";
		};
		class lockpick_seaVeh
		{
			icon = "\RRP_icons\interaction\deadMoveOut.paa";
			title = "Взломать технику";
			condition = "(('extItem_lockpick' in (magazines player)) and !(curTarget in life_vehicles) and !((player call getSide in ['cop','med'])) and ((typeOf curTarget) isKindOf 'ship'))";
			action = "[curTarget] spawn RRPClient_vehicle_hotwireRequestShip; closeDialog 0;";
		};
		class info
		{
			icon = "";
			title = "Паспорт";
			condition = "true";
			action = "[curTarget] spawn RRPClient_system_vehiclePassport; closeDialog 0;";
		};
	};
};
