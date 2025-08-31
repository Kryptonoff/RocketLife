private["_key","_result","_pipe"];
_key = _this;
_time = diag_tickTime;
_result = "";
while{true} do
{
	_pipe = "extDB3" callExtension format["5:%1", _key];
	if(_pipe isEqualTo "") exitWith {};
	_result = _result + _pipe;
};
(parseSimpleArray _result)