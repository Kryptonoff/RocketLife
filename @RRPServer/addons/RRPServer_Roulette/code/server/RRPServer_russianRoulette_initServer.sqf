if (!isNil "RRPClientRouletteChairs" and {RRPClientRouletteChairs isNotEqualTo []}) then 
{
	{deleteVehicle _x} forEach RRPClientRouletteChairs;
	deleteVehicle RRPClientRouletteTable;
	RRPClientRouletteChairs = [];
	RRPClientRouletteTable = objNull;
};
RRPClientRouletteChairs = [];

RRPClientRouletteChairPositions = 
[
	[[3573.58,13171.4,4.55795],[[-0.988775,0.14941,-0.000459182],[-0.000390483,0.000489136,1]]],
	[[3575.03,13173,4.55787],[[0.149977,0.98869,-3.89239e-005],[-2.27801e-005,4.28247e-005,1]]],
	[[3573.78,13172.2,4.55794],[[-0.990257,0.139254,-0.000445012],[-0.000373814,0.000537441,1]]],
	[[3575.66,13171,4.55788],[[0.985663,-0.168727,-4.14202e-005],[3.58345e-005,-3.61502e-005,1]]],
	[[3575.81,13171.8,4.55788],[[0.985663,-0.168727,-4.14453e-005],[3.58389e-005,-3.62726e-005,1]]],
	[[3574.36,13170,4.55787],[[-0.232732,-0.972541,4.91063e-005],[3.32435e-005,4.25376e-005,1]]]
];

{
    private ["_chair"];

    _chair = "RussianRouletteChair" createVehicle (ASLToAGL(_x select 0));
	_chair setVectorDirAndUp (_x select 1);
    _chair setPosWorld (_x select 0);
    _chair allowDamage false;
    _chair enableSimulationGlobal false;

    RRPClientRouletteChairs pushBack _chair;
}
forEach RRPClientRouletteChairPositions;


private _tablePos = [3574.71,13171.5,4.98537];
private _vectors = [[0.193635,0.981074,0],[0,0,1]];

RRPClientRouletteTable = "Land_WoodenTable_large_F" createVehicle (ASLToAGL(_tablePos));
RRPClientRouletteTable setVectorDirAndUp _vectors;
RRPClientRouletteTable setPosASL _tablePos;
RRPClientRouletteTable enableSimulationGlobal false;
