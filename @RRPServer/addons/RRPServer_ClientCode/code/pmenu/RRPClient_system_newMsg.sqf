/*
	Filename: 	RRPClient_system_newMsg.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
try{
	disableSerialization;

	params [
		["_type",-1,[0]],
		["_playerData",-1,[0]],
		["_msg","",[""]]
	];

	if (EQUAL(_type,-1)) throw "???";
	if (count(_msg) > 512) throw "Максимальная длинна сообщения 256 символов!";
	private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
	private _group = _display displayCtrl 26000;
	private _cPlayerList = _group controlsGroupCtrl 88881;
	private _cMessageEdit = _group controlsGroupCtrl 88884;
	private _lbMedMsg = CONTROL(887890,9852);

	private _isPhone = call RRPClient_system_canUsePhone;
	private _canUse = if (player GVAR ["tf_unable_to_use_radio",false]) then {false} else {true};
	switch(_type) do 
	{
		case 0: 
		{
			life_smartphoneTarget = call compile format["%1",_playerData];
			ctrlSetText[88886, format["Сообщение для: %1",life_smartphoneTarget call getFullname]];
			if (FETCH_CONST(life_adminlevel) < 1) then {
				ctrlShow[888897,false];
			};
		};
		//normal message
		case 1: 
		{
			if (!(_isPhone)) throw "Связь недоступна, так как у вас нет телефона в соответствующем слоте. Купите его в универсальном магазине или на заправках 24-7. Вы можете связаться только с администратором.";
			if !(_canUse) throw "Вы не можете пользоваться телефоном со связанными руками";
			if !(life_smartphoneTarget isEqualType objNull) throw "Абонент недоступен";
			if (isNull life_smartphoneTarget) throw "Абонент недоступен";
			ctrlShow[88885, false];
			if (EQUAL(_msg,"")) then {ctrlShow[88885, true]; throw"Сообщение не может быть пустым!"};

			[life_smartphoneTarget,_msg,player,0] remoteExecCall ["RRPServer_msg_handleMessages",2];

			[format["Вы отправили для %1 сообщение: %2",GVAR_RNAME(life_smartphoneTarget),_msg]] call hints;
			ctrlShow[88885, true];
			closeDialog 1;
		};
		//copmessage
		case 2: 
		{
			if !(_isPhone) throw "Связь недоступна, так как у вас нет телефона в соответствующем слоте. Купите его в универсальном магазине или на заправках 24-7. Вы можете связаться только с администратором.";
			if !(_canUse) throw "Вы не можете пользоваться телефоном со связанными руками";
			if(["cop"] call RRPClient_system_playerCount == 0) throw format["Полиция в данный момент недоступна. Пожалуйста, повторите ваш запрос позже"];
			ctrlShow[888895,false];
			if (EQUAL(_msg,"")) then{ throw "Сообщение не может быть пустым!";ctrlShow[888895,true];};

			[objNull,_msg,player,1] remoteExecCall ["RRPServer_msg_handleMessages",2];
			
			[format["Вы отправили для %1 сообщение: %2","The Police",_msg]] call hints;
			ctrlShow[888895,true];
			closeDialog 1;
		};
		//msgadmin
		case 3: 
		{
			ctrlShow[888896,false];
			if (EQUAL(_msg,"")) then {ctrlShow[888896,true]; throw "Сообщение не может быть пустым!"};

			[objNull,_msg,player,2] remoteExecCall ["RRPServer_msg_handleMessages",2];

			[format["Вы отправили для %1 сообщение: %2","Admins",_msg]] call hints;
			ctrlShow[888896,true];
			closeDialog 1;
		};
		//emsrequest
		case 4: 
		{
			if !(_isPhone) throw "Связь недоступна, так как у вас нет телефона в соответствующем слоте. Купите его в универсальном магазине или на заправках 24-7. Вы можете связаться только с администратором.";
			if !(_canUse) throw "Вы не можете пользоваться телефоном со связанными руками";
			if (["med"] call RRPClient_system_playerCount == 0) throw format["МЧС в данный момент недоступно. Пожалуйста, повторите ваш запрос позже"];
			ctrlShow[888899,false];
			if (EQUAL(_msg,"")) then {ctrlShow[888899,true]; throw "Сообщение не может быть пустым!"};

			[objNull,_msg,player,3] remoteExecCall ["RRPServer_msg_handleMessages",2];

			[format["Вы отправили сообщение в МЧС<br/>%1",_msg]] call hints;
			ctrlShow[888899,true];
			closeDialog 1;
		};
		//adminToPerson
		case 5: 
		{
			if (FETCH_CONST(life_adminlevel) < 1) throw "Вы не админ!";
			if !(life_smartphoneTarget isEqualType objNull) throw "Абонент недоступен";
			if (isNull life_smartphoneTarget) throw "Абонент недоступен";
			if (EQUAL(_msg,"")) throw "Сообщение не может быть пустым!";

			[life_smartphoneTarget,_msg,player,4] remoteExecCall ["RRPServer_msg_handleMessages",2];

			[format["Admin Message Sent To: %1 - Message: %2",GVAR_RNAME(life_smartphoneTarget),_msg]] call hints;
			closeDialog 1;
		};

		//emergencyloading
		case 6: 
		{
		
			ctrlShow[9852,false];
			ctrlShow[888911,false];
			if (FETCH_CONST(life_adminlevel) < 1) then {
				ctrlShow[888898,false];
				ctrlShow[888896,true];
			} else {
				ctrlShow[888898,true];
				ctrlShow[888896,false];
			};

			if (('cop' call RRPClient_groups_getSideLevel) < 1) then {
				ctrlShow[888900,false];
				ctrlShow[888895,true];

				ctrlShow[888901,false];
				ctrlShow[888902,false];
				ctrlShow[888903,false];
				ctrlShow[888904,false];
				ctrlShow[888909,false];
			} else {
				ctrlShow[888900,true];
				ctrlShow[888895,false];
			};

			if (('med' call RRPClient_groups_getSideLevel) < 1) then {
				ctrlShow[888899,true];
				ctrlShow[888905,false];
			} else {
				ctrlShow[888899,false];
				
				ctrlShow[9852,true];
				ctrlShow[888911,true];
				ctrlShow[888905,true];
				
				lbClear _lbMedMsg;
				private _medMsgs = getArray (missionConfigFile >> "RRP_messages" >> "medMessagePresets");
				{
					_index = _lbMedMsg lbAdd (_x select 0);
					_lbMedMsg lbSetData [_index,(_x select 1)];
				}forEach _medMsgs;
				_lbMedMsg lbSetCurSel -1;
				
			};

			if !(license_press) then {
				ctrlShow[888908,false];
			};
		};

		//adminMsgAll
		case 7: 
		{
			if (FETCH_CONST(life_adminlevel) < 1) throw "Вы не админ!";
			if (EQUAL(_msg,"")) throw "Сообщение не может быть пустым!";

			[objNull,_msg,player,5] remoteExecCall ["RRPServer_msg_handleMessages",2];
			["db_log",[format["Admin message for all -> %1",_msg]],GVAR_RNAME(player),steamid] remoteExecCall ["RRPServer_system_logIt",RSERV];

			[format["Админское сообщение для всех: %1",_msg]] call hints;
			closeDialog 1;
		};
		//PoliceMsgAll
		case 8: 
		{
			if (('cop' call RRPClient_groups_getSideLevel) < 1) throw "Вы не полицейский!";
			if (EQUAL(_msg,"")) throw "Сообщение не может быть пустым!";

			[objNull,_msg,player,6] remoteExecCall ["RRPServer_msg_handleMessages",2];

			[format["Полицейское сообщение для всех: %1",_msg]] call hints;
			closeDialog 1;
		};
		//MedicMsgAll
		case 9: 
		{
			if (('med' call RRPClient_groups_getSideLevel) < 1) throw "Вы не сотрудник МЧС!";
			if (EQUAL(_msg,"")) throw "Сообщение не может быть пустым!";

			[objNull,_msg,player,7] remoteExecCall ["RRPServer_msg_handleMessages",2];

			[format["МЧС сообщение для всех: %1",_msg]] call hints;
			closeDialog 1;
		};
		//В такси
		case 10: 
		{
			if !(_isPhone) throw "Связь недоступна, так как у вас нет телефона в соответствующем слоте. Купите его в универсальном магазине или на заправках 24-7. Вы можете связаться только с администратором.";
			if !(_canUse) throw "Вы не можете пользоваться телефоном со связанными руками";
			if (EQUAL(_msg,"")) throw "Сообщение не может быть пустым!";

			[objNull,_msg,player,8] remoteExecCall ["RRPServer_msg_handleMessages",2];

			[format["Вы отправили запрос в ТАКСИ\n\n%1",_msg]] call hints;
			closeDialog 1;
		};
		//7newsMsgAll
		case 11: 
		{
			if !(license_press) throw "Вы не сотрудник 7news!";
			if (('civ' call RRPClient_groups_getSideLevel) < 3) throw "У вас не 3-ий уровень";
			if (EQUAL(_msg,"")) throw "Сообщение не может быть пустым!";

			[objNull,_msg,player,9] remoteExecCall ["RRPServer_msg_handleMessages",2];

			[format["Сообщение от 7NEWS для всех: %1",_msg]] call hints;
			closeDialog 1;
		};
		case 12: 
		{
			if (('med' call RRPClient_groups_getSideLevel) < 1) throw "Вы не сотрудник МЧС!";
			if ((lbCurSel 9852) isEqualTo -1) throw "Выберите сообщение!";
			
			private _curSelection = lbCursel _lbMedMsg;
			private _msg = (_lbMedMsg lbData _curSelection);
			
			[objNull,_msg,player,7] remoteExecCall ["RRPServer_msg_handleMessages",2];
			[format["Сообщение от МЧС для всех: %1",_msg]] call hints;
			closeDialog 1;
		};
	};
}catch{
	["ErrorTitleAndText",["Мессенджер",_exception]] call toast;
};