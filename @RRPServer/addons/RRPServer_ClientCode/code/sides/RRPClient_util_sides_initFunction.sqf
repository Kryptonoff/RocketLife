/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _input = param [0,objNull,[objNull,""]];
private _return = false;

try{
	if (_input isEqualType objNull) then {if (isNull _input) throw _return};
	if (_input isEqualType "") then {if (_input isEqualTo "") throw _return};
	
	_input = [_input,_input getVariable ["RRPSide","error"]] select (_input isEqualType objNull);
	
	private _config = getMissionConfig "CfgSides" >> _input;

	if !(isClass(_config)) throw _return;

	call compile getText(_config >> "initFunction");
	throw true;
}
catch{
	_return = _exception;
};
_return
