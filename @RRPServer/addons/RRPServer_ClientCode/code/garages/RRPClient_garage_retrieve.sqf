

private ["_display","_key","_hash","_values","_classParents","_retrievePrice","_allowedGarages","_nearVehicles","_sp_name"];

try
{
	_display = uiNamespace getVariable ["RRPDialogGarage",displayNull];
	_key = _display getVariable ["value",-1];
	if (_key isEqualTo -1) throw "Вы ничего не выбрали";
	_hash = _display getVariable "cache";
	_values = _hash get _key;
	
	_values params ["_classname","_color","_spname","_tuning_data","_insure","_baseprice","_material","_fuel","_parking","_plate","_distance","_damage","_filled"];
	
	if (_classname in (getArray(getMissionConfig "LifeCfgGarages" >> "lockedVehicles"))) throw "Данный вид техники временно заблокирован";

	if (_classname in (getArray(missionConfigFile >> "LifeCfgSettings" >> "life_vShop_trucks")) && {life_garage_isHouse}) throw "Грузовой транспорт нельзя достать из частного гаража.";

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

	if (RRPClientAtmWaitingResponse) throw "Предыдущая транзакция еще не была обработана!";

	_classParents = [(configfile >> "CfgVehicles" >> _classname),true] call BIS_fnc_returnParents;
	if (server_ddos_air && {"Air" in _classParents}) throw "На острове наблюдаются магнитные бури. Воздушная техника временно недоступна";

	_retrievePrice = if (_baseprice isEqualTo 0) then {500} else {round (_baseprice * 0.02)};
	if (["MatesRates"] call perk) then {_retrievePrice = round(_retrievePrice * 0.75)};
	
	if ((player call getSide) in ["cop","med"]) then {_retrievePrice = 50};
	if (RRPClientAtmMoney < _retrievePrice) throw format [("У вас нет $%1 на вашем банковском счете"),[_retrievePrice] call RRPClient_util_numberText ];

	_sp_name = _display getVariable "marker";

	_nearVehicles = if (_sp_name isEqualType "") then 
	{
		if (isArray(missionConfigFile >> "LifeCfgGarages" >> (toLower worldName) >> _sp_name >> "position")) then 
		{
			nearestObjects[(getArray(missionConfigFile >> "LifeCfgGarages" >> (toLower worldName) >> _sp_name >> "position") select 0),["Car","Air","Ship"],10]
		}else{
			nearestObjects[getMarkerPos _sp_name,["Car","Air","Ship"],10]
		};
	} else {
		nearestObjects[_sp_name select 0,["Car","Air","Ship"],10]
	};
	if !(_nearVehicles isEqualTo []) then 
	{
		diag_log format ["GarageError: sp: %2 | _nearVehicles: %1",_nearVehicles,_sp_name];
		throw "Место выдачи возле гаража уже занято.";
	};

	if (_spname isEqualTo "none") then
	{
		_allowedGarages = getArray(getMissionConfig "LifeCfgVehicles" >> _classname >> "allowedGarages");
		(format ["G: %1",_allowedGarages]) call debugConsole;
		if !(_allowedGarages isEqualTo []) then
		{
			private _str = {
				params ["_classname","_allowedGarages"];
				_text = "";
				{
					_t = getText(getMissionConfig "LifeCfgGarages" >> worldName >> _x >> "displayName");
					_text = _text + format["%1<br/>",_t];
				}forEach _allowedGarages;
				_text
			};
			if !(_sp_name in _allowedGarages) throw format ["Эту технику можно достать только в гаражах: <br/>%1",[_classname,_allowedGarages] call _str];
		};
	};
	

	if !((_sp_name isEqualTo _spname) OR {_spname isEqualTo ""} OR {_spname isEqualTo "none"}) then
	{
		if (isClass (getMissionConfig "LifeCfgGarages" >> worldName >> _spname) && {!(getMarkerPos _spname isEqualTo [0,0,0])}) 
			throw format ["Эта тенхика находится в гараже %1",getText(getMissionConfig "LifeCfgGarages" >> worldName >> _spname >> "displayName")];
	};

	[
		_display,
		{
			RRPClientAtmWaitingResponse = true;
			(str _this) call debugConsole;
			[_this,"garage_retrieve"] call RRPClient_system_hcExec;
		},
		[_key,_retrievePrice,_sp_name],
			"Достать транспорт из гаража?",
			format["Достать %1 за $%2?",getText(configFile >> "CfgVehicles" >> _classname >> "displayName"),
				[_retrievePrice] call RRPClient_util_numberText
		]
	] call RRPClient_util_prompt;
	
}catch{
	["ErrorTitleAndText",["Гараж",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
