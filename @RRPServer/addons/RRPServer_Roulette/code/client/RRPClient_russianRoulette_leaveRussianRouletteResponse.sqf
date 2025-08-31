
private["_position", "_direction"];
_position = _this select 0;
_direction = _this select 1;
player removeWeapon (handGunWeapon player);
player switchMove "";
player setPosASL _position;
player setDir _direction;
["",true] call RRPClient_system_animDo;
RRPClientIsPlayingRussianRoulette = false;
RRPClientRussianRouletteChair = objNull;
RRPClientRussianRouletteCanEscape = false;
RRPClientRussianRouletteCanFire = false;
call SmartClient_gui_toaster_removealltoasts;
true call RRPClient_hud_show;
call RRPClient_russianRoulette_hide;
