/*
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/
private ['_position','_object','_marker','_amount','_radius','_zone','_className','_index'];

_amount    = _this select 0;
_className = _this select 1;
_radius = ((InfoList select 4) select 1);
_zone   = ((InfoList select 4) select 0);
if (isNil 'subArrHerbs') then {
  subArrHerbs = [];
};

for '_i' from 1 to _amount do {
  _index = (floor random 999999);
  _position = [(markerPos _zone), 20, _Radius, 3, 0, 20, 0] call BIS_fnc_findSafePos;

  _object = _className createVehicleLocal _position;
  _object setVectorUp [0,0,1];

  _marker = createMarkerLocal [format['herbs_marker_%1',_index],getpos _object];
  _marker setMarkerSizeLocal [0.7, 0.7];
  _marker setMarkerTypeLocal 'welmen_loh_herbs';
  subArrHerbs pushBack [_object,_marker];
};
['successTitleAndText', ['Травник UPD', 'Откройте карту для того что-бы узнать где находятся растения']] call SmartClient_gui_toaster_addTemplateToast;
