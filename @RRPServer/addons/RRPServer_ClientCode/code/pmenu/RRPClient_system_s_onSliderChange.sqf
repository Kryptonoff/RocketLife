/*
	Project: 	Rimas Altis Life RPG
*/
params [
	["_mode",-1,[0]],
	"_ctrl",
	["_value",-1,[0]]
];

if (_mode isEqualTo -1 OR _value isEqualTo -1) exitWith {};
disableSerialization;

_parentGroup = ctrlParentControlsGroup _ctrl;
_valText = _parentGroup controlsGroupCtrl 1104;

switch (_mode) do {
	case 0:
	{
		life_viewDistanceFoot = round(_value);
		profileNamespace setVariable ["RRPSetting_viewDistanceFoot",round(_value)];
	};
	case 1:
	{
		life_viewDistanceCar = round(_value);
		profileNamespace setVariable ["RRPSetting_viewDistanceCar",round(_value)];
	};
	case 2:
	{
		life_viewDistanceAir = round(_value);
		profileNamespace setVariable ["RRPSetting_viewDistanceAir",round(_value)];
	};
};

_valText ctrlSetStructuredText parseText format["<t size='.8' align='left'>%1</t>",round(_value)];

call RRPClient_system_updateViewDistance;
saveProfileNamespace;
