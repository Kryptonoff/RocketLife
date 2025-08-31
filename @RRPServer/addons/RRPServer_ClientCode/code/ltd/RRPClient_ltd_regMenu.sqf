/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
if !(EQUAL(RRPClientLTDsData,[])) exitWith {["ErrorTitleAndText",["Бизнес","У вас уже есть компания"]] call toast};
disableSerialization;
createDialog "UnionDialogRegisterLTD";
waitUntil {!isNull (findDisplay 7100)};

private _info = CONTROL(7100,7101);

_info ctrlSetStructuredText parseText "<t size='0.85'>При регистрации вы должны внести в уставной капитал сумму в размере <t color='#3b7200'>$1000</t><br/>";