/*
	Filename: 	RRPClient_system_buyHouseDone.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
try{
	private _house = param [0,ObjNull,[ObjNull]];
	private _housePos = param [1,[],[[]]];
	private _name = _this # 2;
	if (isNull _house or EQUAL(_housePos,[])) throw "Что-то не так с домом";
	if (!isClass (missionConfigFile >> "LifeCfgHousing" >> worldName >> typeOf _house)) throw "Здание не продается";

	private _price = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"price");
	if (BANK < _price) throw "Вам не хватает денег!";

	[steamid,_house,player,_name] remoteExec ["RRPServer_house_addHouse",2];
	_house SVAR ["house_owned",true,true];

	_house SVAR ["house_owner",[steamid,GVAR_RNAME(player)],true];
	_house SVAR ["locked",true,true];
	[_house,"house_forSell"] call RRPClient_system_clearGlobalVar;
	[player,"atm","take",STR(_price)] remoteExecCall ["RRPServer_system_moneyChange",2];

	_log = format ["buyHouseDone: atm (take) %3 to NAME:%1 (%2)",name player,getPlayerUID player,_price];	
	["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];

	life_tmp_tax = life_tmp_tax + _price;	
	life_vehicles pushBack _house;

	//houses.pos, houses.classname
	life_houses pushBack [_housePos,typeOf _house];
	life_houses_count = life_houses_count + 1;

	life_netID_houses pushBack (netID _house);
	_house setVariable ["buyed_in_session",true,true];
	private _houseName = FETCH_CONFIG2(getText,"CfgVehicles",typeOf _house,"displayName");
	_nameHouse = _house getVariable ["house_name",""];
	private _markerID = round (_housePos select 0);
	private _marker = createMarkerLocal [format["house_%1",_markerID],_housePos];
	_marker setMarkerTextLocal format["%1",_nameHouse];
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	private _numOfDoors = FETCH_CONFIG2(getNumber,"CfgVehicles",typeOf _house,"numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house SVAR[format["bis_disabled_Door_%1",_i],1,true];
	};
	["SuccessTitleAndText",["Поздравляем! Вы купили дом!"]] call toast;
	["house",1] call RRPClient_ach_gateway;

	[(100 * getNumber(missionConfigFile >> "LifeCfgHousing" >> worldName >> typeOf _house >> "numberCrates")) max 50 ,"покупку недвижимости"] call addXP;
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};