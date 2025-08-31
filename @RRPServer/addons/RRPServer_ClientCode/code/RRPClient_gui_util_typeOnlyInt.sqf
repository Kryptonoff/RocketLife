/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND

	Call it from onChar UI eventhandler
*/


disableSerialization;
params ["_control","_charCode"];
private _ctrlText = ctrlText _control; 
try 
{
	{
		if !(_x in [48,49,50,51,52,53,54,55,56,57]) throw false;
	}forEach (toArray _ctrlText);
}
catch 
{
	_ctrlText = (ctrlText _control) select [0, (count _ctrlText) - 1];
	_control ctrlSetText _ctrlText;
	_control ctrlCommit 0;
};
true
