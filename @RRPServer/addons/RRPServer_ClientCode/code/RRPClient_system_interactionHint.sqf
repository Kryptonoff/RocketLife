/*
    Author(s)
    Arrra (original)
    ----
    Сontacts
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
    ----
    License
    cc by-nc-nd
    ----
    Description:

*/

private ["_control","_nameObject"];
_control = findDisplay 46 ctrlCreate ["RRP_RscStructuredText", -1];
_control ctrlSetPosition [0.54125,0.755,0.952656,0.044];
_control ctrlSetStructuredText parseText "<t font='Overwatch' shadow='1' size='1.1'>Нажмите <img image='\RRP_icons\interaction\winKey.paa' size='1.3'/> для взаимодействия</t>";
_control ctrlSetFade 1;
_control ctrlCommit 0;

while {true} do {
  _nameObject = typeOf cursorObject;
  if( !(dialog) and !life_action_InUse and (player distance cursorObject) < 5) then {
    if (_nameObject in (getArray(missionConfigFile >> "LifeCfgSettings" >> "interactionObjects"))) then {
       _control ctrlSetFade 0;
       _control ctrlCommit 0.5;
    } else {
      _control ctrlSetFade 1;
      _control ctrlCommit 0.5;
    };
  } else { 
    _control ctrlSetFade 1;
    _control ctrlCommit 0.5;
    };
  uisleep 0.35;
};
