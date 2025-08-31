[] spawn {
	
	if ((missionNamespace getVariable ["RRPClient_call_curTask",-1]) isEqualTo -1) then 
	{
		RRPClient_call_curTask = taskNull;
	};

	disableSerialization;
	private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
	private _mainGroup = _display displayCtrl 24001;
	private _slide = _mainGroup controlsGroupCtrl 19000;

	private _ctrlMap = _slide controlsGroupCtrl 6944;
	waitUntil {ctrlCommitted _slide};
	_ctrlMap ctrlMapSetPosition [0.31 * safeZoneW, 0.05 * safeZoneH,0.17625 * safeZoneW, 0.263333 * safeZoneH];
	_ctrlMap ctrlMapAnimAdd [0, ctrlMapScale _ctrlMap, player];
	ctrlMapAnimCommit _ctrlMap;

	private _requestList = _slide controlsGroupCtrl 6943;
	private _listPreset = _slide controlsGroupCtrl 6947;
	private _time = _slide controlsGroupCtrl 6948;
	private _distance = _slide controlsGroupCtrl 6949;
	private _assigned = _slide controlsGroupCtrl 6950;
	private _name = _slide controlsGroupCtrl 6951;
	private _position = _slide controlsGroupCtrl 6952;
	private _assignList = _slide controlsGroupCtrl 6956;

	lbClear _requestList;
	lbClear _assignList;

	_arrayMessages = getArray (missionConfigFile >> "RRP_messages" >> "messages_preset");

	{
		_listPreset lbAdd (_x select 0);
		_listPreset lbSetData [(lbSize _listPreset)-1,(_x select 1)];
	} forEach ([["Сообщение",""]] + _arrayMessages);
	
	_listPreset lbSetCurSel 0;
	_index = 0;
	{
		if (!(isNull _x) && (alive _x) && ((_x call getSide) isEqualTo (player call getSide))) then {
			_assignList lbAdd (_x call getFullname);
			_assignList lbSetData [(lbSize _assignList)-1,str(_x)];
			if (player isEqualTo _x) then {_index = ((lbSize _assignList)-1);};
		};
	} forEach playableUnits;

	_assignList lbSetCurSel _index;
	ctrlShow [6953,false];
	ctrlEnable [6954,false];
	ctrlEnable [6955,false];
	ctrlEnable [6942,false];
	ctrlShow [6940,false];
	ctrlEnable [6946,false];
	ctrlEnable [6945,false];
	ctrlEnable [6947,false];
	ctrlShow [6956,false];

	_oldVar = [];
	while {!(isNull (uiNamespace getVariable ["RRPDialogTablet",displayNull]))} do 
	{
		_newVar = [];
		if (player call getSide isEqualTo "cop") then {_newVar = RRPClient_waiting_cop_calls;};
		if (player call getSide isEqualTo "med") then {_newVar = RRPClient_waiting_med_calls;};

		_newRequests = _newVar - _oldVar;
		_removedRequest = _oldVar - _newVar;
		_oldVar = _newVar;

		if ((count _newVar) isEqualto 0) then {
			lbClear _requestList;
			_requestList lbAdd "Вызовов нет";
			_requestList lbSetData [0,"NULL"];

			_time ctrlSetText "";
			_distance ctrlSetText "";
			_assigned ctrlSetText "";
			_name ctrlSetText "";
			_position ctrlSetText "";

			ctrlEnable [6954,false];
			ctrlEnable [6955,false];
			ctrlEnable [6942,false];
			ctrlShow [6940,false];
		} else {
			{
				_type = switch (_x select 6) do 
				{
					case 0 : {"Сообщение"};
					case 1 : {"Call"};
					default {"NULL"};
				};
				_text = format ["%1 - %2",(_x select 0),_type];
				_requestList lbAdd _text;
				if ((_x select 4) isEqualto "") then {
					_requestList lbSetPicture [(lbSize _requestList)-1,"\rimas_dispatch\icons\not_assigned.paa"];
				} else {
					_requestList lbSetPicture [(lbSize _requestList)-1,"\rimas_dispatch\icons\assigned.paa"];
				};
			} forEach _newRequests;

			{
				_index = -1;
				for "_i" from 0 to (lbSize 6943)-1 do {
					if ((_oldVar select _i) isEqualTo _x) exitWith {_index = _i;};
				};

				if !(_index isEqualTo -1) then {
					_requestList lbDelete _index;

					if ((lbCurSel 6943) isEqualTo _index) then {
						_time ctrlSetText "";
						_distance ctrlSetText "";
						_assigned ctrlSetText "";
						_name ctrlSetText "";
						_position ctrlSetText "";

						ctrlEnable [6954,false];
						ctrlEnable [6955,false];
						ctrlEnable [6942,false];
						ctrlShow [6940,false];
						lbSetCurSel -1;
					};
				};
			} forEach _removedRequest;
		};
		
		uiSleep 3;
	};
};
