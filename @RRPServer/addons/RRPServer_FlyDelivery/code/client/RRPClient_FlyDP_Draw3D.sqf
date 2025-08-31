
_text = format ["Доставьте груз | растояние: %1км ",parseNumber (((player distance FinishPos)/1000) toFixed 1)];	

arrowPointer setDir ((getDir arrowPointer) + 3);
drawIcon3D [
	"",
	[255, 69, 0, 0.8],
	getPos arrowPointer,
	0,
	0,
	0,
	_text,
	2,
	0.04,
	"RobotoCondensed",
	"Center",
	true
];