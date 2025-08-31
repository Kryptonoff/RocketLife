/*

	Filename: 	RRPServer_poker_init.sqf
	Project: 	Fatum Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://altislife.extremo.club/

*/
{
	_id = configName _x;
	_bet = getNumber(_x >> "bet");
	_position = getArray(_x >> "position");
	_tableClass = getText(_x >> "tableClass");
	_tableDir = getNumber(_x >> "tableDir");
	_chairClass = getText(_x >> "chairClass");
	_chairX = getNumber(_x >> "chairX");
	_chairY = getNumber(_x >> "chairY");
	_sideChairY = getNumber(_x >> "sideChairY");

	[_id,_bet,_position,_tableClass,_tableDir,_chairClass,_chairX,_chairY,_sideChairY] call RRPServer_poker_spawntable;
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgPoker" >> worldName));

//["lelk",5000,[14555.7,16132.7,0.00143814],"land_Fatum_stol",90,"int_red_chair",1.5,1,2] call RRPServer_poker_spawntable;