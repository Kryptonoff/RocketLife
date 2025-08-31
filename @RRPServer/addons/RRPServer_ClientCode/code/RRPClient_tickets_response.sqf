
params [
	["_success",false],
	["_message",""],
	["_add",0]
];

if !(_success) exitWith {
	["Счет",_message] call toastError;
};

if (call RRPClient_groups_inGroup) then {
	_side = RRPClientGroupInfo get "side";
	_config = switch (_side) do {
		case "cop": {"ticketPayCop"};
		case "med": {"ticketPayMed"};
		default {""};
	};
	_tax = (RRPClientGroupInfo get "taxes") get _config;
	if (_tax > 0) then {
		_tax = _rate * (_tax / 100);
		_rate = _rate - _tax;
		[player getVariable ["GroupId",-1],"add",_tax] remoteExecCall ["RRPServer_groups_moneyChange",2];
	};
};

[[player,"atm","add",_toAdd],"system_moneyChange"] call RRPClient_system_hcExec;
