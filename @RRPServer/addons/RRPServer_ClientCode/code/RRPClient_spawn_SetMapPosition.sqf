/*
  Project: Rimas Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

disableSerialization;
params [
    ["_control",controlNull,[controlNull]],
    ["_time",[1,[0]]],
    ["_zoom",0.1,[0]],
    ["_position",[],[[]]]
];

if (isNull _control || _position isEqualTo []) exitWith {};

_control ctrlMapAnimAdd [_time,_zoom,_position];
ctrlMapAnimCommit _control;
