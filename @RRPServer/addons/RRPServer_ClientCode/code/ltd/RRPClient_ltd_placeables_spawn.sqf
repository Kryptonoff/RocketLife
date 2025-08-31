/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
try{
	disableSerialization;

	if (EQUAL((lbCurSel 9601),-1)) throw "Вы ничего не выбрали";
	private _className = CONTROL_DATA(9601);
	private _name = ctrlText 9604;
	private _countName = count _name;
	if ([getPos player,250] call RRPClient_ltd_world_isStoreInRange) throw "В радиусе 250 метров уже есть магазин, выберите другое место!";
	if (_name isEqualTo "") throw "Нужно дать имя магазину!";
	if (_countName < 2 OR {_countName > 15}) throw "Название магазина не может быть меньше двух симоволов или больше 15ти";

	private _alph = getText(missionConfigFile >> "LifeCfgSettings" >> "allowAlphabet");
	private _index = [_name,_alph] call RRPClient_util_containsForbiddenCharacter;
	if !(_index isEqualTo -1) throw format ["Нельзя использовать '%1'!",_index];

	closeDialog 0;
	_array = parseSimpleArray _className;
	_className = _array select 0;
	_variable = _array select 1;
	RRPClientLTDsStoreData = [_array,_name];

	life_container_active = true;
	_object = _className createVehicle [0,0,0];

	life_container_activeObj = _object;
	_attachPos = [0.16, 3, ((boundingBoxReal _object) select 1) select 2];

	_object attachTo [player, _attachPos];

	[_object] call RRPClient_ltd_buildStore;

	clearWeaponCargoGlobal _object;
	clearMagazineCargoGlobal _object;
	clearItemCargoGlobal _object;
	clearBackpackCargoGlobal _object;

	titleText ["Намите пробел, чтобы установить!", "PLAIN"];
}catch{
	["ErrorTitleAndText",["Бизнес",_exception]] call toast;
};