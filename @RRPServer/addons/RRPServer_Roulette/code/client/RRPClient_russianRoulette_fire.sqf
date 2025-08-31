
private["_display", "_hint", "_sounds", "_direction"];
disableSerialization;
RRPClientRussianRouletteCanFire = false;
_display = uiNameSpace getVariable ["RscExileRussianRoulette", displayNull];
_hint = _display displayCtrl 4003;
_hint ctrlShow false;
if (RRPClientRussianRouletteNextShotIsFatal) then 
{
	player playActionNow "GestureExileSuicide01";   
	uiSleep 4.4;   
	_sounds =  
	[ 
		"A3\Sounds_F\arsenal\weapons\Pistols\Zubr\Zubr_short_01.wss", 
		"A3\Sounds_F\arsenal\weapons\Pistols\Zubr\Zubr_short_02.wss", 
		"A3\Sounds_F\arsenal\weapons\Pistols\Zubr\Zubr_short_03.wss" 
	]; 
	playSound3D [selectRandom _sounds, player, true];
	player attachTo [RRPClientRussianRouletteChair, [0, 0, 0]];
	player setDir 180; 
	RRPClientRussianRouletteChair setCenterOfMass [[0, 0, 1], 0]; 
	RRPClientRussianRouletteChair setMass 4;  
	_direction = (getDir RRPClientRussianRouletteChair) + 90;    
	RRPClientRussianRouletteChair setVelocity [(sin _direction) * 4, (cos _direction) * 4, 0];   
	uiSleep 0.75;   
	player enableCollisionWith RRPClientRussianRouletteChair;    
	RRPClientRussianRouletteChair enableCollisionWith player;    
	detach player;
	player removeWeapon (handGunWeapon player);
	[player,player,player] call RRPClient_dmg_Agony;
}
else 
{
	player playActionNow "GestureExileSuicide01";   
	uiSleep 4.4;   
	playSound3D ["A3\Sounds_F\arsenal\weapons\Pistols\Zubr\dry_Zubr.wss", player, true];  
	uiSleep 0.25;   
	player playActionNow "GestureExileSuicideCancel01";   
	[SessionId] remoteExecCall ["RRPServer_russianRoulette_fireRussianRouletteRevolverResponse",2];
};
