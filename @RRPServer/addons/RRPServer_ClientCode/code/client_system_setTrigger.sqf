/*

	Filename: 	client_system_setTrigger.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		http://empyrean.club
	
*/
params["_trg","_area","_activation","_statements"];

_trg setTriggerArea _area;
_trg setTriggerActivation _activation;
_trg setTriggerStatements _statements;

nil