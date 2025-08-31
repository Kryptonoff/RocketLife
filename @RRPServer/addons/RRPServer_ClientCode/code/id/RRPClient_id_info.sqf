
_passImage = getText(missionConfigFile >> "LifeCfgPassports" >> life_myPassportID >> "image");
_groupName = "";
if (count RRPClientGroupInfo isNotEqualTo 0) then {
	_groupName = RRPClientGroupInfo get "name";
};

[getPlayerUID player, player call getName, player call getSurName, call RRPClientPlayerID, _passImage] 
