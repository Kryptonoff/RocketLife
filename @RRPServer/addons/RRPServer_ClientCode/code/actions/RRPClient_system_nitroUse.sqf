/*
	Filename: 	RRPClient_system_nitroUse.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"

try{

	if (NOTINVEH(player)) throw "Вы не в технике";
	private _vehicle = objectParent player;
	private _adacNitro = _vehicle GVAR ["adacNitroUsed",false];
	private _adacNitroUsed = _vehicle GVAR ["adacNitroCooldown",-1];
	if !(_adacNitro) throw "На этой технике нет закиси азота";
	if (_adacNitroUsed > 0 && {(time - _adacNitroUsed) < 120}) throw "Закись азота можно использовать не чаще раза в 2 минуты";
	if ((speed _vehicle) <= 20) throw "Вы должны быть в движении, чтобы использовать закись азота!";
	private _fuelTax = 0.25;
	if (fuel _vehicle < _fuelTax) throw "У вас мало топлива. Должно быть больше половины бака!";

	[_vehicle,"adacNitroCooldown",time] call CBA_fnc_setVarNet;

	["SuccessTitleAndText",["Нитро","Нитро активировано!"]] call toast;
	player say3D "action_nitro";

	private _vel = velocity _vehicle;  
	private _dir = direction _vehicle;  
	private _speed = 40;
	_vehicle setVelocity [(_vel select 0) + (sin _dir * _speed), (_vel select 1) + (cos _dir * _speed), (_vel select 2)];

	if(!local _vehicle) then {	
		[_vehicle,(fuel _vehicle) - _fuelTax] remoteExecCall ["RRPClient_system_setFuel",_vehicle];
	} else {
		_vehicle setFuel ((fuel _vehicle) - _fuelTax);
	};
}catch{
	["ErrorTitleAndText",["Нитро", _exception]] call toast;
};
