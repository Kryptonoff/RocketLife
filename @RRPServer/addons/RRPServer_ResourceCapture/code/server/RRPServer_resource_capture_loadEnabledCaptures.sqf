

try
{
    
    private _query = "loadingAllCaptures" call RRPServer_DB_selectFull;
    {
        _x params ["_objectString","_procName","_groupOwner", ["_groupName",""],"_earned","_applics","_nextBattle","_captured"];
        private _applicantsNames = "";
        private _applicantsIDs = [];
        _groupName = if (isNil "_groupName" or {_groupName isEqualTo ""}) then {"Никто"}else{_groupName}; 
        {
            if !((_x select 0) isEqualTo []) then 
            {
                if (_applicantsNames isEqualTo "") then 
                { 
                    _applicantsNames = _x select 0;
                } else {
                    _applicantsNames = format["%1,%2", _applicantsNames, _x select 0];
                };
            } else {
                _applicantsNames = _x;
            };
            _applicantsIDs pushback (_x select 1);
        } forEach _applics;

        _x set [5, format["%1-%2-%3 %4:%5", _nextBattle select 2, _nextBattle select 1, _nextBattle select 0, _nextBattle select 3, _nextBattle select 4]];
        _x set [6, format["%1-%2-%3 %4:%5", _captured select 2, _captured select 1, _captured select 0, _captured select 3, _captured select 4]];
        _x set [8, _applicantsNames];
        _x set [9, _applicantsIDs];
        
    } forEach _query;
    enabledCaptures = _query;
    publicVariable "enabledCaptures";

}catch{
    format ["CaptureLoad: %1",_exception] call RRPServer_util_log;
};
true
