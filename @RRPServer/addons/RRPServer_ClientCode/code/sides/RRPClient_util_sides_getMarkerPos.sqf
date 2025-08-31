/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _input = param [0,objNull,[objNull,""]];
private _return = [14026.5,18684.4,0];

try{
	if (_input isEqualType objNull) then {if (isNull _input) throw [14026.5,18684.4,0]};
	if (_input isEqualType "") then {if (_input isEqualTo "") throw [14026.5,18684.4,0]};
	
	_input = [_input,_input getVariable ["RRPSide","error"]] select (_input isEqualType objNull);
	
	private _config = getMissionConfig "CfgSides" >> _input;

	if !(isClass(_config)) throw [14026.5,18684.4,0];

	throw (getMarkerPos getText(_config >> "safeMarker"));
}
catch{
	_return = _exception;
};
_return
