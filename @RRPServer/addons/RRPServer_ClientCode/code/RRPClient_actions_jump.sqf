/*

	Filename: 	RRPClient_actions_jump.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/

_handled = false;

if((vehicle player == player) && (isTouchingGround player) && (stance player == "STAND")) then 
{
	if((speed player > 11) && (getFatigue player < 0.6) && (isTouchingGround player)) then 
	{
		if !(missionNamespace getVariable ["life_var_jumping",false]) then 
		{
			_handled = true;
			life_var_jumping = true;
			_height = 3.5-((load player));
			_vel = velocity player;
			_ppos = getposASL player;
			player setposASL [_ppos select 0, _ppos select 1, (_ppos select 2)+0.1];
			_jh = (3.5-(loadAbs player)*0.001) max 0;
			player setVelocity [(_vel select 0), (_vel select 1), _jh];
			
			player setStamina (getStamina player)-8;
			_holding = currentWeapon player;
			["jumper",1] call RRPClient_ach_gateway;
			if (_holding == "") then {
				player playActionNow "rrp_noWeap_Jump";
			} else {
				if (_holding == (primaryWeapon player)) then {
					player playActionNow "rrp_rifle_Jump";
				} else {
					if (_holding == (handGunWeapon player)) then {
						player playActionNow "rrp_pistol_Jump";
					} else {
						if (_holding == (secondaryWeapon player)) then {
							player playActionNow "rrp_rpg_Jump";
						};
					};
				};
			};
			uiSleep 1;
			life_var_jumping = false;
		};
	};
};
