/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_val","_str","_titleText"];
if (isNil "volume") then { volume = 0.5 }; 
volume = (((volume + _this) min 1) max 0.02); 
 0.5 fadeSound volume; 
 0.5 fadeMusic volume; 
_val = round(volume * 10); 
_str = ""; 
for "_x" from 1 to _val do {
 
	_str = _str + "-"; 
}; 
_str = _str + "|"; 
for "_x" from _val to 9 do 
{ 
	_str = _str + "-"; 
}; 
_titleText = format[("<t font='Overwatch' size='.8' color='#1E90FF' align='right' shadow='1' shadowColor='#000000'>%1%2</t><br/><t shadow='1'shadowColor='#000000' font='TahomaB' size='.8' color='#FFFFFF' align='right'>%3</t>"), "Громкость: ",str(_val*10),_str]; 
[ _titleText, [safezoneX + safezoneW - 0.8,0.50],  [safezoneY + safezoneH - 0.8,0.7],  3, 0] spawn BIS_fnc_dynamicText; 
profileNamespace setVariable ["volume",volume];
