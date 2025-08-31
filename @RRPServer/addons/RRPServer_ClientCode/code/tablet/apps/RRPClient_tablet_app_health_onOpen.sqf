disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _healthSlide = _mainGroup controlsGroupCtrl 27000;

private _hitHead = round ((player getHitPointDamage "hitHead") * 100);
private _hitBody = round ((player getHitPointDamage "hitBody") * 100);
private _hitHands = round ((player getHitPointDamage "hitHands") * 100);
private _hitLegs = round ((player getHitPointDamage "hitLegs") * 100);

private _headImage = _healthSlide controlsGroupCtrl 3611;
private _bodyImage = _healthSlide controlsGroupCtrl 3612;
private _handsImage = _healthSlide controlsGroupCtrl 3613;
private _legsImage = _healthSlide controlsGroupCtrl 3614;

private _healthInfo = _healthSlide controlsGroupCtrl 3615;
_damageText = "";
_healthText = "";

if (_hitHead >= 25) then {
	_damageText = _damageText + "Ранение головы<br/>";
};
if (_hitBody >= 25) then {
	_damageText = _damageText + "Ранение туловища<br/>";
};
if (_hitHands >= 25) then {
	_damageText = _damageText + "Ранение рук<br/>";
};
if (_hitLegs >= 25) then {
	_damageText = _damageText + "Ранение ног<br/>";
};
if (life_bleeding) then {
	_damageText = _damageText + "Кровотечение<br/>";
};
if (life_pain_shock) then {
	_damageText = _damageText + "Болевой шок<br/>";
};
if (life_critHit) then {
	_damageText = _damageText + "Критическое ранение<br/>";
};

if (_damageText == "") then {
	_damageText = "<t size='0.85' color='#c3ff21'><br/><br/>Повреждений нет<br/></t>";
} else {
	_damageText = "<t size='0.85' color='#ff4e00'><br/><br/>" + _damageText + "</t>";
};


if (RRPClientNarcomania isEqualTo 1) then {
	_healthText = _healthText + "Зависимость от легких наркотиков<br/>";
};
if (RRPClientNarcomania isEqualTo 2) then {
	_healthText = _healthText + "Зависимость от тяжелых наркотиков<br/>";
};
if (life_sickness) then {
	_healthText = _healthText + "Вы болеете<br/>";
};
if (life_diarrhea) then {
	_healthText = _healthText + "Диарея";
};

if (_healthText isEqualTo "") then {
	_healthText = "<t size='0.8' color='#c3ff21'><br/><br/>Заболеваний нет</t>";
} else {
	_healthText = "<t size='0.8' color='#ff4e00'><br/><br/>" + _healthText + "</t>";
};

_healthInfo ctrlSetStructuredText parseText format ["<t size='1.15'>Повреждения:</t>%1<br/><t size='1.15'>Здоровье:</t>%2",_damageText, _healthText];

switch (true) do
{
	case (_hitHead >= 0 && _hitHead < 25): {_headImage ctrlSetText "\rimas_pack\pictures\health\head1.paa"};
	case (_hitHead >= 25 && _hitHead <= 75 ): {_headImage ctrlSetText "\rimas_pack\pictures\health\head2.paa"};
	case (_hitHead > 75 && _hitHead <= 100): {_headImage ctrlSetText "\rimas_pack\pictures\health\head3.paa"};
};

switch (true) do
{
	case (_hitBody >= 0 && _hitBody < 25): {_bodyImage ctrlSetText "\rimas_pack\pictures\health\body1.paa"};
	case (_hitBody >= 25 && _hitBody <= 75): {_bodyImage ctrlSetText "\rimas_pack\pictures\health\body2.paa"};
	case (_hitBody > 75 && _hitBody <= 100): {_bodyImage ctrlSetText "\rimas_pack\pictures\health\body3.paa"};
};

switch (true) do
{
	case (_hitHands >= 0 && _hitHands < 25): {_handsImage ctrlSetText "\rimas_pack\pictures\health\hands1.paa"};
	case (_hitHands >= 25 && _hitHands <= 75 ): {_handsImage ctrlSetText "\rimas_pack\pictures\health\hands2.paa"};
	case (_hitHands > 75 && _hitHands <= 100): {_handsImage ctrlSetText "\rimas_pack\pictures\health\hands3.paa"};
};

switch (true) do
{
	case (_hitLegs >= 0 && _hitLegs < 25): {_legsImage ctrlSetText "\rimas_pack\pictures\health\legs1.paa"};
	case (_hitLegs >= 25 && _hitLegs <= 75 ): {_legsImage ctrlSetText "\rimas_pack\pictures\health\legs2.paa"};
	case (_hitLegs > 75 && _hitLegs <= 100): {_legsImage ctrlSetText "\rimas_pack\pictures\health\legs3.paa"};
};
