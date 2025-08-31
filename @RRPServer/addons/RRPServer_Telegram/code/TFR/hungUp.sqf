
if ((PhoneTaskForceRadioCall select 0) isEqualTo netId player) then {
	[0] spawn TFAR_fnc_phoneCallEnd;
	[0] remoteExec ["TFAR_fnc_phoneCallEnd", (objectFromNetId (PhoneTaskForceRadioCall select 1))];
}else{
	if (!isNil "PhoneTaskForceRadioCall") then {			
		_typeEnd = if (isNil "PhoneTaskForceRadioFreq") then {1.1}else{0.1};
		[_typeEnd] spawn TFAR_fnc_phoneCallEnd;
	};
};