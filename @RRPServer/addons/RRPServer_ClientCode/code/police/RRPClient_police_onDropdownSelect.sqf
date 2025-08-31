/*
	Project: Police Systems for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND 
*/

private _display = 		uiNamespace getVariable ["RRPDialogPoliceDatabase",displayNull];
private _listBox = 		_this select 0;
private _index = 		_this select 1;
RRPClientPoliceTypeSearch = _listBox lbData _index;
private _editBox =		_display displayCtrl 7702;
private _housesList = 	_display displayCtrl 7705;
private _carsList = 	_display displayCtrl 7707;
private _crimeList = 	_display displayCtrl 7712;
private _hintCtrl = 	_display displayCtrl 7713;
private _ticketsList = 	_display displayCtrl 7718;
private _playersList = 	_display displayCtrl 7719;
private _drop = 		_display displayCtrl 7721;
private _dropAll = 		_display displayCtrl 7722;
private _active = 		_display displayCtrl 7723;
lbClear _playersList;
lbClear _ticketsList;
lbClear _crimeList;
lbClear _carsList;
lbClear _housesList;
switch (RRPClientPoliceTypeSearch) do
{
	case "id":
	{
		_hintCtrl ctrlSetText "Введите ID паспорта гражданина!";
		_hintCtrl ctrlSetBackgroundColor [0.8,0.8,0,0.8];
		{
			_ctrl = _display displayCtrl _x;
			_ctrl ctrlEnable false;
			_ctrl ctrlShow false;
		}forEach [7704,7705,7706,7707,7708,7709,7710,7711,7712,7714,7715,7716,7717,7718,7719,7720,7721,7722,7723];
		{
			private _ctrl = _display displayCtrl _x;
			_ctrl ctrlShow true;
			_ctrl ctrlEnable true;
		}forEach [7704,7705,7706,7707,7708,7709,7710,7711,7712,7721,7722,7723];
		if !(('cop' call RRPClient_groups_getSideLevel) >= 8) then 
		{
			_dropAll ctrlEnable false;
			_dropAll ctrlSetTooltip "Данная функция недоступна вашему рангу!";
			_drop ctrlEnable false;
			_drop ctrlSetTooltip "Данная функция недоступна вашему рангу!";
			_active ctrlEnable false;
			_active ctrlSetTooltip "Данная функция недоступна вашему рангу!";
		};
	};
	case "name":
	{
		_hintCtrl ctrlSetText "Просто выберите жителя из списка ниже!";
		_hintCtrl ctrlSetBackgroundColor [0.8,0.8,0,0.8];
		{
			_ctrl = _display displayCtrl _x;
			_ctrl ctrlEnable false;
			_ctrl ctrlShow false;
		}forEach [7704,7705,7706,7707,7708,7709,7710,7711,7712,7714,7715,7716,7717,7718,7719,7720,7721,7722,7723];
		{
			private _ctrl = _display displayCtrl _x;
			_ctrl ctrlShow true;
			_ctrl ctrlEnable true;
		}forEach [7719,7720];
		{
			_index = _playersList lbAdd (_x call getFullName);
			_playersList lbSetData [_index,netID _x]
		}forEach allPlayers;
		lbSort _playersList;
	};
	case "car":
	{
		if !(isNil "RRPClientTemporaryData") then {_editBox ctrlSetText RRPClientTemporaryData;};
		_hintCtrl ctrlSetText "Будьте внимательны при запросе номерных знаков! Прим: ХХ 0000 ХХ";
		_hintCtrl ctrlSetBackgroundColor [0.8,0.8,0,0.8];
		{
			_ctrl = _display displayCtrl _x;
			_ctrl ctrlEnable false;
			_ctrl ctrlShow false;
		}forEach [7704,7705,7706,7707,7708,7709,7710,7711,7712,7714,7715,7716,7717,7718,7719,7720,7721,7722,7723];
		{
			private _ctrl = _display displayCtrl _x;
			_ctrl ctrlShow true;
			_ctrl ctrlEnable true;
		}forEach [7714,7715,7716,7717,7718];
	};
	default 
	{
		_hintCtrl ctrlSetText "Ошибка в подаче запроса! Попробуйте еще раз!";
		_hintCtrl ctrlSetBackgroundColor [1,0,0,0.8];
		{
			_ctrl = _display displayCtrl _x;
			_ctrl ctrlEnable false;
			_ctrl ctrlShow false;
		}forEach [7704,7705,7706,7707,7708,7709,7710,7711,7712,7714,7715,7716,7717,7718,7719,7720,7721,7722,7723];
	};
};