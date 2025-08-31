disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 41000;

private _textGroup = _slide controlsGroupCtrl 41002;
private _textCtrl = _textGroup controlsGroupCtrl 41003;
_textCtrl ctrlSetStructuredText parseText format ["<t size='2' align='center'>TRX Store</t><br/><br/>"+
"Что такое TRX и где их получить?<br/> - Это второстепенная валюта, ее можно получить из кейсов, ивентов или другой активности на сервере<br/>"+
"Могу ли я передать TRX другому игроку?<br/> - Нет, TRX закрепляются за одним человеком их невозможно передать или потерять, только потратить в TRX Store<br/>"+
"Я купил тут предмет, где мне его получить?<br/> - Все покупки совершенные в TRX Store отправляются в тайник, забрать их там можно в любое время<br/>"
];
_positionText = ctrlPosition _textCtrl;
_hText = ctrlTextHeight _textCtrl;
_textCtrl ctrlSetPositionH _hText;
_textCtrl ctrlCommit 0;
