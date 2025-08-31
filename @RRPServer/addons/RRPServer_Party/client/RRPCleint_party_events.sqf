params ["_group"];

_group addEventHandler ["UnitJoined", {
	params ["_group", "_newUnit"];
}];

_group addEventHandler ["UnitLeft", {
	params ["_group", "_oldUnit"];
}];

_group addEventHandler ["Empty", {
	params ["_group"];
}];

_group addEventHandler ["Deleted", {
	params ["_group"];
}];

_group addEventHandler ["LeaderChanged", {
	params ["_group", "_newLeader"];
}];