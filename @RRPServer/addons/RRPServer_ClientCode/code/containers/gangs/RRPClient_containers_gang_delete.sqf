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
	private _takeButton = ((findDisplay 4800) displayCtrl 4810);
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
			//if !([_item] call RRPClient_system_canUseItem) throw "Вы не можете использовать данный предмет";
			_boxInventory = life_gang_box getVariable ["inventory",[[],0]];
			_playerItems = call RRPClient_util_getplayeritems;
			_boxInventory params ["_containerItems","_containerWeight"];

			_itemCaregory = _itemInfo select 4;
			_itemType = _itemInfo select 5;
			_itemWeight = _itemInfo select 6;

			_indexH = [_item,_containerItems] call RRPClient_system_index;

			if (_indexH isEqualTo -1) throw "У вас нет такого предмета в хранилище";
			if (_itemCaregory isEqualTo "Equipment" && (_num > 1)) throw "Предметы одежды можно забирать только по одному";

			_val = (_containerItems select _indexH) select 1;
			if (_num > _val) throw "У вас нет такого количества предметов в хранилище";
			_takeButton ctrlEnable false;
			RRPClientAtmWaitingResponse = true;
			[SessionId, life_gang_box, "check", _item, _num] remoteExecCall ["RRPServer_containers_gang_delete",2];
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
			["SuccessTitleAndText",["Хранилище","Предмет удален из хранилища"]] call SmartClient_gui_toaster_addTemplateToast;
			_val = (_containerItems select _indexH) select 1;
			if ((_val - _num) isEqualTo 0) then {
				_containerItems deleteAt _indexH;
			} else {
				_containerItems set[_indexH,[_item,_val - _num]];
			};
			_containerWeight = _containerWeight - (_itemWeight * _num);
			[player,"storeitem"] remoteExecCall ["RRPClient_system_say3d",0];

			[SessionId, life_gang_box, "save", _containerItems, _containerWeight] remoteExecCall ["RRPServer_containers_gang_delete",2];
			_takeButton ctrlEnable true;
			RRPClientAtmWaitingResponse = false;
			[nil,(uiNamespace getVariable["GangBox_Filter",0])] call RRPClient_containers_gang_filterChanged;

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
