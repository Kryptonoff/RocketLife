/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/



try {
	private ["_refinery_var","_vehicle"];
	_refinery_var = lbdatarefinery;
	_vehicle = objectFromNetId (lbData[5802,lbCurSel (5802)]);
	closeDialog 0;

	private ["_refinery_control","_ref_oil"];
	_refinery_control = missionNamespace getVariable [format["%1_control", _refinery_var], objNull];
	if (isNull _refinery_control) throw "_refinery_control isNull";

	_ref_oil = _refinery_control getVariable ["ref_oil", -1];

	private ["_ref_item","_ref_item_weight"];
	_ref_item = _refinery_control getVariable ["ref_item", ""];
	_ref_item_weight = (getNumber(missionConfigFile >> "VirtualItems" >> _ref_item >> "weight"));

	if (_ref_oil isEqualTo 0) throw "Нарколаба пустая, приезжайте после бури";

	([_vehicle] call RRPClient_system_vehicleWeight) params ["_maxWeight","_curWeight"];
	private ["_maxAmountRes","_freeWeight"];
	 _freeWeight =  _maxWeight - _curWeight;
	_maxAmountRes = floor(_freeWeight/_ref_item_weight);

	if (_freeWeight < _ref_item_weight)  throw "В машине недостаточно места!";

	switch (true) do {
	    case (_ref_oil <= _maxAmountRes): {
			if ([_vehicle,_ref_item,_ref_oil,true] call RRPClient_system_vehicleInv) then {
			  [[[_ref_item,_ref_oil]],'virtual'] call RRPClient_farm_util_notificationADDitems;
			  _refinery_control setVariable ["ref_oil", 0, true];
			 [_refinery_var,netId player,0] remoteExec ["RRPServer_refinery_updateAmountItems", 2];
			} else {
				["ErrorTitleAndText", ["Ошибка!", "В машине не хватает места!"]] call SmartClient_gui_toaster_addTemplateToast;
			};
	    };
		case (_ref_oil >= _maxAmountRes): {
			private _amount = floor(_freeWeight/_ref_item_weight);
			if ([_vehicle,_ref_item,_amount,true] call RRPClient_system_vehicleInv) then {
			  [[[_ref_item,_ref_oil]],'virtual'] call RRPClient_farm_util_notificationADDitems;
			  _refinery_control setVariable ["ref_oil", _ref_oil - _amount, true];
			  [_refinery_var,netId player,_ref_oil - _amount] remoteExec ["RRPServer_refinery_updateAmountItems", 2];
			} else {
				["ErrorTitleAndText", ["Ошибка!", "В машине не хватает места!"]] call SmartClient_gui_toaster_addTemplateToast;
			}
		};
		case (_maxAmountRes <= 0): {
		    ["ErrorTitleAndText", ["Ошибка!", "В машине не хватает места!"]] call SmartClient_gui_toaster_addTemplateToast
		};
	};
} catch {
	closeDialog 0;
	["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
}
