
private["_position", "_direction", "_popTabs"];
_position = _this select 0;
_direction = _this select 1;
_popTabs = _this select 2;
player removeWeapon (handGunWeapon player);
player switchMove "";
player setPosASL _position;
player setDir _direction;
["",true] call RRPClient_system_animDo;
RRPClientIsPlayingRussianRoulette = false;
RRPClientRussianRouletteChair = objNull;
RRPClientRussianRouletteCanEscape = false;
RRPClientRussianRouletteCanFire = false;
call RRPClient_russianRoulette_hide;
true call RRPClient_hud_show;
["patron",1] call RRPClient_ach_gateway;
["SuccessTitleAndText", ["Поздравляем!", format ["Вы выиграли в Русскую рулетку!<br/><br/>Ваш выигрыш составил $%1", [_popTabs] call RRPClient_util_numberText]]] call SmartClient_gui_toaster_addTemplateToast;
