
private["_chairNetID", "_listOfPlayers"];
_chairNetID = _this select 0;
_listOfPlayers = _this select 1;
RRPClientIsPlayingRussianRoulette = true;
RRPClientRussianRouletteNextShotIsFatal = false;
RRPClientRussianRouletteCanEscape = false;
RRPClientRussianRouletteCanFire = false;
RRPClientRussianRouletteChair = objectFromNetid _chairNetID;
if !((handGunWeapon player) isEqualTo "") then 
{
	player removeWeapon (handGunWeapon player);
};
["Exile_RouletteSitting01", true] call RRPClient_system_animDo;
player addWeapon "hgun_Pistol_heavy_02_F"; 
player selectWeapon (handGunWeapon player); 
player switchMove "Exile_RouletteSitting01";  
player disableCollisionWith RRPClientRussianRouletteChair;
player setPosASL (getPosASL RRPClientRussianRouletteChair);
player setDir ((getDir RRPClientRussianRouletteChair) + 180);   
