params ["_control", "_selectedIndex"];

if !(life_cs_lastSelected isEqualTo "") then {life_cs_lastSelected setMarkerColorLocal "ColorOrange";};
private _marker = format["%1_cs", _selectedIndex];
_marker setMarkerColorLocal "ColorGreen";
if !(life_cs_lastSelected isEqualTo _marker) then {life_cs_lastSelected setMarkerColorLocal "ColorOrange";};
life_cs_lastSelected = _marker;
life_cs_selected = _selectedIndex;
private _vehicle = _control lbData _selectedIndex;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 21000;
private _map = _slide controlsGroupCtrl 21006;
private _rulesText = _slide controlsGroupCtrl 21003;

_basePrice = getNumber(getMissionConfig "CfgCar2GO" >> "Cars" >> _vehicle >> "price");

_rulesText ctrlSetStructuredText parseText format["<t size='1'><t color='#FFFFFF'>Здесь вы можете арендовать машину которая находится рядом с вами.<br/>
%1
Деньги будут списываться с вашего банковского счета. Машину необходимо оставлять на дороге в радиусе зон паркинга без повреждений, иначе на вас будет наложен штраф или предупреждения, если у вас нет денег.", 
format["Цена за бронь %1 - <t color='#00FF00'>$%2</t>, цена за минуту аренды - <t color='#00FF00'>$%3</t><br/>",
getText (configfile >> "CfgVehicles" >> _vehicle >> "displayName"), [_basePrice * 10] call RRPClient_util_numberText, [_basePrice] call RRPClient_util_numberText
]];

_map ctrlMapAnimAdd [0.1, 0.1, getMarkerPos _marker];
ctrlMapAnimCommit _map;