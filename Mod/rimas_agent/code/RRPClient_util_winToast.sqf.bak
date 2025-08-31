

params [
	["_AppId","ArmA 3"],
	["_title","Message"],
	["_message","Hello World!"],
	["_icon","dummys"],
	["_ActivationType",""],
	["_ActivationArguments",""],
	["_actions",[
		["protocol","Кнопка 1",""]
	],[[]]],
	["_audio","SMS"],
	["_loop",true],
	["_duration","long"]
];

"secExt" callExtension ["WinToast",
	[
		format ["AppID: %1",_AppId],
		format ["Title: %1",_title],
		format ["Message: %1",_message],
		format ["Icon: %1",_icon],
		format ["ActivationType: %1",_ActivationType],
		format ["ActivationArguments: %1",_ActivationArguments],
		format ["Actions: %1",_actions],
		format ["Loop: %1",_loop],
		format ["Audio: %1",_audio],
		format ["Duration: %1",_duration]
	]
];
