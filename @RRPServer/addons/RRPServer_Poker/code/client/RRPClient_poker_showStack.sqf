/*

	Filename: 	RRPClient_poker_showStack.sqf
	Project: 	Fatum Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://altislife.extremo.club/

	kek setvariable ["pots",[[10000,[FP76561198188834837,FP76561198006439083]],[45000,[FP76561198188834837,FP76561198006439083]],[25000,[FP76561198006439083]],[80000,[FP76561198188834837]]]]
*/
params ["_player", "_pot", "_pots"];
private _display = uiNamespace getVariable ["RRPDialogPoker",displayNull];
if (isNull _display) exitWith {};

private _groupSideBank = _display displayCtrl 25600;
private _sidePotsTextCtrl = _display displayCtrl 25603;

private _currentPotText = (_display displayCtrl 25300) controlsGroupCtrl 25306;
private _currentBankText = (_display displayCtrl 25200) controlsGroupCtrl 25204;

_currentPotText ctrlSetStructuredText parseText format ["<t align='center' color='#ffffff'>Текущий банк - <t color='#72ff00'>$%1</t></t>",[_pot] call RRPClient_util_numberText];
_currentBankText ctrlSetStructuredText parseText format ["<t align='center' color='#ffffff'>Ваш стэк - <t color='#72ff00'>$%1</t></t>",[(player getVariable ["stack",0])] call RRPClient_util_numberText];

if (count _pots > 1) then {
	_groupSideBank ctrlShow true;

	private _sidePotsText = "<t align='center' color='#ffffff' size = '0.8'>";
	{
		if (_forEachIndex == 0) then {
			_sidePotsText = _sidePotsText + format["Основной банк - <t color='#72ff00'>$%1</t><br/><t underline = '1'>Участники - ",[_x select 0] call RRPClient_util_numberText];	
		} else {
			_sidePotsText = _sidePotsText + format["Побочный банк #%1 - <t color='#72ff00'>$%2</t><br/><t underline = '1'>Участники - ",_forEachIndex,[_x select 0] call RRPClient_util_numberText];	
		};
		{_sidePotsText = (_sidePotsText + (_x call getNickName) + " | ")} forEach (_x select 1);
		_sidePotsText = _sidePotsText + "<br/></t>";
	} forEach _pots;
	
	_sidePotsTextCtrl ctrlSetStructuredText parseText _sidePotsText;
} else {
	_groupSideBank ctrlShow false;
}; 
