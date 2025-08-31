/*
	Filename: 	RRPClient_system_insurance.sqf
	Project: 	Rimas Altis Life RPG
*/
try{
	private["_nearVehicles","_vehicle","_price","_action","_type","_sp","_basePrice"];

	_sp = param [0,"",[""]];
	_typeV = param [1,"",[""]];

	if(_sp == "") throw "Ошибка. Не задана точка страхования. Сообщите админу.";
	if(player call getSide in ["med","cop"]) throw "Служебную технику нельзя страховать. За нее платит государство :)";

	if !(isNull (objectParent player)) then {
		_vehicle = objectParent player;
	} else {
		_nearVehicles = nearestObjects[getPosATL player,["LandVehicle","Air"],50];
		if(count _nearVehicles > 0) then {
			{
				if(!isNil "_vehicle") exitWith {}; //Kill the loop.
				_vehData = _x getVariable ["vehicle_info_owners",[]];
				if(count _vehData  > 0) then
				{
					_vehOwner = (_vehData select 0) select 0;
					if ((getPlayerUID player) isEqualTo _vehOwner) exitWith {
						_vehicle = _x;
					};
				};
			} foreach _nearVehicles;
		};
	};

	if(isNil "_vehicle") throw "Проверьте, чтобы ваша техника была рядом с гаражом и повторите попытку";
	if(isNull _vehicle) exitWith {};
	if(_vehicle getVariable ["isInsured",false]) throw "Эта техника уже застрахована";
	if(_vehicle getVariable ["insPrice",0] == 0) throw "Эта техника не подлежит страхованию";
	if(!(_vehicle in life_vehicles)) throw "Рядом нет техники, которая принадлежит вам";

	_type = switch(true) do {
		case (_vehicle isKindOf "LandVehicle"): {"Car"};
		case (_vehicle isKindOf "Air"): {"Air"};		
	};

	if (_typeV != _type) throw format ["Вы пытаетесь застраховать технику класса %1 у страховщика класса %2. Найдите страховщика соответствующего формата",_type,_typeV];
	if (_type == "Air" && {player call getSide == "reb"}) throw "Бандиты могут страховать только наземную технику!";

	if (["B_mas_HMMWV",(typeOf _vehicle)] call BIS_fnc_inString) throw "Страховка военных хаммеров невозможна";
	if ((typeOf _vehicle) in ["I_MRAP_03_F", "B_MRAP_01_F", "O_MRAP_02_F", "B_G_Offroad_01_armed_F"]) throw "Страховка бронированной техники невозможна";

	_basePrice = _vehicle getVariable ["insPrice",0];
	if (_basePrice == 0) exitWith {};

	_price = round (_basePrice * 0.15); //7% от стоимости аренды
	if (_type == "Car" && {player call getSide == "reb"}) then {_price = _price * 1.5};

	_veh_name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	_action = [
		format["Вы действительно хотите застраховать %1 за $%2?", _veh_name,[_price] call RRPClient_util_numberText ],
		"Страхование техники",
		"Да",
		"Нет"
	] call BIS_fnc_guiMessage;

	if(_action) then 
	{
		if(RRPClientAtmMoney < _price) throw format["У вас нет необходимой суммы для страхования!<br/>Вам необходимо $%1",[_price] call RRPClient_util_numberText]; 
		[format["Вы застраховали свою технику (%2) за $%1.\n\nЕсли она взорвется в результате ДТП, то вы сможете получить компенсацию в гараже!",[_price] call RRPClient_util_numberText,_veh_name]] call hints;
		[[player,"atm","take",_price],"system_moneyChange"] call RRPClient_system_hcExec;
		[40, "страхование"] call addXP;
		["insure",1] call RRPClient_ach_gateway;
		_log = format ["insuranceDeposit: atm (take) %3 to NAME:%1 (%2)",name player,getPlayerUID player,_price];
		["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];

		_vehicle setVariable ["isInsured",true,true];	
		_vehicle remoteExecCall ["RRPServer_garage_insurancePermanent",2];
		closeDialog 0;
		
	};
}catch{
	["ErrorTitleAndText",["Страхование",_exception]] call toast;
};