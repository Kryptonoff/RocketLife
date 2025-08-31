/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
*/
params [
	["_owner",objNull,[objNull]],
	["_rate",0,[0]]
];

[player,"restrained"] call RRPClient_system_clearGlobalVar;
[player,"slave",true] call CBA_fnc_setVarNet;
life_slave = true;
[8] call RRPClient_session_updatePartial;

player setPosATL (getMarkerPos "cotton");

if (!isNull _owner) then {[player,_rate] remoteExecCall ["RRPClient_system_sellSlaveDone",_owner]};

[] spawn {
	while {life_slave && player getVariable ["lifeState",""] isEqualTo "HEALTHY"} do {
		if (player distance (getMarkerPos "cotton") > 70) then	{
			999999 cutText ["","PLAIN",5];
			uiSleep 5;
			player setPosATL (getMarkerPos "cotton");
			0 cutText ["","PLAIN",2];
			["InfoTitleAndText", ["Побег не лучшая идея...", "Убегать бесполезно. Солнце еще высоко...."]] call SmartClient_gui_toaster_addTemplateToast;
		};
		if (life_inv_RRP_Cotton >= 50) exitWith {
			[] spawn RRPClient_system_getoutofSlavery;
		};
		uiSleep 1;
	};
};

call RRPClient_util_stripDownPlayer;
call RRPClient_system_saveGear;
player forceAddUniform "mgsr_robe_olive_muddy";
{
missionNamespace setVariable [format ["life_inv_%1",getText(missionConfigFile >> "VirtualItems" >> configName _x >> "variable")],0];
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));
life_carryWeight = 0;


["<t align = 'center' font = 'overwatch' size = '1.6'>Рабство</t>",format ["<t align = 'center' size = '6'><img image='\RRP_icons\other\slave.paa'></img></t><br/><br/><t font = 'RobotoCondensedBold'>Что бы обрести свободу вам нужно немного поработать. Выйдите в центр поля и начните собирать хлопок. Что бы начать сбор, нажмите клавишу WIN <img image='\RRP_icons\interaction\winKey.paa' size='1.3'/>. Как только соберете нужное количество, Вас доставят на основной остров</t><br /><br /> <br />",[life_jail_coin] call RRPClient_util_numberText]] call RRPClient_system_briefingNotification;
0 cutText ["","PLAIN",5];
