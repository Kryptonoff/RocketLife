/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _control = _this select 0;
private _partyUnits = units (group player);
if !(isMultiplayer) exitWith {};

comment "Draw party first";
{
	//if ((count (units (group player))) > getNumber(missionConfigFile >> "CfgParty" >> "maxMembers")) then {continue};
	if (isPlayer _x) then
	{
		_color = [
			profileNamespace getVariable ["PRNS_ColorNotPlayerDraw",[8/255,107/255,115/255,0.85]],
			profileNamespace getVariable ["PRNS_ColorPlayerDraw",[52/255,199/255,13/255,0.85]]
		] select (_x isEqualTo player);

		if (_x getVariable ["isBlind",false]) then {continue};
		_control drawIcon
		[
			"\A3\ui_f\data\map\VehicleIcons\iconman_ca.paa",
			_color,
			getPosWorldVisual _x,
			26,
			26,
			getDirVisual _x,
			_x call getNickName,
			1,
			profileNamespace getVariable ["PRNS_SizeTextUnits",0.06],
			"RobotoCondensed",
			"right"
		];
	};
}forEach _partyUnits;

comment "Draw org members, exclude party players";
if (count RRPClientGroupInfo isNotEqualTo 0) then
{
	private _clanMembers = RRPClientGroupInfo call RRPClient_groups_getMembers;
	{
		if (_x in _partyUnits)then {continue};
		if (_x getVariable ["isBlind",false]) then {continue};
		_control drawIcon
		[
			"\A3\ui_f\data\map\VehicleIcons\iconman_ca.paa",
			profileNamespace getVariable ["PRNS_ColorGroupPlayers",[8/255,107/255,115/255,0.85]],
			getPosWorldVisual _x,
			26,
			26,
			getDirVisual _x,
			_x call getNickName,
			1,
			profileNamespace getVariable ["PRNS_SizeTextUnits",0.06],
			"RobotoCondensed",
			"right"
		];
	};
}forEach _clanMembers;

if !(RRPClientImpulseScaned isEqualTo []) then
{
	{
		if (isPlayer _x) then
		{
			_control drawIcon
			[
				"\A3\ui_f\data\map\VehicleIcons\iconman_ca.paa",
				[222/255,15/255,15/255,0.85],
				getPosWorldVisual _x,
				26,
				26,
				getDirVisual _x,
				"",
				1,
				0.06,
				"RobotoCondensed",
				"right"
			];
		};
	}forEach RRPClientImpulseScaned;
};

if !((ctrlIDC _control) isEqualTo 101) then
{
	if !(vehicles isEqualTo []) then
	{
		{
			private _vehDBInfo = _x getVariable ["dbInfo",[]];
			if (!isNull _x && {alive _x} && {!(_vehDBInfo isEqualTo [])}) then
			{
				if ((getPlayerUID player isEqualTo (_vehDBInfo select 0)) && {(_x getVariable ["adacGPSTracker",false])}) then
				{
					_control drawIcon
					[
						"\A3\ui_f\data\map\markers\nato\c_car.paa",
						profileNamespace getVariable ["PRNS_ColorPlayerDraw",[0.85,0.85,0,0.85]],
						getPosWorldVisual _x,
						26,
						26,
						0,
						format["%1",getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName")],
						1,
						0.06,
						"RobotoCondensed",
						"right"
					];

				};
			};
		}forEach vehicles;
	};
};

if !(SmartClientWaypoints isEqualTo[]) then
{
	{
		_control drawIcon
		[
			(profileNameSpace getVariable["PRNS_WaypointPic","\a3\ui_f\data\Map\MapControl\custommark_CA.paa"]),
			(profileNameSpace getVariable["PRNS_WaypointColor", [0.5, 0.5, 0.5, 0.85]]),
			SmartClientWaypoints select _forEachIndex,
			((profileNamespace getVariable ["PRNS_WaypointSize",0.65]) * 25),
			((profileNamespace getVariable ["PRNS_WaypointSize",0.65]) * 25),
			0,
			format["%1m", floor(player distance2D _x)],
			1,
			0.06,
			"RobotoCondensed",
			"right"
		];
	}
	forEach SmartClientWaypoints;
};
call RRPClient_groups_renderLines;
call RRPClient_groups_renderIcons;
call RRPClient_groups_renderPolys;
