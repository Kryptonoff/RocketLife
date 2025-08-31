/*
	Project: Rimas Role Play
	License: CC BY-ND
	Author: FairyTale#5571
*/

private["_toastControl", "_status", "_statusChangeAt", "_toastPosition"];
disableSerialization;
if ((diag_tickTime - SmartClientLastToastTickAt) >= 0.5) then 
{
    {
        _toastControl = _x select 0;
        _status = _x select 1;
        _statusChangeAt = _x select 2;
        if (diag_tickTime >= _statusChangeAt) then 
        {
            switch (_status) do 
            {
                case 0:
                {
                    _toastPosition = ctrlPosition _toastControl;
                    _toastPosition set [1, (_toastPosition select 1) + 20 * pixelH];
                    _toastControl ctrlSetPosition _toastPosition;
                    _toastControl ctrlSetFade 1;
                    _toastControl ctrlCommit 0.25;
                    SmartClientToasts set [_forEachIndex, [_toastControl, 1, diag_tickTime + 1]];
                };
                case 1:
                {
                    ctrlDelete _toastControl;
                    SmartClientToasts deleteAt _forEachIndex;
                };
            };
        };
    }
    forEach SmartClientToasts;
    SmartClientLastToastTickAt = diag_tickTime;
};