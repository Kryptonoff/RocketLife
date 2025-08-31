disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;

private _inviteMenu = {
	[] spawn {
		try{
			if (isNil "RRPClient_temp_waitRequest") throw "Приглашение не активно, вероятно истек его срок!";
			if (RRPClientPartyID != "") throw "Вы уже состоите в тусовке! Покиньте ее для начала!";
			private _group = groupFromNetId RRPClient_temp_waitRequest;
			[
				format ["Вы были приглашены в тусовку '%1'! Принимаете приглашение?",groupId _group],
				"Принять","Отказаться"
			] call RRPClient_tablet_showConfirm;
			waitUntil {!isNil "RRPClientTabletConfirmResult"};
			if (RRPClientTabletConfirmResult) then {
				call RRPClient_party_acceptInvite
			}else{
				call RRPClient_party_rejectInvite
			};
		}catch{
			["Тусовка",_exception] call toastError;	
		};
	};
	
};

private _manage = {
	["party_manage",1] call RRPClient_tablet_slide;
};

private _create = {
	["party_create",1] call RRPClient_tablet_slide;
};

try {
	if !(isNil "RRPClient_temp_waitRequest") throw _inviteMenu;
	if (RRPClientPartyID isNotEqualTo "") throw _manage;
	throw _create;
}catch{
	call _exception;
};
true
