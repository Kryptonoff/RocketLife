while {true} do
{
	waitUntil {!isNull (findDisplay 602)};
	{
		if ((isPlayer _x && _x != player) && (alive _x)) then {
			_backpack = backpackContainer player;
			_backpack_x = backpackContainer _x;
			if(_backpack isEqualTo _backpack_x)then{
				// _message = format["Попытка дюпа от %1",profilename];
				// [_message,1] remoteExecCall ["TON_fnc_moneyHackLog",2];
				removeBackpack player;
				// [_killerPID,999999,"Dupe backpack"] remoteExecCall ["RRPServer_DB_addBan",RSERV];
			};
		};
	} forEach nearestObjects [player, ["C_man_1","C_man_polo_6_F","C_man_1_2_F","C_man_polo_1_F","C_man_1_3_F","C_man_polo_4_F","B_medic_F"], 20];
	uiSleep 3;
};