/*
Author:	Arrra

http://steamcommunity.com/id/sdfsfsdgdfgdgdfg/

My VK:https://vk.com/id478482025
*/
#include "..\..\script_macros.hpp"
_NameJob = _this select 0;

_sumka = getText (missionConfigFile >> "SmartJobs" >> _NameJob >> "backpack");
_kepchik = getText (missionConfigFile >> "SmartJobs" >> _NameJob >> "headgear");
_shkurka = getText (missionConfigFile >> "SmartJobs" >> _NameJob >> "uniform");
_vest = getText (missionConfigFile >> "SmartJobs" >> _NameJob >> "uniform");

if (_sumka isEqualto "") then 
{
_sumka = PBACKPACK;
};
if (_kepchik isEqualto "") then 
{
_kepchik = PHEADGEAR;
};
if (_shkurka isEqualto "") then 
{
_shkurka = PUNIFORM;
};
if (_vest isEqualto "") then {
_vest = PVEST;
};

EQUAL(PUNIFORM,_shkurka) && EQUAL(PBACKPACK,_sumka) && EQUAL(PHEADGEAR,_kepchik) && EQUAL(PVEST,_vest)
