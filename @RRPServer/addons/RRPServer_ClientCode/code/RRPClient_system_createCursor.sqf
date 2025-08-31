/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/
private ["_mod","_display","_cursor"];
_mod = _this;
_display = findDisplay 46;
_cursor = (_display displayCtrl 11000);

switch (_mod) do {
    case "show":{_cursor ctrlSetFade 0;_cursor ctrlCommit 0};
    case "hide":{_cursor ctrlSetFade 1;_cursor ctrlCommit 0};
    case "create":{
      if (isNull _cursor) then {
        private _cursor = _display ctrlCreate ["RscPictureKeepAspect", 11000];
        _cursor ctrlSetBackgroundColor [0.1, 0.1, 0.1,1];
        _cursor ctrlSetPosition [0.484938,0.480924,0.03,0.04];
        _cursor ctrlSetText "\RRP_icons\interaction\default.paa";
        _cursor ctrlCommit 0
      };
    };
    case "destroy":{if !(isNull _cursor) then {ctrlDelete _cursor}};
};
