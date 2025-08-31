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
if (life_action_inUse) exitWith {};
life_action_inUse = true;
uiSleep 0.5;
private ['_FinalItem','_amountEXP','_item','_multiplierCombo','_addItemsArray','_chance','_itemsArray','_profName','_prof','_curlvl','_maxLVL','_CursorObj','_defaultTime','_time','_animation','_complete','_Amount'];
try {
	_CursorObj = _this select 0;
	if (_CursorObj getVariable ['abuse',false]) throw 'Там уже кто-то ищет!';
	_DefaultTime = 30;
	_Amount = 3;

	_animation = if ([_CursorObj] call RRPClient_util_getModelName in ['tyres_f','garbagebags_f']) then {'CL3_anim_GatheringIn1'} else {'AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon'};

	_profName = 'Maroder';
	_prof   = missionNamespace getVariable [_profName,[]];
	_curlvl = _prof select 0;
	_maxLVL = 30;

	_time   = [_maxLVL,_curlvl,_DefaultTime] call RRPClient_util_countSavingTime;

	if ((call (life_adminlevel) > 0) and !((getPlayerUID player) isEqualTo "76561197984276591")) then {
		hint format ["DEBUG | time: %1",_time];
		_time = 3;
	};

	_CursorObj setVariable ['abuse',true,true];
	_complete = ["Ищем ценности...",{(speed player < 4) and ((player getVariable ["lifeState",""]) isEqualTo "HEALTHY") and (alive player)},true,_time,false,true,{player playActionNow _animation; playSound selectRandom ["Glass_3","Glass_2","Glass_1","Doska_2","Doska_1","Bumaga_3","Bumaga_2","Bumaga_1","Bak_3","Bak_2","Bak_1"]}] call RRPClient_system_newProgressBar;
	if (isNil "_complete") throw "Действие прервано";
	if !(_complete)  throw 'Действие прервано';

	if (player getVariable ['lifeState',''] in ['RESPAWN','INCAPACITATED','DEAD']) throw '';

	_Amount = (round random _Amount);
	if (_Amount isEqualTo 0) throw 'К сожалению в этой куче нет ничего ценного';
	_itemsArray   = [];
	_chance       = (round random 100);

	for '_i' from 1 to _Amount step 1  do {
		_item = selectRandom ['RRP_Treasure_1','RRP_Treasure_2','RRP_Treasure_3','RRP_Treasure_4','RRP_Treasure_5','RRP_Treasure_6',"RRP_Treasure_7","RRP_Treasure_8"];
		_itemsArray pushBack _item;
	};

	 _addItemsArray = _itemsArray call BIS_fnc_consolidateArray;

	 [_addItemsArray,'virtual'] call RRPClient_farm_util_notificationADDitems;
	 _amountEXP = [12,_curlvl,_profName] call RRPClient_farm_util_countAmountXP;
	 [_profName,_amountEXP] call RRPClient_skills_addXP;
	 [12, "добычу"] call addXP;

	{
	_FinalItem = _x select 0;
	_Amount    = _x select 1;
	if !([true,_FinalItem,_Amount] call RRPClient_system_handleInv) Exitwith {
			['WarningTitleAndText', ['Инвентарь', 'Ваш инвентарь переполнен!']] call SmartClient_gui_toaster_addTemplateToast;
		};
	} forEach _addItemsArray;
	[_CursorObj] remoteExec ['RRPServer_system_HideObject',2];
	life_action_inUse = false;
} catch {
	life_action_inUse = false;
	_CursorObj setVariable ['abuse',nil,true];
	['WarningTitleAndText', ['Ошибка!', _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
