_display = uiNamespace getVariable ["RRPDialogPoker",displayNull];
_groupPlayers = _display displayCtrl 25500;
_playerText = _groupPlayers controlsGroupCtrl 25501;
_background = _groupPlayers controlsGroupCtrl 25502;
_playerText ctrlSetStructuredText parseText ("<t color='#00EBFC' font='RobotoCondensedLight' size='1.5'>Игроки</t>")
