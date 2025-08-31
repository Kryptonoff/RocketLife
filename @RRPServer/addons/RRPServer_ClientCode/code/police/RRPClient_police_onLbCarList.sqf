/*
	Project: Police Systems for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _display = 		uiNamespace getVariable ["RRPDialogPoliceDatabase",displayNull];
private _listBox = 		_this select 0;
private _index = 		_this select 1;
private _data = 		call compile (_listBox lbData _index);
private _vehText = 		_display displayCtrl 7717;
private _carList = 		_display displayCtrl 7718;
_insure = switch (_data select 3) do
{
	case 0:{"Не застрахована"};
	case 1:{"Застрахована"};
	case 2:{"Уничтожена. Готово к выплате"};
};
_color = if ((_data select 4) isEqualTo toLower("default")) then {"Базовый"}else{getText(missionConfigFile >> "LifeCfgVehTextures" >> _data select 4 >> "displayName")};
_disput = if ((_data # 7) isEqualTo []) then {"Отсутствует"}else{format ["%1 $%2",(_data # 7) select 1,(_data # 7) select 0]};
_upgrades = if ((_data # 6) isEqualTo []) then {"Отсутствуют"}else{"Есть"};
_vehText ctrlSetStructuredText parseText (format 
[
	"<t size='0.95'>
		<br/>
		Номер: %1 <br/>
		Тип: %2 <br/>
		Название: %3 <br/>
		Владелец: %4 <br/>
		Остров: %5 <br />
		Страховка: %6 <br/>
		<br/>
		Цвет: <t color='#FFFF00'>%7</t><br />
		Материал: <t color='#FFFF00'>%8</t><br />
		Штраф: <t color='#FFFF00'>%9</t><br />
		Улучшения: <t color='#FFFF00'>%9</t><br />
		</t>
	",
	_data select 2,
	_data select 1,
	getText(configFile >> "CfgVehicles" >> _data select 0 >> "displayName"),
	_data select 9,
	_data select 8,
	_insure,
	_color,
	getText(missionConfigFile >> "LifeCfgVehMaterials" >> _data select 5 >> "displayName"),
	_disput,
	_upgrades		
]);

_positionText = ctrlPosition _vehText;
_yText = _positionText select 1;
_hText = ctrlTextHeight _vehText;
_vehText ctrlSetPosition [_positionText select 0, _yText, _positionText select 2, _hText];
_vehText ctrlCommit 0;