/*
	Project: Aurora Role Play 
	Author: FairyTale#5571
	License:: CC BY-ND 

	Usage: Вызывать только вручную, при закрытом сервере или обосреться по полной
*/

private ["_changed","_toChange"];
{
	_changed = _x select 0;
	_toChange = _x select 1;
	format ["replaceItemsDB:%1:%2",_toChange,_changed] call RRPServer_DB_fireAndForget;
}forEach 
[
  ["CN_BTR60","RRPVehicle_BTR90_CostraNostra"],
  ["PH_BTR60","RRPVehicle_BTR90_Phoenix"],
  ["RRPVehicle_BTR60_Pirates","RRPVehicle_BTR90_Pirates"],
  ["S7_BTR60","RRPVehicle_BTR90_Sector7"],
  ["IMPERIUM_BTR60","RRPVehicle_BTR90_IMPERIUM"],
  ["Pirates_BTR60","RRPVehicle_BTR90_Pirates"],
  ["SOPRANO_BTR60","RRPVehicle_BTR90_Soprano"],
  ["BS_BTR60","RRPVehicle_BTR90_BlackSnow"],
 
  ["CN_BRDM","RRPVehicle_BTR90_CostraNostra"],
  ["Pirates_BRDM","RRPVehicle_BTR90_Pirates"],
  ["PHEONIX_BRDM","RRPVehicle_BTR90_Phoenix"],
  ["imperium_BRDM","RRPVehicle_BTR90_IMPERIUM"],
  ["BRDM_cigane","RRPVehicle_BTR90_Cigane"],
  ["BRDM_Sector","RRPVehicle_BTR90_Sector7"]
];
"все предметы заменены" call RRPServer_util_debugConsole;
