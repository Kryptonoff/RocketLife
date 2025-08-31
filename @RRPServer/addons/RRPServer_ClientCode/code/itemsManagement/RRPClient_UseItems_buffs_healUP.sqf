/*
    Arrra (original)
    Discord: arrra#9745
    License:
    cc by-nc-nd
*/
private _healCoef = _this select 0;
if (_healCoef isEqualTo 0) Exitwith {};
_healCoef = _healCoef/100;

private _damage = getDammage player;
_damage = _damage - _healCoef;

if (_healCoef > 1) then {_healCoef = 1};
if (_healCoef < 0) then {_healCoef = 0};

player setDammage _damage;
['heal','',(format ['+ %1%2',_healCoef,'%']),true] spawn RRPClient_UseItems_buffs_instantCreateUI;
