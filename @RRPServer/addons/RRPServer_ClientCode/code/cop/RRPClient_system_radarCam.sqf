if (player call getSide isEqualTo "cop") exitWith {};

params ["_driver","_speed","_limit"];
_limit = _limit + 19;
if (isNull (objectParent _driver)) exitWith {
	diag_log "Driver camera: player is null";
};

if ((objectParent _driver isKindOf "Ship") OR {(objectParent _driver isKindOf "Air")}) exitWith {
	diag_log "Driver camera: ship or air";
};

if (!(_speed > _limit) or {!(_driver call getSide in ["civ","reb"])}) exitWith {
	diag_log "Driver camera: speed is below limit or side == cop or med";
};

try
{
	life_speedTicket = life_speedTicket + 1;
	private _ticket = round (((_speed - _limit) / 2) * life_speedTicket);
	if (_ticket < 10) then {_ticket = 100};

	["speedfee",1] call RRPClient_ach_gateway;

	player say3d "PhotoSound";

	uiSleep 0.05;
	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]];
	"colorCorrections" ppEffectCommit 0;
	uiSleep 0;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];
	"colorCorrections" ppEffectCommit 0.05;
	uiSleep 0.05;
	"colorCorrections" ppEffectEnable false;
	uiSleep 0.1;
	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]];
	"colorCorrections" ppEffectCommit 0;
	uiSleep 0;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];
	"colorCorrections" ppEffectCommit 0.05;
	uiSleep 0.05;
	"colorCorrections" ppEffectEnable false;

	_text = format["<br/>Это ваш %1-ый штраф за превышение скорости. Соблюдайте ПДД!",life_speedTicket];
	switch (life_speedTicket) do
	{
		case 1,case 2: {};
		case 3:
		{
			_text = _text + "<br/>Следующее нарушение скоростного режима внесет вас в список розыска полиции!";
		};
		case 4:
		{
			_text = _text + "<br/>Вы были внесены в розыск!";
			[getPlayerUID _driver,"S120S"] remoteExecCall ["RRPServer_ws_wantedAdd",2];
		};
		default
		{
			_text = _text + format["<br/><br/>Вы в были внесены в Национальный розыск, как многократный нарушитель!",life_speedTicket];
			[getPlayerUID _driver,"H120H"] remoteExecCall ["RRPServer_ws_wantedAdd",2];
			[1] remoteExecCall ["RRPClient_system_removeLicenses",_driver];
		};
	};
	if (RRPClientCashMoney <= _ticket) then
	{
		if (RRPClientAtmMoney <= _ticket) then
		{
			[getPlayerUID _driver,"S120S"] remoteExecCall ["RRPServer_ws_wantedAdd",2];
			throw format ["<t color='#0072ff'><t size='1.5'>Полицейский радар</t></t><br/><br/><t color='#ff0000'>Скорость: %1 км/ч</t><br/>Скоростной лимит: %2 км/ч<br/>Водитель: %3<br/><br/><t color='#ffde00'>Штраф: $%4%5</t><br/><br/>Так как у Вас недостаточно средств и не можете оплатить штраф, то вы попадаете в розыск",round _speed,_limit,_driver call getNickName,[_ticket] call RRPClient_util_numberText,_text];
		};
		[[player,"atm","take",_ticket],"system_moneyChange"] call RRPClient_system_hcExec;
		throw format ["<t color='#0072ff'><t size='1.5'>Полицейский радар</t></t><br/><br/><t color='#ff0000'>Скорость: %1 км/ч</t><br/>Скоростной лимит: %2 км/ч<br/>Водитель: %3<br/><br/><t color='#ffde00'>Штраф: $%4%5</t>",round _speed,_limit,_driver call getNickName,[_ticket] call RRPClient_util_numberText,_text];
	} else {
		[[player,"cash","take",_ticket],"system_moneyChange"] call RRPClient_system_hcExec;
		throw format ["<t color='#0072ff'><t size='1.5'>Полицейский радар</t></t><br/><br/><t color='#ff0000'>Скорость: %1 км/ч</t><br/>Скоростной лимит: %2 км/ч<br/>Водитель: %3<br/><br/><t color='#ffde00'>Штраф: $%4%5</t>",round _speed,_limit,_driver call getNickName,[_ticket] call RRPClient_util_numberText,_text];
	};
}catch{
	[_exception,"warning"] call hints;
};

true