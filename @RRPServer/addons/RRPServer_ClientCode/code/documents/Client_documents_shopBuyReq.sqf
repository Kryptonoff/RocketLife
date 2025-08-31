try {
	if ((time - life_action_delay) < 3) throw "Вы делаете это слишком быстро!";
	life_action_delay = time;

	disableSerialization;
	private _docList = ((findDisplay 55200) displayCtrl 55201);
	private _docBuyButton = ((findDisplay 55200) displayCtrl 55203);

	private _index = (lbCurSel _docList);
	if (_index isEqualTo -1) throw "Вы не выбрали документ!";

	private _tvData = (_docList lbData _index);
	if (_tvData isEqualTo "") throw "Нету информации";

	(parseSimpleArray _tvData) params ["_docClass","_conditions","_message"];

	if (_docClass in life_documents) throw "У вас уже есть такой документ...";
	if !([_conditions] call RRPClient_util_conditionsCheck) throw "У вас нет доступа к этому документу";

	private ["_name","_expires","_description","_price"];
	_name = getText(missionConfigFile >> "LifeCfgDocuments" >> _docClass >> "name");
	_expires = getNumber(missionConfigFile >> "LifeCfgDocuments" >> _docClass >> "expires");
	_description = getText(missionConfigFile >> "LifeCfgDocuments" >> _docClass >> "description");
	_price = getNumber(missionConfigFile >> "LifeCfgDocuments" >> _docClass >> "price");
	_price = ["priceSell",_price] call RRPClient_system_VIP;

	if (RRPClientCashMoney < _price) throw "Недостаточно денег";
	life_docBuyReq = nil;

	_docBuyButton ctrlEnable false;

	[[netId player,life_docShopOpened,_docClass],"doc_buyDocuments"] call RRPClient_system_hcExec;
	waitUntil {uiSleep 0.3; !isNil "life_docBuyReq"};

	_docBuyButton ctrlEnable true;

	if !life_docBuyReq throw "Возникла ошибка при покупке документа";

	if life_docBuyReq then {
		["SuccessTitleAndText", ["Документы", format["Вы оформили: <t color='#ff9a03'>%1</t><br/>Описание: <t color='#ff9a03'>%2</t><br/>Срок действия документа: <t color='#ff9a03'>%3дн.</t>",_name,_description,if (_expires < 0) then {"Неограниченное"} else {_expires}]]] call SmartClient_gui_toaster_addTemplateToast;
		[player,"cash","take",STR(_price)] remoteExecCall ["RRPServer_system_moneyChange",2];
	};

	life_docBuyReq = nil;
} catch {
	["ErrorTitleAndText", ["Документы", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
