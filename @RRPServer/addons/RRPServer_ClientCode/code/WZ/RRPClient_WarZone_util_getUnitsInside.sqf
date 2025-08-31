/*
	Project: Rimas Role Play 
	Author: FairyTale#5571
	License: CC BY-ND

	Usage: 
		input:
			marker or position
			radius
		return: 
			array - netId players in zone
			if player dead then netId 1:1
*/

params [
	["_zone",[],[[],""]],
	"_radius"
];
if (_zone isEqualTo "" or {_zone isEqualTo []}) exitWith {[]};
private _zone = [_zone,getMarkerPos _zone] select (_zone isEqualType "");
if (_zone isEqualTo []) exitWith {[]};
private _return = [];
_return = (_zone nearEntities ["Man",_radius]) apply {	
		if (alive _x and 
			{isPlayer _x} and 
			{!(_x getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"])}
		)then{netId _x}else{"1:1"}
};

{
	private _vehicle = _x;
	if (alive _vehicle and { crew _vehicle isNotEqualTo [] }) then 
	{
		{
			private _crews = _x;
			if (isPlayer _crews and {alive _crews}) then 
			{
				_return pushBackUnique (netId _crews);
			};
		}forEach (crew _vehicle);
	};
}forEach (_zone nearEntities [["Car","Air","Tank","APC"],_radius]);

_return 
