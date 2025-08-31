/**
 * File: RRPServer_system_getRandomStrings_forID
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
   Return: STRING
 */

private ['_ret'];
if (_this select 0 == 3) then {_ret = 'EXTDB3_';};
if (_this select 0 == 2) then {_ret = 'EXTDB3_';};
if (_this select 0 == 1) then {_ret = 'AVS_';};
if (_this select 0 == 0) then {_ret = 'BAN ID #';};
for '_i' from 1 to (_this select 1) do 
{
	_ret = (_ret + (['0','1','2','3','4','5','6','7','8','9'] select (random 9)));
};
_ret
