/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

disableSerialization;
params [
	["_action","request",[""]]
];
try{
	private _storeButton = ((findDisplay 4800) displayCtrl 4808);
	switch _action do
	{
		case "request": {
			if (RRPClientAtmWaitingResponse) throw "Сервер еще не обработал ваш запрос";
			if ((lbCurSel 4803) isEqualTo -1) throw "Вы ничего не выбрали";
			private _item = (lbData[4803,lbCurSel 4803]);
			private _num = ctrlText 4806;
			if !([_num] call RRPClient_system_isnumber) throw "Укажите количество в цифровом формате, а не символьном";
			_num = parseNumber(_num);
			if (_num < 1) throw "Минус? Серьезно?";
			if (_item isEqualTo "extItem_prisonKey") throw "Данный ключ бесполезно хранить, так как замки все равно уже сменили...";
			if (_item call RRPClient_util_isSaveItem isEqualTo "") throw "Этот ящик слишком ненадежный для такого сокровища...";
			if (_item isEqualTo "EXT_FakePrimaryWeapon") then {
				[_item] call RRPClient_system_removeItem;
				closeDialog 0;
				throw "Данный предмет невозможно хранить";
			};
			private _gangBoxSlots = life_gang_box getVariable ["slots",1];
			if (_gangBoxSlots isEqualTo 0) throw "У вас не добавлены места для хранения вещей";
			private _gangBoxInventory = life_gang_box getVariable ["inventory",[[],0]];
			private _itemClassInfo = [_item] call RRPClient_util_itemDetails;
			private _playerItems = call RRPClient_util_getplayeritems;

			private _containerItems = _gangBoxInventory select 0;
			private _currentWeight = _gangBoxInventory select 1;

			private _maxWeight = (getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_trunkInventoryWeight")) * _gangBoxSlots;
			private _itemWeight = _itemClassInfo select 6;
			private _itemCaregory = _itemClassInfo select 4;
			private _itemType = _itemClassInfo select 5;
			if ((_currentWeight + (_itemWeight *  _num)) > _maxWeight) throw "В хранилище нет необходимого свободного места";

			private _indexP = [_item,_playerItems] call RRPClient_system_index;
			private _indexH = [_item,_containerItems] call RRPClient_system_index;
			if (_num > ((_playerItems select _indexP) select 1)) throw "У вас нет такого количества предметов в инвентаре";
			if (_itemCaregory isEqualTo "Equipment" && {_itemType isEqualTo "Uniform"} && {count(uniformItems player) > 0} && {_item isEqualTo uniform player}) throw "В вашей форме есть вещи. Уберите их прежде чем переместить ее в хранилище!";
			if (_itemCaregory isEqualTo "Equipment" && {_itemType isEqualTo "Vest"} && {count(vestItems player) > 0} && {_item isEqualTo vest player}) throw "В вашем бронежилете есть вещи. Уберите их прежде чем переместить его в хранилище!";
			if (_itemCaregory isEqualTo "Equipment" && {_itemType isEqualTo "Backpack"} && {count(backpackItems player) > 0} && {_item isEqualTo backpack player}) throw "В вашем рюкзаке есть вещи. Уберите их прежде чем переместить его в хранилище!";

			_storeButton ctrlEnable false;
			private _itemsRemoved = false;

			for "_x" from 1 to _num do {
				_itemsRemoved = [_item] call RRPClient_system_removeItem;
			};
			if !(_itemsRemoved) then {
				_storeButton ctrlEnable true;
				RRPClientAtmWaitingResponse = false;
				throw "Ошибка! Не все вещи были удалены из инвентаря при переносе!";
			};
			[SessionId, life_gang_box, "check", _item, _num] remoteExecCall ["RRPServer_containers_gang_store",2];

		};
		case "response": {
			_item = param [1,"",[""]];
			_num = param [2,0,[0]];
			_itemInfo = [_item] call RRPClient_util_itemDetails;
			_itemWeight = _itemInfo select 6;
			_boxInventory = life_gang_box getVariable ["inventory",[[],0]];
			_boxInventory params ["_containerItems","_containerWeight"];
			if (_indexH isEqualTo -1) then {
				_containerItems pushBack [_item,_num];
			} else {
				private _val = (_containerItems select _indexH) select 1;
				_containerItems set[_indexH,[_item,_val + _num]];
			};
			_containerWeight = _containerWeight + (_itemWeight *  _num);
			[SessionId, life_gang_box, "save", _containerItems, _containerWeight] remoteExecCall ["RRPServer_containers_gang_store",2];
			[player,"storeitem"] remoteExecCall ["RRPClient_system_say3d",0];
		};
		case "success": {
			_storeButton ctrlEnable true;
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
