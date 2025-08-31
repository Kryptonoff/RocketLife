
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 23000;
private _text = _slide controlsGroupCtrl 23002;
_text ctrlSetStructuredText parseText format ["<t size='1.2' align='center'>Привет, %1!</t><br/>"+
"Если вы столкнулись с ошибкой, неподобающим поведением или просто хотите оставить отзыв<br/>
Вы можете оставить свое обращение ниже, постарайтесь составить свою заявку максимально развернуто", player call getNickFullName];

private _text = _slide controlsGroupCtrl 23003;
_text ctrlSetStructuredText parseText "Введите тему обращения";

private _text = _slide controlsGroupCtrl 23006;
_text ctrlSetStructuredText parseText "Напишите текст обращения ниже";

private _button = _slide controlsGroupCtrl 23007;
_button ctrlSetEventHandler ["ButtonClick","_this call RRPClient_bug_sendReport"];
