
private["_shotIsFatal", "_display", "_hint"];
_shotIsFatal = _this select 0;
_display = uiNameSpace getVariable ["RscExileRussianRoulette", displayNull];
_hint = _display displayCtrl 4003;
_hint ctrlSetStructuredText (parseText "<t align='center' size='2' color='#ffffff' shadow='false'>Нажмите <t color='#3fd4fc'>ПРОБЕЛ</t></t>");
_hint ctrlShow true;
RRPClientRussianRouletteNextShotIsFatal = _shotIsFatal;
RRPClientRussianRouletteCanFire = true;