params ["_target", "_caller", "_actionId", "_args"];
_args params ["_table_obj","_table_id","_player_index"];
try
{
	private _bet = _table_obj getVariable ["poker_bet",0];
	if (_bet isEqualTo 0) throw "Произошла ошибка, на столе не инициализированы ставки. Обратитесь к администрации!";
	private _stack = _bet * 100;
	if (RRPClientAtmMoney < _stack) throw format["На вашем банковском счету недостаточно средств для вступительного денежного взноса - $%1",[_stack] call RRPClient_util_numberText];

	private _variable = format ["%1_player_%2",_table_id,_player_index];
	if !(isNull (_table_obj getVariable [_variable,objNull])) throw "Место уже занято!";

	if !(isNull (_target getVariable ["occupied",objNull])) throw "Место уже занято!";
	_target setVariable ["occupied",player,true];
	uiSleep random 0.5;
	if !(_target getVariable ["occupied",objNull] isEqualTo player) throw "Ваше место уже кто-то занял!";

	life_poker_id = _table_id;
	life_poker_index = _player_index;
	life_poker_table = _table_obj;
	life_poker_chair = _target;
	life_poker_accept = false;
	
	disableSerialization;
	createDialog "RRPDialogPokerLobby";
	private _display = uiNamespace getVariable ["RRPDialogPokerLobby",displayNull];
	_table_obj setVariable [_variable,player,true];
	[_target,_caller] spawn RRPClient_actions_chairSiting;

	player setVariable ["stack",_stack,true];
	player setVariable ['pok_player_status','OFFER',true];
	[player,"atm","take",_stack] remoteExecCall ["RRPServer_system_moneyChange",2];

	private _title = _display displayCtrl 24999;
	private _information_text = _display displayCtrl 25002;
	private _cancel_btn = _display displayCtrl 25003;
	private _accept_btn = _display displayCtrl 25004;

	_title ctrlSetText getText(missionconfigFile >> "LifeCfgPoker" >> worldName >> _table_id >> "displayName");
	_accept_btn buttonSetAction "life_poker_accept = true";
	_information_text ctrlSetStructuredText parseText format["<t size='1.5'>Вы собираетесь присоединиться к покерному столу с ставками $%1/$%2, вступительный денежный взнос (бай-ин) составляет - $%3. Взнос спишется с банковского счета, вы согласны?</t>",[round (_bet*0.5)] call RRPClient_util_numberText,[_bet] call RRPClient_util_numberText,[_stack] call RRPClient_util_numberText];

	waitUntil {isNull (uiNamespace getVariable ["RRPDialogPokerLobby",displayNull]) OR {life_poker_accept}};
	if (isNull (uiNamespace getVariable ["RRPDialogPokerLobby",displayNull]) OR {!life_poker_accept}) then {
		[_table_id,_table_obj,_player_index,"Вы отказались от участия в покерной игре"] call RRPClient_poker_leaveTable;
		throw "Вы отказались от участия в покерной игре";
	};
	player setVariable ['pok_player_status','ACCEPT',true];
	_accept_btn ctrlShow false;
	_accept_btn buttonSetAction "player setVariable ['pok_player_status','READY',true]";
	_accept_btn ctrlSetText "Готов";

	private _dots = "";
	waitUntil {
		_players_ready = [];
		_players_playing = [];
		_players_count = 0;
		_table_players = [
			(_table_obj getVariable [format["%1_player_1",_table_id],objNull]),
			(_table_obj getVariable [format["%1_player_2",_table_id],objNull]),
			(_table_obj getVariable [format["%1_player_3",_table_id],objNull]),
			(_table_obj getVariable [format["%1_player_4",_table_id],objNull]),
			(_table_obj getVariable [format["%1_player_5",_table_id],objNull]),
			(_table_obj getVariable [format["%1_player_6",_table_id],objNull])
		];
		{
			if ((_x getVariable ["pok_player_status",""]) isEqualTo "LOADED") then {
				_players_count = _players_count + 1;
				_players_ready pushBack (_x call getNickName);
			};
			if ((_x getVariable ["pok_player_status",""]) isEqualTo "READY") then 
			{
				_players_count = _players_count + 1;
				_players_playing pushBack (_x call getNickName);
			};
		} forEach _table_players;
		_dots = [_dots + ".","."] select ((count _dots) > 3);
		_table_status = _table_obj getVariable ["poker_status",""];

		if (_table_status isEqualType 0 OR {_table_status isEqualTo "START"}) then {
			_accept_btn ctrlShow true;
			_information_text ctrlSetStructuredText parseText format[
			"<t size='1.5' align='center'>Минимум игроков набрался!<br/>" +
			"Подтвердите готовность!<br/>Готовы: %1<br/>Игра начнется через %2</t>",(_players_ready + _players_playing) joinString "<br/>",_table_status];
		} else {
			_information_text ctrlSetStructuredText parseText format["<t size='1.25'>Ожидаем игроков! Минимум для старта игры - 2 человека! Как только сядет кто-то еще, в течение 20 секунд нажмите на кнопку 'Готов' в правом нижнем углу чтобы подтвердить свое участие! <br/>Сейчас играют: %1<br/><br/>Ожидаем %1</t>",_players_ready joinString "<br/>",_dots];	};
		uiSleep 0.5;

		((_table_status isEqualTo "START") OR {isNull (uiNamespace getVariable ["RRPDialogPokerLobby",displayNull])})
	};

	if (isNull (uiNamespace getVariable ["RRPDialogPokerLobby",displayNull]) OR {((player getVariable ["pok_player_status",""]) != "READY")}) exitWith 
	{
		_display closeDisplay 1;
		[_table_id,_table_obj,_player_index,"Вы отказались от участия в покерной игре"] call RRPClient_poker_leaveTable;
	};

	_display closeDisplay 1;
	waitUntil {isNull _display};

	createDialog "RRPDialogPoker";

	private _display = uiNamespace getVariable ["RRPDialogPoker",displayNull];
	private _buttonsGroup = _display displayCtrl 25400;
	private _foldButton = _buttonsGroup controlsGroupCtrl 25401;
	private _checkCallButton = _buttonsGroup controlsGroupCtrl 25402;
	private _raiseButton = _buttonsGroup controlsGroupCtrl 25403;
	private _raiseSlider = _buttonsGroup controlsGroupCtrl 25404;

	_foldButton ctrlEnable false;
	_checkCallButton ctrlEnable false;
	_raiseButton ctrlEnable false;
	_raiseSlider ctrlEnable false;

	private _cameraX = (getNumber(missionconfigFile >> "LifeCfgPoker" >> worldName >> _table_id >> "cameraX"));
	private _cameraY = (getNumber(missionconfigFile >> "LifeCfgPoker" >> worldName >> _table_id >> "cameraY"));
	private _cameraH = (getNumber(missionconfigFile >> "LifeCfgPoker" >> worldName >> _table_id >> "cameraH"));
	private _table_pos = _table_obj modelToWorld [_cameraX,_cameraY,0];
	PokerTableCamera = "camera" camCreate _table_pos; 
	PokerTableCamera cameraEffect ["Internal", "TOP"]; 
	PokerTableCamera camPrepareFOV 0.65;  


	PokerTableCamera camPrepareTarget _table_pos; 
	PokerTableCamera setPosATL [(_table_pos select 0)+0.01, (_table_pos select 1), (_table_pos select 2) + _cameraH]; 
	PokerTableCamera camCommitPrepared 1.5;
	showCinemaBorder false;
	uiSleep 1.5;

	_raiseSlider ctrlAddEventHandler ["SliderPosChanged",
	
	format ['
	params ["_control", "_newValue"]; 
	_display = ctrlParent _control;
	_group = _display displayCtrl 25400;
	comment "Меняем ";
	(_group controlsGroupCtrl 25403) ctrlSetText format ["RAISE $%2", [(round (_newValue / %1) * %1)] call RRPClient_util_numberText]',
	round (_bet*0.5),"%1"]];

	player setVariable ['pok_player_status','LOADED',true];

	waitUntil {uiSleep 0.3; (animationState player != "crew") OR {isNull (uiNamespace getVariable ["RRPDialogPoker",displayNull])}};

	[_table_id,_table_obj,_player_index,"Вы прекратили игру"] call RRPClient_poker_leaveTable;

}catch{
	["Покер",_exception] call toastError;
};
