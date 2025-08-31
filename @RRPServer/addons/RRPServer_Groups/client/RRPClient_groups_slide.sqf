if (count RRPClientGroupInfo isEqualTo 0) exitWith {
	["group_create",1] call RRPClient_tablet_slide;
};

["groups",1] call RRPClient_tablet_slide;
