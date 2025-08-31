
params [
	"_mode",
	["_object",objNull],
	["_texture",""]
];
str _this call RRPServer_util_debugConsole;
try{
	if (isNull _object) throw "Объект не определен";
	switch (_mode) do 
	{
		case "color": 
		{
			_object setObjectTextureGlobal [1,getText(missionConfigFile >> "CfgTrunkColors" >> "Coloring" >> _texture >> "textures")];
			format ["updateColor:%1:%2",_texture,_object] call RRPServer_DB_fireAndForget;
		};
		case "picture": 
		{
			_object setObjectTextureGlobal [0,getText(missionConfigFile >> "CfgTrunkColors" >> "Pictures" >> _texture >> "textures")];
			format ["updatePicture:%1:%2",_texture,_object] call RRPServer_DB_fireAndForget;
		};
	};
}catch{
	_exception call RRPServer_util_debugConsole;
};
true
