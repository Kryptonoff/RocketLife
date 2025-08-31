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
private ['_curItem','_rRecipe','_complete','_itemName','_type', '_item', '_amount','_finalItem','_Finalamount','_TimeAction','_time',"_CoefAmount","_textForLog"];
life_action_inUse = true;

_curItem  = uiNamespace getVariable ['curItemInfo',[[]]];
_rRecipe  = uiNamespace getVariable ['ReadyRecipes',[[]]];
_itemName = format['Создается %1, пожалуйста подождите...',_curItem select 0];
_finalItem   = _curItem select 3;
_TimeAction  = _curItem select 4;
_Finalamount = _rRecipe select 2;
_CoefAmount  = _rRecipe select 3;

_time = round(_Finalamount * _TimeAction);
_time = ["saveTimeAction",_time] call RRPClient_system_VIP;
closeDialog 0;

_complete = [_itemName,{!(speed player > 4) and ((player getVariable ["lifeState",""]) isEqualTo "HEALTHY") and (alive player)},true,_time,false,true,{call RRPClient_animation_kneelWork}] call RRPClient_system_newProgressBar;
if (isNil "_complete") Exitwith {};
if !(_complete) Exitwith {life_action_inUse = false};
_textForLog = "";
{
    _type   = _x select 0;
    _item   = _x select 1;
    _amount = _x select 2;
    _textForLog = _textForLog + _item + " X" +  (str _amount);
    if (_type isEqualto'virtual') then {
      [false,_item,_amount] call RRPClient_system_handleInv;
    } else {
       for'_i' from 0 to _amount step 1 do {player removeItem _item};
    };
} forEach (_rRecipe select 0);

if ((call (life_adminlevel) > 0) and !((getPlayerUID player) isEqualTo "76561197984276591")) then {
  systemChat format ["DEBUG: %1",_rRecipe];
};

if ((_curItem select 2) isEqualto 'virtual') then {
  if ([true,_finalItem,(_Finalamount * _CoefAmount)] call RRPClient_system_handleInv) then {
    [[[_finalItem,(_Finalamount * _CoefAmount)]],'virtual',0] call RRPClient_farm_util_notificationADDitems;
  }
  } else {
    for'_i' from 1 to (_Finalamount * _CoefAmount) step 1 do {[_finalItem] call RRPClient_inventory_addItemToInventory};
    [[[_finalItem,(_Finalamount * _CoefAmount)]],'Physical',0] call RRPClient_farm_util_notificationADDitems;
};

[format["%1 CRAFTING %2 IN %3 X%4",(getPlayerUID player),_textForLog,_finalItem,(_Finalamount * _CoefAmount)],"CraftingLog"] remoteExecCall ["RRPServer_system_logIt",2];
['crafter',_Finalamount] call RRPClient_ach_gateway;
life_action_inUse = false;
