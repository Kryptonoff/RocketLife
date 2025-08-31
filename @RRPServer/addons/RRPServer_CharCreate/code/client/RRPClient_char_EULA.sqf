
[
	findDisplay 46,
	{
		profileNamespace setVariable ["EULA",true];
		saveProfileNamespace;
	},[],
	"EULA",
	"Перед началом игры, Вы должны принять EULA по этой <t underline='1' color='#ffff00'><a href='https://rimasrp.life/agreements'>ССЫЛКЕ</a></t>",
	{
	},[]
] call RRPClient_util_prompt;
