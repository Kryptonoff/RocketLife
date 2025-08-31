/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
if (diag_tickTime - RRPClientLastDrawParty >= 0.01) then 
{
    RRPClientLastDrawParty = diag_tickTime;

	private _display = findDisplay 46;
	private _textColor = [(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0]),(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1]),(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1]),(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])];
	(_display getVariable ["groupBarCtrlInfo",[]]) params ['_ctrls','_ctrlsName','_ctrlsPic','_ctrlsHealthBar'];
	maximumSize = count _ctrls;
	private _membersGroup = _display displayCtrl 252200;
	if (isNull _membersGroup) exitWith {};
	if ((headgear player) in ["extItem_headBag"]) then
	{
		_membersGroup ctrlSetFade 1;
		_membersGroup ctrlCommit 0;
	}else {
		_membersGroup ctrlSetFade 0;
		_membersGroup ctrlCommit 0;
	};

	private _nearGroupUnitsNew = [(units (group player))] call RRPClient_party_util_findNearUnits;
	private _nearGroupUnitsNewDamage = _nearGroupUnitsNew apply {[_x] call RRPClient_party_util_getDamageInfo};
	private _nearGroupUnitsNewRole = _nearGroupUnitsNew apply {[_x] call RRPClient_party_util_getRoleInVehicle};
	_oldGroupLeader = leader group player;
	if (
		!(nearGroupUnitsOld isEqualTo _nearGroupUnitsNew) || 
		{!(nearGroupUnitsOldDamage isEqualTo _nearGroupUnitsNewDamage)} || 
		{!(nearGroupUnitsOldRole isEqualTo _nearGroupUnitsNewRole)} || 
		{!(oldGroupLeader isEqualTo (leader group player))} 
	) then {
		nearGroupUnitsOld = +_nearGroupUnitsNew;
		nearGroupUnitsOldDamage = +_nearGroupUnitsNewDamage;
		nearGroupUnitsOldRole = +_nearGroupUnitsNewRole;
		oldGroupLeader = leader group player;
		{
			private _damageP = _nearGroupUnitsNewDamage select _forEachIndex;
			private _color = switch (true) do
			{
				case (_damageP > 0.5): {[1,1,1,1]};
				case ((_damageP <= 0.5) AND {(_damageP >= 0.25)}): {[1,0.35,0,1]};
				case (_damageP < 0.25): {[1,0,0,1]};
			};
			private _tempCtrl = (_ctrlsHealthBar select _forEachIndex);
			_tempCtrl ctrlSetTextColor _color;
			_tempCtrl progressSetPosition _damageP;

			private _tempIndex = _nearGroupUnitsNewRole select _forEachIndex;
			private _pic = switch (true) do
			{
				case (_damageP <= 0):
				{
					"\A3\ui_f\data\igui\rscingameui\rscunitinfo\icon_cross_ca.paa"
				};
				case (_tempIndex > -1):
				{
					(getArray(missionConfigFile >> "CfgParty" >> "iconsArray")) select (_nearGroupUnitsNewRole select _forEachIndex);
				};
				default {""};
			};
			(_ctrlsPic select _forEachIndex) ctrlSetText _pic;
			if (_damageP <= 0) then
			{
				(_ctrlsPic select _forEachIndex) ctrlSetTextColor [1,0,0,1];
			} else {
				(_ctrlsPic select _forEachIndex) ctrlSetTextColor _textColor;
			};
			_nameText = _x call getNickName;

			_text = [
				_nameText,
				(format ["<img image='\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\mp_serverlike_ca.paa'/> %1",_nameText])
			] select ((leader group player) isEqualTo _x);
			
			[(_ctrlsName select _forEachIndex),_text] call RRPClient_gui_util_updateStructuredText;
			(_ctrls select _forEachIndex) ctrlSetFade 0;
		} forEach _nearGroupUnitsNew;

		for "_i" from (count _nearGroupUnitsNew) to (maximumSize - 1) do {(_ctrls select _i) ctrlSetFade 1};

		{_x ctrlCommit 0} forEach _ctrls;
	};
};