if (RRPClientLTDsData isEqualTo []) exitWith {
	["У вас нет компании! Вы можете зарегистрировать ее в офисе правительства!","Сделаю!"] call RRPClient_tablet_showWarning;
};
["ltds",1] call RRPClient_tablet_slide;

// ["refresh","main"] call RRPClient_ltds_ltd_actions;
