
private ["_display","_vehicle","_parameters"];


try
{
	if (RRPClientAtmWaitingResponse) throw "Предыдущая транзакция еще не была обработана!";

	_display = uiNamespace getVariable ["RRPDialogGarageStore",displayNull];
	if (isNull _display) throw "Дисплей не определен, попробуйте еще раз";
	
	_parameters = _display getVariable "settings";
	if (isNil "_parameters") throw "Не определены настройки гаража";

	_parameters params [
		["_isHouse",false,[false,objNull]],
		["_sp","",[""]],
		["_typeV","",[""]]
	];
	(str _parameters) call debugConsole;

	_vehicle = _display getVariable ["vehicle",objNull];
	if (isNull _vehicle) throw "Техника не определена, попробуйте еще раз";

	if !(isNull objectParent player) throw "Выйдите из транспорта, для взаимодействия с гаражем";
	if (crew _vehicle isNotEqualTo []) throw "В технике кто-то есть...";

	{
		if (player distance2D getMarkerPos("war_marker_" + (str(_x#0))) < _x#1) throw "Гараж заблокирован так как находится в военном положении";
	} forEach RRPServerWarZones;
	
	_point = [cursorObject,_ishouse] select (_isHouse isEqualType objNull);
	if (_sp isEqualTo "") then
	{
		_sp = "none";
		_typeV = "Car";
	};
	
	if (_typeV != _type) throw (format ["Вы пытаетесь поставить в гараж технику класса %1, но гараж расчитан на технику класса %2. Найдите гараж соответствующего формата",_type,_typeV]);

	_allowedGarages = getArray(getMissionConfig "LifeCfgVehicles" >> typeOf _vehicle >> "allowedGarages");
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
		if !(_sp in _allowedGarages) throw format ["Эту технику можно поставить только в гаражи: <br/>%1",[typeOf _vehicle,_allowedGarages] call _str];
	};

	_donatVehLastFire = _vehicle getVariable "donatVehLastFire";
	if (!isNil "_donatVehLastFire" && {typeOf _vehicle in (getArray(missionConfigFile >> "LifeCfgSettings" >> "battleVehicle"))} && {(time - _donatVehLastFire)  < 1200}) then
	{
		throw (format ["Вы стреляли из боевой техники %1 минут(ы) назад. Убрать ее можно будет через %2 минут(ы)", round ((time - _donatVehLastFire) / 60), round ((1200 - (time - _donatVehLastFire))/60)]);
	};

	_trunkData = _vehicle getVariable ["Trunk",[[],0]];
	if (_ishouse && {(_trunkData select 0) isNotEqualTo []}) throw "В ваш частный гараж не поместится груженная техника. Отгоните ее в общественный гараж или освободите багажник.";

	_illegal = false;
	{
		_index = [_x select 0,RRPPublicEconomyIlegalItems] call RRPClient_system_index;
		if(_index isNotEqualTo -1) then {_illegal = true;break;};
	} foreach (_trunkData select 0);

	if (_illegal) then
	{
		[
			_display,
			{
				RRPClientAtmWaitingResponse = true;
				(str _this) call debugConsole;
				[_this,"garage_store"] call RRPClient_system_hcExec;  

			},
			[_vehicle,false,_sp],
				"Поставить с нелегалом?",
				format["В технике %1 есть нелегальные предметы, при сохранении техники они будут безвозвратно утрачены! Продолжить?",getText(configOf _vehicle >> "displayName")]
		] call RRPClient_util_prompt;
	}else{
		[
			_display,
			{
				RRPClientAtmWaitingResponse = true;				
				[_this,"garage_store"] call RRPClient_system_hcExec;  
			},
			[_vehicle,false,_sp],
				"Сохранить транспорт?",
				format["Сохранить %1 в гараже?",getText(configOf _vehicle >> "displayName")]
		] call RRPClient_util_prompt;
	};
}catch{
	["ErrorTitleAndText",["Гараж",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
