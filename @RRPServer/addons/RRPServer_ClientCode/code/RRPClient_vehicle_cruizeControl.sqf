/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

[] spawn 
{
	_this = objectParent player;
	if(driver _this != player) exitWith {};
	_cruiseControl = _this getVariable["cruize",0]; 
	if(_cruiseControl == 1) exitWith {_this setVariable ["cruize",0];};
	_speed = speed _this;
	["InfoTitleAndText",["Круиз контроль","Включен"]] call SmartClient_gui_toaster_addTemplateToast;
	_this setVariable ["cruize",1];
	_damage = damage _this;
	_currentDir = getDir _this;
	EVH_EPE_CC = _this addEventHandler ["epeContact", { _this spawn RRPClient_evh_epeContact; }];
	[_this] spawn 
	{
		params["_this"];
		while{_this getVariable "cruize" == 1} do 
		{
			_dir1 = sin (getDir _this);
			uiSleep 1;
			_dir2 = sin (getDir _this);
			if(abs(_dir1-_dir2) > 0.45) exitWith
			{
				_this setVariable ["cruize",0];
			};
		};
	};
	try
	{
		while {true} do 
		{
			if (isNil {_this}) then { _this setVariable ["cruize",0];};
			if (driver _this != player) then {_this setVariable ["cruize",0];};
			if ((getpos _this select 2) > 0.35) then {_this setVariable ["cruize",0];};
			if !(istouchingground _this) then {_this setVariable ["cruize",0];};
			if !(isEngineOn _this) then {_this setVariable ["cruize",0];};
			if (_this getVariable "cruize" == 0) throw "Круиз контроль отключен!";
			if (_speed < 10 || {speed _this < 10}) throw "Вы двигаетесь слишком медленно, наберите скорость!"; 
			if (damage _this > 0.5) throw "Система круиз-контроля повреждена! Почините транспортное средство!";
			_dir = getDir _this;
			_x = (sin _dir)*(_speed/3.6);
			_y = (cos _dir)*(_speed/3.6);
			_this setVelocity [(_x), (_y), ((velocity _this) select 2)];
			uiSleep 0.5;
		};
	}catch{
		 _this setVariable ["cruize",0];
		["InfoTitleAndText",["Круиз контроль",_exception]] call toast;
	};
		
	_this removeEventHandler ["epeContact", EVH_EPE_CC];
};