params [
	["_marker","",[""]],
	["_radius",1000,[0]],
	["_distance",45,[0]],
	["_count",100,[0]]
];

try {

	if (_marker isEqualTo "") throw "Маркер отсутсвует в конфиге!";

	private ["_center", "_anomalyList"];

	_center = getMarkerPos _marker;
	_anomalyList = [];

	for "_i" from 1 to _count do {

		private ["_type","_chance","_random","_pos"];
	     _type = selectRandom (getArray(missionConfigFile >> "LifeCfgAnomaly" >> "anomalyTapes"));
	     _chance = round(random(100));
	     _random = getNumber(missionConfigFile >> "LifeCfgAnomaly" >> "Settings" >> _type >> "spawnRandom");
		 _pos = [_center,1,_radius,5,0,0.8,0,[],[]] call BIS_fnc_findSafePos;


		private ["_check","_check2"];
		_check = if ((_type isEqualTo "Radiation") && {count _anomalyList > 0}) then {
	        {(_pos distance (_x # 0)) < 600} count (_anomalyList select {(_x select 1) isEqualTo "Radiation"}) == 0 // сделал больше чтобы были дорожки обхода радиации
		} else {
		    {(_pos distance( _x # 0)) < _distance} count _anomalyList == 0
		};
		_check2 = (_pos inArea _marker);

		if (_check && {_check2} && {_chance <= _random}) then {
			_anomalyList pushBack [_pos,_type];
	    } else {
			_i = _i - 1;
		};
	};

	_anomalyList
} catch {
	diag_log format ["anomaly zone error:  %1",_exception];
};
