/*
	Project: Police Systems for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _text = _this select 0;
private _bool = param [1,true,[true]];
private _type = param [2,"",[""]];
private _data = param [3,[],[[]]];
private _display = uiNamespace getVariable ["RRPDialogPoliceDatabase",displayNull];
private _hintCtrl = _display displayCtrl 7713;
private _housesList = _display displayCtrl 7705;
private _carsList = _display displayCtrl 7707;
private _crimesList = _display displayCtrl 7712;
private _textPlayer = _display displayCtrl 7710;
private _carList = _display displayCtrl 7718;
try
{
	if !(_bool) throw _text;
	if (_data isEqualTo []) throw "Ошибка в получении ответа от сервера! Попробуйте еще раз!";
	if (_data isEqualTo [[],[],[]]) throw "ID введенного паспорта нет в базе данных!";
	switch (_type) do
	{
		case "id": 
		{
			lbClear _carsList;
			lbClear _housesList;
			lbClear _crimesList;
			_data params [
					"_dataID",
					["_dataWanted",[],[[]]],
					["_dataCars",[],[[]]],
					["_dataHouses",[],[[]]]
			];
			_dataID params ["_uid", "_name", "_bankacc", "_side", "_arrested", "_jail_time", "_ganginfo"];
			diag_log format ["%1",_dataWanted];

			
			if !(_dataWanted isEqualTo []) then
			{
				RRPClientPoliceDataWanted = _dataWanted;
				{
					_index = _crimesList lbAdd (getText (missionConfigFile >> 'LifeCfgCrimes' >> _x select 1 >> 'displayName'));
					if (_x select 2) then
					{
						_crimesList lbSetTextRight [_index,format ["$%1",(getNumber (missionConfigFile >> 'LifeCfgCrimes' >> _x select 1 >> 'reward'))]];
					}else{_crimesList lbSetTextRight [_index,"Погашено"];};
					_crimesList lbSetData [_index,STR(_x # 0)];	
				}forEach _dataWanted;
				lbSort [_crimesList,"ASC"];
			}else{_crimesList lbAdd "Не в розыске!"};


			if !(_dataCars isEqualTo []) then
			{
				{
					_index = _carsList lbAdd getText(configFile >> "CfgVehicles" >> _x # 0 >> "displayName");
					_carsList lbSetTextRight [_index,_x # 1];
				}forEach _dataCars;
			}else{_carsList lbAdd "Отсутствуют"};

			if !(_dataHouses isEqualTo []) then
			{
				{
					_index = _housesList lbAdd getText(configFile >> "CfgVehicles" >> _x # 1 >> "displayName");	
					_housesList lbSetTextRight [_index,_x # 0];
				}forEach _dataHouses;
			}else{_housesList lbAdd "Отсутствуют"};
			_infoBank = "Неизвестно";
			_bank = parseNumber(_bankacc);
			_resArrestTime = _jail_time;
			switch (true) do 
			{
				case (_bank < 5000): {_infoBank = "Низкий баланс";};
				case (_bank < 50000): {_infoBank = "Средний баланс";};
				case (_bank >= 100000): {_infoBank = "Крупный баланс";};
				default {_infoBank = "Неизвестно";};
			};
			
			_resArrested = [false,true] select ((_arrested) isEqualTo 1);
			
			_infoArrest = "Неизвестно";
			if (_resArrested) then {_infoArrest = format ["Да. Осталось %1 месяцев",_resArrestTime];} else {_infoArrest = "Нет";};
			
			_infoCiv = "Неизвестно";
			if (_side isNotEqualTo "reb") then {_infoCiv = "Действительно";} else {_infoCiv = "Отменено";};
			
			_infoReb = "Неизвестно";
			if (_side isEqualTo "reb") then {_infoReb = "Установлены";} else {_infoReb = "Не установлены";};


			_infoOrgPrem = "Нет информации в базе";
			_infoOrgSide = "Нет информации в базе";

			_resultGang = _ganginfo;
			_infoOrg = "Неизвестно";
			if (_resultGang isEqualTo "") then {_infoOrg = "Нет информации в базе";
			_infoOrgPrem = "Нет информации в базе"; _infoOrgSide = "Нет информации в базе";
			} else{
				_infoOrgPrem =  if (_resultGang isEqualto "") then {"Нет"} else {"Да"};
				_infoOrg = format ["Состоит в организации: %1",_resultGang];
				_infoOrgSide = switch (_side) do
					{
						case "civ": {"Гражданская организация"};
						case "reb": {"Бандитская организация"};
						case "med": {"Сотрудник EMS"};
						case "cop": {"Сотрудник Полицейского департамента"};
					};
			};
			_textPlayer ctrlSetStructuredText parseText (format 
			[
				"<t size='0.95'>
					<br/>
					ID: %1 <br/>
					Имя: %2 <br/>
					<br/>
					Состояние банковского счета: <t color='#FFFF00'>%3</t><br />
					Гражданство: <t color='#FFFF00'>%4</t><br />
					Связи с революционерами: <t color='#FFFF00'>%5</t><br />
					Отбывает срок: <t color='#FFFF00'>%6</t><br />
					Связи с организациями: <t color='#FFFF00'>%7</t><br />
					Является ли премиальной: <t color='#FFFF00'>%8</t><br />
					Принадлежность организации: <t color='#FFFF00'>%9</t><br />
					</t>
				",
				_uid,
				_name,
				_infoBank,
				_infoCiv,
				_infoReb,
				_infoArrest,
				_infoOrg,
				_infoOrgPrem,
				_infoOrgSide
			]);
			_positionText = ctrlPosition _textPlayer;
			_yText = _positionText select 1;
			_hText = ctrlTextHeight _textPlayer;
			_textPlayer ctrlSetPosition [_positionText select 0, _yText, _positionText select 2, _hText];
			_textPlayer ctrlCommit 0;
		};
		case "car": 
		{
			lbClear _carList;
			{
				_index = _carList lbAdd format ["%1",getText(configFile >> "CfgVehicles" >> (_x # 0) >> "displayName")];
				_carList lbSetData [_index,STR(_x)];
			}forEach _data;
		};
		default {};
	};
	_hintCtrl ctrlSetText _text;
	_hintCtrl ctrlSetBackgroundColor [0.2,0.8,0.2,0.8];
}catch{
	_hintCtrl ctrlSetText _exception;
	_hintCtrl ctrlSetBackgroundColor [0.4,0.8,1,0.8];
};
