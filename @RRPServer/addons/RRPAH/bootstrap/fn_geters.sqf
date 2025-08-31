
{
	_x call RRPServer_util_clientCompile
} forEach [
	["addXP",{
		_this call RRPClient_perks_addXP
	}],
	["perk",{
		_this call RRPClient_perks_hasPerk
	}],
	["chat",{
		_this call RRPClient_gui_chat
	}],
	["condition", {
		_this call RRPClient_util_conditionsCheck
	}],
	["sendDs",{
		_this remoteExecCall ["DiscordEmbedBuilder_fnc_buildSqf",2];
	}],
	["getLocation",{
		_this call mav_taxi_fnc_nearestLocation
	}],
	["hints",{
		_this call RRPClient_gui_hint
	}],
	// Toasts
	["toast",{
		_this call SmartClient_gui_toaster_addTemplateToast
	}],
	["toastSuccess",{
		params[
			["_title",""],
			["_msg",""]
		];
		["SuccessTitleAndText",[_title,_msg]] call SmartClient_gui_toaster_addTemplateToast
	}],
	["toastWarning",{
		params[
			["_title",""],
			["_msg",""]
		];
		["WarningTitleAndText",[_title,_msg]] call SmartClient_gui_toaster_addTemplateToast
	}],
	["toastInfo",{
		params[
			["_title",""],
			["_msg",""]
		];
		["InfoTitleAndText",[_title,_msg]] call SmartClient_gui_toaster_addTemplateToast
	}],
	["toastError",{
		params[
			["_title",""],
			["_msg",""]
		];
		["ErrorTitleAndText",[_title,_msg]] call SmartClient_gui_toaster_addTemplateToast
	}],

	// Names
	["getFullName",{
		_unit = _this;
		private _string = _unit getVariable ["name_surname",[
			(selectRandom([getArray(getMissionConfig "CfgCharCreate" >> "defaultNames")] call CBA_fnc_shuffle)),
			(selectRandom([getArray(getMissionConfig "CfgCharCreate" >> "defaultSurNames")] call CBA_fnc_shuffle))
		]];
		_string joinString " ";
	}],
	["getSurName",{
		_unit = _this;
		private _string = _unit getVariable ["name_surname",[
			(selectRandom([getArray(getMissionConfig "CfgCharCreate" >> "defaultNames")] call CBA_fnc_shuffle)),
			(selectRandom([getArray(getMissionConfig "CfgCharCreate" >> "defaultSurNames")] call CBA_fnc_shuffle))
		]];
		_string # 1
	}],
	["getName",{
		_unit = _this;
		private _string = _unit getVariable ["name_surname",[
			(selectRandom([getArray(getMissionConfig "CfgCharCreate" >> "defaultNames")] call CBA_fnc_shuffle)),
			(selectRandom([getArray(getMissionConfig "CfgCharCreate" >> "defaultSurNames")] call CBA_fnc_shuffle))
		]];
		_string # 0
	}],
	["getNickName",{
		_unit = _this;
		_unit getVariable ["nickname",(selectRandom([getArray(getMissionConfig "CfgCharCreate" >> "defaultNickNames")] call CBA_fnc_shuffle))]
	}],
	["getNickFullName",{
		_unit = _this;
		format ["%1 ""%3"" %2",_unit call getName,_unit call getSurName,_unit call getNickName];
	}]
];
