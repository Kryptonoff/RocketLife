/*
    Author(s):
    Arrra (original)
    ----
    Сontacts:
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd
*/
{
  if (_x in (missionNamespace getVariable [_this,[]])) then {
    _x ctrlSetFade 0;
    _x ctrlEnable true;
    _x ctrlCommit 0;
  } else {
    _x ctrlSetFade 1;
    _x ctrlEnable false;
    _x ctrlCommit 0;
  };
} forEach (statusCtrls + vInvCtrls);
missionNameSpace setVariable ['extInv_tabe',_this];