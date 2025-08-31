/*
	Usage:
		-key STRING: Required

	Return: any
		"not found" if not exist
*/

private _key = _this;
RRPClientCache getOrDefault [_key, ["not found", 0,0]] select 0;
