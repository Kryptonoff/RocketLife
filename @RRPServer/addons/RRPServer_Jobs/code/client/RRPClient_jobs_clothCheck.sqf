/*

	Filename: 	RRPClient_jobs_clothCheck.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try {
	_uniform = getText(missionConfigFile >> "CfgJobs" >> _this >> "life_cloth_uniform");
	if (_uniform isNotEqualTo "") then {
		if (uniform player isNotEqualTo _uniform) throw false;
	};
	
	_headgear = getText(missionConfigFile >> "CfgJobs" >> _this >> "life_cloth_headgear");
	if (_headgear isNotEqualTo "") then {
		if (headGear player isNotEqualTo _headgear) throw false;
	};
	
	_instrument = getText(missionConfigFile >> "CfgJobs" >> _this >> "life_cloth_instrument");
	if (_instrument isNotEqualTo "") then {
		if !(_instrument in [primaryWeapon player, secondaryWeapon player, handgunWeapon player]) throw false;
	};
	
	if (_this isEqualTo "dhl") then {
		if (currentWeapon player isNotEqualTo "") throw false;
	};

	throw true;
} catch {
	_exception
};
