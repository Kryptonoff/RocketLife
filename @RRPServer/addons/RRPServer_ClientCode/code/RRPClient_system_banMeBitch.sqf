params ["_getTime","_reason"];

"БАН" hintC [  
	format ["Вы были заблокированы на сервере до %3-%2-%1 %4:%5",
		_getTime select 0,	//Year
		_getTime select 1,	//Month
		_getTime select 2,	//Day
		_getTime select 3,	//Hour
		_getTime select 4	//Min
	],  
	format ["За - %1",_reason],
	"Вы можете обжаловать блокировку на форуме - forum.rocket-rp.fun" 
];
format ["#kick %1",getPlayerUID player] remoteExecCall ["RRPServer_DB_sendRconCommand",2];
