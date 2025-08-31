
private _target = param [0,objNull,[objNull]];
[
	findDisplay 46,
	{
        params ["_target"];
		[player,true] remoteExec ["RRPClient_invSearch_answer",_target]
	},[_target],
	"Вам предлагают действие",
	format ["Вас хотят досмотреть!",_name,_text],
    {
        params ["_target"];
        [player,false] remoteExec ["RRPClient_invSearch_answer",_target]
    },[_target]
] call RRPClient_util_prompt;

