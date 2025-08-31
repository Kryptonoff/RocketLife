
private _winItem = param [0,""];
private _player = param [1,objNull];
private _categoryItem = param [2,""];
private _id = param [3];
private _config = getMissionConfig "CfgCasesItems";
try
{
	if !(isClass(_config >> _winItem)) throw "Предмет выигрыша не найден";
	private _itemConfig = _config >> _winItem;
	private _itemType = getText(_itemConfig >> "type");
	switch _itemType do 
	{
		case "money": {
			private _val = getNumber(_itemConfig >> "value");
			["__SERVER__", [getPlayerUID _player, [["RRPAtm",_val]] ] ] call RRPServer_rewards_addRewardsRequest;
		};
		case "vip": {
			private _level = getNumber(_itemConfig >> "level");
			private _val = getNumber(_itemConfig >> "value");
			["__SERVER__", [getPlayerUID _player, [[format["vip%1",_level],_val]] ] ] call RRPServer_rewards_addRewardsRequest;
		};
		case "rc": {
			private _val = getNumber(_itemConfig >> "value");
			["__SERVER__", [getPlayerUID _player, [["Points",_val]] ] ] call RRPServer_rewards_addRewardsRequest;
		};
		case "trx": {
			private _val = getNumber(_itemConfig >> "value");
			[_player,"trx","add",_val] call RRPServer_system_moneyChange;
		};
		case "exp": {
			private _val = getNumber(_itemConfig >> "value");
			private _classname = getText(_itemConfig >> "classname");
			[_classname, _val] remoteExecCall ["RRPClient_skills_addXP",_player];
		};
		case "weapon": {
			private _item = getText(_itemConfig >> "item");
			private _val = getNumber(_itemConfig >> "value");
			["__SERVER__", [getPlayerUID _player, [[_item,_val]] ] ] call RRPServer_rewards_addRewardsRequest;
		};
		case "clothing": {
			private _item = getText(_itemConfig >> "item");
			private _val = getNumber(_itemConfig >> "value");
			["__SERVER__", [getPlayerUID _player, [[_item,_val]] ] ] call RRPServer_rewards_addRewardsRequest;
		};
		case "item": {
			private _item = getText(_itemConfig >> "item");
			private _val = getNumber(_itemConfig >> "value");
			["__SERVER__", [getPlayerUID _player, [[_item,_val]] ] ] call RRPServer_rewards_addRewardsRequest;
		};
		case "vehicle": {
			private _item = getText(_itemConfig >> "vehicle");
			["__SERVER__", [getPlayerUID _player, [_item] ] ] call RRPServer_rewards_addRewardsRequest;
		};
	};
	format ["setOpenedCase:%1:%2:%3",getText(_itemConfig >> "name"), _categoryItem, _id] call RRPServer_DB_fireAndForget;

}catch{
	["Кейсы",_exception] remoteExecCall ["toastError",_player]
};
