params ["_ctrl","_code","_shift","_ctrlKey","_alt"];
if !(player getVariable ["lifeState",""] isEqualTo "INCAPACITATED") exitWith {false};

private _handled = false;
private _medicReqKey = (actionKeys "ShowMap") select 0;
private _deathKey = 19;
private _resKey = 35;
if (_code in (actionKeys "personView")) exitWith {true};

if (player getVariable ["RRPVariablePartyMeatActive",false]) then {
	if (_code isEqualTo _deathKey AND missionNamespace getVariable ["RRPClientPartyRespawn",false]) then {
		[] spawn RRPClient_partymeat_respawn;
	};

	if (_code isEqualTo _medicReqKey AND missionNamespace getVariable ["RRPClientPartyRespawn",false]) then {
		[] spawn RRPClient_partymeat_endGame;
	};
} else {
	switch (true) do {

		case (_code isEqualTo _medicReqKey): {
			_handled = true;
			[player] call RRPClient_system_requestMedic;
		};

		case (_code isEqualTo _deathKey): {
			if (life_deathScreen_canRespawn) then {
			_handled = true;
			[player] call RRPClient_dmg_dieInAgony;
			};
		};

		case (_code isEqualTo _resKey): {
			if ((call life_adminlevel) > 2) then {
			_handled = true;
			[player] spawn RRPClient_system_revived;
			};
		};

		case (_code isEqualTo 74): {
			if(_shift) then {
				_handled = true;
				["SHIFTMINUS",format["%1 (%2) use shift minus endmission in AGONY",player getVariable ["realname",""],getPlayerUID player]] remoteExecCall ["TON_fnc_customLog",2 ];
				[] spawn {
					disableUserInput true;
					uiSleep 15;
					disableUserInput false;
				};
			};
		};
	};
};



_handled
