/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

disableSerialization;
try
{
	if (lbCurSel 2802 isEqualTo -1) throw "Вы ничего не выбрали";
	private _dataArr = (lbData[2802,lbCurSel 2802]);
	private _dataArr = call compile format["%1",_dataArr];
	private _vehicle = _dataArr select 0;
	private _vid = (lbValue[2802,lbCurSel 2802]);
	private _keyMode = (lbValue[2815,lbCurSel 2815]);
	if (isNil "_vehicle") throw "Ошибка при выборе...";
	if (_vehicle in (getArray(missionConfigFile >> "LifeCfgSettings" >> "life_vShop_trucks")) && {life_garage_isHouse}) throw "Грузовой транспорт нельзя достать из частного гаража.";
	if (isWeaponDeployed player) then 
	{
		[
			"SpyGlass","","","",false,
			[
				[
					"Steam профиль",
					[
						format ["**Имя:** %1",name player],
						"**Попытался на сошках достать машину**",
						format ["**TeamSpeak ID:** %1",(player getVariable ["tsNickName",name player])]
					] joinString "\n",
					"https://steamcommunity.com/profiles/" + getPlayerUID player,
					"FF0000",false,"","",[],[]
				]
			]
		] remoteExecCall ["DiscordEmbedBuilder_fnc_buildSqf",2];
		throw "Информация о попытке использования бага передана администрации!";
	};
	private _classParents = [(configfile >> "CfgVehicles" >> _vehicle),true] call BIS_fnc_returnParents;
	if (server_ddos_air && {"Air" in _classParents}) throw "На острове наблюдаются магнитные бури. Воздушная техника временно недоступна";

	private _basePrice = _dataArr select 5;
	private _retrievePrice = if (_basePrice isEqualTo 0) then {500} else {round (_basePrice * 0.02)};
	if (["MatesRates"] call perk) then {_retrievePrice = round(_retrievePrice * 0.75)};
	
	if ((player call getSide) in ["cop","med"]) then {_retrievePrice = 50};
	if ((_dataArr select 2) isEqualTo "none") then
	{
		_allowedGarages = getArray(getMissionConfig "LifeCfgVehicles" >> _vehicle >> "allowedGarages");
		if !(_allowedGarages isEqualTo []) then
		{
			private _str = {
				params ["_vehicle","_allowedGarages"];
				_text = "";
				{
					_t = getText(getMissionConfig "LifeCfgGarages" >> worldName >> _x >> "displayName");
					_text = _text + format["%1<br/>",_t];
				}forEach _allowedGarages;
				_text
			};
			if !(life_garage_sp_name in _allowedGarages) throw format ["Эту технику можно достать только в гаражах: <br/>%1",[_vehicle,_allowedGarages] call _str];
		};
	};

	if (RRPClientAtmMoney < _retrievePrice) throw format[("У вас нет $%1 на вашем банковском счете"),[_retrievePrice] call RRPClient_util_numberText];

	if (life_garage_sp isEqualType []) then {
		[SessionID,_vid,life_garage_sp select 0,_retrievePrice,life_garage_sp select 1,life_garage_sp_name,_keyMode] remoteExec ["RRPServer_garage_spawnVehicle",2];
	} else {
		[SessionID,_vid,(getMarkerPos life_garage_sp),_retrievePrice,markerDir life_garage_sp,life_garage_sp_name,_keyMode] remoteExec ["RRPServer_garage_spawnVehicle",2];
	};

	closeDialog 0;
	["WarningTitleAndText",["Гараж","Производится выдача. Пожалуйста подождите..."]] call SmartClient_gui_toaster_addTemplateToast;
}catch{
	["ErrorTitleAndText",["Гараж",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
