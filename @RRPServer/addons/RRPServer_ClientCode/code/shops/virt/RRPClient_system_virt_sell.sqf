/*
    Author(s):
    SteamID: 76561198090549826
    Discord: arrra#9745
*/

try {
	private ["_type","_itemInfo","_amount","_legal","_price","_amountItem"];
	if life_action_inUse throw "Вы уже выполняете какое-то действие!";
	if ((lbCurSel 2402) isEqualTo -1) throw "Вы не выбрали ресурс!";
	if RRPLockToSellResource throw "Обновление цен, ожидайте...";

	call RRPClient_actions_inUse;

	_type = (lbData[2402,lbCurSel 2402]);
	_itemInfo = _type call RRPClient_economy_getResInfo;
	if (_itemInfo isEqualTo "") throw ("Не опрделен ресурс:" + _type);

	if ((_itemInfo # 8) isEqualType []) then {
		private _text = format ["Продажа этого ресурса заблокирована до: %1", [(_itemInfo select 8)] call RRPClient_util_dateToString];
		 throw _text;
	};
	if (life_inwarzone) throw "В регионе введено военное положение, сбыт ресурса невозможен!";

	if ((time - life_vshop_timer) < 3) throw "Повторите действие через 3 секунды";
	life_vshop_timer = time;

	_amount = ctrlText 2403;
	if !([_amount] call RRPClient_system_isnumber) throw "Вы ввели неверное количество";
	_amount = parseNumber(_amount);

	_amountItem = missionNamespace getVariable [format ["life_inv_%1",getText(missionConfigFile >> "VirtualItems" >> _type >> "variable")],0];
	if (_this isEqualTo 'all') then {_amount = _amountItem};
	if (_amount > _amountItem) throw "У вас нет такого количества предметов для продажи";

	_legal = [_type,RRPPublicEconomyIlegalItems] call RRPClient_system_index;
	_price = ((_type call RRPClient_economy_getResInfo select 2) * _amount);
	_price = if ((_itemInfo select 3) > (_itemInfo select 4)) then {_price * 2} else {_price};


	if (_type call RRPClient_refinery_isRefineryRes) then {
		_price = round(_price * 1.30);
	};

	if (life_is_arrested) then {_price = round _price/2};

	if ((call (life_adminlevel) > 0) and !((getPlayerUID player) isEqualTo "76561197984276591")) then {
		format ["Цена: %1", _price] call chat;
	};



	if ([false,_type,_amount] call RRPClient_system_handleInv) then {
		private ["_successText","_typeCash"];
		if (_legal isEqualTo -1) then {
			private ["_tax","_index","_tmpamount"];
			_tax = round (_price * (server_tax/100));
			life_tmp_tax = life_tmp_tax + _tax;
			_price = ["LegalTrader", _price] call RRPClient_perks_activatePerk;

			_price = _price - _tax;
			_index = [_type,life_tmp_selled] call RRPClient_system_index;

			if (_index isEqualTo -1) then {
				life_tmp_selled pushBack [_type,_amount];
			} else {
				_tmpamount = ((life_tmp_selled select _index) select 1) + _amount;
				life_tmp_selled set [_index,[_type,_tmpamount]];
			};

			_typeCash = "cash";
			_successText = format["Вы продали %1 %2 за $%3 (с учетом $%6 налог в %4%5)",_amount,getText(missionConfigFile >> "VirtualItems" >> _type >> "displayName"),[_price] call RRPClient_util_numberText,server_tax,"%",_tax];
		} else {
			_price = ["ShadyTrader", _price] call RRPClient_perks_activatePerk;
			if ((["cop"] call RRPClient_system_playerCount) < (call RRPClient_system_copsForIllegal)) then {
				_price = round(_price/2);
				if ((call (life_adminlevel) > 0) and !((getPlayerUID player) isEqualTo "76561197984276591")) then {
					format ["Если нет копов, цена: %1", _price] call chat;
					["WarningTitleAndText", [format["Копов менее %1",(call RRPClient_system_copsForIllegal)], "Цена сбыта состовляет 50% от его номинала"]] call SmartClient_gui_toaster_addTemplateToast;
				};
			};
			_typeCash = "dcash";
			_successText = format["Вы продали %1 %2 за $%3",_amount,getText(missionConfigFile >> "VirtualItems" >> _type >> "displayName"),[_price] call RRPClient_util_numberText];
		};
		
		if (call RRPClient_groups_inGroup) then {
			_typeSell = if (_typeCash isEqualTo "dcash") then {"sellIllegalResources"} else {"sellLegalResources"};
			_tax = (RRPClientGroupInfo get "taxes") get _typeSell;
			if (_tax > 0) then {
				_tax = _price * (_tax / 100);
				_price = _price - _tax;
				[player getVariable ["GroupId",-1],"add",_tax] remoteExecCall ["RRPServer_groups_moneyChange",2];
			};
		};

		[
			[
				player,
				_typeCash,
				"add",
				_price,
				[format["%1 (%2) продал %3 в количестве %4 за %5 %6",(name player),(getPlayerUID player),(getText(missionConfigFile >> "VirtualItems" >> _type >> "displayName")),_amount,[_price] call RRPClient_util_numberText],"VirtSellLog"]
		],"system_moneyChange"] call RRPClient_system_hcExec;


		if ((_type call RRPClient_economy_getResInfo select 4) > 0) then 	{
			["addSelled",_type,_amount] remoteExecCall ["RRPServer_economy_updateStatus",2];

			_communityGoalsItems = missionNamespace getVariable ["RRPServer_communityGoalsItems", createHashMap];
			_communityGoalId = _communityGoalsItems getOrDefault [_type, -1];
			if (_communityGoalId isNotEqualTo -1) then {[getPlayerUID player, _communityGoalId, _amount] remoteExecCall ["RRPServer_cg_updateParticipation", 2]};
		};

		if (_type isEqualto getText(missionConfigFile >> "CfgFed" >> "awardItem")) then {[player, "serverbank", "take", _price] remoteExecCall ["RRPServer_system_moneyChange", 2]};

		call RRPClient_system_virt_update;
		call RRPClient_system_saveGear;
		['million',_price] call RRPClient_ach_gateway;
		life_action_inUse = false;

		["SuccessTitleAndText", ["Ресурс продан", _successText]] call SmartClient_gui_toaster_addTemplateToast;
	} else {
		["SrrorTitleAndText", ["Ошибка при продаже", ""]] call SmartClient_gui_toaster_addTemplateToast;
	}
} catch {
	["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
	life_action_inUse = false;
};
