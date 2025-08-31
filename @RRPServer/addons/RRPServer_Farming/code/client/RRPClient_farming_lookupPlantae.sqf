/*
	Project: Aurora Role Play
	Filename: RRPClient_farming_lookupPlantae.sqf
	Author: МишаняНуНихуяСебе
	License: CC BY-ND
*/
try {
	if (life_action_inUse OR life_action_gathering) throw "Вы заняты";
	if !(isNull objectParent player) throw "Вы не можете заниматься этим находясь в транспорте!";

	private _plant = param [0,objNull,[objNull]];
	if (isNull _plant) throw "Растения больше нет";

	private _state = _plant getVariable["growState", []];
	if (_state isEqualTo []) throw "У растения нет статуса";

	private _curState = _state select 0;
	private _totalState = _state select 1;
	private _curGrowKoef = _state select 2;
	private _watered = _state select 4;
	private _fertilized = _state select 5;
	private _percentage = ((_curstate / _totalstate) * 100);

	private _zrelost = call { 
		if (_percentage < 50) exitWith {"низкая"}; 
		if (_percentage >= 50 && _percentage < 80) exitWith {"средняя"};
		if (_percentage >= 80 && _percentage < 100) exitWith {"высокая"};
		if (_percentage >= 100) exitWith {"полностью созрело"}; 
		"Ошибка!"; 
	};

	private _rost = call { 
		if ((_curGrowKoef * _watered) == 0) exitWith {"не растёт"}; 
		if ((_curGrowKoef * _watered) <= 1) exitWith {"очень низкая"}; 
		if ((_curGrowKoef * _watered) >= 1 && (_curGrowKoef * _watered) < 1.15) exitWith {"средняя"};
		if ((_curGrowKoef * _watered) >= 1.15 && (_curGrowKoef * _watered) < 1.25) exitWith {"выше среднего"};
		if ((_curGrowKoef * _watered) >= 1.25 && (_curGrowKoef * _watered) < 1.4) exitWith {"высокая"};
		if ((_curGrowKoef * _watered) >= 1.4 && (_curGrowKoef * _watered) < 1.65) exitWith {"очень высокая"};
		if ((_curGrowKoef * _watered) > 1.65) exitWith {"растёт как на дрожжах"}; 
		"Ошибка!"; 
	};

	private _polito = call { 
		if (_watered == 1) exitWith {"полито"}; 
		if (rain >= 0.4) exitWith {"будет полито дождём"};
		if (rain >= 0.2) exitWith {"скоро будет полито дождём"};
		if (rain >= 0.1) exitWith {"медлено поливается дождём"};
		if (rain >= 0.01) exitWith {"очень медлено поливается дождём"}; 
		if (_watered >= 0.1) exitWith {"требует полива"};
		if (_watered == 0) exitWith {"не полито"};
		"Ошибка!"; 
	};

	private _udobreno = call { 
		if (_fertilized == -1) exitWith {"не требует удобрения"}; 
		if (_fertilized >= 1) exitWith {"удобрено"};
		if (_fertilized == 0) exitWith {"не удобрено"};
		"Ошибка!"; 
	};

	hint parseText format["
		<t color='#009900'><t size='1.5'>Растение</t><br/>
		<t color='#FFD700'><t size='1.2'>Зрелость:</t><t color='#ffffff' ><t size='1'> %1</t><br/>
		<t color='#FFD700'><t size='1.2'>Рост:</t><t color='#ffffff'><t size='1'> %2</t><br/>
		<t color='#FFD700'><t size='1.2'>Поливка:</t><t color='#ffffff'><t size='1'> %3</t><br/>
		<t color='#FFD700'><t size='1.2'>Удобрен:</t><t color='#ffffff'><t size='1'> %4</t><br/>",
	   _zrelost,
	   _rost,
	   _polito,
	   _udobreno
	];
} catch {
	["Растения", _exception] call toastError;
};