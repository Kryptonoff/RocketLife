/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/
private["_dialog","_cwCount"];
disableSerialization;
try {
  _display = uiNamespace getVariable ['RRPDialogPunish',displayNull];
  if (isNull _display) throw "Нет диалога!";
  if (isNull curTarget) throw "Задержаный игрок не отправлен!";
  if (!(isPlayer curTarget)) throw "Это не игрок, попробуйте еще раз";
  if (!(curTarget getVariable "restrained")) throw "Задержаный игрок должен быть связан!";
  if (curTarget getVariable ["corrective_work",false]) throw "Данный человек уже привлечен к общественным работам!";

  _cwCount = ctrlText 25003;
  if (!([_cwCount] call RRPClient_system_isnumber)) throw "Вы ввели неправильную сумму.";
  _cwCount = parseNumber _cwCount;
  if (_cwCount < 50) throw "Сумма исправительных работ не может быть менее 50$";
  if (_cwCount > 2000) throw "Сумма исправительных работ не может привышать более 2000$";
  _why = ctrlText 25004;
  if (count _why < 5) throw "Напишите за что наказываете игрока более развернуто";
  [_cwCount] remoteExecCall ["RRPClient_cw_getToWork",curTarget];

  _log = [
    format ["**%1 (%2)** отправил в исправительные работы **%3 (%4)**",player call getFullName, getPlayerUID player, curTarget call getFullName, getPlayerUID curTarget],
    format ["**Сроком на:** %1$",_cwCount],
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
  [player getVariable ["GroupID",-1],"cw",getPlayerUID player,_log] call RRPServer_groups_log;
  [100,"наказание жителя"] call addXP;
  closeDialog 0;
} catch {
  ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
