/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

params [
	"_mode",
	["_object",objNull]
];

try
{

switch _mode do 
{
	case "openManage": {
		
		if (isNull _object) throw "Контейнер не определен, попробуйте еще раз";
		if (_object getVariable ["t_owner","-1"] isEqualTo "-1") throw "Контейнер публичный, настройки недоступны";
		if (_object getVariable ["t_owner","-1"] isNotEqualTo getPlayerUID player) throw "Вы не имеете доступа к настройкам";
		createDialog "RRPDialogContainerManage";

		private _display = uiNamespace getVariable ["RRPDialogContainerManage", displayNull];
		
		_display setVariable ["C_Object",_object];
		["refreshDialog"] call RRPClient_containers_gang_manage;
		
	};
	case "setColor": {
		private _display = uiNamespace getVariable ["RRPDialogContainerManage", displayNull];
		private _object = _display getVariable ["C_Object",objNull];
		private _color = lbData[26207,lbCurSel 26207];
		if (_color isEqualTo "") throw "Вы ничего не выбрали";

		private _config = missionConfigFile >> "CfgTrunkColors" >> "Coloring" >> _color;
		if !([getText(_config >> "conditions")] call condition) throw "Вам этот цвет недоступен";
		["color",_object,_color] remoteExecCall ["RRPServer_containers_gang_setTexture",2];
	};
	case "setPicture": {
		private _display = uiNamespace getVariable ["RRPDialogContainerManage", displayNull];
		private _object = _display getVariable ["C_Object",objNull];
		private _pic = lbData[26211,lbCurSel 26211];
		if (_pic isEqualTo "") throw "Вы ничего не выбрали";
		private _config = missionConfigFile >> "CfgTrunkColors" >> "Pictures" >> _pic;
		if !([getText(_config >> "conditions")] call condition) throw "Вам этот цвет недоступен";
		["picture",_object,_pic] remoteExecCall ["RRPServer_containers_gang_setTexture",2];
	};
	case "addSlot": {
		
		private _display = uiNamespace getVariable ["RRPDialogContainerManage",displayNull];
		if (isNull (uiNamespace getVariable ["RRPDialogContainerManage",displayNull])) throw "Перезагрузите диалог";
		private _object = _display getVariable ["C_Object",objNull];
		if (isNull _object) throw "Объект не определен";
		["request",_object] call RRPClient_containers_gang_upgrade;
	};
	case "addMember": 
	{
		
		private _display = uiNamespace getVariable ["RRPDialogContainerManage",displayNull];
		if (isNull (uiNamespace getVariable ["RRPDialogContainerManage",displayNull])) throw "Перезагрузите диалог";

		if (RRPClientAtmWaitingResponse) throw "Предыдущее действие еще не обработано";

		private _object = _display getVariable ["C_Object",objNull];
		if (isNull _object) throw "Объект не определен";

		if (_object getVariable ["t_owner","-1"] isNotEqualTo (getPlayerUID player)) throw "Вы не владелец";

		private _idsList = _display displayCtrl 26203;

		private _selected = lbData [26203,lbCurSel 26203];
		if (_selected isEqualTo "") throw "Вы никого не выбрали";

		private _members = _object getVariable ["members",[]]; 
		if (getPlayerUID (objectFromNetId _selected) in _members) throw "Выбранный игрок уже прописан";

		if (count _members >= 2) throw "Достигнут лимит";
	
		[
			(uiNamespace getVariable ["RRPDialogContainerManage", displayNull]),
			{
				params ["_object","_selected"];
				RRPClientAtmWaitingResponse = true;
				[
					"addMember",
					player,
					_object,
					objectFromNetId _selected
				] remoteExecCall ["RRPServer_containers_gang_manage",2];
			},[_object,_selected],
			"Добавить игрока в личный ящик?",
			format ["Добавить игрока %1 в ваш ящик? Это действие стоит %2 RC, удаление бесплатное.",lbText[26203,lbCurSel 26203],getNumber(getMissionConfig "ptw" >> "costInviteToBox")]
		] call RRPClient_util_prompt;

	};
	case "removeMember": {
		
		private _display = uiNamespace getVariable ["RRPDialogContainerManage",displayNull];
		if (isNull (uiNamespace getVariable ["RRPDialogContainerManage",displayNull])) throw "Перезагрузите дисплей";

		if (RRPClientAtmWaitingResponse) throw "Предыдущее действие еще не обработано";

		private _object = _display getVariable ["C_Object",objNull];
		if (isNull _object) throw "Объект не определен";
		
		private _memList = _display displayCtrl 26205;

		_selected = lbData [26205,lbCurSel 26205];
		if (_selected isEqualTo "") throw "Вы никого не выбрали";

		[
			(uiNamespace getVariable ["RRPDialogContainerManage", displayNull]),
			{
				params ["_object","_selected"];
				RRPClientAtmWaitingResponse = true;
				[
					"removeMember",
					player,
					_object,
					_selected
				] remoteExecCall ["RRPServer_containers_gang_manage",2];
			},[_object,_selected],
			"Удалить игрока из доступа в личное хранилище?",
			format ["Удалить игрока %1 в ваш ящик? Это действие бесплатное, но добавление обратно обойдется Вам в %2 RC",lbText[26205,lbCurSel 26205],getNumber(getMissionConfig "ptw" >> "costInviteToBox")]
		] call RRPClient_util_prompt;
	};
	case "response": 
	{
		RRPClientAtmWaitingResponse = false;
		if (_this select 2) then 
		{
			["refreshDialog"] call RRPClient_containers_gang_manage;
		};
	};
	case "refreshDialog": 
	{
		if !(isNull (uiNamespace getVariable ["RRPDialogContainerManage",displayNull])) then 
		{
			private _display = uiNamespace getVariable ["RRPDialogContainerManage", displayNull];
			private _object = _display getVariable ["C_Object",objNull];
			
			private _idsList = _display displayCtrl 26203;
			private _memList = _display displayCtrl 26205;
			private _slotText = _display displayCtrl 26214;
			private _colorList = _display displayCtrl 26207;
			lbClear _colorList;
			private _pictureList = _display displayCtrl 26211;
			lbClear _pictureList;
			private _config = missionConfigFile >> "CfgTrunkColors";
			{
				if !([getText(_x >> "conditions")] call condition) then {continue};
				_index = _colorList lbAdd (getText(_x >> "displayName"));
				_colorList lbSetData [_index,configName _x];
				_colorList lbSetPicture [_index,getText(_x >> "textures")];

			} forEach ("true" configClasses (_config >> "Coloring"));
			{
				if !([getText(_x >> "conditions")] call condition) then {continue};
				_index = _pictureList lbAdd (getText(_x >> "displayName"));
				_pictureList lbSetData [_index,configName _x];
				_pictureList lbSetPicture [_index,getText(_x >> "textures")];
			} forEach ("true" configClasses (_config >> "Pictures"));

			_slotText ctrlSetStructuredText (parseText (format ["Слотов активно - %1<br/>Стоимость улучшения - %2 RC<br/>Доступно слотов доступа - %3/%4<br/>Стоимость добавления игрока в доступ - %5 RC<br/>Удаление бесплатное",
				_object getVariable ["slots",1],
				getNumber(getMissionConfig "ptw" >> "costUpgradeGroupBox"),
				count (_object getVariable ["members",[]]),
				2,
				getNumber(getMissionConfig "ptw" >> "costInviteToBox")]
			));

			lbClear _memList; lbClear _idsList;

			private _members = _object getVariable ["members",[]];
			if (_members isEqualTo []) then 
			{
				_memList lbAdd "НИКТО НЕ ПРОПИСАН";
			}else {
				{
					_member = (_x call RRPClient_util_objectFromPlayerUID);
					if !(isNull _member) then
					{
						_index = _memList lbAdd format ["%1",name _member];
						_memList lbSetData [_index, _x];
					}else{
						_index = _memList lbAdd format ["OFF: %1",_x];
						_memList lbSetData [_index, _x];
						_memList lbSetColor [_index,[128/255, 128/255, 128/255, 1]];
					};
				}forEach _members;
			};
			
			_collect_players = {
				private _ids = life_ids apply {
					private _o = (_x select 0) call RRPClient_util_objectFromPlayerUID;
					if (!isNull _o) then {
						_o
					};
				};
				_ids = _ids + (units (group player));
				_a = [];
				{
					if (_x isNotEqualTo player) then
					{
						_a pushBackUnique _x;
					};
				}forEach _ids;
				_ids = nil;
				_a
			};

			_ids = call _collect_players;
			if (_ids isEqualTo []) then 
			{
				_idsList lbAdd "Требуется паспорт";
				_idsList lbAdd "Или нахождение в тусовке";
			}else{
				{
					_index = _idsList lbAdd format ["%1", name _x];
					_idsList lbSetData [_index, netId _x];
				}forEach _ids;
			};
		};
	};
};

}catch{
	["ErrorTitleAndText",["Личный контейнер",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true
