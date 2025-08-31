
params [
	["_processor","",[""]],
	["_groupId",-1,[0]],
	["_value",-1,[0]]
];

try{
	if (_groupId isEqualTo -1 OR {_value isEqualTo -1}) throw "Ошибка #406";
	private _groupHash = missionNamespace getVariable [format["ServerGroupInfo_%1",_groupId],[]];
	if (_groupHash isEqualTo []) throw "Данные организации повреждены!";

	if (_groupHash#7 < _cost) throw "На счету организации недостаточно средств";

	[_groupId,"take",_value] call RRPServer_groups_moneyChange;
	format ["updateCapturesBalance:%1:%2:%3",_value,_processor] call RRPServer_DB_fireAndForget;
}catch{
	["ErrorTitleAndText",["Битва за ресурс", _exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",2];
};
true
