/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

disableSerialization;
params [
	["_action","request",[""]]
];
try
{
	private _takeButton = ((findDisplay 4800) displayCtrl 4809);
	switch _action do
	{
		case "request": {
			if (RRPClientAtmWaitingResponse) throw "Сервер еще не обработал ваш запрос";
			_item = lbData[4802,lbCurSel 4802];
			if (_item isEqualTo "") throw "Вы ничего не выбрали";
			if ([life_gang_box] call RRPClient_system_isTrunkInUse) then {
				closeDialog 0;
				throw "Хранилище уже используется."
			};
			_num = ctrlText 4805;
			if !([_num] call RRPClient_system_isNumber) throw "Используйте только цифры";
			_num = parseNumber _num;
			if (_num <= 0) throw "Число должно быть больше нуля";
			_itemInfo = [_item] call RRPClient_util_itemDetails;
			if (_itemInfo isEqualTo []) throw "Не были получены данные о предмете";
			if !([_item] call RRPClient_system_canUseItem) throw "Вы не можете использовать данный предмет";
			_boxInventory = life_gang_box getVariable ["inventory",[[],0]];
			_playerItems = call RRPClient_util_getplayeritems;
			_boxInventory params ["_containerItems","_containerWeight"];

			_itemCaregory = _itemInfo select 4;
			_itemType = _itemInfo select 5;
			_itemWeight = _itemInfo select 6;
			_condition = _itemInfo select 13;
			_indexH = [_item,_containerItems] call RRPClient_system_index;

			if ([_condition] call RRPClient_util_conditionsCheck) throw "Этот предмет опасно держать в доме!";
			if (_indexH isEqualTo -1) throw "У вас нет такого предмета в хранилище";
			if (_itemCaregory isEqualTo "Equipment" && (_num > 1)) throw "Предметы одежды можно забирать только по одному";

			_val = (_containerItems select _indexH) select 1;
			if (_num > _val) throw "У вас нет такого количества предметов в хранилище";
			_takeButton ctrlEnable false;
			RRPClientAtmWaitingResponse = true;
			[SessionId, life_gang_box, "check", _item, _num] remoteExecCall ["RRPServer_containers_gang_take",2];
		};
		case "response": {
			_item = param [1,"",[""]];
			_num = param [2,0,[0]];
			_itemInfo = [_item] call RRPClient_util_itemDetails;
			_boxInventory = life_gang_box getVariable ["inventory",[[],0]];

			_boxInventory params ["_containerItems","_containerWeight"];
			_indexH = [_item,_containerItems] call RRPClient_system_index;

			_itemCaregory = _itemInfo select 4;
			_itemType = _itemInfo select 5;
			_itemWeight = _itemInfo select 6;
			_condition = _itemInfo select 13;

			if ([_condition] call RRPClient_util_conditionsCheck) throw "Этот предмет опасно держать в доме!";
			private _added = false;
			private _misc = false;
			private _numReal = 0;
			private _message = "";

			switch (_itemType) do {
				case "Uniform":
				{
					if !(uniform player isEqualTo "") then
					{
						_added = [_item] call RRPClient_system_addItemToInventory;
						if !(_added) then {_message = "Слот униформы занят и нет места в инвентаре. Или уберите текущую униформу, или освободите место в инвентаре."};
					} else {
						_added = [_item] call RRPClient_system_addItem;
						if !(_added) then {_message = "Не удалось добавить униформу"};
					};
				};
				case "Vest":
				{
					if !(vest player isEqualTo "") then
					{
						_added = [_item] call RRPClient_system_addItemToInventory;
						if !(_added) then {_message = "Слот бронежилета занят и нет места в инвентаре. Или уберите текущий бронежилет, или освободите место в инвентаре."};
					} else {
						_added = [_item] call RRPClient_system_addItem;
						if !(_added) then {_message = "Не удалось добавить бронежилет"};
					};
				};
				case "Backpack":
				{
					if (backpack player isEqualTo "") then {
						_added = [_item] call RRPClient_system_addItem;
						if !(_added) then {_message = "Не удалось добавить рюкзак"};
					} else {
						_message = "Нельзя положить рюкзак в рюазак. Уберите или выкиньте текущий!";
					};
				};

				default
				{
					for "_x" from 1 to _num do
					{
						if ([_item] call RRPClient_system_addItem) then {
						_numReal = _numReal + 1;
						_misc = true;
						};
					};
					if (_numReal > 0) then
					{
						_added = true;
						if (_numReal > 1) then
						{
							_message = format["Взято из хранилища %1: %2 из %3",_itemInfo select 1,_numReal,_num];
						};
					} else {_message = "Не удалось добавить"};
				};
			};

			if !(_added) then {
				RRPClientAtmWaitingResponse = false;
				throw (format["%1",_message])
			};

			if (_message isEqualTo "") then {
				["SuccessTitleAndText",["Хранилище","Предмет взят из хранилища"]] call SmartClient_gui_toaster_addTemplateToast;
			} else {
				["SuccessTitleAndText",["Хранилище",_message]] call SmartClient_gui_toaster_addTemplateToast;
			};

			if (_misc) then {
				_num = _numReal;
			};
			_val = (_containerItems select _indexH) select 1;
			if ((_val - _num) isEqualTo 0) then {
				_containerItems deleteAt _indexH;

			} else {
				_containerItems set[_indexH,[_item,_val - _num]];
			};
			_containerWeight = _containerWeight - (_itemWeight * _num);
			[player,"storeitem"] remoteExecCall ["RRPClient_system_say3d",0];

			[SessionId, life_gang_box, "save", _containerItems, _containerWeight] remoteExecCall ["RRPServer_containers_gang_take",2];

		};
		case "success": {
			_takeButton ctrlEnable true;
			RRPClientAtmWaitingResponse = false;
			[nil,(uiNamespace getVariable["GangBox_Filter",0])] call RRPClient_containers_gang_filterChanged;
		};
		case "error": {
			_takeButton ctrlEnable true;
			RRPClientAtmWaitingResponse = false;
			throw (param [2,"",[""]]);
		};
	};
}catch{
	["ErrorTitleAndText",["Хранилище",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true
