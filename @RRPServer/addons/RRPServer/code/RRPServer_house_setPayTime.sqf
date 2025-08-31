/**
	File: RRPServer_house_setPayTime
	Project: Aurora Role Play
	Author: FairyTale
*/

private _house = _this;
private _currentTimestamp = systemTime;
private _lpt = _house getVariable ["LastPayTime", _currentTimestamp];
private _maintenancePeriod = 30;
private _maintenancePeriodDueDate = parseSimpleArray ("extDB3" callExtension format["9:DATEADD:%1:[%2,0,0,0]",_lpt,_maintenancePeriod]);
_house setVariable ["HouseMaintanceDate", _maintenancePeriodDueDate select 1, true];
true
