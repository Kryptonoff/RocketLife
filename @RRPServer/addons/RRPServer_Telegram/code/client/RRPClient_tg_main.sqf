RRPClient_tg_main = {
disableSerialization;
systemChat str _this;
params["_mode", "_this"];
try
{
	switch _mode do 
	{
		case "onLoad":
		{
			createDialog "RRPDialogTelegram";
			_display = uiNamespace getVariable ['RRPDialogTelegram',displayNull];
			if (isNull _display) exitWith {};

			private _ctrlList = _display displayCtrl 9001;
			_ctrlList ctrlAddEventHandler["LBSelChanged", {["onSelectMessage", _this] call RRPClient_tg_main}];
			ctrlSetFocus _ctrlList;

			private _ctrlSearchFilter = _display displayCtrl 9002;
			private _ctrlSearchPic = _display displayCtrl 9222;
			_ctrlSearchFilter ctrlAddEventHandler["SetFocus", {["onSetFocus",_this] call RRPClient_tg_main}];
			_ctrlSearchFilter ctrlAddEventHandler["KillFocus", {["onKillFocus",_this] call RRPClient_tg_main}];
			_ctrlSearchFilter ctrlAddEventHandler["KeyDown", 
			{
				if ((_this select 1) == 0x1C || (_this select 1) == 0x9C) then {
					["refreshList",[uiNamespace getVariable ["RRPDialogTelegram",displayNull]]] call RRPClient_tg_main;
				};
			}];
			_ctrlSearchFilter ctrlAddEventHandler ["Char",{
				["refreshList",[uiNamespace getVariable ["RRPDialogTelegram",displayNull]]] call RRPClient_tg_main;
			}];
			_ctrlSearchFilter ctrlSetText "Быстрый поиск...";
			_ctrlSearchFilter ctrlSetTooltip "Что бы начать поиск нажмите Enter";

			private _ctrlFilter = _display displayCtrl 9003;
			_ctrlFilter ctrlAddEventHandler["LBSelChanged", {["onSelectFilter", _this] call RRPClient_tg_main}];

			{
				private _index = _ctrlFilter lbAdd (_x select 0);
				_ctrlFilter lbSetValue [_index,(_x select 1)];
			} forEach [
				["Все",0],
				["Выделенные каналы",1],
				["Друзья",2],
				["Сообщения",3]
			];
			
			_ctrlFilter lbSetCurSel (profileNamespace getVariable[getText(getMissionConfig "CfgTelegram" >> "indexVar"),0]);

			(_display displayCtrl 9107) ctrlSetFade 1;  (_display displayCtrl 9107) ctrlCommit 0;
			(_display displayCtrl 9108) ctrlSetFade 1;  (_display displayCtrl 9108) ctrlCommit 0;
			(_display displayCtrl 9109) ctrlSetFade 1;  (_display displayCtrl 9109) ctrlCommit 0;

			(_display displayCtrl 9107) ctrlSetFade 0;  (_display displayCtrl 9107) ctrlCommit 0.3;
			(_display displayCtrl 9108) ctrlSetFade 0;  (_display displayCtrl 9108) ctrlCommit 0.3;
			(_display displayCtrl 9109) ctrlSetFade 0;  (_display displayCtrl 9109) ctrlCommit 0.3;

			_ctrlList ctrlSetFade 1;
			_ctrlSearchFilter ctrlSetFade 1;

			_ctrlFilter ctrlSetFade 1;
			_ctrlList ctrlCommit 0;
			_ctrlSearchFilter ctrlCommit 0;
			_ctrlFilter ctrlCommit 0;

			_ctrlList ctrlSetFade 0;
			_ctrlSearchFilter ctrlSetFade 0;
			_ctrlSearchPic ctrlSetFade 0;
			_ctrlFilter ctrlSetFade 0;
			_ctrlList ctrlCommit 0.3;
			_ctrlSearchFilter ctrlCommit 0.3;
			_ctrlSearchPic ctrlCommit 0.3;
			_ctrlFilter ctrlCommit 0.3;

			private _ctrlTitalStatus = _display displayCtrl 9004;
			_ctrlTitalStatus ctrlShow false;

			private _ctrlGroupShow = _display displayCtrl 9005;
			_ctrlGroupShow ctrlShow false;
			_ctrlGroupShow ctrlSetAutoScrollRewind false;
			_ctrlGroupShow ctrlSetAutoScrollSpeed 0.00001;
			_ctrlGroupShow ctrlSetAutoScrollDelay 0;

			_ctrlGroupShow ctrlAddEventHandler [
				"SetFocus",
				{
					params ["_ctrlGroupShow"];
					_ctrlGroupShow ctrlSetAutoScrollSpeed -1;
				}
			];

			private _ctrlMessageContent = _display displayCtrl 9006;
			_ctrlMessageContent ctrlShow false;

			private _ctrlEditText = _display displayCtrl 9007;
			_ctrlEditText ctrlAddEventHandler["KeyDown", {
				if ((_this select 1) == 0x1C || (_this select 1) == 0x9C) then {
					["onSendMessage",[(_this select 3)]] call RRPClient_tg_main;
				};
			}];
			_ctrlEditText ctrlSetTooltip "Что бы отправить сообщения нажмите Enter";
			_ctrlEditText ctrlShow false;

			private _ctrlTimeComing = _display displayCtrl 9008;
			_ctrlTimeComing ctrlShow false;

			private _ctrlBtnStopCall = _display displayCtrl 9009;
			_ctrlBtnStopCall ctrlShow false;

			private _ctrlBtnVolPlus = _display displayCtrl 9010;
			_ctrlBtnVolPlus ctrlSetTooltip "В разработке";
			_ctrlBtnVolPlus ctrlShow false;

			private _ctrlBtnVolMin = _display displayCtrl 9011;
			_ctrlBtnVolMin ctrlSetTooltip "В разработке";
			_ctrlBtnVolMin ctrlShow false;

			private _ctrlBtnSpeakers = _display displayCtrl 9012;
			_ctrlBtnSpeakers ctrlShow false;
			private _ctrlGroupInComingCall = _display displayCtrl 9013;
			_ctrlGroupInComingCall ctrlShow false;
			private _ctrlInComingName = _display displayCtrl 9014;
			_ctrlInComingName ctrlShow false;
			private _ctrlAcceptCall = _display displayCtrl 9015;
			_ctrlAcceptCall ctrlShow false;
			private _ctrlDeclineCall = _display displayCtrl 9016;
			_ctrlDeclineCall ctrlShow false;
			private _ctrlIconAddContact = _display displayCtrl 9101;
			_ctrlIconAddContact ctrlSetText "";
			_ctrlIconAddContact ctrlShow false;
			private _ctrlIconLeave = _display displayCtrl 9102;
			_ctrlIconLeave ctrlSetText "";
			_ctrlIconLeave ctrlShow false;
			private _ctrlIconCallContact = _display displayCtrl 9103;
			_ctrlIconCallContact ctrlSetText "";
			_ctrlIconCallContact ctrlShow false;
			private _ctrlIconAddContact2 = _display displayCtrl 9104;
			_ctrlIconAddContact2 ctrlSetText "";
			_ctrlIconAddContact2 ctrlShow false;
			private _ctrlIconRemoveFriends = _display displayCtrl 9105;
			_ctrlIconRemoveFriends ctrlSetText "rimas_agent\assets\telegram\deleteFriends.paa";
			_ctrlIconRemoveFriends ctrlShow false;
			private _ctrlIconRemoveInvolved = _display displayCtrl 9106;
			_ctrlIconRemoveInvolved ctrlSetText "rimas_agent\assets\telegram\delet.paa";
			_ctrlIconRemoveInvolved ctrlShow false;

			private _ctrlButtonAddContact = _display displayCtrl 9201;
			_ctrlButtonAddContact ctrlSetTooltip "Запросить дружбу у выбранного игрока";
			_ctrlButtonAddContact ctrlShow false;

			private _ctrlButtonLeave = _display displayCtrl 9202;

			_ctrlButtonLeave ctrlSetTooltip "Выйти из выбранной беседы";
			_ctrlButtonLeave ctrlShow false;

			private _ctrlButtonCallContact = _display displayCtrl 9203;

			_ctrlButtonCallContact ctrlSetTooltip "Позвонить выбранному игроку";
			_ctrlButtonCallContact ctrlShow false;

			private _ctrlButtonAddContact2 = _display displayCtrl 9204;

			_ctrlButtonAddContact2 ctrlSetTooltip "Добавить в беседу игрока из списка";
			_ctrlButtonAddContact2 ctrlShow false;

			private _ctrlButtonRemoveFriends = _display displayCtrl 9205;
			_ctrlButtonRemoveFriends ctrlAddEventHandler["ButtonClick", {["onClickRemoveFriends", _this] call RRPClient_tg_main}];
			_ctrlButtonRemoveFriends ctrlSetTooltip "Удалить выброного игрока из списка друзей";
			_ctrlButtonRemoveFriends ctrlShow false;

			private _ctrlButtonRemoveInvolved = _display displayCtrl 9206;
			_ctrlButtonRemoveInvolved ctrlAddEventHandler["ButtonClick", {["onClickRemoveInvolved", _this] call RRPClient_tg_main}];
			_ctrlButtonRemoveInvolved ctrlSetTooltip "Удалить историю беседы";
			_ctrlButtonRemoveInvolved ctrlShow false;

			private _ctrlListEmoje = _display displayCtrl 9207;
			_ctrlListEmoje ctrlAddEventHandler["LBSelChanged", {["onSelectEmoje", _this] call RRPClient_tg_main}];
			_ctrlListEmoje ctrlShow false;

			private _ctrlPicSend = _display displayCtrl 9108;
			private _ctrlButtonSend = _display displayCtrl 9208;
			_ctrlButtonSend ctrlAddEventHandler["ButtonClick", {["onSendMessage", [false]] spawn RRPClient_tg_main}];
			_ctrlButtonSend ctrlSetTooltip "Отправить сообщение";
			_ctrlButtonSend ctrlShow false;
			_ctrlPicSend ctrlShow false;

			private _ctrlButtonCall = _display displayCtrl 9017;
			_ctrlButtonCall ctrlSetText "";
			_ctrlButtonCall ctrlAddEventHandler ["ButtonClick", TFAR_fnc_clickCall];
			_ctrlButtonCall ctrlShow false;

			["refreshList",[_display]] call RRPClient_tg_main;
			["deleteMessageControls",[]] call RRPClient_tg_main;
		};
		case "onUnload":
		{
			params["", "_display", "_exitCode"];
			if (isNull _display) then {_display = uiNamespace getVariable ["RRPDialogTelegram",displayNull]};
			{
				_x ctrlSetFade 1;
				_x ctrlCommit 0.3;
			} forEach allControls _display;
			[{
				uiNamespace setVariable ["RRPDialogTelegram",nil];
			},[],0.3] call CBA_fnc_witeAndExecut;
			"Messager onUnload" call RRPClient_system_log;
		};
		case "onSelectFilter":
		{
			params["_ctrlFilter", "_selectedFilterIndex"];
			private _display = ctrlParent _ctrlFilter;
			private _ctrlList = _display displayCtrl 9001;
			private _lbValue = _ctrlFilter lbValue _selectedFilterIndex;

			if (_selectedFilterIndex > -1) then {
				profileNamespace setVariable [getText(getMissionConfig "CfgTelegram" >> "indexVar"),_selectedFilterIndex];
				["refreshList",[_display]] spawn RRPClient_tg_main;
			};
		};
		case "renderMessages":
		{
													comment "true - left, false - right";
			_this params ["_message","_time","_senderName",["_pos",true]];
			private	_controlGroup = _display displayCtrl 9005;
			private _someIDC = 35410;
			private _topCtrl = _display ctrlCreate ["RscPicture", _someIDC, _controlGroup];                		_someIDC = _someIDC + 1;
			private _midCtrl = _display ctrlCreate ["RscPicture", _someIDC, _controlGroup];                		_someIDC = _someIDC + 1;
			private _bottomCtrl = _display ctrlCreate ["RscPicture", _someIDC, _controlGroup];            		_someIDC = _someIDC + 1;
			private _structuredText =  _display ctrlCreate ["RscStructuredText", _someIDC, _controlGroup];      _someIDC = _someIDC + 1;

			private _color = "#000000";
			private _alignTime = ['right','left'] select _pos;
			private _struct =  format ["<t align='"+_alignTime+"' color='#777777' font='RobotoCondensedLight' shadow='0' size='0.5'>%4</t><br/><t align='"+_alignTime+"' color='%2' shadow='0' size='%3'>%1</t>", _message, _color,(((pixelH * 5) * ((getResolution select 1) / 1080)) * 100),_time];
			private _imageFormat = ["MessageTo","MessageFrom"] select _pos;
			
			_bottomCtrl ctrlSetText format ["rimas_agent\assets\telegram\%1Bottom.paa",_imageFormat];
			_midCtrl ctrlSetText format ["rimas_agent\assets\telegram\%1Middle.paa",_imageFormat];
			_topCtrl ctrlSetText format ["rimas_agent\assets\telegram\%1Top.paa",_imageFormat];
			
			_structuredText ctrlSetPosition [7 * (((safezoneW / safezoneH) min 1.2) / 40),0, ((0.1517 * safezoneW) * 0.65) ,(1 * safezoneH)];
			_structuredText ctrlCommit 0;
			_structuredText ctrlSetStructuredText parseText _struct;
			
			private _baseImageSize = [
				[7 * (((safezoneW / safezoneH) min 1.2) / 40), 0, (0.1517 * safezoneW), (0.011 * safezoneH)],
				[0, 0, (0.1517 * safezoneW), (0.011 * safezoneH)]
			] select _pos;
			
			{
				_x ctrlSetPosition _baseImageSize;
				_x ctrlCommit 0;
			} forEach [_bottomCtrl, _midCtrl, _topCtrl];

			if ((count MessageControls) > 0) then {
				private _lastControl = MessageControls select ((count MessageControls) - 1);
				private _newY = ((ctrlPosition _lastControl) select 1) + (((ctrlPosition _lastControl) select 3)) + (0.011 * safezoneH);
				{
					private _thisCtrlPos = ctrlPosition _x;
					_thisCtrlPos set [1, _newY];
					_x ctrlSetPosition _thisCtrlPos;
					_x ctrlCommit 0;
				} forEach [_bottomCtrl, _midCtrl, _topCtrl];
			};

			private _topCtrlPos = ctrlPosition _topCtrl;
			_topCtrlPos params ["", "_topY", "", "_topH"];

			private _midStartPos = _topY + _topH;

			private _textHeight = ctrlTextHeight _structuredText;
			private _midCtrlPos = [ ((ctrlPosition _midCtrl) select 0),_midStartPos,(0.1517 * safezoneW),_textHeight];
			private _structuredTextPos = [((ctrlPosition _midCtrl) select 0),_midStartPos,((_midCtrlPos select 2) * 0.65),_textHeight];


			_structuredTextPos set [
				0,
				[
					(10.8 * (((safezoneW / safezoneH) min 1.2) / 40)),
					(0.3 * (((safezoneW / safezoneH) min 1.2) / 40))
				] select _pos
			];
			_structuredText ctrlSetPosition _structuredTextPos;

			_structuredText ctrlCommit 0;
			_midCtrl ctrlSetPosition _midCtrlPos;
			_midCtrl ctrlCommit 0;

			_midCtrlPos = ctrlPosition _midCtrl;
			_botCtrlPos = ctrlPosition _bottomCtrl;

			private _midBotDifference = (_midCtrlPos select 1) + (_midCtrlPos select 3);

			_botCtrlPos set [1, _midBotDifference];

			_bottomCtrl ctrlSetPosition _botCtrlPos;
			_bottomCtrl ctrlCommit 0;

			{MessageControls pushBack _x} forEach [_structuredText, _topCtrl, _midCtrl, _bottomCtrl];
			
		};
		case "refreshList":
		{
			params [["_display", displayNull, [displayNull]]];
			if (isNull _display) then {
				_display = uiNamespace getVariable ["RRPDialogTelegram",displayNull];
			};
			if (isNull _display) throw "Перезагрузите диалог телефона";
			
			["deleteMessageControls",[]] call RRPClient_tg_main;
			private _ctrlList = _display displayCtrl 9001;
			private _ctrlFilter = _display displayCtrl 9003;
			private _selectedFilterIndex = _ctrlFilter lbValue (lbCurSel _ctrlFilter);
			private _searchValue = ctrlText 9002;
			if (_searchValue isEqualTo "Быстрый поиск...") then {
				_searchValue = "";
			};

			switch (_selectedFilterIndex) do 
			{
				case 0: 
				{

					lbClear _ctrlList;
					private _units = [playableUnits,[],{name _x},"ASCEND"] call BIS_fnc_sortBy;
					private _all = [];
					_all = (_units select {_x != player && {name _x != ""} && {(_searchValue isEqualTo "" OR (toLower(_searchValue) find toLower(name _x) != -1))}});
					{
						private _index = _ctrlList lbAdd format["%1",name _x];
						_ctrlList lbSetData  [_index,getPlayerUID _x];
						_ctrlList lbSetValue [_index,0];
					} forEach _all;
				};
				case 1 : 
				{
					lbClear _ctrlList;
					{
						_x params ["_title", "_id", "_type", "_color","_icon","_showOnline","_group_id"];

						private _index = _ctrlList lbAdd _title;
						_ctrlList lbSetData [_index,_type];
						_ctrlList lbSetValue [_index,_id];
						_ctrlList lbSetPicture [_index,_icon];

						if (_showOnline isEqualTo 1) then
						{
							_ctrlList lbSetPictureRight [_index, "\A3\ui_f\data\map\markers\military\dot_CA.paa"];
							_color = [[0.502,0.502,0.502,1],[0,0.502,0,1]] select (_group_id call RRPClient_groups_util_count_players < 0);
							_ctrlList lbSetPictureRightColor [_index, _color];
						};
					} forEach (call RRPClient_tg_create_array_dedicated_channels);
				};
				case 2 : 
				{
					lbClear _ctrlList;
					private _myFriends = [RRPClientTGFriends,[],{_x select 0},"ASCEND"] call BIS_fnc_sortBy;
					{
						_x params ["_fName", "_fUid"];
						if (_searchValue isEqualTo "" || {[_searchValue,_fName] call RRPClient_util_xString}) then 
						{
							private _index = _ctrlList lbAdd _fName;
							_ctrlList lbSetData [_index,_fUid];
							_ctrlList lbSetValue[_index,0];
							_ctrlList lbSetPicture [_index,"rimas_agent\assets\telegram\superuser.paa"];
							private _unit = _fUid call RRPClient_util_objectFromPlayerUID;
							if !(isNull _unit) then 
							{
								_ctrlList lbSetPictureRight [_index, "\A3\ui_f\data\map\markers\military\dot_CA.paa"];
								_ctrlList lbSetPictureRightColor [_index, [0,0.6,0.7,1]];
							} else {
								_ctrlList lbSetPictureRight [_index, "\A3\ui_f\data\map\markers\military\dot_CA.paa"];
								_ctrlList lbSetPictureRightColor [_index, [1,0,0,1]];
							};
						};
					} forEach _myFriends;
				};
				case 3 : 
				{
					private _myConversations = [RRPClientTGConversations,[],{_x select 3},"DESCEND"] call BIS_fnc_sortBy;
					lbClear _ctrlList;
					{
						_x params ["_cUid","_cName","_cArray","_cCount"];
						if (!(_cUid in ["__ADMIN__","__COP__","__MED__","__PRESS__","__TAXI__"]) && 
							{_searchValue isEqualTo ""} || {[_searchValue,_cName] call RRPClient_util_xString}) then 
						{
							private _index = _ctrlList lbAdd _cName;
							_ctrlList lbSetData [_index,_cUid];
							_ctrlList lbSetValue[_index,0];
							_ctrlList lbSetPicture [_index,"rimas_agent\assets\telegram\chat.paa"];
							private _unit = _cUid call RRPClient_util_objectFromPlayerUID;
							if !(isNull _unit) then 
							{
								if (_cCount > 0) then {
									_ctrlList lbSetTextRight [_index,str(_cCount)];
								};
								_ctrlList lbSetPictureRight [_index, "\A3\ui_f\data\map\markers\military\dot_CA.paa"];
								_ctrlList lbSetPictureRightColor [_index, [0,0.7,0.1,1]];
							} else {
								if (_cCount > 0) then 
								{
									_ctrlList lbSetTextRight [_index,str(_cCount)];
								};
								_ctrlList lbSetTextRight [_index,str(_cCount)];
								_ctrlList lbSetPictureRight [_index, "\A3\ui_f\data\map\markers\military\dot_CA.paa"];
								_ctrlList lbSetPictureRightColor [_index, [1,0,0,1]];
							};
						};
					} forEach _myConversations;
				};
			};
			["onListEmoji",[_display]] call RRPClient_tg_main;
			if (isNil "life_quickOpen911") then 
			{
				_ctrlList lbSetCurSel - 1;
			} else {
				if (player call getSide in ["civ","reb"]) then 
				{
					_ctrlList lbSetCurSel 1;
				};
				life_quickOpen911 = nil;
			};
		};
		case "onSelectMessage":
		{
			params["_ctrlList", "_selectedListIndex"];
			["deleteMessageControls",[]] call RRPClient_tg_main;
			_display = ctrlParent _ctrlList;
			_ctrlTitalStatus = _display displayCtrl 9004;
			_ctrlGroupShow = _display displayCtrl 9005;
			_ctrlGroupShow ctrlSetAutoScrollRewind false;
			_ctrlGroupShow ctrlSetAutoScrollSpeed 0.00001;
			_ctrlGroupShow ctrlSetAutoScrollDelay 0;

			_ctrlGroupShow ctrlAddEventHandler [
				"SetFocus",
				{
					params ["_ctrlGroupShow"];
					_ctrlGroupShow ctrlSetAutoScrollSpeed -1;
				}
			];
			_ctrlMessageContent = _display displayCtrl 9006;
			_ctrlEditText = _display displayCtrl 9007;

			_ctrlIconRemoveFriends = _display displayCtrl 9105;
			_ctrlButtonRemoveFriends = _display displayCtrl 9205;

			_ctrlIconRemoveInvolved = _display displayCtrl 9106;
			_ctrlButtonRemoveInvolved = _display displayCtrl 9206;
			_ctrlListEmoje = _display displayCtrl 9207;
			_ctrlPicSend = _display displayCtrl 9108;
			_ctrlButtonSend = _display displayCtrl 9208;
			_ctrlButtonCall = _display displayCtrl 9017;
			_ctrlListEmoje = _display displayCtrl 9207;

			if (_selectedListIndex > -1) then 
			{
				private _playerName = _ctrlList lbText _selectedListIndex;
				private _lbValue = _ctrlList lbValue _selectedListIndex;
				private _playerUID = _ctrlList lbData _selectedListIndex;
				private _messageContent = "";
				private _data = [];
				_ctrlMessageContent ctrlSetStructuredText parseText "";

				if !(_playerUID isEqualTo "") then 
				{
					private _data = ["onLoadConversationsData",[_playerUID]] call RRPClient_tg_main;
					systemChat str _data;
					if !(_data isEqualTo []) then 
					{
						{
							_x params ["_senderName","_text","_time"];
							_time = (["msg",_time] call RRPClient_util_convertTime);
							if (_text find "[" > -1 && _text find "]" > -1) then 
							{
								_text = ["onConvertEmoji",[_text]] call RRPClient_tg_main;
							};
							if (_senderName in [profileName,player getVariable ["realname",""]]) then 
							{
								["renderMessages",[_text,_time,profileName,false]] call RRPClient_tg_main;
							} else {
								["renderMessages",[_text,_time,_senderName,true]] call RRPClient_tg_main;
							};
							if (_text isEqualTo "[Удалил вас из друзей...]") then {[_playerUID] call RRPClient_tg_deleteFriends};
						} foreach _data;
						_ctrlMessageContent ctrlSetStructuredText(parseText _messageContent);
						_adjustedHeight = (ctrlTextHeight _ctrlMessageContent) + 0.005;
						_pos = ctrlPosition _ctrlMessageContent;
						_ctrlMessageContent ctrlSetPosition[_pos select 0, _pos select 1, _pos select 2, _adjustedHeight];
						_ctrlMessageContent ctrlCommit 0;
						_ctrlMessageContent ctrlShow true;
						_ctrlGroupShow ctrlShow true;
						_ctrlGroupShow ctrlSetFade 1;
						_ctrlGroupShow ctrlCommit 0;
						_ctrlGroupShow ctrlSetFade 0;
						_ctrlGroupShow ctrlCommit 0.3;
						_ctrlButtonRemoveInvolved ctrlShow true;
						_ctrlIconRemoveInvolved ctrlShow true;
						_ctrlIconRemoveInvolved ctrlSetFade 1;
						_ctrlIconRemoveInvolved ctrlCommit 0;
						_ctrlIconRemoveInvolved ctrlSetFade 0;
						_ctrlIconRemoveInvolved ctrlCommit 0.3;
						["onMessageStatus",[_playerUID]] call RRPClient_tg_main;
					};
					_ctrlButtonRemoveFriends ctrlShow (((lbValue[9003,lbCurSel 9003])) isEqualTo 2);
					_ctrlIconRemoveFriends ctrlShow (((lbValue[9003,lbCurSel 9003])) isEqualTo 2);
					_ctrlIconRemoveFriends ctrlSetFade 1;
					_ctrlIconRemoveFriends ctrlCommit 0;
					_ctrlIconRemoveFriends ctrlSetFade 0;
					_ctrlIconRemoveFriends ctrlCommit 0.1;
					_ctrlTitalStatus ctrlSetStructuredText(parseText format["<t align='center' color='#FFFFFF' shadow='0' size='1' >%1</t>",_playerName]);
					if (((lbValue[9003,lbCurSel 9003])) in [2,3]) then 
					{
						if (isNull (_playerUID call RRPClient_util_objectFromPlayerUID)) then 
						{
							_ctrlTitalStatus ctrlSetStructuredText(parseText format["<t align='center' color='#FFFFFF' shadow='0' size='1' >%1</t><br/><t align='center' color='#FF0000' shadow='0' size='0.8' >Оффлайн</t>",_playerName]);
						} else {
							_ctrlTitalStatus ctrlSetStructuredText(parseText format["<t align='center' color='#FFFFFF' shadow='0' size='1' >%1</t><br/><t align='center' color='#00B31A' shadow='0' size='0.8' >Онлайн</t>",_playerName]);
						};
					};
					_ctrlTitalStatus ctrlShow true;
					_ctrlTitalStatus ctrlSetFade 1;
					_ctrlTitalStatus ctrlCommit 0;
					_ctrlTitalStatus ctrlSetFade 0;
					_ctrlTitalStatus ctrlCommit 0.1;
				};
				_ctrlEditText ctrlShow true;
				_ctrlPicSend ctrlShow true;
				_ctrlButtonSend ctrlShow true;
				_ctrlListEmoje ctrlShow true;

				_unit = _playerUID call RRPClient_util_objectFromPlayerUID;
				_friends = [_playerUID] call RRPClient_tg_checkFriends;
				if ((isNull _unit) OR (!_friends)) then 
				{
					_ctrlButtonCall ctrlSetText "";
					_ctrlButtonCall ctrlShow false;
				} else {
					if (alive _unit) then 
					{
						if (isNil "PhoneTaskForceRadioCall") then 
						{
							_ctrlButtonCall ctrlSetText "rimas_agent\assets\telegram\GreenCall.paa";
						}else{
							_netId = netId _unit;
							if ((_netId isEqualTo (PhoneTaskForceRadioCall select 1)) || (_netId isEqualTo (PhoneTaskForceRadioCall select 0))) then 
							{
								_ctrlButtonCall ctrlSetText "rimas_agent\assets\telegram\RedCall.paa";
							}else{
								_ctrlButtonCall ctrlSetText "rimas_agent\assets\telegram\GreenCall.paa";
							};
						};
						_ctrlButtonCall ctrlShow true;
					}else{
						_ctrlButtonCall ctrlSetText "";
						_ctrlButtonCall ctrlShow false;
					};
				};
			} else {
				_ctrlGroupShow ctrlShow false;
			};
		};
		case "deleteMessageControls":
		{

			if (isNil "MessageControls") then {
				MessageControls = [];
			} else {
				if !(MessageControls isEqualTo []) then {
					{
						ctrlDelete _x;
					} forEach MessageControls;
				};
			};
		};
		case "onRefreshConversation":
		{
			params["_display", "_data"];
			["deleteMessageControls",[]] call RRPClient_tg_main;
			private _playerUID = (lbData[9001,lbCurSel 9001]);
			if (_data isEqualTo []) then 
			{
				private _data = ["onLoadConversationsData",[_playerUID]] call RRPClient_tg_main;
			};
			_ctrlMessageGroup = _display displayCtrl 9005;
			_ctrlMessageContent = _display displayCtrl 9006;
			_messageContent = "";
			_ctrlMessageContent ctrlShow false;
			_ctrlMessageGroup ctrlShow false;
			{
				_x params ["_senderName","_text","_time"];
				_time = (["msg",_time] call RRPClient_util_convertTime);
				if (_text find "[" > -1 && _text find "]" > -1) then 
				{
					_text = ["onConvertEmoji",[_text]] call RRPClient_tg_main;
				};
				if (_senderName in [profileName,player getVariable ["realname",""]]) then 
				{
					["renderMessages",[_text,_time,profileName,false]] call RRPClient_tg_main;
				} else {
					["renderMessages",[_text,_time,_senderName,true]] call RRPClient_tg_main;
				};
				if (_text isEqualTo "[Удалил вас из друзей...]") then {[_playerUID] call RRPClient_tg_deleteFriends};
			} foreach _data;
			_ctrlMessageContent ctrlSetStructuredText(parseText _messageContent);
			_adjustedHeight = (ctrlTextHeight _ctrlMessageContent) + 0.005;
			_pos = ctrlPosition _ctrlMessageContent;
			_ctrlMessageContent ctrlSetPosition[_pos select 0, _pos select 1, _pos select 2, _adjustedHeight];
			_ctrlMessageContent ctrlCommit 0;
			_ctrlMessageContent ctrlShow true;
			_ctrlMessageGroup ctrlShow true;
			["onMessageStatus",[_playerUID]] call RRPClient_tg_main;
		};
		case "onSendMessage":
		{
			params [["_isAdmin", false, [false]]];
			_display = uiNamespace getVariable ["RRPDialogTelegram",displayNull];
			private _playerName = (lbText[9001,lbCurSel 9001]);
			private _lbValue = (lbValue[9001,lbCurSel 9001]);
			private _playerUID = (lbData[9001,lbCurSel 9001]);

			if (_lbValue isEqualTo -1) throw "Вы ничего не выбрали";
			private _message = [ctrlText 9007,""":%''&</>"] call RRPClient_util_stripChars;
			if (_message isEqualTo "[Удалил переписку...]") throw "Переписка удалена";
			if (count(_message) > 600) throw "Максимальная длинна сообщения 600 символов!";
			if (count(_message) isEqualTo 0 && {!(_lbValue isEqualTo 8)}) throw "Ошибка 404";

			private _isPhone = call RRPClient_system_canUsePhone;
			private _canUse = if (player getVariable ["tf_unable_to_use_radio",false]) then {false} else {true};
			if (!_canUse && {_lbValue in [0,2,3,4]}) throw "Вы не можете пользоваться телефоном со связанными руками";
			if (!_isPhone && {_lbValue in [0,2,3,4]}) throw "У вас нет телефона";
			private _SendTimeOut = missionNamespace getVariable [format["SendMessageTimeout_%1",_playerUID],0];
			if (time - _SendTimeOut < 1) throw "Минимальный интервал между отправкой сообщений пользователю - 1 секунды";
			switch(_lbValue) do 
			{
				case 0:
				{
					_unit = _playerUID call RRPClient_util_objectFromPlayerUID;
					if (isNull _unit) then 
					{
						if ([_playerUID] call RRPClient_tg_checkFriends) then 
						{
							[_playerUID,profileName,_playerName,_message,true] call RRPClient_tg_saveConversation;
							[[getPlayerUID player,profileName],[_playerUID,_playerName],_message,true] remoteExecCall ["RRPServer_tg_updateMessage",2];
						} else {
							["onRefreshConversation",[_display,[[profileName,"[Оффлайн сообщение можно отправить только друзьям...]",systemTimeUTC]]]] call RRPClient_tg_main;
						};
					} else {
						if (_isAdmin && {call life_adminlevel > 0}) then 
						{
							[_message,player,14] remoteExecCall ["RRPClient_tg_receiveClient",_unit];
						} else {
							[_message,player,0] remoteExecCall ["RRPClient_tg_receiveClient",_unit];
						};
						[_playerUID,profileName,_playerName,_message] call RRPClient_tg_saveConversation;
						[[getPlayerUID player,profileName],[_playerUID,_playerName],_message] remoteExecCall ["RRPServer_tg_updateMessage",2];
					};
				};
				case 1: 
				{
					[_message,player,1] remoteExecCall ["RRPClient_tg_receiveClient",-2];
					["__ADMIN__",profileName,"Администрация",_message] call RRPClient_tg_saveConversation;
					[[getPlayerUID player,profileName],[_playerUID,_playerName],_message] remoteExecCall ["RRPServer_tg_updateMessage",2];
				};
				case 2: 
				{
					[_message,player,2] remoteExecCall ["RRPClient_tg_receiveClient",-2];
					["__COP__",profileName,"Полиция",_message] call RRPClient_tg_saveConversation;
					[[getPlayerUID player,profileName],[_playerUID,_playerName],_message] remoteExecCall ["RRPServer_tg_updateMessage",2];
				};
				case 3: 
				{
					[_message,player,3] remoteExecCall ["RRPClient_tg_receiveClient",-2];
					["__MED__",profileName,"ES",_message] call RRPClient_tg_saveConversation;
					[[getPlayerUID player,profileName],[_playerUID,_playerName],_message] remoteExecCall ["RRPServer_tg_updateMessage",2];
				};
				case 4: 
				{
					[_message,player,4] remoteExecCall ["RRPClient_tg_receiveClient",-2];
					["__TAXI__",profileName,"Такси",_message] call RRPClient_tg_saveConversation;
				};
				case 5: 
				{
					[_message,player,5] remoteExecCall ["RRPClient_tg_receiveClient",-2];
					["__ADMIN__",profileName,"Администрация",_message] call RRPClient_tg_saveConversation;
					[[getPlayerUID player,profileName],[_playerUID,_playerName],_message] remoteExecCall ["RRPServer_tg_updateMessage",2];
				};
				case 6: 
				{
					[_message,player,6] remoteExecCall ["RRPClient_tg_receiveClient",-2];
					["__COP__",profileName,"Полиция",_message] call RRPClient_tg_saveConversation;
					[[getPlayerUID player,profileName],[_playerUID,_playerName],_message] remoteExecCall ["RRPServer_tg_updateMessage",2];
				};
				case 7: 
				{
					_message = format["Внимание! Экстренная ситуация в %1. В целях Вашей безопасности, рекомендуем не выходить на улицы, оставайтесь в безопасном месте до стабилизации обстановки",_message];
					[_message,player,7] remoteExecCall ["RRPClient_tg_receiveClient",-2];
					["__COP__",profileName,"Полиция",_message] call RRPClient_tg_saveConversation;
					[[getPlayerUID player,profileName],[_playerUID,_playerName],_message] remoteExecCall ["RRPServer_tg_updateMessage",2];
				};
				case 8: 
				{
					_message = "Уважаемые граждане нашего острова, если на Вас напали, украли Ваше транспортное средство, вы стали свидетелем преступления, немедленно пишите в экстренный канал полиции и обязательно указывайте Ваше местоположение с GPS координатами 123456";
					[_message,player,8] remoteExecCall ["RRPClient_tg_receiveClient",-2];
					["__COP__",profileName,"Полиция",_message] call RRPClient_tg_saveConversation;
					[[getPlayerUID player,profileName],[_playerUID,_playerName],_message] remoteExecCall ["RRPServer_tg_updateMessage",2];
				};
				case 9: 
				{
					_message = format["%1! Сдавайтесь! Вы окружены, сопротивление бесполезно! В случае невыполнения требований полиции будет открыт огонь на поражение!",_message];
					[_message,player,9] remoteExecCall ["RRPClient_tg_receiveClient",-2];
					["__COP__",profileName,"Полиция",_message] call RRPClient_tg_saveConversation;
					[[getPlayerUID player,profileName],[_playerUID,_playerName],_message] remoteExecCall ["RRPServer_tg_updateMessage",2];
				};
				case 10: 
				{
					_message = format["%1! Немедленно остановитесь, выйдите из техники и поднимите руки вверх! В случае невыполнения требований полиции будет открыт огонь на поражение!",_message];
					[_message,player,10] remoteExecCall ["RRPClient_tg_receiveClient",-2];
					["__COP__",profileName,"Полиция",_message] call RRPClient_tg_saveConversation;
					[[getPlayerUID player,profileName],[_playerUID,_playerName],_message] remoteExecCall ["RRPServer_tg_updateMessage",2];
				};
				case 11: 
				{
					_message = format["%1! Немедленно остановитесь! Заглушите двигатель и оставайтесь в транспортном средстве! Ожидайте дальнейших указаний! В случае невыполнения требований будет применено оружие!",_message];
					[_message,player,11] remoteExecCall ["RRPClient_tg_receiveClient",-2];
					["__COP__",profileName,"Полиция",_message] call RRPClient_tg_saveConversation;
					[[getPlayerUID player,profileName],[_playerUID,_playerName],_message] remoteExecCall ["RRPServer_tg_updateMessage",2];
				};
				case 12: 
				{
					[_message,player,12] remoteExecCall ["RRPClient_tg_receiveClient",-2];
					["__MED__",profileName,"ES",_message] call RRPClient_tg_saveConversation;
					[[getPlayerUID player,profileName],[_playerUID,_playerName],_message] remoteExecCall ["RRPServer_tg_updateMessage",2];
				};
				case 13: 
				{
					[_message,player,13] remoteExecCall ["RRPClient_tg_receiveClient",-2];
					["__PRESS__",profileName,"Altory Media",_message] call RRPClient_tg_saveConversation;
					[[getPlayerUID player,profileName],[_playerUID,_playerName],_message] remoteExecCall ["RRPServer_tg_updateMessage",2];
				};
			};

			missionNamespace setVariable [format["SendMessageTimeout_%1",_playerUID], time];
			ctrlSetText [9007,""];
		};
		case "onClickRemoveFriends":
		{
			params [["_ctrlButtonRemoveFriends", controlNull, [controlNull]]];
			private _display = ctrlParent _ctrlButtonRemoveFriends;
			private _ctrlList = _display displayCtrl 9001;
			private _selectedListIndex = lbCurSel _ctrlList;
			private _playerUID = _ctrlList lbData _selectedListIndex;
			private _playerName = _ctrlList lbText _selectedListIndex;
			private _lbValue = (lbValue[9003,lbCurSel 9003]);
			if (_playerUID isEqualTo "" OR {_playerName isEqualTo ""} OR {(_lbValue in [0,1,3])}) exitWith {format["onClickRemoveFriends %1",_lbValue] call RRPClient_system_log};
			if (_playerUID in ["__ADMIN__","__COP__","__MED__","__PRESS__","__TAXI__"]) throw "Спецальные службы нельзя удалить";
			if !([_playerUID] call RRPClient_tg_checkFriends) throw "Телефон","Его нет в друзьях";

			{
				if ((_x select 1) isEqualTo _playerUID) exitWith
				{
					RRPClientTGFriends deleteAt _forEachIndex;
				};
			} forEach RRPClientTGFriends;

			_unit = _playerUID call RRPClient_util_objectFromPlayerUID;
			if (isNull _unit) then 
			{
				[_playerUID,profileName,_playerName,"[Удалил вас из друзей...]"] call RRPClient_tg_saveConversation;
				[[getPlayerUID player,profileName],[_playerUID,_playerName],"[Удалил вас из друзей...]",true] remoteExecCall ["RRPServer_tg_updateMessage",2];
			} else {
				["[Удалил вас из друзей...]",player,0] remoteExecCall ["RRPClient_tg_receiveClient",_unit];
				[_playerUID,profileName,_playerName,"[Удалил вас из друзей...]"] call RRPClient_tg_saveConversation;
			};
			["refreshList",[_display]] spawn RRPClient_tg_main;
		};
		case "onClickRemoveInvolved":
		{
			params [["_ctrlButtonRemove", controlNull, [controlNull]]];
			private _display = ctrlParent _ctrlButtonRemove;
			private _ctrlList = _display displayCtrl 9001;
			private _selectedListIndex = lbCurSel _ctrlList;
			private _playerUID = _ctrlList lbData _selectedListIndex;
			if (_playerUID isEqualTo "") throw "Ничего не выбрали";
			{
				if ((_x select 0) isEqualTo _playerUID) exitWith
				{
					RRPClientTGConversations deleteAt _forEachIndex;
				};
			} forEach RRPClientTGConversations;
			if (player call getSide isEqualTo "cop" && ('cop' call RRPClient_groups_getSideLevel) isEqualTo 25) then 
			{
				_unit = _playerUID call RRPClient_util_objectFromPlayerUID;
				if (isNull _unit) then 
				{
					[[getPlayerUID player,profileName],[_playerUID,_playerName],"[Удалил переписку...]",true] remoteExecCall ["RRPServer_tg_updateMessage",2];
				} else {
					["[Удалил переписку...]",player,0] remoteExecCall ["RRPClient_tg_receiveClient",_unit];
				};
				["onRefreshConversation",[_display,[[profileName,"[Вы удалили свою переписку и собеседника...]",systemTimeUTC]]]] call RRPClient_tg_main;
			} else {
				["onRefreshConversation",[_display,[[profileName,"[Вы удалили свою переписку...]",systemTimeUTC]]]] call RRPClient_tg_main;
			};
			["add",RRPClientTGConversations] call RRPClient_ini_chatHistory;
		};
		case "onKeyBoardLayout":
		{
			private _source_str = param [0, "", [""]];
			if (_source_str isEqualTo "") exitWith { "" };

			private _source_symbols = toArray (toLower _source_str);
			private _symbols_rus = toArray "абвгдеёжзийклмнопрстуфхцчшщъыьэюя";
			private _symbols_eng = toArray "f,dult`;pbqrkvyjghcnea[wxio]sm'.z";

			private _result_symbols = [];
			private _result_str = "";

			{
				private _next_result_symbol = _x;
				if (_x in _symbols_rus) then {
					_next_result_symbol = _symbols_eng select (_symbols_rus find _x);
				};
				_result_symbols pushBack _next_result_symbol;
			} forEach _source_symbols;

			_result_str = toString _result_symbols;
			_result_str
		};
		case "onSetFocus":
		{
			private _ctrlSetFocus = _this select 0;
			private _ctrlIDCSetFocus = ctrlIDC _ctrlSetFocus;
			if ((ctrlText _ctrlSetFocus) isEqualTo "Быстрый поиск...") exitWith
			{
				ctrlSetText [_ctrlIDCSetFocus,""];
				_ctrlSetFocus ctrlSetBackgroundColor [1,1,1,1];
				_ctrlSetFocus ctrlSetTextColor [0,0,0,1];

			};
		};
		case "onKillFocus":
		{
			private _ctrlSetFocus = _this select 0;
			private _ctrlIDCSetFocus = ctrlIDC _ctrlSetFocus;
			if ((ctrlText _ctrlSetFocus) isEqualTo "") exitWith
			{
				ctrlSetText [_ctrlIDCSetFocus, "Быстрый поиск..."];
				_ctrlSetFocus ctrlSetBackgroundColor [0.078,0.23,0.37,1];
				_ctrlSetFocus ctrlSetTextColor [1,1,1,1];
			};
		};
		case "onMessageStatus":
		{
			params [["_uid","",[""]]];
			if (_uid isEqualTo "") exitWith {};
			if (RRPClientTGConversations isEqualTo []) exitWith {};
			{
				if ((_x select 0) isEqualTo _uid) exitWith
				{
					_x set [3, 0];
				}
			} forEach RRPClientTGConversations;
		};
		case "onLoadConversationsData":
		{
			params ["_uid"];
			private _tmp = [];
			if (_uid isEqualTo "") exitWith {_tmp};
			if (RRPClientTGConversations isEqualTo []) exitWith {_tmp};
			{
				if ((_x select 0) isEqualTo _uid) exitWith
				{
					_tmp = (_x select 2);
				};
			} forEach RRPClientTGConversations;
			_tmp
		};
		case "onConvertEmoji":
		{
			params [["_text","",[""]]];   
			if (_text isEqualTo "") exitWith {""};

			{
				_keyword = "[" + getText(_x >> "keyword") + "]";
				_image = getText(_x >> "image");
				_text = ["stringReplace",[_text,_keyword,format["<img color='#FFFFFF' image='%1'/>",_image],true]] call RRPClient_tg_main;
			} forEach ("true" configClasses (missionConfigFile >> "CfgEmoji"));
			_text;
		};
		case "stringReplace": 
		{
			params ["_input","_find","_replace",["_caseSensitive",false]];
			private _findLen = count _find;
			if !_caseSensitive then {_find = toLower _find};
			private _output = [];
			private _index = -1;
			for "_i" from 0 to 1 step 0 do 
			{
				_index = if _caseSensitive then {_input find _find} else {tolower _input find _find};
				if (_index < 0) exitwith {_output pushback _input};
				_output pushback (_input select [0,_index]);
				_output pushback _replace;
				_input = _input select [_index + _findLen,count _input];
			};
			_output joinString ""
		};
		case "onListEmoji": 
		{
			params [["_display", displayNull, [displayNull]]];
			if (isNull _display) then {
				_display = uiNamespace getVariable ["RRPDialogTelegram",displayNull];
			};
			if (isNull _display) exitWith {"UI RRPDialogTelegram isNull" call RRPClient_system_log};
			_ctrlList = _display displayCtrl 9207;
			lbClear _ctrlList;
			_ctrlList lbAdd "";
			{
				if ([getText(_x >> "conditions")] call RRPClient_util_conditionsCheck) then 
				{
					private _keyword = getText(_x >> "keyword");
					private _index = _ctrlList lbAdd getText(_x >> "displayName");
					_ctrlList lbSetData [_index,getText(_x >> "keyword")];
					_ctrlList lbSetPicture [_index,getText(_x >> "image")];
				};
			} forEach ("true" configClasses (missionConfigFile >> "CfgEmoji"));
			_ctrlList lbSetCurSel -1;
		};
		case "onSelectEmoje": 
		{
			params["_ctrlList", "_selectedListIndex"];
			_display = ctrlParent _ctrlList;
			_ctrlEditText = _display displayCtrl 9007;
			if (_selectedListIndex > -1) then 
			{
				private _keyword = _ctrlList lbData _selectedListIndex;
				if !(_keyword isEqualTo "") then 
				{
					private _text = ctrlText _ctrlEditText;
					_text = _text + "["+_keyword+"]";
					_text = _text + " ";
					_ctrlEditText ctrlSetText _text;
				};
			};
		};
	};

}catch{
	["ErrorTitleAndText",["Телефон",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
};
["onLoad"] call RRPClient_tg_main;