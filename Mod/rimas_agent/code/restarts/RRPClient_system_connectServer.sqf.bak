
#include "\A3\Ui_f\hpp\defineResincl.inc"
params 
[
	["_IP", "127.0.0.1"], 
	["_PORT", "2302"],
	["_PASS", ""],
    ["_WAIT", 1]
];
onEachFrame format [
"
	private _allDisplays = allDisplays select 
	[
		allDisplays find findDisplay %5, 
		count allDisplays
	];
	reverse _allDisplays;
	{_x closeDisplay %4} forEach _allDisplays;
	
	onEachFrame 
	{
		findDisplay %6 closeDisplay  %4;
		findDisplay %7 closeDisplay  %4;
		onEachFrame
		{
			onEachFrame 
			{
				private _display = uiNamespace getVariable 'RscDisplayMain';
				private _ctrlGrMultiplayer = _display displayCtrl 1002;
				private _ctrlQuickPlayer = _ctrlGrMultiplayer controlsGroupCtrl 154;
				AccesConnect = true;
				ctrlActivate _ctrlQuickPlayer;

				onEachFrame 
				{
					private _display = uiNamespace getVariable 'RscDisplayMultiplayer';
					private _ctrlDirectConnect = _display displayCtrl 166;
					{ _x ctrlShow false; } forEach allControls _display;

							private _ctrlBgText = _display ctrlCreate ['RscPicture', 111902];
							_ctrlBgText ctrlSetText '\rimas_agent\texture\loading\loading_restart.jpg';
							_ctrlBgText ctrlSetPosition [safezoneX, safezoneY, safezoneW, safezoneH];
							_ctrlBgText ctrlCommit 0;

							private _ctrlText = _display ctrlCreate ['RscStructuredText', 111903];
							_ctrlText ctrlSetStructuredText parseText 'Инициализация';
							private _h = ctrlTextHeight _ctrlText;
							_ctrlText ctrlSetPosition [safezoneX, safezoneY + safezoneH * .8 - (_h/2), safezoneW, _h];
							_ctrlText ctrlCommit 0;

							sr_time = diag_tickTime;

					ctrlActivate _ctrlDirectConnect;

					onEachFrame 
					{
						private _display = uiNamespace getVariable ['RscDisplayIPAddress', displayNull];
						private _ctrlGrConnect = _display displayCtrl 2300;
						private _ctrlEditIp = _ctrlGrConnect controlsGroupCtrl 101;
						private _ctrlEditPort = _ctrlGrConnect controlsGroupCtrl 102;
						private _ctrlBtnOk = _ctrlGrConnect controlsGroupCtrl 1;

						_ctrlEditIp ctrlSetText '%1';
						_ctrlEditPort ctrlSetText '%2';
						ctrlActivate _ctrlBtnOk;

						onEachFrame {
							private _display = uiNamespace getVariable 'RscDisplayMultiplayer';
							private _ctrlList = _display displayCtrl 102;
							private _ctrlBtnJoin = _display displayCtrl 105;
							private _ctrlText = _display displayCtrl 111903;
							_ctrlText ctrlSetStructuredText parseText ('<t align=''center''>Нажмите ESC чтобы отменить подключение к серверу<br/>Ждем сервер ' + ((diag_tickTime - sr_time) toFixed 2) + '</t>');

							_display displayAddEventHandler ['KeyDown', {
								params ['_display', '_key', '_shift', '_ctrl', '_alt'];
								if (_key isEqualTo 1) then {[] call compile preprocessfilelinenumbers '\rimas_agent\code\restarts\servDisconect.sqf';};
							}];

							private _ipPort = '%1:%2';
							if ((_ctrlList lbData 0) isEqualTo _ipPort AND (diag_tickTime-sr_time) > %8) exitWith {
								_ctrlList lbSetCurSel 0;
								onEachFrame {
									_display = uiNamespace getVariable 'RscDisplayMultiplayer';
									private _ctrlBtnJoin = _display displayCtrl 105;
									ctrlActivate _ctrlBtnJoin;

									(_display displayCtrl 111903) ctrlSetStructuredText parseText ('<t align=''center''>Нажмите ESC чтобы продолжить...</t>');

									AccesConnect = nil;
									onEachFrame {};
								};
							};
						};
					};
				};
			};
		};
	};
", _IP, _PORT, _PASS, IDC_CANCEL, IDD_MISSION, IDD_DEBRIEFING, IDD_MP_SETUP, _WAIT];
