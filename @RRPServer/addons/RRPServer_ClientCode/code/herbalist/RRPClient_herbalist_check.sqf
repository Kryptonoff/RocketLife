/*
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/
private ['_amountHerbs','_difHerbs','_amountHerbs','_warning'];
_warning = 1;

while {true} do {
  _amountHerbs = count subArrHerbs;
  if (_amountHerbs < 10) then {
    _difHerbs = (24 - _amountHerbs);
    [_difHerbs,(InfoList select 5)] call RRPClient_herbalist_create;
  };

  if ((player distance2d (getMarkerPos ((InfoList select 4) select 0))) >  500) exitWith {
      {
        deleteVehicle (_x select 0);
        deleteMarkerLocal (_x select 1);
      } forEach subArrHerbs;
      deleteMarkerLocal (InfoList select 8);
      subArrHerbs = nil;
      InfoList    = nil;
      life_action_inUse = false;
    };

    uiSleep 10;
  };

['InfoTitleAndText', ['Травник', 'Миссия завершена!']] call SmartClient_gui_toaster_addTemplateToast;
