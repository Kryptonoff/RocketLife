/*

	Filename: 	RRPClient_evh_damageHandle.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
params ["_unit", "_selection", "_damage", "_shooter", "_projectile", "_hitPointIndex", "_instigator"];

if (player getVariable ["RRPVariablePartyMeatRespawn",false]) then {
	_damage = damage player;
};

//баг с определением патрона
if (_projectile isEqualType objNull) then {
	_projectile = typeOf _projectile;
	_this set [4, _projectile];
};

if (_projectile isEqualTo "RRPAmmo_empCharge") then {
	_damage = 0;
};

//не важные нам повреждения
if (EQUAL(_selection,"hands")) exitWith {_unit getHit "hands"};
if (EQUAL(_selection,"legs")) exitWith {_unit getHit "legs"};
if (EQUAL(_selection,"arms")) exitWith {_unit getHit "arms"};

if (isPlayer _unit) then {
	if (_projectile isEqualTo "BP_Pickaxe_Swing_Ammo") exitWith {0};
};

//получаем данные о текущем уроне
private _currentDmg = [_unit getHitIndex _hitPointIndex, damage _unit] select (_hitPointIndex < 0);

format["DMG - U: %1 - SEL: %2 - D: %3 - SHO: %4 - P: %5 - I: %6 - TR: %7",_unit, _selection, _damage, _shooter, _projectile, _hitPointIndex,_instigator] call RRPClient_system_log;
if (alive _unit && _damage > 0) then
{
	if (LSINCAP(_unit) AND !(player inArea getText(missionConfigFile >> "LifeCfgSettings" >> "zone_for_beginners")) AND !(player getVariable ["RRPVariablePartyMeatActive",false])) then {
		if !((isPlayer _unit) AND (player getVariable ["RRPVariablePartyMeatActive",false]) AND !(isNull (uiNamespace getVariable ["Death_Screen_V2",displayNull]))) then {
			"DMG - In agony - call _KilledInAgony" call RRPClient_system_log;
			[_unit,_shooter,_instigator,_damage,_projectile,_selection] spawn RRPClient_dmg_KilledInAgony;
		};
	} else {
		//сразу ловим тейзер и пейнтбол
		if (_projectile in ["DDOPP_B_Taser","Caseless_blau"]) then {
			_damage = _currentDmg;
			[_unit,_shooter,_projectile] spawn RRPClient_dmg_NotLetal;
		} else {
			//остальные снаряды по человеку, но сперва урон от техники
			if (NOTINVEH(_unit) && {!(vehicle _shooter isEqualTo _shooter)} && {EQUAL((driver (vehicle _shooter)),_shooter)}) then {
				"DMG - VRDM" call RRPClient_system_log;
				_damage = _currentDmg;
				[_unit,_shooter] spawn RRPClient_dmg_Vehicle;
			} else {
				//Отправляем ли мы в агонию игрока?
				if (_damage >= 0.89) then {
					"DMG - Call Agony!" call RRPClient_system_log;
					[{
						_this call RRPClient_dmg_Agony;
					}, [_unit,_shooter,_instigator,_projectile]] call CBA_fnc_execNextFrame;
				} else {
					private _dmg = _damage - _currentDmg; //сколько в итоге прилетело?
					//не агония, но урон надо обработать
					if (isNull _shooter && !(NOTINVEH(_unit))) then {
						//может мы ехали в машине и врезались куда-то? здесь будем делать поправку на будущий апгрейд "Ремни безопасности"
						"DMG - Damage in car?" call RRPClient_system_log;
						if (_dmg > 0) then {
							if (["SecondNature"] call perk) then 
							{
								_dmg = _dmg * 0.8;
							};
							switch (true) do {
							    case (life_seatBelt) : {
								    _damage = if (speed vehicle _unit <= 50) then {_currentDmg} else {_currentDmg + _dmg / 3};
								};
								case (_dmg > 0.3 && _dmg <= 0.45) : {
									[{_this spawn RRPClient_system_addBuff}, ["life_bleeding","debuff",300], random(2)] call CBA_fnc_waitAndExecute;
								};
								case (_dmg > 0.45 && _dmg <= 0.9) : {
									[{_this spawn RRPClient_system_addBuff}, ["life_critHit","debuff"], random(2)] call CBA_fnc_waitAndExecute;
								};
								default {};
							};
						};
					} else {
						//оставшийся урон - урон от оружия
						"DMG - just damage" call RRPClient_system_log;
						if (_dmg > 0) then {
							if (["friendly"] call perk) then {
								if (count RRPClientGroupInfo isNotEqualTo 0) then {
									_membersUids = (RRPClientGroupInfo getOrDefault ["members", [[]]]) apply {_x select 0};
									_shooterUid = getPlayerUID _shooter;
									if (_shooterUid in _membersUids) then {
										_damage = _currentDmg;
										_dmg = 0;
									};
								};
							};

							switch (true) do {
								case (_dmg > 0.1 && _dmg <= 0.3) : {
									[{_this spawn RRPClient_system_addBuff}, ["life_bleeding","debuff",300], random(2)] call CBA_fnc_waitAndExecute;
								};
								case (_dmg > 0.3 && _dmg <= 0.45) : {
									[{_this spawn RRPClient_system_addBuff}, ["life_pain_shock","debuff"], random(2)] call CBA_fnc_waitAndExecute;
								};
								case (_dmg > 0.45 && _dmg <= 0.9) : {
									[{_this spawn RRPClient_system_addBuff}, ["life_critHit","debuff"], random(2)] call CBA_fnc_waitAndExecute;
								};
								default {};
							};
						};
					};
				};
			};
		};
	};
} else {
	_damage = _currentDmg;
	"DMG - Skip" call RRPClient_system_log;
};
_damage = _damage min 0.89;
['damage', round _damage] call RRPClient_ach_gateway;
_damage
