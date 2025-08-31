# RRP Tablet

### Как использовать?

## Семпл для GUI редактора
```
/* #Salabe
$[
	1.063,
	["template",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[-2300,"TemplateGroup",[1,"",["0.386553 * safezoneW + safezoneX","0.178786 * safezoneH + safezoneY","0.402222 * safezoneW","0.629227 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-2400,"backButton",[2300,"MainMenu",["0.305272 * safezoneW","0.58749 * safezoneH","0.0928206 * safezoneW","0.0330014 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/
```

Кнопка "Назад" уже определена классом `MainMenuButton`, там уже указана позиция и размер кнопки

## Вызов инициализирующей функции для слайда

Функция при открытии приложения должна называться `RRPClient_tablet_app_%1_onOpen`, где %1 это название класса в конфиге кнопок
Функция при закрытии приложения должна называться `RRPClient_tablet_app_%1_onClose`, где %1 это название класса в конфиге кнопок

## Стандартное начало функции для слайда

```
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl __IDC__;
```

``` cpp
RRPClient_tablet_slide 
    [
        "Slide", // класснейм слайда, который указан в конфиге
        1 // в какую сторону будет свайп 
    ]
```

## Шрифты для планшета:
```
SFCompactTextItalic
SFCompactText
SFCompactTextBold
SFCompactDisplay
SFProDisplay
```
## UI Kit:
``` CPP
class AppTabletButton: TabletButton {};
class AppRscEdit: ctrlEdit {};
class AppRscEditMulti: AppRscEdit {};
class AppRscCombo: ctrlCombo {};
class AppRscTree: ctrlTree {};
class AppRscListbox: ctrlListbox {};
class AppRscListNbox: ctrlListNBox {};
class AppRscStructuredText: ctrlStructuredText {};
class AppRscXListBox: ctrlXListbox {};
class AppRscMap: RscMapControl {};
class AppRscCheckBox: ctrlCheckbox {};
class AppRscXSlider: RscXSliderH {};
```
Кнопка Назад = `MainMenuButton`, всегда указывать idc +1 от слайда 

**Используйте AppToggle вместо AppRscCheckBox**
