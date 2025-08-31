

private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 32000;
private _list = _slide controlsGroupCtrl 32002;

lbClear _list;
_eco = call RRPClient_economy_sort;
{
	_x params ["_resName", "_localize", "_sellprice", "_selled", "_max_selled", "_legal", "_prem", "_locked_time", "_locked_until", "_lastprice"];
	
	_index = _list lnbAddRow [_localize,format ["$%1",_sellprice]];
	_list lnbSetData [[_index,0],_resName];
	_list lnbSetPicture [[_index,0], (getText(missionConfigFile >> "VirtualItems" >> _resName >> "icon"))];
	
	_pricePicture = [(["arrowDown.paa", "arrowUp.paa"] select (_sellprice > _lastprice)), "arrowRight.paa"] select (_sellprice isEqualTo _lastprice);
	_list lnbSetPicture [[_index,2], "\rimas_agent\assets\economy\" + _pricePicture];

	if ((_selled > _max_selled) AND {(_locked_until isEqualTo "")}) then {
		_sellprice = (_sellprice * 2);
		_list lnbSetPicture [_index, "\RRP_icons\holdAction\default.paa"];
		_list lnbSetColor [[_index,1],[0.743, 0.561, 0.093,1]];
	} else {
		if (_locked_until isEqualTo "") then {
			if _legal then {
				_list lnbSetColor [[_index,1],[0.16, 0.76, 0.31,1]];
			}else{
				_list lnbSetColor [[_index,1],[0.835,0.243,0.027,1]];
			};
		}else{
			_list lnbSetPicture [[_index,0], "\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\sessions_locked_ca.paa"];
			_list lnbSetColor [[_index,1],[0.8, 0.064, 0.064,1]];
		};
	};
} forEach _eco;
_list lnbSetCurSelRow 0;
