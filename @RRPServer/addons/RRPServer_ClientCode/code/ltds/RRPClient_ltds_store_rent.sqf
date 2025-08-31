
private _object = curTarget;

try{
	if (isNull _object) throw "Объект не определен";
	private _config = getMissionConfig "CfgLtds" >> "stores" >> vehicleVarName _object; 
	if !(isClass _config) throw "Этот магазин не настроен";
	if ((_object getVariable ["ltdOwner",-1]) isNotEqualTo -1) throw "Этот магазин уже арендован";
	if (RRPClientCredits < getNumber(_config >> "rentCost")) throw (format ["У вас недостаточно средств! Стоимость оплаты %1 RC",getNumber(_config >> "rentCost")]);

	[
		(findDisplay 46),
		{
			params ["_object","_cost","_id"];
			["rent",_object,[player, _cost,_id]] remoteExecCall ["RRPServer_ltds_stores_actions",2];
		},[_object,getNumber(_config >> "rentCost"), RRPClientLTDsData#0],
		"Арендовать магазин?",
		format ["Арендовать этот магазин? Срок аренды составляет 30 дней с момента начала! Не забывайте вовремя оплачивать Ваш магазин, в противном случае вы его утратите, а также все достижения в нем!", getNumber(_config >> "costUpgrade"), _store getVariable ["ltdName","UNDEFINED"]]
	] call RRPClient_util_prompt;
}catch{
	["Бизнес",_exception] call toastError;
};
