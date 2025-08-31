_this spawn {
	if (Done) exitWith {};
	Done = true;
	disableSerialization;
	private ["_ctrl","_speed","_shakes","_degrees","_s","_d"];
	_ctrl = 	param [0, controlNull,[controlNull]];
	_speed = 	param [1,5,[0]];
	_shakes = 	param [2,3,[0]];
	_degrees = 	param [3,10,[0]];

	if (_ctrl isEqualTo controlNull) exitWith {false};

	for "_s" from 0 to (_shakes - 1) do {

		for "_d" from 0 to _degrees step _speed do {
			_ctrl ctrlSetAngle [_d * -1,0.5,0.5];
			uiSleep 0.01;
		};
		for "_d" from (_degrees * -1) to _degrees step _speed do {
			_ctrl ctrlSetAngle [_d,0.5,0.5];
			uiSleep 0.01;
		};
		for "_d" from 0 to _degrees step _speed do {
			_ctrl ctrlSetAngle [_degrees - _d,0.5,0.5];
			uiSleep 0.01;
		};
		_ctrl ctrlSetAngle [0,0.5,0.5]; // just in case given params are not balanced
	};
	Done = false;
	true
};
true