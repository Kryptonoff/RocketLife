private _mode = param [0,""];
private _return = [];
try
{
	switch (_mode) do
	{

		case "readAll": {
			if !("exists" call ChatHistoryINI) throw [];
			
			_sections = "getSections" call ChatHistoryINI;
			if (_sections isEqualTo []) throw _sections;
			
			private _conversations = [];
			{
				_conversations pushBack (["read",[_x]] call RRPClient_ini_friendList);
			}forEach _return;

			throw _conversations;
		};
		case "read": {
			
			if !("exists" call ChatHistoryINI) throw [];
			_input = [1,""];
			_return = 
				[
					"read", 
					["Conversations", "Chat"]
				] call ChatHistoryINI;
			if !(_return isEqualType []) throw [];
			throw _return;
		};
		case "add": 
		{
			_conversation = param [1,[],[[],"",1,false]];
			_return = [
				"write",
				["Conversations","Chat", _conversation] 
			] call ChatHistoryINI;
			throw _return;
		}; 
	}
}catch{
	_return = _exception;
};
_return
