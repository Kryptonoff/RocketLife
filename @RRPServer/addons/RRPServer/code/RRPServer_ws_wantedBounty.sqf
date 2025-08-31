/*
    File: fn_wantedBounty.sqf
    Author: Bryan "Tonic" Boardwine"
    Database Persistence By: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm

    Description:
    Checks if the person is on the bounty list and awards the cop for killing them.
    [[_unit,player,false],"wantedBounty"] call RRPClient_system_hcExec;
    _unit - наказывают
    player - наказавший

*/
private ["_unit","_cop","_half","_unitUid","_query","_queryResult","_amount"];
private _unit = param [0,objNull,[objNull]];
private _cop = param [1,objNull,[objNull]];
private _half = param [2,false,[false]];
if (isNull _unit || isNull _cop) exitWith {};
private _unitUid = getPlayerUID _unit;
private _queryResult = format ["wantedPerson:%1",_unitUid] call RRPServer_DB_selectFull;
if !(_queryResult isEqualTo []) then 
{
    _amount = 0;
	{
		_crime = _x select 1;
		_cost = getNumber(missionConfigFile >> "LifeCfgCrimes" >> _crime >> "reward");
		_amount = _amount + _cost;
	}forEach _queryResult;
    if !(_amount isEqualTo 0) then {
        if (_half) then {
            if (_amount > 50000) then
            {
                _tax = round(_amount * (server_tax/100));
                _amount = _amount - _tax;
            };
            format ["insertSalary:%1:%2",getPlayerUID _cop,(_amount / 2)] call RRPServer_DB_insertSingle;
        } else {
            if (_amount > 50000) then
            {
                _tax = round(_amount * (server_tax/100));
                _amount = _amount - _tax;
            };
            format ["insertSalary:%1:%2",getPlayerUID _cop,_amount] call RRPServer_DB_insertSingle;
        };
    };
};

