/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_control", "_scale", "_icon", "_color", "_position", "_iconSize", "_text", "_textSize"];
if!(RRPClientGroupInfo isEqualTo [])then
{
	_control = _this select 0;
	_scale = 10^(abs log (ctrlMapScale _control));
	{
		_icon = _x select 0;
		_color = _x select 1;
		_position = _x select 2;
		_iconSize = _x select 3;
		_text = _x select 4;
		_textSize = _x select 5;
		_iconSize = (_iconSize * 0.15) * _scale;
		_textSize = (_textSize * 0.15) * _scale;
		_control drawIcon
		[
			_icon,
			_color,
			_position,
			_iconSize,
			_iconSize,
			0,
			_text,
			1,
			_textSize,
			'RobotoCondensed',
			'right'
		];
	}
	forEach (RRPClientGroupInfo get "markers");
};	
if(!(RRPClientGroupMapIconPreviewArray isEqualTo []))then
{
	_control drawIcon
	[
		RRPClientGroupMapIconPreviewArray select 0,
		RRPClientGroupMapIconPreviewArray select 1,
		RRPClientGroupMapIconPreviewArray select 2,
		((RRPClientGroupMapIconPreviewArray select 3) *  0.15) * _scale,
		((RRPClientGroupMapIconPreviewArray select 3) *  0.15) * _scale,
		0,
		RRPClientGroupMapIconPreviewArray select 4,
		1,
		((RRPClientGroupMapIconPreviewArray select 5) *  0.15) * _scale,
		'RobotoCondensed',
		'right'
	];
};
