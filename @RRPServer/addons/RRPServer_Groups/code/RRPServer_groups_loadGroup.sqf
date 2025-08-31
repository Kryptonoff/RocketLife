/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_id","_groupInfo","_groupMembers","_groupMarkers","_markers","_polys","_markerID","_markerType","_position","_color","_icon","_iconSize","_text", "_textSize", "_marker", "_poly", "_hash"];
_id = _this;
_groupInfo = format ["loadGroupInfo:%1",_id] call RRPServer_DB_selectSingle;
["LoadGroup",_groupInfo,false] call RRPClient_util_logArray;

_groupInfo params [
	"_name",
	"_leader",
	"_deputys",
	"_slots",
	"_premialVar",
	"_ranks",
	"_tfar",
	"_bank",
	["_massage_day",[],[[]]],
	"_side",
	["_taxes",[],[[]]],
	["_salary",[],[[]]],
	["_payed",true]
];

_groupMembers = format ["loadGroupMembers:%1",_id] call RRPServer_DB_selectFull;
_groupMarkers = format ["loadGroupMarkers:%1",_id] call RRPServer_DB_selectFull;
_markers = [];
_polys = [];
{
	_markerID = _x select 0;
	_markerType = _x select 1;
	_position = _x select 2;
	_color = _x select 3;
	switch _markerType do
	{
		case 0 :
		{
			_icon = _x select 4;
			_iconSize = _x select 5;
			_text = _x select 6;
			_textSize = _x select 7;
			_marker = [_icon,_color,_position,_iconSize,_text,_textSize,_markerID];
			_markers pushback _marker;
		};
		case 1 :
		{
			_poly = [_position,_color,_markerID];
			_polys pushback _poly;
		};
		default
		{
		};
	};
}
forEach _groupMarkers;
//_hash =	[_name,_leader,_deputys,_slots,_premialVar,_ranks,_tfar,[],_groupMembers,_markers,_polys,_bank,_ally];

_taxes = createHashMapFromArray _taxes;
_salary = createHashMapFromArray _salary;

_newHash = createHashMap;
_newHash set ["name",_name];
_newHash set ["leader",_leader];
_newHash set ["deputys",_deputys];
_newHash set ["slots",_slots];
_newHash set ["premialVar",_premialVar];
_newHash set ["ranks",_ranks];
_newHash set ["tfar",_tfar];
_newHash set ["bank",_bank];
_newHash set ["ally",[]];
_newHash set ["members",_groupMembers];
_newHash set ["markers",_markers];
_newHash set ["polys",_polys];
_newHash set ["massage_day",_massage_day];
_newHash set ["side",_side];
_newHash set ["payed",_payed];
_newHash set ["taxes",_taxes];
_newHash set ["salary",_salary];

/*
_hash = [_name,		//0
		_leader,	//1
		_deputys,	//2
		_slots,		//3
		_premialVar,//4
		_ranks,	//5
		_tfar,		//6
		_bank,		//7
		[],//8
		_massage_day,//9
		_groupMembers,//10
		_markers,	//11
		_polys,		//12
		_side, 		//13
		_payed
	];
*/
missionNamespace setVariable [format["ServerGroupsInfo_%1",_id],_newHash];
