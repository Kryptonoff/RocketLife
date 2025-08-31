/*
	File: fn_updateStructuredText.sqf

	Description:
	Updates given structured text control.
*/

params [["_ctrl",controlNull],["_text",""]];
if (isNull _ctrl) exitWith {};
(_ctrl getVariable ["format",[]]) params ["_size","_color", "_align","_font","_shadow"];
_ctrl ctrlSetStructuredText (parseText format ["<t shadow='%6' font='%5' align='%4' size='%2' color='%3'>%1</t>", _text,_size,_color, _align,_font,_shadow]);
_ctrl ctrlCommit 0;