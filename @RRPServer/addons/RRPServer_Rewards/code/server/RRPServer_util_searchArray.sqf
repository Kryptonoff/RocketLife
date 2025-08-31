
private ["_data", "_classname", "_index", "_i"];
 
_data = (_this select 0);
_classname = (_this select 1); 
_index = -1;

for "_i" from 0 to (count _data - 1) do {
	if ( ((_data select _i) select 0) isEqualTo _classname) exitWith {
		_index = _i;
	};
};
_index