/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private ["_control","_input"];
_control = (_this#0) param [0,controlNull,[controlNull]];
if (isNull _control) exitWith {};
_input = param [1,"",[""]];
switch (_input) do
{
	case "nosignal":
	{
		if !(canSuspend) exitWith {_this spawn RRPClient_CCTV_loadInfo};
		_st = 1;
		_path = "\exile_assets\assets\nosignal\";
		while {!isNull _control} do
		{
			_control ctrlSetText (_path + str(_st) + ".paa");
			_st = _st + 1;
			if (_st isEqualTo 7) then {_st = 1};
			uiSleep 0.08;
		};
	};
	case "selcamera":
	{
		if !(canSuspend) exitWith {_this spawn RRPClient_CCTV_loadInfo};
		_st = 1;
		_path = "\exile_assets\assets\selcamera\";
		while {!isNull _control} do
		{
			_control ctrlSetText (_path + str(_st) + ".paa");
			_st = _st + 1;
			if (_st isEqualTo 14) then {_st = 1};
			uiSleep 0.08;
		};
	};
	case "date": 
	{
		private _date = if (isNil "RRPPublicTime") then {date}else{RRPPublicTime};
		_control ctrlSetStructuredText parseText format 
		["<t align='center' size='1.7'>%1.%2.%3</t>",_date select 1,_date select 2,_date select 0];
	};
	case "time": 
	{
		private _date = if (isNil "RRPPublicTime") then {date}else{RRPPublicTime};
		_control ctrlSetStructuredText parseText format [
		"<t align='center' size='1.7'>%1:%2</t>",_date select 3,_date select 4];
	};
	case "player": 
	{
		_control ctrlSetStructuredText parseText format
		[
			"<t align='left' size='0.7' >Добро пожаловать,</t><br/><t align='left' size='1.2'>%1</t><br/>",
			player call getNickName
		];
	};
	default {};
};
true
