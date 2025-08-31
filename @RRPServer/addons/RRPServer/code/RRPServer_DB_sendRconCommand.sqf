/*
	Project: Async functions for extDB3
	Author: FairyTale5571
	License: CC BY-ND
*/

private["_command", "_password", "_return"];
_command = _this;
_password = getText(configFile >> "RCON" >> "password");
if(_password isEqualTo "")then{_password = "empty";}; 
_return = _password serverCommand _command;
_return