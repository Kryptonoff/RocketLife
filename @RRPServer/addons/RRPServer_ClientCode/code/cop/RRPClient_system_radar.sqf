/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    License: cc by-nc-nd
*/
try {
	private ["_infoText","_time24","_second","_minute","_hour","_plate","_plate_array","_vehicleColor", "_target", "_speed", "_className", "_vehicleInfo","_colorIndex","_vehicleColor","_owners"];
	if (player call getSide != "cop") exitWith {};

	_target = cursorObject;
	_speed = round speed _target;

	if !((currentWeapon player) in ["DDOPP_X26_b","DDOPP_X26"]) throw "Для измерения скорости нужно держать тайзер в руках и направить его на авто";
	if ((player distance _target) > 1500) throw "Радар работает на дистанции не более 1500м";
	if !(_target isKindOf "Car") throw "Измерять скорость можно только автомобилям";
	if (!alive _target) throw "";

	_className = typeOf _target;
	_vehicleInfo = [_className] call RRPClient_system_fetchVehInfo;
	_colorIndex = _target getVariable ["Life_VEH_color",-1];

	_vehicleColor = if !(_colorIndex isEqualto -1) then {getText(missionConfigFile >> "LifeCfgVehTextures" >> _colorIndex >> "displayName")} else {"Стандартный"};
	_owners = _target getVariable "vehicle_info_owners";
	if (isNil "_owners") throw "неопределенный владелец";

	_plate_array = _target getVariable ["dbInfo",[]];
	_plate = "Номерных знаков нет";

	if !(_plate_array isEqualTo []) then {
	_plate = _plate_array select 1;
	};

	_hour = floor daytime;
	_minute = floor ((daytime - _hour) * 60);
	_second = floor (((((daytime) - (_hour)) * 60) - _minute) * 60);

	if (_hour < 10) then {_hour = format ["0%1",_hour]};
	if (_minute < 10) then {_minute = format ["0%1",_minute]};
	if (_second < 10) then {_second = format ["0%1",_second]};

	_time24 = text format ["%1:%2:%3",_hour,_minute,_second];
	_infoText = format [
		"<t>Скорость: <t color='#E3E703'>%1</t><br />Координаты: <t color='#E3E703'>x:%2 y:%3</t><br />Время: <t color='#E3E703'>%4</t></t><br /><br /><t size='1'>Название: <t color='#E3E703'>%5</t><br />Цвет: <t color='#E3E703'>%6</t><br /><t size='1.2'>Номер: <t color='#E3E703'>%7</t></t>",
		_speed,
		round(getPos _target # 0),
		round(getPos _target # 1),
		_time24,
		(_vehicleInfo select 3),
		_vehicleColor,
		_plate
	];

	["InfoTitleAndText", ["TrueCAM", _infoText]] call SmartClient_gui_toaster_addTemplateToast;
 	life_cop_radar_info pushBack [_speed,(([(position player)] call RRPClient_radar_posToGPSCoordinates) select 0),(([(position player)] call RRPClient_radar_posToGPSCoordinates) select 1),_time24,(_vehicleInfo select 3),_vehicleColor,_plate];
} catch {
	["ErrorTitleAndText", ["TrueCAM!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
