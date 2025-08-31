/*
	File: fn_lockVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Locks the vehicle (used through the network when the person calling it isn't local).
*/
private["_vehicle","_state","_astate"];
_vehicle = param [0,Objnull,[Objnull]];
_state = param [1,2,[0,false]];
if(isNull _vehicle) exitWith {};

_astate = switch (_state) do {
	case 0: {1};
	case 2: {0};
};

_vehicle lock _state;

switch (true) do {
	//ifrit
	case (typeof _vehicle in ["O_MRAP_02_F","ifrit_constant_1","ifrit_escobaro","ifrit_kasatky","ifrit_kasatky_1","ifrit_cosanostra","ifrit_enclav","ifrit_chrome"]): {		
		_vehicle animateDoor ["Door_LF", _astate];  
		_vehicle animateDoor ["Door_RF", _astate];
		_vehicle animateDoor ["Door_LM", _astate];
		_vehicle animateDoor ["Door_RM", _astate];
		_vehicle animateDoor 
		["Door_rear", _astate]; 
	};
	
	case (typeof _vehicle in ["B_MRAP_01_F"]): {
		_vehicle animateDoor ["Door_LF", _astate];
		_vehicle animateDoor ["Door_RF", _astate];
		_vehicle animateDoor ["Door_LB", _astate];
		_vehicle animateDoor ["Door_RB", _astate];
	};
	
	case (typeof _vehicle in ["I_MRAP_03_F"]): {
		_vehicle animateDoor ["Door_LF", _astate];
		_vehicle animateDoor ["Door_RF", _astate];
	};
	
	case (typeof _vehicle isEqualTo "I_Heli_Transport_02_F"): {
		_vehicle animateDoor ["Door_Back_L", _astate];
		_vehicle animateDoor ["Door_Back_R", _astate];
	};
	
	case (typeof _vehicle isEqualTo "B_Heli_Light_01_F") : {
		_vehicle animateDoor ["DoorL_Front_Open", _astate];
		_vehicle animateDoor ["DoorR_Front_Open", _astate];
		_vehicle animateDoor ["DoorL_Back_Open", _astate];
		_vehicle animateDoor ["DoorR_Back_Open", _astate];
	};
};