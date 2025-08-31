/*
	Project: Rimas Role Play
	Authors: Arrra & FairyTale5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
private _type = param [0,0,[0]];
if (_type isEqualTo 0) exitWith {};
private _data = [(player call getFullName),(getpos life_corpse),"Мне нужна помощь, я попал в аварию ! ~ Это автоматическое сообщение, отправленное с моего телефона",serverTime,"",player,0];

switch (_type) do { 
    case 1 : {
        [life_corpse,player call getNickName] remoteExecCall ["RRPClient_system_medicRequest",allPlayers select {_x call getSide == "cop"}];
        RRPClient_waiting_cop_calls pushBack _data;
        publicVariable "RRPClient_waiting_cop_calls";
    }; 
    case 2 : {
        [life_corpse,player call getNickName] remoteExecCall ["RRPClient_system_medicRequest",allPlayers select {_x call getSide == "med"}];
        RRPClient_waiting_med_calls pushBack _data;
        publicVariable "RRPClient_waiting_med_calls";
    };
};