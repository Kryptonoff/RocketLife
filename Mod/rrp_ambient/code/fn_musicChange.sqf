
private _tracks = getArray(configFile >> "CfgAmbientMusic" >> _this);
if!(_tracks isEqualTo [])then
{
	_tracks spawn
	{
		3 fadeMusic 0.01;
		uisleep 3;
		playMusic (selectRandom _this);
		3 fadeMusic 0.3;
	};
};
true