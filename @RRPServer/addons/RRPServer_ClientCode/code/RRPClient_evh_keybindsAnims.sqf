
params ["_func","_keyDown"];

if (_keyDown) then 
{
	if (isNull (objectParent player) && {!dialog} && {!life_dance} && {isNull life_DraggedBody}) then 
	{
		[_func] call RRPClient_gestures_playAction;
	};
}else{

};
true