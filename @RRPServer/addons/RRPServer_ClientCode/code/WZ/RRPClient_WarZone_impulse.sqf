/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

try
{
	// throw "Спутник вышел из строя, некоторое время система импульсов будет недоступна";
	if (count RRPClientGroupInfo isEqualTo 0) throw "Данная функция доступна только членам организаций";
	if !("impulse" call RRPClient_groups_util_permCheck) throw "У вас нет доступа к использованию этой функции";
	private _gangName = RRPClientGroupInfo get "name";
	private _gangBank = RRPClientGroupInfo get "bank";
	private _id = player getVariable ["GroupId",-1];
	private _delay = missionNamespace getVariable [format["ImpulseDelay_%1",_id],0];
	if ((time - _delay) < (getNumber(getMissionConfig "CfgWarZone" >> "cooldownImpulse") * 60))  throw "Импульс в куллдауне";

	private _c = missionNamespace getVariable [format["ImpulseCount_%1_%2",_id,((RRPServerWarZones select RRPClientMarkerIndexLocal) select 0)],1];
	private _cost = getNumber(getMissionConfig "CfgWarZone" >> "costImpulse") * _c;
	if (_cost > _gangBank) throw format ["На счету организации недостаточно средств! Стоимость импульса $%1",[_cost] call RRPClient_util_numberText];
	_inZone = (([player] call RRPClient_WarZone_util_getZoneInside) call RRPClient_WarZone_util_getUnitsInside);
	["alert",[_inZone,format["Организация '%1' задействовала сканирующий импульс, запуск через 10 секунд",_gangName]]] remoteExecCall ["RRPServer_WarZone_impulse",2];
	["alertWhile",[_inZone,"ИМПУЛЬС БУДЕТ ЗАПУЩЕН ",10]] remoteExec ["RRPServer_WarZone_impulse",2];
	missionNamespace setVariable [format["ImpulseDelay_%1",_id],time,true];

	[
		{
			params ["_id","_cost"];
			private _c = missionNamespace getVariable [format["ImpulseCount_%1_%2",_id,((RRPServerWarZones select RRPClientMarkerIndexLocal) select 0)],1];
			missionNamespace setVariable [format["ImpulseCount_%1_%2",_id,((RRPServerWarZones select RRPClientMarkerIndexLocal) select 0)],_c + 1,true];
			private _inZone = (([player] call RRPClient_WarZone_util_getZoneInside) call RRPClient_WarZone_util_getUnitsInside);
			["InfoTitleAndText",["Военное положение","Импульс задействован!"]] call SmartClient_gui_toaster_addTemplateToast;
			["alert",[_inZone,format["Импульс активирован!"]]] remoteExecCall ["RRPServer_WarZone_impulse",2];
			comment "//-- Собираем юнитов в зоне";

			private _units = [];
			{
				_unit = objectFromNetId _x;
				if !(isNull _unit) then 
				{
					if (_unit getVariable ["GroupId",-1] isEqualTo _id) then 
					{
						_units pushBack _unit;
					};
				};
			}forEach _inZone;
			
			comment "//-------------- Выбираем только тех кто с одной орг";
			private _enemies = [];
			{
				_unit = objectFromNetId _x;
				if !(isNull _unit) then 
				{
					if !(_unit getVariable ["GroupId",-1] isEqualTo _id) then 
					{
						_enemies pushBack _unit;
					};
				};
			}forEach _inZone;
			private _uid = getPlayerUID _unit;
			[
				"Warzone","","","",false,
				[
					[
						"Steam профиль",
						[
							"**"+name player+" Вызвал импульс**",
							"**Организация:** " + RRPClientGroupInfo get "name",
							"**Название ВП:** " + ((RRPServerWarZones select RRPClientMarkerIndexLocal) select 2),
							format["**Отсканировано:** %1 игроков",count _enemies],
							format["**Заплатили:** $%1",[_cost] call RRPClient_util_numberText]
						] joinString "\n",
						"https://steamcommunity.com/profiles/" +  getPlayerUID player,
						"009fdd",false,"","",[],[]
					]
				]
			] remoteExecCall ["DiscordEmbedBuilder_fnc_buildSqf",2];
			
			//-- Take money from organization
			[_id,"take",_cost] remoteExecCall ["RRPServer_groups_moneyChange",2];
			[_id,"impulse",getPlayerUID player,format ["%1 вызвал импульс в зоне %2, оплатив $%3",player call getFullName,((RRPServerWarZones select RRPClientMarkerIndexLocal) select 2),[_cost] call RRPClient_util_numberText]] remoteExecCall ["RRPServer_groups_log",2];


			["createMarks",[_units,_enemies,_id]] remoteExecCall ["RRPServer_WarZone_impulse",2];
			["alertWhile",[_inZone,"ИМПУЛЬС АКТИВИРОВАН! ДЕЙСТВИЕ ЗАКОНЧИТСЯ ",10]] remoteExec ["RRPServer_WarZone_impulse",2];
			["impulseDown",1] remoteExecCall ["RRPClient_ach_gateway",_enemies];
		},
		[_id,_cost],10
	] call CBA_fnc_waitAndExecute;
}catch{
	["ErrorTitleAndText",["Военное положение",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true
