/*
	Project: Smart house system
	Author: FairyTale5571
	License: CC BY-ND
*/

private _house = RRPClientSelectedHouse;
[netId _house,netId player] remoteExec ["RRPServer_house_kickMeFromHouse",2];