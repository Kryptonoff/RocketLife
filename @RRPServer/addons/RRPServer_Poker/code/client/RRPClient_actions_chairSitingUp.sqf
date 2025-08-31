
["stand"] call RRPClient_system_animDo;

//FIX правельной посадки на стул (PS на всякий случий подключу хотя эта функция не на что не вилияла в паркуре во время тестов)
["EH_em_walkonstuff", {true}, [], babe_em_fnc_walkonstuff, [], false, {}, [], -1] call babe_core_fnc_addEH;