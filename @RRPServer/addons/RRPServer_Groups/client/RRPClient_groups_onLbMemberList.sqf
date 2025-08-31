/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _lb = _this select 0;
private _index = _this select 1;
private _uid = _lb lnbData [_index,0];
private _setDeputyButton = _display displayCtrl 12034;
private _kickButton = _display displayCtrl 12032;
private _upButton = _display displayCtrl 12035;
private _downButton = _display displayCtrl 12033;

comment "Если недостаточно прав";
private _post = (getPlayerUID player) call RRPClient_groups_getPostGroup;
private _postSel = _uid call RRPClient_groups_getPostGroup;
if (_uid isEqualTo (getPlayerUID player)) then 
{
	_kickButton ctrlSetText "Выгнать";
	_kickButton ctrlEnable false;
}else{
	_kickButton ctrlSetText "Выгнать";
	_kickButton ctrlEnable false;
};
switch (_post) do
{
  case 1:
	{
		switch (_postSel) do
		{
			case 1:
			{
				_setDeputyButton ctrlEnable false;
				_kickButton ctrlEnable true;
		  		_upButton ctrlEnable true;
		  		_downButton ctrlEnable true;
			};
			case 2:
			{
				_setDeputyButton ctrlEnable true;
				_setDeputyButton ctrlSetText "Разжаловать";
				_kickButton ctrlEnable true;
		  		_upButton ctrlEnable true;
		  		_downButton ctrlEnable true;
			};
			case 3:
			{
				_setDeputyButton ctrlEnable true;
      			_setDeputyButton ctrlSetText "Назн. замом";
				_kickButton ctrlEnable true;
				_upButton ctrlEnable true;
				_downButton ctrlEnable true;
			};
		};
	};
	case 2:
	{
		switch (_postSel) do
		{
			case 1:
			{
				_setDeputyButton ctrlEnable false;
				_kickButton ctrlEnable false;
		  	_upButton ctrlEnable false;
		  	_downButton ctrlEnable false;
			};
			case 2:
			{
				_setDeputyButton ctrlEnable false;
				_kickButton ctrlEnable false;
		  		_upButton ctrlEnable false;
		  		_downButton ctrlEnable false;
			};
			case 3:
			{
				_setDeputyButton ctrlEnable false;
				_kickButton ctrlEnable true;
				_upButton ctrlEnable true;
				_downButton ctrlEnable true;
			};

		};
	};
	case 3: {
		_setDeputyButton ctrlEnable false;
		_kickButton ctrlEnable ("canKick" call RRPClient_groups_util_permCheck);
		_upButton ctrlEnable ("canUp" call RRPClient_groups_util_permCheck);
		_downButton ctrlEnable ("canDown" call RRPClient_groups_util_permCheck);
	};
};
if (_uid isEqualTo "") then
{
	_giveLeadButton ctrlEnable false;
	_setDeputyButton ctrlEnable false;
	_kickButton ctrlEnable false;
	_upButton ctrlEnable false;
	_downButton ctrlEnable false;
};
