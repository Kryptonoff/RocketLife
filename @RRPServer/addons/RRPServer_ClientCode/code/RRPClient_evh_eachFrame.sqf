
if (cursorObject getVariable ["donMachine", false] && {player distance cursorObject < 5}) then {
	if ((cursorObject getVariable ["multiplier", -1]) > 0) then {
		99999 cutText ["<t font='PuristaLight' size='1.2'>НАЖМИТЕ </t><t font='PuristaBold' size='1.2' color='#cc0000'>[E] </t><t font='PuristaLight' size='1.2'>СЫГРАТЬ ""ВСЕ ИЛИ НИЧЕГО"" ($1000)</t><br/><t font='PuristaLight' size='1.2'>НАЖМИТЕ </t><t font='PuristaBold' size='1.2' color='#298A08'>[F] </t><t font='PuristaLight' size='1.2'>ЧТОБЫ ЗАБРАТЬ ВЫИГРЫШ</t>", "PLAIN DOWN", 0.01, false, true];
	} else {
		99999 cutText ["<t font='PuristaLight' size='1.2'>НАЖМИТЕ </t><t font='PuristaBold' size='1.2' color='#cc0000'>[E] </t><t font='PuristaLight' size='1.2'>СЫГРАТЬ ""ВСЕ ИЛИ НИЧЕГО"" ($1000)</t>", "PLAIN DOWN", 0.01, false, true];
	};
};