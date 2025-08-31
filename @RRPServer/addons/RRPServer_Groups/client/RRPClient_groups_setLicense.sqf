/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_r","_name"];

{
	
	_name = configName _x;
	_r = call {
		if (count RRPClientGroupInfo isEqualTo 0) exitWith {false};
		if ((RRPClientGroupInfo get "premialVar") isEqualTo _name) exitWith {true};
		false
	};	
	missionNamespace setVariable [format ["license_%1",_name],_r];
}foreach ("true" configClasses (missionConfigFile >> "CfgGroups" >> "PremiumGroups"));