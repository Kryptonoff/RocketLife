/**
 * File: RRPClient_util_getBuildingInside
 * Project: Exile Point
 * Author: FairyTale5571
 * E-Mail: a3atlaslife@gmail.com
 * Site: http://forum.exilepoint.club/
 */

lineIntersectsSurfaces 
[
	getPosWorld _this,  
	getPosWorld _this vectorAdd [0, 0, 50],  
	_this, objNull, true, 1, "GEOM", "NONE" 
] select 0 params ["","","","_house"];
if !(isNil "_house") then{_house}else{objNull};
