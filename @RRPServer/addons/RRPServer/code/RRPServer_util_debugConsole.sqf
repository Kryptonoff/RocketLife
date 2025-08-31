/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

_string = _this;
if (_string isEqualTo '') exitWith {};
if !(_string isEqualType '') then {
    _string = str _string
};
private _rptString = (_string splitString "#~") select 0;
if (_rptString isEqualTo '0000') exitWith {};
diag_log _rptString;
"debug_console" callExtension _string;