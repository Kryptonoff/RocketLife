private _netId = param [0,"",[""]];
if (_netId isEqualTo "") exitWith {};
(objectFromNetId _netId) setOwner 2;
