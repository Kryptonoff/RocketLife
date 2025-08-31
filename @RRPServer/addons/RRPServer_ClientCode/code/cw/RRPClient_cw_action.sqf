/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/
["Исправительные работы",format ["За ваши нарушения, вы были отправленны на исправительные работы!<br/><br/>Откройте карту и найдите синий тригер - «Территория исправительных работ» в нем помечены черные точки(мусор) и синий маркер(точка сдачи)<br/>Ваша задача собирать мусор и относить на точку сдачи.<br/>Что-бы собрать мусор подойдите к нему и наведитесь на него после чего зажмите [ПРОБЕЛ]<br/>Стоимость уборки одного мешка мусора оценивается в 50$<br />Ваш долг перед государством: %1 Алтийских $<br /><br /> <br />",[life_jail_coin] call RRPClient_util_numberText]] call RRPClient_system_briefingNotification;
life_garbage_hands_count = 0;
life_cw_marker_status = false;
player setVariable ["corrective_work",true,true];

private _actionTakeTrash = [
player,
"Собрать мусор",
"",
"",
"(alive player) && life_garbage_action_status && (!(vehicle player != player)) && !(life_action_inUse) && !(player getVariable [""restrained"",false]) && (life_garbage_hands_count <= 5)",
"(!(vehicle player != player)) && (alive player) && life_garbage_action_status && !(life_action_inUse) && !(player getVariable [""restrained"",false])",
{},
{
	if (animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon") then {
	player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	};
},
{
	if (life_garbage_action_status) then {
		private _arrayObject = +[];
		_arrayObject = nearestObjects [player, ["Land_Garbage_line_F","Land_Garbage_square3_F","Land_Garbage_square5_F"], 2];
		if (count _arrayObject > 0) then {
			if ((_arrayObject select 0) getVariable ["garbageCW",false]) then {
				["InfoTitleAndText", ["<t font = 'robotoCondensedBold'>Исправительные работы</t>", format["<t font = 'robotoCondensed' >Вы подобрали мешок с мусором %1/5<br/>Сумма отработки: %2 </t>",life_garbage_hands_count,life_jail_coin]]] call SmartClient_gui_toaster_addTemplateToast;
				private _tmpArray = +[];
				_tmpArray = life_cw_object_array - [(_arrayObject select 0)];
				life_cw_object_array = _tmpArray;
				deleteVehicle (_arrayObject select 0);
				life_garbage_hands_count = life_garbage_hands_count + 1;
			} else {
			["ErrorTitleAndText", ["Ошибка!", "Вам не удалось собрать мусор"]] call SmartClient_gui_toaster_addTemplateToast;
			};
		} else {
		["ErrorTitleAndText", ["Ошибка!", "Вам не удалось собрать мусор"]] call SmartClient_gui_toaster_addTemplateToast;
		};
	} else {
	["ErrorTitleAndText", ["Ошибка!", "Вам не удалось собрать мусор"]] call SmartClient_gui_toaster_addTemplateToast;
	};
},
{
	["ErrorTitleAndText", ["Ошибка!","Действие прервано, повторите еще раз!"]] call SmartClient_gui_toaster_addTemplateToast;
},
[],
4,
16,
false,
false] call BIS_fnc_holdActionAdd;

private _actionSaleTrash = [garbage_container_1,
"Выбросить мусор",
"",
"",
"(alive player) && (!(vehicle player != player)) && !(life_action_inUse) && !(player getVariable [""restrained"",false]) && (_this distance _target < 3) && (life_garbage_hands_count > 0)",
"((!(vehicle player != player)) && (alive player) && (_caller distance _target < 3) && !(life_action_inUse) && !(player getVariable [""restrained"",false]))",
{},
{
	if (animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon") then {
		player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	};
},
{
	["InfoTitleAndText", ["Исправительные работы", format ["Вы выбросили %1 мешок(ов) мусора",life_garbage_hands_count]]] call SmartClient_gui_toaster_addTemplateToast;
	private _tmp = life_jail_coin;
	_tmp = (_tmp - (life_garbage_hands_count * 50));
	if (_tmp < 0) then {_tmp = 0};
	life_jail_coin = _tmp;
	life_garbage_hands_count = 0;
	[25] call RRPClient_session_updatePartial;
},
{
	["ErrorTitleAndText", ["Инфо","Действие прервано, повторите еще раз!"]] call SmartClient_gui_toaster_addTemplateToast;
},
[],
4,
16,
false,
false] call BIS_fnc_holdActionAdd;

while {(life_jail_coin > 0) && alive player} do {
	private _arrayObject = +[];
	_arrayObject = nearestObjects [player, ["Land_Garbage_line_F","Land_Garbage_square3_F","Land_Garbage_square5_F"], 2];
	if (count _arrayObject > 0) then {
		if ((_arrayObject select 0) getVariable ["garbageCW",false]) then {
			life_garbage_action_status = true;
		} else {
			life_garbage_action_status = false;
		};
	} else {
		life_garbage_action_status = false;
	};
	if (visibleMap && !life_cw_marker_status) then {
		life_cw_marker_status = true;

		[] spawn {
			private _markers = +[];
			{
				if !(isNull _x) then {
					private _marker = createMarkerLocal [format["%1_garbage_marker",_forEachIndex],visiblePosition _x];
					_marker setMarkerColorLocal "ColorBlack";
					_marker setMarkerTypeLocal "mil_join";
					_markers pushBack _marker;
				};
			} forEach life_cw_object_array;

			waitUntil {!visibleMap};
			{deleteMarkerLocal _x} foreach _markers;
			life_cw_marker_status = false;
		};
	};

	if (count life_cw_object_array < 10) then {
		[20] call RRPClient_cw_createGarbage;
	};

	uiSleep 1;
};

private _marker_name_1 = getText(missionConfigFile >> "LifeCfgSettings" >> "MarkerCW_1");
private _marker_name_2 = getText(missionConfigFile >> "LifeCfgSettings" >> "MarkerCW_2");
private _marker_name_3 = getText(missionConfigFile >> "LifeCfgSettings" >> "MarkerCW_3");
{deleteMarkerLocal _x} foreach [_marker_name_1,_marker_name_2,_marker_name_3];

[player,_actionTakeTrash] call BIS_fnc_holdActionRemove;
[player,_actionSaleTrash] call BIS_fnc_holdActionRemove;
{deleteVehicle _x} forEach life_cw_object_array;
player setVariable ["corrective_work",nil,true];
life_cw_object_array = nil;
life_cw_marker_status = nil;
life_garbage_action_status = nil;
life_garbage_hands_count = nil;

if (life_jail_coin <= 0) then {
	["SuccessTitleAndText", ["Исправительные работы","Вы отработали долг перед государством!"]] call SmartClient_gui_toaster_addTemplateToast;
};
