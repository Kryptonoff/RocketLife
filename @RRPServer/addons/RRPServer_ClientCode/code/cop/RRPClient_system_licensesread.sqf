/*
	File: fn_licensesRead.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Outprints the licenses.
*/

private _civ = param [0,"",[""]];
private _licenses = param [1,("Нет лицензий"),[""]];

[format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'>" +("Лицензии")+ "</t></t><br/>%2",_civ,_licenses]] call hints;