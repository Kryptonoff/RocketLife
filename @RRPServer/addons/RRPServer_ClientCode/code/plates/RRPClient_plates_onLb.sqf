/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;
private _dialog = 		uiNamespace getVariable ["RRPDialogChangePlate",displayNull];
_listBox = 				_this select 0;
_index = 				_this select 1;
private _vehicle = 		objectFromNetId (_listBox lbData _index);
RRPClientSelectedPlateVeh = _vehicle;
private _name1 = 		_dialog displayCtrl 7603;
private _name2 = 		_dialog displayCtrl 7604;
private _number1 = 		_dialog displayCtrl 7605;
private _number2 = 		_dialog displayCtrl 7606;
private _number3 = 		_dialog displayCtrl 7607;
private _number4 = 		_dialog displayCtrl 7608;
private _name3 = 		_dialog displayCtrl 7609;
private _name4 = 		_dialog displayCtrl 7610;

_plate = 				_vehicle getVariable ["dbInfo",[]] select 1;
_toArray = 				_plate splitString "";;
_name1 ctrlSetText 		(_toArray select 0);
_name2 ctrlSetText 		(_toArray select 1);
_number1 ctrlSetText 	(_toArray select 3);
_number2 ctrlSetText 	(_toArray select 4);
_number3 ctrlSetText 	(_toArray select 5);
_number4 ctrlSetText 	(_toArray select 6);
_name3 ctrlSetText 		(_toArray select 8);
_name4 ctrlSetText 		(_toArray select 9);