/*
	Project: Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

params 
[
    ["_unit",objNull,[objNull]],
    ["_cop",objNull,[objNull]],
    ["_unitId","",[""]],
    ["_side","error",[""]]
];

if (isNull _unit || isNull _cop || _unitId isEqualTo "" || _side isEqualTo "error") exitWith {};
if (_side isEqualTo "cop") exitWith {};

if (_unit getVariable ["lifeState",""] isEqualTo "HEALTHY") exitWith {};
_queryResult = format ["wantedPerson:%1",_unitId] call RRPServer_DB_selectFull;
if !(_queryResult isEqualTo []) then 
{
    _amount = 0;
	{
		_crime = _x select 1;
		_cost = getNumber(missionConfigFile >> "LifeCfgCrimes" >> _crime >> "reward");
		_amount = _amount + _cost;
	}forEach _queryResult;
	
    if !(_amount isEqualTo 0) then 
	{
        if (_amount > 50000) then
        {
            _tax = round(_amount * (server_tax/100));
            _amount = _amount - _tax;
        };
        format ["insertSalary:%1:%2",getPlayerUID _cop,(_amount / 2)] call RRPServer_DB_insertSingle;
        [_unitId] call RRPServer_ws_wantedRemove;
    };
};
