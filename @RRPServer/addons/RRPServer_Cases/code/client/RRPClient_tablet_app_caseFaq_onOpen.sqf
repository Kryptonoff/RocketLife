disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 39300;

private _backButton = _mainGroup controlsGroupCtrl 39301;
_backButton ctrlRemoveAllEventHandlers "ButtonClick";
_backButton ctrlAddEventHandler ["ButtonClick", {[RRPClientBackButton,0] call RRPClient_tablet_slide}];

private _textGroup = _slide controlsGroupCtrl 39302;
private _textCtrl = _textGroup controlsGroupCtrl 39303;
_textCtrl ctrlSetStructuredText parseText format ["<t size='2' align='center'>Кейсы</t><br/><br/>"+
"<t size='1'>Кейсы можно получить за все что угодно, за просто нахождение на сервере, ивенты, определенные действия или просто купить</t><br/><br/>"+
"Кейсы систематически будут обновляться, поэтому не забывайте заходить на сервер и проверять обновления<br/><br/>"+
"Как и где я могу получить выигранный подарок?<br/> - Все подарки можно забрать в тайнике<br/><br/>"+
"Где находится тайник?<br/> - Тайник это робот Гривус, он находится в центре основнных городов, а также на местах проживания организаций<br/><br/>"+
"Я выиграл машину/вещь/предмет - он будет в магазине чтобы я смог покупать его всегда?<br/> - Нет, все вещи ограничены, машина выдается в одном экземпляре, вещи/предметы в одном и более экземпляре<br/><br/>"+
"Я могу передать/подарить кейс другому игроку?<br/> - Нет, передать кейс другому игроку невозможно<br/>"
];
_positionText = ctrlPosition _textCtrl;
_hText = ctrlTextHeight _textCtrl;
_textCtrl ctrlSetPositionH _hText;
_textCtrl ctrlCommit 0;
