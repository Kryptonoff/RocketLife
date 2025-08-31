/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _mode = param [0,""];
private _return = [];
try
{
	switch (_mode) do
	{
		case "read": {
			
			if !("exists" call FriendsINI) throw [];
			 
			_return = 
				[
					"read", 
					["MyFriends", "List"]
				] call FriendsINI;
			if !(_return isEqualType []) throw [];
			throw _return;
		};
		case "add": 
		{
			_input = param [1,[],[[],"",1,false]];
			_return = [
				"write",
				["MyFriends","List", _input] 
			] call FriendsINI;
			throw _return;
		}; 
	}
}catch{
	_return = _exception;
};
_return
