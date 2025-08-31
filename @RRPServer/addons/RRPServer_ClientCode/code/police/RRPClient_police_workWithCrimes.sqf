/*
	Project: Police Systems for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

_display = uiNamespace getVariable ["RRPDialogPoliceDatabase",displayNull];
_listCrime = _display displayCtrl 7712;
private _hintCtrl = _display displayCtrl 7713;
_crimeIndex = lbCurSel _listCrime;
_id = _listCrime lbData (lbCurSel _listCrime);
_text = "";
try
{
	if !(('cop' call RRPClient_groups_getSideLevel) >= 8) throw "Вы не можете управлять розыском гражданей!";
	switch (_this) do
	{
		case "active": 
		{
			if (_id isEqualTo "" OR _crimeIndex isEqualTo -1) throw "Вы не выбрали преступление!"; 
			format ["copDB_setActiveCrime:1:%1",_id] remoteExecCall ["RRPServer_DB_fireAndForget",2];
			_listCrime lbSetTextRight [_crimeIndex,"Восстановлено!"];
			_text = format ["Преступление с ID: %1 успешно восстановлено!",_id];
		};
		case "drop": 
		{
			if (_id isEqualTo "" OR _crimeIndex isEqualTo -1) throw "Вы не выбрали преступление!"; 
			format ["copDB_setActiveCrime:0:%1",_id] remoteExecCall ["RRPServer_DB_fireAndForget",2];
			_listCrime lbSetTextRight [_crimeIndex,"Погашено"];
			_text = format ["Преступление с ID: %1 успешно погашено!",_id];
		};
		case "dropAll": 
		{
			format ["copDB_setActiveCrimeAll:%1",RRPClientPoliceCurrentID] remoteExecCall ["RRPServer_DB_fireAndForget",2];
			_text = format ["Все преступления гражданина %1 были погашены!",RRPClientPoliceCurrentID];
			_count = count RRPClientPoliceDataWanted;
			for "_i" from 0 to _count -1 do
			{
				_listCrime lbSetTextRight [_i,"Погашено"];
			};
		};
	};
	_hintCtrl ctrlSetText _text;
	_hintCtrl ctrlSetBackgroundColor [0.2,0.8,0.2,0.8];
}catch{
	_hintCtrl ctrlSetText _exception;
	_hintCtrl ctrlSetBackgroundColor [0.4,0.8,1,0.8];
};