/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/

try {
	private ["_display","_jailtime"];
	_display = uiNamespace getVariable ['RRPDialogPunish',displayNull];
	if (isNull _display) throw "Нету диалога!";
	if (isNull curTarget OR isNil "curTarget") throw "Игрок не определен попробуйте еще раз";
	if (!(curTarget isKindOf "Man")) throw "объект взаимодействия не является игроком";
	if (!(isPlayer curTarget)) throw "Игрок не определен неверно, попробуйте еще раз";
	if (!(curTarget getVariable "restrained")) throw "Задержаный игрок должен быть связан!";
	if (curTarget getVariable ["isArrested",false]) throw "Уже отбывает заключение!";

	_jailtime = ctrlText 25003;
	if (!([_jailtime] call RRPClient_system_isnumber)) throw "Вы ввели неправильную сумму.";
	_jailtime = parseNumber _jailtime;
	if (_jailtime > 180 OR _jailtime < 5) throw "Срок заключения должен быть от 5 до 180 минут";
	if (_jailtime > 30 AND ([player,"grp_jail_marker"] call CBA_fnc_getDistance > 100)) throw "Чтобы посадить в тюрьму более чем на 30 минут, Вы должны конвоировать преступника в Национальную тюрьму";

	[curTarget,player,false] remoteExecCall ["RRPServer_ws_wantedBounty",2];
	[curTarget,false,_jailtime] remoteExecCall ["RRPClient_system_jail",curTarget];

	[0,"%1 был отправлен в тюрьму сотрудником %2",true, [curTarget call getFullName, player call getFullName]] remoteExecCall ["RRPClient_system_broadcast",-2 ];

	_why = ctrlText 25004;
	if (count _why < 5) throw "Напишите за что наказываете игрока более развернуто";
	
	_log = [
		format ["**%1 (%2)** отправил в тюрьму **%3 (%4)**",player call getFullName, getPlayerUID player, curTarget call getFullName, getPlayerUID curTarget],
		format ["**Сроком на:** %1 мин.",_jailtime],
		format ["**Причина:** %1",_why]
	] joinString "\n";

  [
    "Prison","","","",false,
    [
      [
        "Steam профиль",
        _log,
        "https://steamcommunity.com/profiles/" +  getPlayerUID player,
				"1FFF00",false,"","",[],[]
      ]
    ]
  ] remoteExecCall ["DiscordEmbedBuilder_fnc_buildSqf",2];
  [player getVariable ["GroupID",-1],"prison",getPlayerUID player,_log] call RRPServer_groups_log;
  [150,"посадку в тюрьму"] call addXP;
} catch {
	["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true