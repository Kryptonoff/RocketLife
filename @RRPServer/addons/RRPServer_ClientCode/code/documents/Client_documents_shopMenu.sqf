try {
	private _documentsShop = param [3,"",[""]];
	if !(isClass (missionConfigFile >> "LifeCfgDocumentsShop" >> _documentsShop)) throw "config error";

	disableSerialization;
	if (isNull (findDisplay 55200)) then {
		createDialog "ALDialogDocumentsShop";
		waitUntil {!isNull (findDisplay 55200)};
	};

	life_docShopOpened = _documentsShop;

	private _conditions = getText(missionConfigFile >> "LifeCfgDocumentsShop" >> life_docShopOpened >> "conditions");
	if !([_conditions] call RRPClient_util_conditionsCheck) throw "Доступ запрещен!";

	private ["_docShopList","_docInfo","_docBuyButton","_docTitle"];
	 _docShopList = ((findDisplay 55200) displayCtrl 55201);
	 _docInfo = ((findDisplay 55200) displayCtrl 55202);
	 _docBuyButton = ((findDisplay 55200) displayCtrl 55203);
	 _docTitle = ((findDisplay 55200) displayCtrl 55204);

	_docTitle ctrlSetText (getText(missionConfigFile >> "LifeCfgDocumentsShop" >> _documentsShop >> "name"));

	[] call Client_documents_shopUpdate;

} catch {
	["ErrorTitleAndText", ["Документы", _exception]] call SmartClient_gui_toaster_addTemplateToast;
}
