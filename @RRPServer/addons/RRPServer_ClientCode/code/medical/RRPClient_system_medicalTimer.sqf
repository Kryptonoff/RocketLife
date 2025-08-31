disableSerialization;
params ["_unit","_txtCtrl","_mode"];

if (player getVariable ["RRPVariablePartyMeatActive",false]) then {
	RRPClientPartyRespawn = false;
	RRPClientPartyMeatDeathTimer = 7 + time;
	waitUntil {
		uisleep 1;
		_txtCtrl ctrlSetStructuredText parseText format ["<t size='1.15' align='center' valign='middle'><br/>Возрождение через: <t color='#f30404'>%1</t></t>", [(RRPClientPartyMeatDeathTimer - time),"MM:SS"] call BIS_fnc_secondsToString];
		(RRPClientPartyMeatDeathTimer - time) <= 0
	};
	RRPClientPartyRespawn = true;
	_txtCtrl ctrlSetStructuredText parseText "<t size='1.15' align='center' valign='middle'><br/>Нажмите R для возрождения</t>";

} else {
	if (_mode) then	{
			RRPClientDeathTimeReqMedic = time + (getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_respawn_timer") * 30)
		} else {
			RRPClientDeathTimeReqMedic = time + (10 * 60)
		};

	life_deathScreen_canRespawn = false;
	waitUntil {
		uisleep 1;
		if (getOxygenRemaining player < 0.5) then {
			player setOxygenRemaining 1;
		};
		_txtCtrl ctrlSetStructuredText parseText format ["<t size='1.15' align='center' valign='middle'><br/>Смерть доступна через <t color='#f30404'>%1</t></t>", [(RRPClientDeathTimeReqMedic - time),"MM:SS"] call BIS_fnc_secondsToString];
		(RRPClientDeathTimeReqMedic - time) <= 0 OR (isNull (uiNamespace getVariable ["Death_Screen_V2",displayNull]))
	};

	if !(isNull (uiNamespace getVariable ["Death_Screen_V2",displayNull])) then {
		life_deathScreen_canRespawn = true;
		_txtCtrl ctrlSetStructuredText parseText format ["<t size='1.15' align='center' valign='middle'><br/>Нажмите <t color='#f30404'>R</t> чтобы умереть...</t>"];
	};
}
