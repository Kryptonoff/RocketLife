
if !(canSuspend) exitWith {_this spawn RRPClient_player_anim};
systemChat str _this;
params ["_category", "_anim"];
switch _category do 
{
	case "Stop":
	{
		call RRPClient_system_animDo;
	};
	case "Actions": 
	{
		default {};
	};
	case "Poses": 
	{
		default {};
	};
	case "Positive": 
	{
		default {};
	};
	case "Negative": 
	{
		default {};
	};
	case "Dance": 
	{

		default {};
	};
	case "etc": 
	{
		switch _anim do 
		{
			case "KamenNozhnici":
			{
				_anims = selectRandom ["GestureGameKamen","GestureGamebumaga","GestureGamenojnice"];
				player playActionNow _anims;
			};
			default {};
		}
	};
	
	default {};
};
