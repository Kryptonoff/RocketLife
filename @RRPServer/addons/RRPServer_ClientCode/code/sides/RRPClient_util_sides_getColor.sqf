/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _input = param [0,objNull,[objNull,""]];
private _return = [1,1,1,1];

try{
	if (_input isEqualType objNull) then {if (isNull _input) throw [1,1,1,0.99]};
	if (_input isEqualType "") then {if (_input isEqualTo "") throw [1,1,1,0.98]};
	
	_input = [_input,_input getVariable ["RRPSide","error"]] select (_input isEqualType objNull);
	
	private _config = getMissionConfig "CfgSides" >> _input;

	if !(isClass(_config)) throw [1,1,1,0.97];

	throw getArray(_config >> "colors");
}
catch{
	_return = _exception;
};
_return
