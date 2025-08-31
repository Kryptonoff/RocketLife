private _display = uiNamespace getVariable ["RRPDialogMarket",displayNull];
try
{
	if ((_display getVariable ["selected",[]]) isEqualTo []) throw "Ресурс не определен";
	((_display getVariable ["selected",[]]) call RRPClient_economy_getResInfo) params ["_resName", "_localize", "_sellprice", "_selled", "_max_selled", "_legal", "_prem", "_locked_time", "_locked_until"];
	
	switch _this do 
	{
		case "block": 
		{
			if (_locked_until isEqualTo "") then {
				["addToLock",_resName,_localize,true] remoteExecCall ["RRPServer_economy_updateStatus",2];
				["SuccessTitleOnly",["Ресурс заблокирован"]] call toast;
			}else{
				["unlock",_resName,_localize,true] remoteExecCall ["RRPServer_economy_updateStatus",2];
				["SuccessTitleOnly",["Ресурс разблокирован"]] call toast;
			};
			call RRPClient_economy_refresh;
		};
		case "price": {
			_ctrlPrice = (_display displayCtrl 25200) controlsGroupCtrl 25202;
			_priceText = ctrlText _ctrlPrice;
			if !([_priceText] call RRPClient_system_isnumber) throw "Некорректный ввод. Введите сумму.";
			_priceText = parseNumber _priceText;
			if (_priceText > 1000) throw "Цена не может быть более 1000$!";
			if (_priceText <= 0) throw "Цена не может быть равна 0 или отрицательным значением!";
			["SuccessTitleOnly",["Цена обновлена"]] call toast;
			["updatePrice",_resName,_priceText] remoteExecCall ["RRPServer_economy_updateStatus",2];
			[format["%1 %2 изменил цену на ресурс %3 Сумма: %4",(getPlayerUID player),(name player),_resName,_priceText],"adminsLog"] remoteExecCall ["RRPServer_system_logIt",2];
			call RRPClient_economy_refresh;
		};
	};
}catch{
	["ErrorTitleOnly",[_exception]] call toast;
};
