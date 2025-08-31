/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/

private ["_bool","_condition","_trunk"];

try{
	_trunk = curTarget;
	_owner = _trunk getVariable ["t_owner","-1"];
	if (_owner isEqualTo "-1") then {
		_condition = getText(missionConfigFile >> "LifeCfgTrunks" >> vehicleVarName _trunk >> "conditions");
		if !([_condition] call condition) throw "У вас нет доступа к этому хранилищу!";
	}else{
		private _members = _trunk getVariable ["members",[]];
		private _uid = getPlayerUID player;
		if (_owner isNotEqualTo _uid && {!(_uid in _members)}) throw "У вас нет доступа к этому хранилищу!";
	};

	if (_trunk getVariable ["locked",false]) then 
	{
		_trunk setVariable ["locked",nil,true];
		[_trunk,"locked"] call RRPClient_system_clearGlobalVar;
		if ((typeOf _trunk) isEqualto "Metal_Locker_F") then {if ((_trunk animationPhase 'Metal_Locker_Rotation') < 0.5) then {_trunk animate ["Metal_Locker_Rotation", 1]}};
		["Ящик", "Хранилище открыто!"] call toastSuccess;
	} else {
		_trunk setVariable ["locked",true,true];
		if ((typeOf _trunk) isEqualto "Metal_Locker_F") then {if ((_trunk animationPhase 'Metal_Locker_Rotation') >= 0.5) then {_trunk animate ["Metal_Locker_Rotation", 0]}};
		["Ящик", "Хранилище закрыто!"] call toastSuccess;
	};	
}catch{
	["Ящик",_exception] call toastError;
};
true
