/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private _scroll = _this select 1;
if(_scroll > 0)then
{
	RRPCameraViewMouseZFoV = (((RRPCameraViewMouseZFoV - 0.05)min 1)max 0.05);	
}
else
{
	RRPCameraViewMouseZFoV = (((RRPCameraViewMouseZFoV + 0.05)min 1)max 0.05);
};
RRPClientCameraObject camSetFov RRPCameraViewMouseZFoV;
RRPClientCameraObject camCommit 0;
true
