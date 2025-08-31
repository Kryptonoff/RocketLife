/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;
private _dialog = 		uiNamespace getVariable ["RRPDialogCompanyMenu",displayNull];
private _nameEdit = 	_dialog displayCtrl 9416;
private _nameButn = 	_dialog displayCtrl 9417;
private _taxEdit = 		_dialog displayCtrl 9405;
private _discountList = _dialog displayCtrl 9415;
private _discountEdit = _dialog displayCtrl 9413;
private _ctrlText = 	ctrlText _nameEdit;
private _mode = 		_this;

try
{
	if (RRPClientLtdWaitResponse) throw "Предыдущее действие еще не было обработано, подождите...";
	switch (_mode) do
	{
		case "rename":
		{
			if (isNull RRPClientStoreSelected) throw "Магазин Null - попробуйте еще раз";
			if (_newName isEqualTo "") throw "Вы ничего не ввели!";
			if (_newName isEqualTo _name) throw "Название должно отличаттся!";
			private _check = [_newName,getText(missionConfigFile >> "LifeCfgSettings" >> "allowAlphabet")] call RRPClient_util_containsForbiddenCharacter;
			if !(_check isEqualTo -1) throw format ["Нельзя использовать символ '%1'",_check];
			[RRPClientStoreSelected,_ctrlText,player] remoteExecCall ["RRPServer_ltd_renameStore",2];
		};
		case "tax":
		{
			if (isNull RRPClientStoreSelected) throw "Магазин Null - попробуйте еще раз";
			_newTax = ctrlText _taxEdit;			
			if (_newTax isEqualTo "") throw "Вы ничего не ввели!";
			_check = [_newTax,"0123456789"] call RRPClient_util_containsForbiddenCharacter;
			if !(_check isEqualTo -1) throw "Использовать можно только цифры";
			
			_newTax = parseNumber(_newTax);
			if (_newTax < 1) throw "Пошлина не может быть ниже чем 1%";
			if (_newTax > 15) throw "Пошлина не может быть выше 15%";
			[RRPClientStoreSelected,_newTax,player] remoteExecCall ["RRPServer_ltd_newTax",2];
		};
		case "discount":
		{
			if (isNull RRPClientStoreSelected) throw "Магазин Null - попробуйте еще раз";
			_discount = ctrlText _discountEdit;			
			if (_discount isEqualTo "") throw "Вы ничего не ввели!";
			_check = [_discount,"0123456789"] call RRPClient_util_containsForbiddenCharacter;
			if !(_check isEqualTo -1) throw "Использовать можно только цифры";
			
			_discount = parseNumber(_discount);
			if (_discount < 1) throw "Скидка не может быть ниже чем 1%";
			if (_discount > 25) throw "Пошлина не может быть выше 25%";
			private _onDay = _discountList lbData (lbCurSel _discountList);
			if (_onDay isEqualTo "") throw "Вы не выбрали срок скидки!";
			[RRPClientStoreSelected,_discount,_onDay,player] remoteExecCall ["RRPServer_ltd_setDiscount",2];
		};
		case "Plus30Day":
		{
			if (RRPClientCredits < 6600) throw "Для добавления 30 дней аренды, Вам необходимо 6600 RCredits";
			[RRPClientStoreSelected,player] remoteExecCall ["RRPServer_ltd_addDays",2];
		};
		case "Plus5Pos":
		{
			if (RRPClientCredits < 660) throw "Для добавления 5 слотов, Вам необходимо 660 RCredits";
			[RRPClientStoreSelected,player] remoteExecCall ["RRPServer_ltd_addSlots",2];
		};
		case "mode":
		{
			[RRPClientStoreSelected,player] remoteExecCall ["RRPServer_ltd_changeMode",2];
		};
		case "status":
		{
			if (RRPClientStoreSelected getVariable ["ltdActive",false]) then 
			{
				[RRPClientStoreSelected,true,player] remoteExecCall ["RRPServer_ltd_activeStore",2];
			}else{
				[RRPClientStoreSelected,false,player] remoteExecCall ["RRPServer_ltd_activeStore",2];
			};		
		};
		case "deleteMe":
		{
			[] spawn
			{
				_action = ["Вы уверены что хотите удалить магазин? Все товары продаваемые в нем, будут безвозвратно удалены и средства затраченные на его установку не будут возвращены!","Удалить?","Да","Не надо"] call BIS_fnc_guiMessage;
				if(_action) then 
				{
					[RRPClientStoreSelected,player] remoteExecCall ["RRPServer_ltd_deleteStore",2];
					closeDialog 0;
				}else{};
			};
		};
	};
	RRPClientLtdWaitResponse = true;
}catch{
	["ErrorTitleOnly", [_exception]] call SmartClient_gui_toaster_addTemplateToast;
};