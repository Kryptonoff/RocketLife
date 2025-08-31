disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 37500;
private _descriptionGroup = _slide controlsGroupCtrl 37502;
private _description = _descriptionGroup controlsGroupCtrl 37512;
private _cost = getNumber(getMissionConfig "CfgGroups" >> "createGroupCost");
_description ctrlSetStructuredText parseText (format ["<t size='1.5' align='center'>Организация</t><br/>"+
"Представляем вам приложение для регистрации организации, которое позволит вам эффективно управлять вашей командой и улучшить взаимодействие между ее участниками.<br/>
Организация имеет 10 доступных слотов, что означает, что вы можете зарегистрировать до 10 участников в вашей организации.<br/>
Стоимость регистрации составляет $%1.<br/><br/>
Участники вашей организации будут видеть себя на карте, что позволит им легко найти своих коллег в любое время. <br/>
Они также будут иметь доступ к рации, что поможет им быстро связаться друг с другом в случае необходимости.<br/>
Организация также позволяет участникам устанавливать ""сообщение дня"", которое будет отображаться на главной странице приложения, чтобы поддерживать командный дух и мотивацию внутри организации.<br/>
Управление вашей организацией будет проще и удобнее, благодаря функционалу приложения организации.<br/><br/>
Кроме того, приложение для регистрации организации также предоставляет функционал управления общим счетом организации. Вам будет доступен общий счет до $%2, который вы сможете использовать для финансирования проектов и закупки необходимого оборудования для вашей команды.<br/><br/>
Нужно больше? В <t color='#40E0D0'><a href='https://lk.rocket-rp.fun'>Личном кабинете</a></t> есть информация о официальных организациях! Переходите в <t color='#40E0D0'><a href='https://lk.rocket-rp.fun'>Личный кабинет</a></t>, вкладка Услуги -> Своя организация!<br/><br/>"
,[_cost] call RRPClient_util_numberText, [getNumber(getMissionConfig "CfgGroups" >> "limitDeposit")] call RRPClient_util_numberText]);

_positionText = ctrlPosition _description;
_hText = ctrlTextHeight _description;
_description ctrlSetPositionH _hText;
_description ctrlCommit 0;

private _createButton = _slide controlsGroupCtrl 37504;
_createButton ctrlAddEventHandler ["ButtonClick", {
	call RRPClient_groups_createGroupRequest;
}];
