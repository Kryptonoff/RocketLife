
params [
	"_player",
	"_groupName"
];

try{
	private _groupID = _player getVariable ["groupID",-1];
	if (_groupID isNotEqualTo -1) throw "Вы уже состоите в группе";

	private _cost = getNumber(getMissionConfig "CfgGroups" >> "createGroupCost");
	if (_cost > _player getVariable ["RRPAtm",0]) throw "У вас недостаточно средств";

	_nameExist = format ["groupNameExists:%1",_groupName] call RRPServer_DB_selectSingleField;
	if (_nameExist isNotEqualTo "") throw "Организация с таким названием уже существует";
	
	private _ranks = [[1,"Дебютант",["DEPOSIT","TFARREAD"]],[2,"Сотрудник",["DEPOSIT","WITHDRAW","TFARREAD","TFARCHANGE","SENDMESSAGE"]],[3,"Директор",["DEPOSIT","WITHDRAW","TFARREAD","TFARCHANGE","SENDMESSAGE","SETDAYMESSAGE","CANINVITE","CANKICK","CANUP","CANDOWN"]]];
	private _tfar = [50,50];
	_id = format ["registerGroup:%1:%2:%3:%4:%5:%6",
			_groupName, 
			getPlayerUID _player,
			10,
			"none",
			_ranks,
			_tfar,
			_player call getSide
		] call RRPServer_DB_insertSingle;
		_newHash = createHashMap;
		_newHash set ["name",_groupName];
		_newHash set ["leader",getPlayerUID _player];
		_newHash set ["deputys",[]];
		_newHash set ["slots",10];
		_newHash set ["premialVar","none"];
		_newHash set ["ranks",_ranks];
		_newHash set ["tfar",_tfar];
		_newHash set ["bank",0];
		_newHash set ["members",[[getPlayerUID _player, _player call getFullName,1]]];
		_newHash set ["markers",[]];
		_newHash set ["polys",[]];
		_newHash set ["massage_day",[]];
		_newHash set ["side",_player call getSide];
		_newHash set ["payed",true];
	
	format ["setPlayerGroupLink:%1:%2",_id,getPlayerUID _player] call RRPServer_DB_fireAndForget;
	missionNamespace setVariable [format["ServerGroupsInfo_%1",_id],_newHash];
	_player setVariable ["GroupID",_id];
	_player setVariable ["GroupData",_newHash];
	_id call RRPServer_groups_updateClients;
	["Регистратор", "Вы успешно создали свою организацию!"] remoteExecCall ["toastSuccess",_player];
	[_player, "atm", "take", _cost] call RRPServer_system_moneyChange;
	["groups",1] remoteExecCall ["RRPClient_tablet_slide",_player];

}catch{
	["Регистратор", _exception] remoteExecCall ["toastError",_player];
};
true
