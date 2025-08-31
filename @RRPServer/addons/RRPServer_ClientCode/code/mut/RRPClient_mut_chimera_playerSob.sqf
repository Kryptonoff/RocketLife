
params ["_creature", "_sound", "_distance"];

if (((_creature distance player) <= _distance) and (alive player)) then {
	player say2D _sound;
};
