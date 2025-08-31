/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;
params [
["_control",controlNull,[controlNull]],
["_index",-1,[0]]
];

if (isNull _control OR {_index isEqualTo -1}) exitWith {};

private _data = _control lbData _index;
(parseSimpleArray _data) params ["_className","_conditions","_conditionsMsg"];


ctrlEnable [2310,true];ctrlEnable [2311,true];ctrlEnable [2309,true];

if ((getText(missionConfigFile >> "LifeCfgVehShops" >> (life_veh_shop select 0) >> "onlyrent") isEqualto "true")) then {
	ctrlEnable [2310,false];ctrlEnable [2309,false];
} else {
	{
		if (_className isEqualTo (_x select 0)) exitWith {
			if !(isNil {(_x select 3)}) then  {
			 if ((_x select 3) isEqualTo "true") then {
					 ctrlEnable [2310,false];ctrlEnable [2309,false]
				 };
		 	};
		};
	} forEach (getArray(missionConfigFile >> "LifeCfgVehShops" >> (life_veh_shop select 0) >> "vehicles"));
};

if !(_conditions isEqualto "") then {
	if !(call (compile _conditions)) then {ctrlEnable [2310,false];ctrlEnable [2311,false];ctrlEnable [2309,false]};
};


private _basePrice = getNumber(missionConfigFile >> "LifeCfgVehicles" >> _className >> "price") * getNumber(missionConfigFile >> "LifeCfgVehShops" >> (life_veh_shop select 0) >> "multiplier");
_basePrice = ['priceSell',_basePrice] call RRPClient_system_VIP;

private _vehicleInfo = [_className] call RRPClient_util_fetchVehInfo;
private _trunkSpace = getNumber(missionConfigFile >> "LifeCfgVehicles" >> _className >> "vItemSpace");
private _available = (["<t color='#3f6b00'>Есть</t>", format["<t color='#ff0000'>%1</t>",_conditionsMsg]] select !([_conditions] call RRPClient_util_conditionsCheck));

ctrlShow [2330,true];
(((findDisplay 2300) displayCtrl 2303)) ctrlSetStructuredText parseText format["<t size='0.9'>" +
	"Цена на аренду" + " <t color='#3f6b00'>$%1</t><br/>" +
	"Цена на покупку" + " <t color='#3f6b00'>$%2</t><br/>" +
	"Цена <t color='#FFFF00'>RCredits</t>" + " <t color='#3f6b00'>%3</t><br/>" +
	"Доступ:" + " %10<br/>" +
	("Макс скорость:") + " %4 km/h<br/>" +
	("Мощность (л/с):") + " %5<br/>" +
	("Мест для пассажиров:") + " %6<br/>" +
	("Вместимость багажника:") + " %7<br/>" +
	("Объем бензобака:") + " %8<br/>" +
	("Рейтинг брони:") + " %9</t>",
	[round(_basePrice * 0.75)] call RRPClient_util_numberText,
	[_basePrice] call RRPClient_util_numberText,
	round((_basePrice) / getNumber(missionConfigFile >> "LifeCfgSettings" >> "dividerDonateCar")),
	_vehicleInfo select 8,
	_vehicleInfo select 11,
	_vehicleInfo select 10,
	_trunkSpace,
	_vehicleInfo select 12,
	_vehicleInfo select 9,
	_available
];

private _colorCtrl = ((findDisplay 2300) displayCtrl 2304);
lbClear _colorCtrl;
{
	if (isClass (missionConfigFile >> "LifeCfgVehTextures" >> _x select 0)) then {
		if ((life_veh_shop select 2) in (_x select 1)) then {
			_colorCtrl lbAdd format["%1",getText(missionConfigFile >> "LifeCfgVehTextures" >> _x select 0 >> "displayName")];
			_colorCtrl lbSetData [(lbSize _colorCtrl)-1,_x select 0];
			_colorCtrl lbSetPicture [(lbSize _colorCtrl)-1,(getArray(missionConfigFile >> "LifeCfgVehTextures" >> _x select 0 >> "texture")) select 0];
			if !([_x select 2] call RRPClient_util_conditionsCheck) then {
				_colorCtrl lbSetPictureRight [(lbSize _colorCtrl)-1, "\rimas_pack\icons\messages\error.paa"];
				_colorCtrl lbSetValue [(lbSize _colorCtrl)-1,0];
			} else {
			_colorCtrl lbSetValue [(lbSize _colorCtrl)-1,1];
			};
		};
	};
} forEach (getArray(missionConfigFile >> "LifeCfgVehicles" >> _className >> "textures"));


private _materialCtrl = ((findDisplay 2300) displayCtrl 2305);
lbClear _materialCtrl;
{
	if (isClass (missionConfigFile >> "LifeCfgVehMaterials" >> _x)) then
	{
		_materialCtrl lbAdd format["%1",getText(missionConfigFile >> "LifeCfgVehMaterials" >> _x >> "displayName")];
		_materialCtrl lbSetData [(lbSize _materialCtrl)-1,_x];
		if !([getText(missionConfigFile >> "LifeCfgVehMaterials" >> _x >> "conditions")] call RRPClient_util_conditionsCheck) then {
			_materialCtrl lbSetPictureRight [(lbSize _materialCtrl)-1, "\rimas_pack\icons\messages\error.paa"];
			_materialCtrl lbSetValue [(lbSize _materialCtrl)-1,0];
		} else {
			_materialCtrl lbSetValue [(lbSize _materialCtrl)-1,1];
		};
	};
} forEach (getArray(missionConfigFile >> "LifeCfgVehicles" >> _className >> "materials"));

lbSetCurSel[2304,0];
lbSetCurSel[2305,0];

if !((lbSize _colorCtrl) isEqualTo 0) then {
	ctrlEnable [2304,true];
} else {
	ctrlEnable [2304,false];
};

if !((lbSize _materialCtrl) isEqualTo 0) then {
	ctrlEnable [2305,true];
} else {
	ctrlEnable [2305,false];
};

//[(findDisplay 2300),_className,_spawnPoints] call RRPClient_vehshop_createPreview;
[findDisplay 2300,_className,(lbData[2304,lbCurSel 2304]),(lbData[2305,lbCurSel 2305])] call RRPClient_system_shopBoxUpdate;
true
