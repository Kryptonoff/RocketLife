if ((call RRPClient_garage_limitMultiplier) <= player getVariable ["CountVehicles",0]) throw format ["У вас не осталось места в гараже, Вам доступно иметь максимум %1 единиц техники! Сейчас в гараже %2 единиц транспорта!",
call RRPClient_garage_limitMultiplier,
player getVariable ["CountVehicles",0]];