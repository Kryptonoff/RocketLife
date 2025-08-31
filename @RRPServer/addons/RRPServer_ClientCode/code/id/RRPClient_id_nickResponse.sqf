params ["_uid"];
_indexInIds = [_uid,life_ids] call RRPClient_system_index;
if (_indexInIds isEqualTo -1) then {
	life_ids pushBack [_uid,time,1];
} else {
	(life_ids select _indexInIds) params ["","","_type"];
	if (_type isEqualTo 2) then {
		life_ids set [_indexInIds,[_uid,time,3]];
	}else{
		life_ids set [_indexInIds,[_uid,time,1]];
	};
};