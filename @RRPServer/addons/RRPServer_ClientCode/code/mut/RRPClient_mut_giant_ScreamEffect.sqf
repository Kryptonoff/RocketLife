
private _mutant = _this select 0;
if (isNull _mutant) exitWith {};

if ((player distance _mutant) <= 100) then {
	enableCamShake true;   
	addCamShake [4, 4, 30];
	titleText ["Вас сковывает страх...", "PLAIN"];
	player say2D "player_scared_breathe";
	player forceWalk true;
	[{player forceWalk false}, "", 20] call CBA_fnc_waitAndExecute;
};