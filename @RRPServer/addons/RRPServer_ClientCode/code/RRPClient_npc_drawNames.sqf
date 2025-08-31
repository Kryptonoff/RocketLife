
_drawRadius = 15;
_nearNpc = ((cameraOn nearEntities[['RRP_NPC_Abstract'], _drawRadius]) - [cameraOn, vehicle cameraOn]);
{
	_c = profileNamespace getVariable ["PRNS_TagsColors",[1, 0, 0.27, 1]];
	_distanceForPlayer = player distance2D _x;
	_pos = _x modelToWorldVisual (_x selectionPosition "head");
	_scale = 1 + (( 0.7 /_drawRadius) * _distanceForPlayer);
	if (_distanceForPlayer < 7) then {
	drawIcon3D [
		_x getVariable ["NPC_Icon",""],
		[1,1,1,((_c select 3 + 0.35) -( (1 / _drawRadius) * _distanceForPlayer))],
		[(_pos select 0),(_pos select 1),((_pos select 2) + 0.5)],1/_scale,1/_scale,0,
		_x getVariable ["NPC_Name","Неизвестный Житель"],
	2,0.038/_scale,"RobotoCondensedLight","center",false];
	};
}forEach _nearNpc;
