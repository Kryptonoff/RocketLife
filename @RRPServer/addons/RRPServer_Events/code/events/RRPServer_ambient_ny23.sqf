// Export of 'NewYearFomka.RRpMap' by Fairy Tale on v0.9

///////////////////////////////////////////////////////////////////////////////////////////
// Init
params [["_layerWhiteList",[],[[]]],["_layerBlacklist",[],[[]]],["_posCenter",[0,0,0],[[]]],["_dir",0,[0]],["_idBlacklist",[],[[]]]];
private _allWhitelisted = _layerWhiteList isEqualTo [];
private _layerRoot = (_allWhitelisted || {true in _layerWhiteList}) && {!(true in _layerBlackList)};


///////////////////////////////////////////////////////////////////////////////////////////
// Markers
private _markers = [];
private _markerIDs = [];


///////////////////////////////////////////////////////////////////////////////////////////
// Groups
private _groups = [];
private _groupIDs = [];


///////////////////////////////////////////////////////////////////////////////////////////
// Objects
private _objects = [];
private _objectIDs = [];

private _item432 = objNull;
if (_layerRoot) then {
	_item432 = createVehicle ["Christmas_Whole_Tree",[3637.81,13182.3,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item432;
	_objects pushback _this;
	_objectIDs pushback 432;
	_this setPosWorld [3637.81,13182.3,4.94584];
	_this setVectorDirAndUp [[0,1,0],[-0.00154408,0,0.999999]];
};

private _item433 = objNull;
if (_layerRoot) then {
	_item433 = createVehicle ["Christmas_Whole_Tree",[3636.64,13169.9,0],[],0,"CAN_COLLIDE"];
	_this = _item433;
	_objects pushback _this;
	_objectIDs pushback 433;
	_this setPosWorld [3636.64,13169.9,4.94529];
	_this setVectorDirAndUp [[0,1,-0.000845728],[0,0.000845728,1]];
};

private _item434 = objNull;
if (_layerRoot) then {
	_item434 = createVehicle ["Christmas_Whole_Tree",[3636.15,13165.1,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item434;
	_objects pushback _this;
	_objectIDs pushback 434;
	_this setPosWorld [3636.15,13165.1,4.94961];
	_this setVectorDirAndUp [[0,1,-0.000845728],[0,0.000845728,1]];
};

private _item435 = objNull;
if (_layerRoot) then {
	_item435 = createVehicle ["Christmas_Whole_Tree",[3635.21,13159.1,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item435;
	_objects pushback _this;
	_objectIDs pushback 435;
	_this setPosWorld [3635.22,13159.1,4.96649];
	_this setVectorDirAndUp [[0,0.999995,-0.00325724],[0.00158197,0.00325723,0.999993]];
};

private _item436 = objNull;
if (_layerRoot) then {
	_item436 = createVehicle ["Christmas_Whole_Tree",[3635.44,13143.5,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item436;
	_objects pushback _this;
	_objectIDs pushback 436;
	_this setPosWorld [3635.44,13143.5,4.96875];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item437 = objNull;
if (_layerRoot) then {
	_item437 = createVehicle ["Christmas_Whole_Tree",[3630.56,13144.4,0],[],0,"CAN_COLLIDE"];
	_this = _item437;
	_objects pushback _this;
	_objectIDs pushback 437;
	_this setPosWorld [3630.56,13144.4,4.96886];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item438 = objNull;
if (_layerRoot) then {
	_item438 = createVehicle ["Christmas_Whole_Tree",[3634.85,13147.5,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item438;
	_objects pushback _this;
	_objectIDs pushback 438;
	_this setPosWorld [3634.85,13147.5,4.9687];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item439 = objNull;
if (_layerRoot) then {
	_item439 = createVehicle ["Christmas_Whole_Tree",[3675.96,13213.4,0],[],0,"CAN_COLLIDE"];
	_this = _item439;
	_objects pushback _this;
	_objectIDs pushback 439;
	_this setPosWorld [3675.96,13213.4,5.08716];
	_this setVectorDirAndUp [[0,1,-0.00091349],[-0.00401163,0.000913483,0.999992]];
};

private _item440 = objNull;
if (_layerRoot) then {
	_item440 = createVehicle ["Christmas_Whole_Tree",[3669.04,13217.5,0],[],0,"CAN_COLLIDE"];
	_this = _item440;
	_objects pushback _this;
	_objectIDs pushback 440;
	_this setPosWorld [3669.04,13217.5,5.04301];
	_this setVectorDirAndUp [[0,0.999995,0.00312644],[-0.00780481,-0.00312635,0.999965]];
};

private _item441 = objNull;
if (_layerRoot) then {
	_item441 = createVehicle ["Christmas_Whole_Tree",[3667.1,13209,-4.05312e-005],[],0,"CAN_COLLIDE"];
	_this = _item441;
	_objects pushback _this;
	_objectIDs pushback 441;
	_this setPosWorld [3667.1,13209,5.02203];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item442 = objNull;
if (_layerRoot) then {
	_item442 = createVehicle ["Christmas_Whole_Tree",[3647.24,13197.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item442;
	_objects pushback _this;
	_objectIDs pushback 442;
	_this setPosWorld [3647.24,13197.3,4.94559];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item445 = objNull;
if (_layerRoot) then {
	_item445 = createVehicle ["sapin",[3651.98,13196.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item445;
	_objects pushback _this;
	_objectIDs pushback 445;
	_this setPosWorld [3651.98,13196.1,7.9771];
	_this setVectorDirAndUp [[0,0.999952,0.00974718],[-0.00985058,-0.0097467,0.999904]];
};

private _item446 = objNull;
if (_layerRoot) then {
	_item446 = createVehicle ["sapin",[3671.36,13212.8,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item446;
	_objects pushback _this;
	_objectIDs pushback 446;
	_this setPosWorld [3671.36,13212.8,8.05625];
	_this setVectorDirAndUp [[0,1,-0.00091349],[-0.00780481,0.000913463,0.999969]];
};

private _item447 = objNull;
if (_layerRoot) then {
	_item447 = createVehicle ["sapin",[3579.92,13253.5,0],[],0,"CAN_COLLIDE"];
	_this = _item447;
	_objects pushback _this;
	_objectIDs pushback 447;
	_this setPosWorld [3579.92,13253.5,7.46001];
	_this setVectorDirAndUp [[0,0.998491,0.0549134],[-0.144528,-0.0543368,0.988008]];
};

private _item448 = objNull;
if (_layerRoot) then {
	_item448 = createVehicle ["sapin",[3606.01,13148.6,0],[],0,"CAN_COLLIDE"];
	_this = _item448;
	_objects pushback _this;
	_objectIDs pushback 448;
	_this setPosWorld [3606.01,13148.6,7.98343];
	_this setVectorDirAndUp [[0,0.99997,0.00774311],[0,-0.00774311,0.99997]];
};

private _item449 = objNull;
if (_layerRoot) then {
	_item449 = createVehicle ["sapin",[3593.83,13150.8,0],[],0,"CAN_COLLIDE"];
	_this = _item449;
	_objects pushback _this;
	_objectIDs pushback 449;
	_this setPosWorld [3593.83,13150.8,8.00886];
	_this setVectorDirAndUp [[0,0.999931,0.0117236],[-0.000488281,-0.0117236,0.999931]];
};

private _item450 = objNull;
if (_layerRoot) then {
	_item450 = createVehicle ["sapin",[3563.99,13160.6,0],[],0,"CAN_COLLIDE"];
	_this = _item450;
	_objects pushback _this;
	_objectIDs pushback 450;
	_this setPosWorld [3563.99,13160.6,7.97015];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item451 = objNull;
if (_layerRoot) then {
	_item451 = createVehicle ["sapin",[3544.11,13165,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item451;
	_objects pushback _this;
	_objectIDs pushback 451;
	_this setPosWorld [3544.11,13165,7.97079];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item452 = objNull;
if (_layerRoot) then {
	_item452 = createVehicle ["sapin",[3524.2,13144.2,0],[],0,"CAN_COLLIDE"];
	_this = _item452;
	_objects pushback _this;
	_objectIDs pushback 452;
	_this setPosWorld [3524.2,13144.2,8.201];
	_this setVectorDirAndUp [[0,0.999986,-0.0053265],[0.0109287,0.00532618,0.999926]];
};

private _item453 = objNull;
if (_layerRoot) then {
	_item453 = createVehicle ["sapin",[3533.95,13155.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item453;
	_objects pushback _this;
	_objectIDs pushback 453;
	_this setPosWorld [3533.95,13155.1,7.97032];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item454 = objNull;
if (_layerRoot) then {
	_item454 = createVehicle ["sapin",[3535.96,13131.3,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item454;
	_objects pushback _this;
	_objectIDs pushback 454;
	_this setPosWorld [3535.96,13131.3,8.19927];
	_this setVectorDirAndUp [[0,1,-0.000845728],[0.00444822,0.000845719,0.99999]];
};

private _item455 = objNull;
if (_layerRoot) then {
	_item455 = createVehicle ["sapin",[3544.57,13122.4,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item455;
	_objects pushback _this;
	_objectIDs pushback 455;
	_this setPosWorld [3544.57,13122.4,8.1184];
	_this setVectorDirAndUp [[0,1,0],[0.0149576,0,0.999888]];
};

private _item456 = objNull;
if (_layerRoot) then {
	_item456 = createVehicle ["sapin",[3600.76,13116.9,0],[],0,"CAN_COLLIDE"];
	_this = _item456;
	_objects pushback _this;
	_objectIDs pushback 456;
	_this setPosWorld [3600.76,13116.9,7.98168];
	_this setVectorDirAndUp [[0,0.999982,0.00594023],[0.00276214,-0.0059402,0.999979]];
};

private _item457 = objNull;
if (_layerRoot) then {
	_item457 = createVehicle ["sapin",[3589.15,13119.5,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item457;
	_objects pushback _this;
	_objectIDs pushback 457;
	_this setPosWorld [3589.15,13119.5,8.01308];
	_this setVectorDirAndUp [[0,0.999968,-0.00797852],[0.0171065,0.00797735,0.999822]];
};

private _item458 = objNull;
if (_layerRoot) then {
	_item458 = createVehicle ["sapin",[3563.13,13121.6,0],[],0,"CAN_COLLIDE"];
	_this = _item458;
	_objects pushback _this;
	_objectIDs pushback 458;
	_this setPosWorld [3563.13,13121.6,8.0747];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item459 = objNull;
if (_layerRoot) then {
	_item459 = createVehicle ["sapin",[3727.64,12971.3,0],[],0,"CAN_COLLIDE"];
	_this = _item459;
	_objects pushback _this;
	_objectIDs pushback 459;
	_this setPosWorld [3727.64,12971.3,12.0744];
	_this setVectorDirAndUp [[0,0.999999,0.00146467],[-0.00367023,-0.00146466,0.999992]];
};

private _item460 = objNull;
if (_layerRoot) then {
	_item460 = createVehicle ["sapin",[3727.52,12982.3,0],[],0,"CAN_COLLIDE"];
	_this = _item460;
	_objects pushback _this;
	_objectIDs pushback 460;
	_this setPosWorld [3727.52,12982.3,12.0745];
	_this setVectorDirAndUp [[0,1,-0.00059802],[0.0278592,0.000597788,0.999612]];
};

private _item461 = objNull;
if (_layerRoot) then {
	_item461 = createVehicle ["sapin",[3527.04,12993.4,0],[],0,"CAN_COLLIDE"];
	_this = _item461;
	_objects pushback _this;
	_objectIDs pushback 461;
	_this setPosWorld [3527.04,12993.4,12.2802];
	_this setVectorDirAndUp [[0,0.999995,-0.00304931],[-0.0169632,0.00304887,0.999851]];
};

private _item462 = objNull;
if (_layerRoot) then {
	_item462 = createVehicle ["sapin",[3786.65,13024.6,0],[],0,"CAN_COLLIDE"];
	_this = _item462;
	_objects pushback _this;
	_objectIDs pushback 462;
	_this setPosWorld [3786.65,13024.6,12.0897];
	_this setVectorDirAndUp [[-0.999726,0.0234168,0],[0,0,1]];
};

private _item464 = objNull;
if (_layerRoot) then {
	_item464 = createVehicle ["sapin",[3561.27,13103.1,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item464;
	_objects pushback _this;
	_objectIDs pushback 464;
	_this setPosWorld [3561.27,13103.1,8.0746];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item465 = objNull;
if (_layerRoot) then {
	_item465 = createVehicle ["sapin",[3581.03,13048.9,0],[],0,"CAN_COLLIDE"];
	_this = _item465;
	_objects pushback _this;
	_objectIDs pushback 465;
	_this setPosWorld [3581.03,13048.9,8.09611];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item466 = objNull;
if (_layerRoot) then {
	_item466 = createVehicle ["sapin",[3556.69,12983.6,0],[],0,"CAN_COLLIDE"];
	_this = _item466;
	_objects pushback _this;
	_objectIDs pushback 466;
	_this setPosWorld [3556.69,12983.6,12.8295];
	_this setVectorDirAndUp [[0,0.993574,-0.113182],[0.00734019,0.113179,0.993548]];
};

private _item467 = objNull;
if (_layerRoot) then {
	_item467 = createVehicle ["sapin",[3566.55,13002.3,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item467;
	_objects pushback _this;
	_objectIDs pushback 467;
	_this setPosWorld [3566.55,13002.3,10.2844];
	_this setVectorDirAndUp [[0,0.992062,-0.125751],[0.0768245,0.125379,0.98913]];
};

private _item468 = objNull;
if (_layerRoot) then {
	_item468 = createVehicle ["sapin",[3534.92,13034.6,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item468;
	_objects pushback _this;
	_objectIDs pushback 468;
	_this setPosWorld [3534.92,13034.6,9.91395];
	_this setVectorDirAndUp [[0,0.997519,-0.0704026],[0.0864853,0.0701388,0.993781]];
};

private _item469 = objNull;
if (_layerRoot) then {
	_item469 = createVehicle ["sapin",[3489.3,13148.7,0],[],0,"CAN_COLLIDE"];
	_this = _item469;
	_objects pushback _this;
	_objectIDs pushback 469;
	_this setPosWorld [3489.3,13148.7,8.73501];
	_this setVectorDirAndUp [[0,0.999985,-0.00554579],[0.00276214,0.00554577,0.999981]];
};

private _item470 = objNull;
if (_layerRoot) then {
	_item470 = createVehicle ["sapin",[3430.44,13135.7,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item470;
	_objects pushback _this;
	_objectIDs pushback 470;
	_this setPosWorld [3430.44,13135.7,8.36487];
	_this setVectorDirAndUp [[0,0.999619,-0.0276101],[-0.0172178,0.027606,0.999471]];
};

private _item471 = objNull;
if (_layerRoot) then {
	_item471 = createVehicle ["sapin",[3416.14,13152.1,0],[],0,"CAN_COLLIDE"];
	_this = _item471;
	_objects pushback _this;
	_objectIDs pushback 471;
	_this setPosWorld [3416.14,13152.1,7.69775];
	_this setVectorDirAndUp [[0,0.999662,-0.0259893],[-0.0109997,0.0259878,0.999602]];
};

private _item472 = objNull;
if (_layerRoot) then {
	_item472 = createVehicle ["sapin",[3673.61,13184.8,0.423136],[],0,"CAN_COLLIDE"];
	_this = _item472;
	_objects pushback _this;
	_objectIDs pushback 472;
	_this setPosWorld [3673.61,13184.8,8.43161];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item473 = objNull;
if (_layerRoot) then {
	_item473 = createVehicle ["sapin",[3673.13,13173.8,0.424118],[],0,"CAN_COLLIDE"];
	_this = _item473;
	_objects pushback _this;
	_objectIDs pushback 473;
	_this setPosWorld [3673.13,13173.8,8.48323];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item474 = objNull;
if (_layerRoot) then {
	_item474 = createVehicle ["sapin",[3673.01,13160.9,0.423216],[],0,"CAN_COLLIDE"];
	_this = _item474;
	_objects pushback _this;
	_objectIDs pushback 474;
	_this setPosWorld [3673.01,13160.9,8.48878];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item475 = objNull;
if (_layerRoot) then {
	_item475 = createVehicle ["sapin",[3672.7,13146.4,0.423084],[],0,"CAN_COLLIDE"];
	_this = _item475;
	_objects pushback _this;
	_objectIDs pushback 475;
	_this setPosWorld [3672.7,13146.4,8.43398];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item476 = objNull;
if (_layerRoot) then {
	_item476 = createVehicle ["sapin",[3714.37,13140.9,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item476;
	_objects pushback _this;
	_objectIDs pushback 476;
	_this setPosWorld [3714.37,13140.9,8.01272];
	_this setVectorDirAndUp [[0,0.999773,0.0213271],[-0.00308816,-0.021327,0.999768]];
};

private _item477 = objNull;
if (_layerRoot) then {
	_item477 = createVehicle ["sapin",[3735.91,13140.8,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item477;
	_objects pushback _this;
	_objectIDs pushback 477;
	_this setPosWorld [3735.91,13140.8,8.01482];
	_this setVectorDirAndUp [[0,1,0.000345055],[-0.00146484,-0.000345055,0.999999]];
};

private _item478 = objNull;
if (_layerRoot) then {
	_item478 = createVehicle ["sapin",[3781.75,13159.4,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item478;
	_objects pushback _this;
	_objectIDs pushback 478;
	_this setPosWorld [3781.75,13159.4,7.52652];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item479 = objNull;
if (_layerRoot) then {
	_item479 = createVehicle ["sapin",[3631.45,13009.8,0],[],0,"CAN_COLLIDE"];
	_this = _item479;
	_objects pushback _this;
	_objectIDs pushback 479;
	_this setPosWorld [3631.45,13009.8,10.0811];
	_this setVectorDirAndUp [[0,0.995534,-0.0944037],[-0.101943,0.0939118,0.990347]];
};

private _item480 = objNull;
if (_layerRoot) then {
	_item480 = createVehicle ["sapin",[3629.88,12998.4,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item480;
	_objects pushback _this;
	_objectIDs pushback 480;
	_this setPosWorld [3629.88,12998.4,11.0387];
	_this setVectorDirAndUp [[0,0.99498,-0.100078],[-0.0980977,0.0995956,0.990181]];
};

private _item481 = objNull;
if (_layerRoot) then {
	_item481 = createVehicle ["sapin",[3627.62,12987.7,0],[],0,"CAN_COLLIDE"];
	_this = _item481;
	_objects pushback _this;
	_objectIDs pushback 481;
	_this setPosWorld [3627.62,12987.7,11.8513];
	_this setVectorDirAndUp [[0,0.996425,-0.0844824],[-0.0811544,0.0842037,0.993138]];
};

private _item482 = objNull;
if (_layerRoot) then {
	_item482 = createVehicle ["sapin",[3625.66,12977.5,0],[],0,"CAN_COLLIDE"];
	_this = _item482;
	_objects pushback _this;
	_objectIDs pushback 482;
	_this setPosWorld [3625.66,12977.5,12.5892];
	_this setVectorDirAndUp [[0,0.996419,-0.0845583],[-0.0548388,0.084431,0.994919]];
};

private _item483 = objNull;
if (_layerRoot) then {
	_item483 = createVehicle ["sapin",[3634.67,13051.2,0],[],0,"CAN_COLLIDE"];
	_this = _item483;
	_objects pushback _this;
	_objectIDs pushback 483;
	_this setPosWorld [3634.67,13051.2,8.35413];
	_this setVectorDirAndUp [[0,1,0],[-0.0558752,0,0.998438]];
};

private _item484 = objNull;
if (_layerRoot) then {
	_item484 = createVehicle ["sapin",[3683.49,13259.2,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item484;
	_objects pushback _this;
	_objectIDs pushback 484;
	_this setPosWorld [3683.49,13259.2,8.06405];
	_this setVectorDirAndUp [[0,1,0],[0.0132689,0,0.999912]];
};

private _item485 = objNull;
if (_layerRoot) then {
	_item485 = createVehicle ["sapin",[3700.92,12967.2,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item485;
	_objects pushback _this;
	_objectIDs pushback 485;
	_this setPosWorld [3700.92,12967.2,12.5757];
	_this setVectorDirAndUp [[0,0.999961,0.00880928],[0.0617886,-0.00879245,0.998051]];
};

private _item486 = objNull;
if (_layerRoot) then {
	_item486 = createVehicle ["sapin",[3661.78,12949.5,0],[],0,"CAN_COLLIDE"];
	_this = _item486;
	_objects pushback _this;
	_objectIDs pushback 486;
	_this setPosWorld [3661.78,12949.5,16.2506];
	_this setVectorDirAndUp [[0,0.992124,-0.125256],[0.020264,0.12523,0.991921]];
};

private _item487 = objNull;
if (_layerRoot) then {
	_item487 = createVehicle ["sapin",[3651.38,12958.6,0],[],0,"CAN_COLLIDE"];
	_this = _item487;
	_objects pushback _this;
	_objectIDs pushback 487;
	_this setPosWorld [3651.38,12958.6,15.3761];
	_this setVectorDirAndUp [[0,0.994275,-0.106849],[-0.0240285,0.106818,0.993988]];
};

private _item488 = objNull;
if (_layerRoot) then {
	_item488 = createVehicle ["sapin",[3616.97,12808.5,0],[],0,"CAN_COLLIDE"];
	_this = _item488;
	_objects pushback _this;
	_objectIDs pushback 488;
	_this setPosWorld [3616.97,12808.5,18.3613];
	_this setVectorDirAndUp [[0,0.999992,-0.00399675],[-0.0359766,0.00399416,0.999345]];
};

private _item489 = objNull;
if (_layerRoot) then {
	_item489 = createVehicle ["sapin",[3586.21,12841.3,0],[],0,"CAN_COLLIDE"];
	_this = _item489;
	_objects pushback _this;
	_objectIDs pushback 489;
	_this setPosWorld [3586.21,12841.3,16.8899];
	_this setVectorDirAndUp [[0,0.9998,-0.0199947],[-0.0339789,0.0199832,0.999223]];
};

private _item490 = objNull;
if (_layerRoot) then {
	_item490 = createVehicle ["sapin",[3482.59,12802.2,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item490;
	_objects pushback _this;
	_objectIDs pushback 490;
	_this setPosWorld [3482.59,12802.2,10.3154];
	_this setVectorDirAndUp [[0,0.999077,0.0429573],[-0.198937,-0.0420986,0.979108]];
};

private _item491 = objNull;
if (_layerRoot) then {
	_item491 = createVehicle ["sapin",[3470.95,12783.4,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item491;
	_objects pushback _this;
	_objectIDs pushback 491;
	_this setPosWorld [3470.95,12783.4,9.15597];
	_this setVectorDirAndUp [[0,0.999928,0.0119996],[-0.0608847,-0.0119774,0.998073]];
};

private _item492 = objNull;
if (_layerRoot) then {
	_item492 = createVehicle ["sapin",[3414.29,12613.6,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item492;
	_objects pushback _this;
	_objectIDs pushback 492;
	_this setPosWorld [3414.29,12613.6,8.75443];
	_this setVectorDirAndUp [[0,0.999736,-0.0229918],[-0.0747877,0.0229274,0.996936]];
};

private _item493 = objNull;
if (_layerRoot) then {
	_item493 = createVehicle ["sapin",[3419.98,12622.8,0],[],0,"CAN_COLLIDE"];
	_this = _item493;
	_objects pushback _this;
	_objectIDs pushback 493;
	_this setPosWorld [3419.98,12622.8,8.86568];
	_this setVectorDirAndUp [[0,0.999077,-0.0429602],[-0.0339789,0.0429354,0.9985]];
};

private _item494 = objNull;
if (_layerRoot) then {
	_item494 = createVehicle ["sapin",[3438.21,12610.1,0],[],0,"CAN_COLLIDE"];
	_this = _item494;
	_objects pushback _this;
	_objectIDs pushback 494;
	_this setPosWorld [3438.21,12610.1,10.62];
	_this setVectorDirAndUp [[0,0.999928,-0.012],[-0.107373,0.0119306,0.994147]];
};

private _item495 = objNull;
if (_layerRoot) then {
	_item495 = createVehicle ["sapin",[3386.99,12618.1,1.0693],[],0,"CAN_COLLIDE"];
	_this = _item495;
	_objects pushback _this;
	_objectIDs pushback 495;
	_this setPosWorld [3386.99,12618.1,8.94232];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item496 = objNull;
if (_layerRoot) then {
	_item496 = createVehicle ["sapin",[3413.31,12659.4,0.992078],[],0,"CAN_COLLIDE"];
	_this = _item496;
	_objects pushback _this;
	_objectIDs pushback 496;
	_this setPosWorld [3413.31,12659.4,8.79502];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item497 = objNull;
if (_layerRoot) then {
	_item497 = createVehicle ["sapin",[3419.28,12667.9,1.003],[],0,"CAN_COLLIDE"];
	_this = _item497;
	_objects pushback _this;
	_objectIDs pushback 497;
	_this setPosWorld [3419.28,12667.9,8.78862];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item498 = objNull;
if (_layerRoot) then {
	_item498 = createVehicle ["sapin",[3444.56,12709.8,1.06822],[],0,"CAN_COLLIDE"];
	_this = _item498;
	_objects pushback _this;
	_objectIDs pushback 498;
	_this setPosWorld [3444.56,12709.8,9.21347];
	_this setVectorDirAndUp [[0,1,0],[0.000488106,0,1]];
};

private _item499 = objNull;
if (_layerRoot) then {
	_item499 = createVehicle ["sapin",[3461.39,12742.9,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item499;
	_objects pushback _this;
	_objectIDs pushback 499;
	_this setPosWorld [3461.39,12742.9,8.77777];
	_this setVectorDirAndUp [[0,0.999992,0.00399666],[-0.0369743,-0.00399393,0.999308]];
};

private _item500 = objNull;
if (_layerRoot) then {
	_item500 = createVehicle ["sapin",[3451.49,12748.8,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item500;
	_objects pushback _this;
	_objectIDs pushback 500;
	_this setPosWorld [3451.49,12748.8,8.31503];
	_this setVectorDirAndUp [[0,0.999992,0.00399666],[-0.0569031,-0.00399019,0.998372]];
};

private _item501 = objNull;
if (_layerRoot) then {
	_item501 = createVehicle ["sapin",[3443.86,12758.5,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item501;
	_objects pushback _this;
	_objectIDs pushback 501;
	_this setPosWorld [3443.86,12758.5,7.83972];
	_this setVectorDirAndUp [[0,0.999995,-0.00300996],[-0.0588958,0.00300474,0.99826]];
};

private _item502 = objNull;
if (_layerRoot) then {
	_item502 = createVehicle ["sapin",[3442.21,12773.9,0],[],0,"CAN_COLLIDE"];
	_this = _item502;
	_objects pushback _this;
	_objectIDs pushback 502;
	_this setPosWorld [3442.21,12773.9,7.54095];
	_this setVectorDirAndUp [[0,0.999992,-0.00399675],[-0.0199947,0.00399595,0.999792]];
};

private _item503 = objNull;
if (_layerRoot) then {
	_item503 = createVehicle ["sapin",[3441.41,12785.6,0],[],0,"CAN_COLLIDE"];
	_this = _item503;
	_objects pushback _this;
	_objectIDs pushback 503;
	_this setPosWorld [3441.41,12785.6,7.57916];
	_this setVectorDirAndUp [[0,0.999736,0.0229942],[-0.0658542,-0.0229443,0.997565]];
};

private _item504 = objNull;
if (_layerRoot) then {
	_item504 = createVehicle ["sapin",[3439.38,12800.6,0],[],0,"CAN_COLLIDE"];
	_this = _item504;
	_objects pushback _this;
	_objectIDs pushback 504;
	_this setPosWorld [3439.38,12800.6,7.08908];
	_this setVectorDirAndUp [[0,0.999423,-0.0339789],[-0.0249912,0.0339683,0.99911]];
};

private _item505 = objNull;
if (_layerRoot) then {
	_item505 = createVehicle ["sapin",[3436.56,12818.1,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item505;
	_objects pushback _this;
	_objectIDs pushback 505;
	_this setPosWorld [3436.56,12818.1,6.97082];
	_this setVectorDirAndUp [[0,1,0],[-0.00699108,0,0.999976]];
};

private _item506 = objNull;
if (_layerRoot) then {
	_item506 = createVehicle ["sapin",[3432.4,12837.8,0],[],0,"CAN_COLLIDE"];
	_this = _item506;
	_objects pushback _this;
	_objectIDs pushback 506;
	_this setPosWorld [3432.4,12837.8,6.89619];
	_this setVectorDirAndUp [[0,0.99995,-0.00999474],[-0.00999474,0.00999424,0.9999]];
};

private _item507 = objNull;
if (_layerRoot) then {
	_item507 = createVehicle ["sapin",[3427.68,12855.9,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item507;
	_objects pushback _this;
	_objectIDs pushback 507;
	_this setPosWorld [3427.68,12855.9,7.01416];
	_this setVectorDirAndUp [[0,0.999995,-0.00300996],[-0.0249912,0.00300902,0.999683]];
};

private _item508 = objNull;
if (_layerRoot) then {
	_item508 = createVehicle ["sapin",[3421.44,12870.1,0],[],0,"CAN_COLLIDE"];
	_this = _item508;
	_objects pushback _this;
	_objectIDs pushback 508;
	_this setPosWorld [3421.44,12870.1,6.85519];
	_this setVectorDirAndUp [[0,0.999608,-0.0279873],[-0.011995,0.0279853,0.999536]];
};

private _item509 = objNull;
if (_layerRoot) then {
	_item509 = createVehicle ["sapin",[3402.11,12979.3,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item509;
	_objects pushback _this;
	_objectIDs pushback 509;
	_this setPosWorld [3402.11,12979.3,6.52236];
	_this setVectorDirAndUp [[0,1,-0.000976562],[-0.00198341,0.00097656,0.999998]];
};

private _item510 = objNull;
if (_layerRoot) then {
	_item510 = createVehicle ["sapin",[3415.8,12938,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item510;
	_objects pushback _this;
	_objectIDs pushback 510;
	_this setPosWorld [3415.8,12938,6.84393];
	_this setVectorDirAndUp [[0,0.99978,0.0209949],[-0.0369727,-0.0209805,0.999096]];
};

private _item511 = objNull;
if (_layerRoot) then {
	_item511 = createVehicle ["sapin",[3468.34,12897.8,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item511;
	_objects pushback _this;
	_objectIDs pushback 511;
	_this setPosWorld [3468.34,12897.8,9.38623];
	_this setVectorDirAndUp [[0,0.999033,-0.0439564],[-0.108355,0.0436976,0.993151]];
};

private _item512 = objNull;
if (_layerRoot) then {
	_item512 = createVehicle ["sapin",[3448.06,12924.8,0],[],0,"CAN_COLLIDE"];
	_this = _item512;
	_objects pushback _this;
	_objectIDs pushback 512;
	_this setPosWorld [3448.06,12924.8,8.03191];
	_this setVectorDirAndUp [[0,0.999077,0.0429587],[-0.0549158,-0.0428939,0.997569]];
};

private _item513 = objNull;
if (_layerRoot) then {
	_item513 = createVehicle ["sapin",[3345.04,12999.9,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item513;
	_objects pushback _this;
	_objectIDs pushback 513;
	_this setPosWorld [3345.04,12999.9,7.58506];
	_this setVectorDirAndUp [[0,0.992278,0.124033],[0.023991,-0.123997,0.991992]];
};

private _item514 = objNull;
if (_layerRoot) then {
	_item514 = createVehicle ["sapin",[3292.28,12968.7,0.651197],[],0,"CAN_COLLIDE"];
	_this = _item514;
	_objects pushback _this;
	_objectIDs pushback 514;
	_this setPosWorld [3292.28,12968.7,6.97692];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item515 = objNull;
if (_layerRoot) then {
	_item515 = createVehicle ["sapin",[3397.55,12915.6,0.64767],[],0,"CAN_COLLIDE"];
	_this = _item515;
	_objects pushback _this;
	_objectIDs pushback 515;
	_this setPosWorld [3397.55,12915.6,6.56186];
	_this setVectorDirAndUp [[0,1,0],[0.000690285,0,1]];
};

private _item516 = objNull;
if (_layerRoot) then {
	_item516 = createVehicle ["sapin",[3379.37,12933.2,0.637751],[],0,"CAN_COLLIDE"];
	_this = _item516;
	_objects pushback _this;
	_objectIDs pushback 516;
	_this setPosWorld [3379.37,12933.2,6.69016];
	_this setVectorDirAndUp [[0,1,0],[0.000488106,0,1]];
};

private _item517 = objNull;
if (_layerRoot) then {
	_item517 = createVehicle ["sapin",[3622.59,13246.3,0],[],0,"CAN_COLLIDE"];
	_this = _item517;
	_objects pushback _this;
	_objectIDs pushback 517;
	_this setPosWorld [3622.59,13246.3,8.00032];
	_this setVectorDirAndUp [[0,0.999995,-0.0031074],[-0.000345267,0.0031074,0.999995]];
};

private _item518 = objNull;
if (_layerRoot) then {
	_item518 = createVehicle ["sapin",[3541.53,12690.4,0],[],0,"CAN_COLLIDE"];
	_this = _item518;
	_objects pushback _this;
	_objectIDs pushback 518;
	_this setPosWorld [3541.53,12690.4,14.8495];
	_this setVectorDirAndUp [[0,0.995329,-0.0965439],[-0.0459525,0.0964419,0.994277]];
};

private _item519 = objNull;
if (_layerRoot) then {
	_item519 = createVehicle ["sapin",[3549.69,12685.1,0],[],0,"CAN_COLLIDE"];
	_this = _item519;
	_objects pushback _this;
	_objectIDs pushback 519;
	_this setPosWorld [3549.69,12685.1,15.6857];
	_this setVectorDirAndUp [[0,0.999161,-0.040962],[-0.144465,0.0405323,0.988679]];
};

private _item521 = objNull;
if (_layerRoot) then {
	_item521 = createVehicle ["sapin",[3729.74,12720.7,0],[],0,"CAN_COLLIDE"];
	_this = _item521;
	_objects pushback _this;
	_objectIDs pushback 521;
	_this setPosWorld [3729.74,12720.7,24.1416];
	_this setVectorDirAndUp [[0,0.999932,-0.0116982],[-0.0212909,0.0116955,0.999705]];
};

private _item522 = objNull;
if (_layerRoot) then {
	_item522 = createVehicle ["sapin",[3590.14,12934.7,0],[],0,"CAN_COLLIDE"];
	_this = _item522;
	_objects pushback _this;
	_objectIDs pushback 522;
	_this setPosWorld [3590.14,12934.7,15.088];
	_this setVectorDirAndUp [[0,0.996239,-0.0866492],[0.0359599,0.0865931,0.995595]];
};

private _item523 = objNull;
if (_layerRoot) then {
	_item523 = createVehicle ["sapin",[3578.2,12945.1,0],[],0,"CAN_COLLIDE"];
	_this = _item523;
	_objects pushback _this;
	_objectIDs pushback 523;
	_this setPosWorld [3578.2,12945.1,14.7424];
	_this setVectorDirAndUp [[0,0.997899,-0.0647833],[0.0447842,0.0647183,0.996898]];
};

private _item524 = objNull;
if (_layerRoot) then {
	_item524 = createVehicle ["sapin",[3547.55,12962.1,0],[],0,"CAN_COLLIDE"];
	_this = _item524;
	_objects pushback _this;
	_objectIDs pushback 524;
	_this setPosWorld [3547.55,12962.1,13.7412];
	_this setVectorDirAndUp [[0,0.999858,-0.0168504],[-0.0737972,0.0168045,0.997132]];
};

private _item525 = objNull;
if (_layerRoot) then {
	_item525 = createVehicle ["sapin",[3565.07,12912.7,0],[],0,"CAN_COLLIDE"];
	_this = _item525;
	_objects pushback _this;
	_objectIDs pushback 525;
	_this setPosWorld [3565.07,12912.7,16.7549];
	_this setVectorDirAndUp [[0,0.999928,0.0119949],[-0.0459486,-0.0119822,0.998872]];
};

private _item528 = objNull;
if (_layerRoot) then {
	_item528 = createVehicle ["sapin",[3531.35,12883,0],[],0,"CAN_COLLIDE"];
	_this = _item528;
	_objects pushback _this;
	_objectIDs pushback 528;
	_this setPosWorld [3531.35,12883,14.867];
	_this setVectorDirAndUp [[0,0.998802,-0.0489402],[-0.108355,0.0486521,0.992921]];
};

private _item529 = objNull;
if (_layerRoot) then {
	_item529 = createVehicle ["sapin",[3536.26,12822.7,0],[],0,"CAN_COLLIDE"];
	_this = _item529;
	_objects pushback _this;
	_objectIDs pushback 529;
	_this setPosWorld [3536.26,12822.7,13.8767];
	_this setVectorDirAndUp [[0,0.999712,0.0239934],[-0.0169983,-0.0239899,0.999568]];
};

private _item530 = objNull;
if (_layerRoot) then {
	_item530 = createVehicle ["sapin",[3518.3,12791.2,0],[],0,"CAN_COLLIDE"];
	_this = _item530;
	_objects pushback _this;
	_objectIDs pushback 530;
	_this setPosWorld [3518.3,12791.2,11.9852];
	_this setVectorDirAndUp [[0,0.999119,0.0419616],[-0.0678408,-0.0418649,0.996817]];
};

private _item531 = objNull;
if (_layerRoot) then {
	_item531 = createVehicle ["sapin",[3480.04,12688,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item531;
	_objects pushback _this;
	_objectIDs pushback 531;
	_this setPosWorld [3480.04,12688,11.3295];
	_this setVectorDirAndUp [[0,0.994112,-0.108355],[0.0139988,0.108344,0.994015]];
};

private _item532 = objNull;
if (_layerRoot) then {
	_item532 = createVehicle ["sapin",[3401.65,12869.2,0],[],0,"CAN_COLLIDE"];
	_this = _item532;
	_objects pushback _this;
	_objectIDs pushback 532;
	_this setPosWorld [3401.65,12869.2,6.49613];
	_this setVectorDirAndUp [[0,0.999758,0.0219926],[-0.0389696,-0.0219759,0.998999]];
};

private _item533 = objNull;
if (_layerRoot) then {
	_item533 = createVehicle ["sapin",[3724.04,13140.5,0],[],0,"CAN_COLLIDE"];
	_this = _item533;
	_objects pushback _this;
	_objectIDs pushback 533;
	_this setPosWorld [3724.04,13140.5,8.01764];
	_this setVectorDirAndUp [[0,0.999935,0.0114246],[0,-0.0114246,0.999935]];
};

private _item534 = objNull;
if (_layerRoot) then {
	_item534 = createVehicle ["sapin",[3650.35,13277.8,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item534;
	_objects pushback _this;
	_objectIDs pushback 534;
	_this setPosWorld [3650.35,13277.8,8.07895];
	_this setVectorDirAndUp [[0,0.999938,-0.0111664],[0.00158197,0.0111664,0.999936]];
};

private _item535 = objNull;
if (_layerRoot) then {
	_item535 = createVehicle ["Christmas_Whole_Tree",[3660.35,13196.2,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item535;
	_objects pushback _this;
	_objectIDs pushback 535;
	_this setPosWorld [3660.35,13196.2,4.9837];
	_this setVectorDirAndUp [[0,0.999951,0.00994696],[-0.00267442,-0.00994693,0.999947]];
};

private _item536 = objNull;
if (_layerRoot) then {
	_item536 = createVehicle ["Christmas_Whole_Tree",[3683.15,13179.9,0],[],0,"CAN_COLLIDE"];
	_this = _item536;
	_objects pushback _this;
	_objectIDs pushback 536;
	_this setPosWorld [3683.14,13179.9,5.11679];
	_this setVectorDirAndUp [[0,1,0],[-0.0049555,0,0.999988]];
};

private _item537 = objNull;
if (_layerRoot) then {
	_item537 = createVehicle ["Christmas_Whole_Tree",[3696.55,13179.8,0],[],0,"CAN_COLLIDE"];
	_this = _item537;
	_objects pushback _this;
	_objectIDs pushback 537;
	_this setPosWorld [3696.55,13179.8,5.15099];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item538 = objNull;
if (_layerRoot) then {
	_item538 = createVehicle ["Christmas_Whole_Tree",[3696.39,13165.9,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item538;
	_objects pushback _this;
	_objectIDs pushback 538;
	_this setPosWorld [3696.39,13165.9,5.14995];
	_this setVectorDirAndUp [[0,1,0],[-0.000976562,0,1]];
};

private _item539 = objNull;
if (_layerRoot) then {
	_item539 = createVehicle ["Christmas_Whole_Tree",[3683.7,13166,0],[],0,"CAN_COLLIDE"];
	_this = _item539;
	_objects pushback _this;
	_objectIDs pushback 539;
	_this setPosWorld [3683.69,13166,5.12144];
	_this setVectorDirAndUp [[0,1,0.000488106],[-0.00265204,-0.000488105,0.999996]];
};

private _item540 = objNull;
if (_layerRoot) then {
	_item540 = createVehicle ["Christmas_Whole_Tree",[3683.67,13152.3,0],[],0,"CAN_COLLIDE"];
	_this = _item540;
	_objects pushback _this;
	_objectIDs pushback 540;
	_this setPosWorld [3683.66,13152.3,5.08326];
	_this setVectorDirAndUp [[0,0.999982,0.00595024],[-0.00467067,-0.00595018,0.999971]];
};

private _item541 = objNull;
if (_layerRoot) then {
	_item541 = createVehicle ["Christmas_Whole_Tree",[3696.65,13151.4,0],[],0,"CAN_COLLIDE"];
	_this = _item541;
	_objects pushback _this;
	_objectIDs pushback 541;
	_this setPosWorld [3696.64,13151.4,5.14566];
	_this setVectorDirAndUp [[0,1,0.000488106],[-0.0041432,-0.000488102,0.999991]];
};

private _item542 = objNull;
if (_layerRoot) then {
	_item542 = createVehicle ["Christmas_Whole_Tree",[3589.25,13147,0],[],0,"CAN_COLLIDE"];
	_this = _item542;
	_objects pushback _this;
	_objectIDs pushback 542;
	_this setPosWorld [3589.25,13147,4.96916];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item543 = objNull;
if (_layerRoot) then {
	_item543 = createVehicle ["Christmas_Whole_Tree",[3584.38,13121.8,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item543;
	_objects pushback _this;
	_objectIDs pushback 543;
	_this setPosWorld [3584.39,13121.8,5.06809];
	_this setVectorDirAndUp [[0,0.999968,-0.00797852],[0.00456743,0.00797843,0.999958]];
};

private _item544 = objNull;
if (_layerRoot) then {
	_item544 = createVehicle ["Christmas_Whole_Tree",[3571.71,13121.6,0],[],0,"CAN_COLLIDE"];
	_this = _item544;
	_objects pushback _this;
	_objectIDs pushback 544;
	_this setPosWorld [3571.71,13121.6,5.0726];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item545 = objNull;
if (_layerRoot) then {
	_item545 = createVehicle ["Christmas_Whole_Tree",[3616.84,12906.9,0],[],0,"CAN_COLLIDE"];
	_this = _item545;
	_objects pushback _this;
	_objectIDs pushback 545;
	_this setPosWorld [3616.82,12907,14.7848];
	_this setVectorDirAndUp [[0,0.992447,-0.122678],[-0.0224436,0.122647,0.992197]];
};

private _item546 = objNull;
if (_layerRoot) then {
	_item546 = createVehicle ["Christmas_Whole_Tree",[3642.9,12864.2,0],[],0,"CAN_COLLIDE"];
	_this = _item546;
	_objects pushback _this;
	_objectIDs pushback 546;
	_this setPosWorld [3642.75,12864.2,17.1756];
	_this setVectorDirAndUp [[0,0.99996,-0.00899675],[-0.135728,0.00891349,0.990706]];
};

private _item547 = objNull;
if (_layerRoot) then {
	_item547 = createVehicle ["Christmas_Whole_Tree",[3709.12,13023.2,0],[],0,"CAN_COLLIDE"];
	_this = _item547;
	_objects pushback _this;
	_objectIDs pushback 547;
	_this setPosWorld [3709.11,13023.2,8.22191];
	_this setVectorDirAndUp [[0,0.998647,-0.0519987],[-0.0118852,0.051995,0.998577]];
};

private _item548 = objNull;
if (_layerRoot) then {
	_item548 = createVehicle ["Christmas_Whole_Tree",[3581.01,13086,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item548;
	_objects pushback _this;
	_objectIDs pushback 548;
	_this setPosWorld [3581.02,13086,5.16977];
	_this setVectorDirAndUp [[0,0.999959,0.00902957],[0.00596025,-0.00902941,0.999941]];
};

private _item549 = objNull;
if (_layerRoot) then {
	_item549 = createVehicle ["Christmas_Whole_Tree",[3717.56,13193.3,0],[],0,"CAN_COLLIDE"];
	_this = _item549;
	_objects pushback _this;
	_objectIDs pushback 549;
	_this setPosWorld [3717.56,13193.2,5.18137];
	_this setVectorDirAndUp [[0,0.998943,0.0459693],[0.00265199,-0.0459692,0.998939]];
};

private _item550 = objNull;
if (_layerRoot) then {
	_item550 = createVehicle ["Christmas_Whole_Tree",[3719.41,13215.7,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item550;
	_objects pushback _this;
	_objectIDs pushback 550;
	_this setPosWorld [3719.43,13215.7,5.06959];
	_this setVectorDirAndUp [[0,0.999972,-0.00745324],[0.01455,0.00745245,0.999866]];
};

private _item551 = objNull;
if (_layerRoot) then {
	_item551 = createVehicle ["Christmas_Whole_Tree",[3547.63,12819.4,0],[],0,"CAN_COLLIDE"];
	_this = _item551;
	_objects pushback _this;
	_objectIDs pushback 551;
	_this setPosWorld [3547.57,12819.4,11.3429];
	_this setVectorDirAndUp [[0,0.998702,0.0509321],[-0.0569062,-0.0508496,0.997084]];
};

private _item552 = objNull;
if (_layerRoot) then {
	_item552 = createVehicle ["sapin",[3497.76,12756.4,0],[],0,"CAN_COLLIDE"];
	_this = _item552;
	_objects pushback _this;
	_objectIDs pushback 552;
	_this setPosWorld [3497.76,12756.4,10.3984];
	_this setVectorDirAndUp [[0,0.997199,-0.0747885],[-0.0319849,0.0747503,0.996689]];
};

private _item553 = objNull;
if (_layerRoot) then {
	_item553 = createVehicle ["Christmas_Whole_Tree",[3527.7,12999.2,-0.000910759],[],0,"CAN_COLLIDE"];
	_this = _item553;
	_objects pushback _this;
	_objectIDs pushback 553;
	_this setPosWorld [3527.72,12999.2,9.13898];
	_this setVectorDirAndUp [[0,0.999709,-0.0241027],[0.0188881,0.0240984,0.999531]];
};

private _item555 = objNull;
if (_layerRoot) then {
	_item555 = createVehicle ["etoile",[3656.09,13103.2,3.72179],[],0,"CAN_COLLIDE"];
	_this = _item555;
	_objects pushback _this;
	_objectIDs pushback 555;
	_this setPosWorld [3656.09,13103.2,-106.555];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item557 = objNull;
if (_layerRoot) then {
	_item557 = createVehicle ["pere",[3653.74,13110.1,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item557;
	_objects pushback _this;
	_objectIDs pushback 557;
	_this setPosWorld [3653.74,13110.1,7.68427];
	_this setVectorDirAndUp [[-0.915647,0.401982,0.000901904],[0.00201303,0.00234171,0.999995]];
};

private _item560 = objNull;
if (_layerRoot) then {
	_item560 = createVehicle ["RRP_Gift",[3651.8,13108.6,0],[],0,"CAN_COLLIDE"];
	_this = _item560;
	_objects pushback _this;
	_objectIDs pushback 560;
	_this setPosWorld [3651.8,13108.6,4.14143];
	_this setVectorDirAndUp [[-0.344958,-0.938611,-0.00351194],[-0.00260671,-0.00278359,0.999993]];
};

private _item568 = objNull;
if (_layerRoot) then {
	_item568 = createVehicle ["Christmas_Candy_Cane_01",[3725.96,13103.8,-0.000396252],[],0,"CAN_COLLIDE"];
	_this = _item568;
	_objects pushback _this;
	_objectIDs pushback 568;
	_this setPosWorld [3725.95,13103.9,5.29644];
	_this setVectorDirAndUp [[-0.940127,0.34057,-0.0131687],[-0.00461935,0.0259018,0.999654]];
};

private _item570 = objNull;
if (_layerRoot) then {
	_item570 = createVehicle ["Christmas_Gift_Medium_Box",[3651.07,13108.5,-0.407615],[],0,"CAN_COLLIDE"];
	_this = _item570;
	_objects pushback _this;
	_objectIDs pushback 570;
	_this setPosWorld [3651.07,13108.5,3.90867];
	_this setVectorDirAndUp [[0.179949,-0.983673,-0.00226908],[-0.00260671,-0.00278359,0.999993]];
};

private _item571 = objNull;
if (_layerRoot) then {
	_item571 = createVehicle ["Christmas_Gift_Medium_Pattern",[3652.46,13108.4,0],[],0,"CAN_COLLIDE"];
	_this = _item571;
	_objects pushback _this;
	_objectIDs pushback 571;
	_this setPosWorld [3652.46,13108.4,4.02095];
	_this setVectorDirAndUp [[0.178724,-0.983897,-0.0022729],[-0.00260671,-0.00278359,0.999993]];
};

private _item572 = objNull;
if (_layerRoot) then {
	_item572 = createVehicle ["Christmas_Gift_Medium_Tree",[3651.78,13107.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item572;
	_objects pushback _this;
	_objectIDs pushback 572;
	_this setPosWorld [3651.78,13107.8,4.01762];
	_this setVectorDirAndUp [[-0.805607,0.59245,-0.000450846],[-0.00260671,-0.00278359,0.999993]];
};

private _item574 = objNull;
if (_layerRoot) then {
	_item574 = createVehicle ["Christmas_Penguin_Light",[3721.76,13107.9,-0.000165939],[],0,"CAN_COLLIDE"];
	_this = _item574;
	_objects pushback _this;
	_objectIDs pushback 574;
	_this setPosWorld [3721.76,13107.9,4.63548];
	_this setVectorDirAndUp [[0.991158,0.132682,0.00114219],[-0.00461935,0.0259018,0.999654]];
};

private _item576 = objNull;
if (_layerRoot) then {
	_item576 = createVehicle ["Christmas_Reindeer_Light",[3725.11,13094.4,-5.53131e-005],[],0,"CAN_COLLIDE"];
	_this = _item576;
	_objects pushback _this;
	_objectIDs pushback 576;
	_this setPosWorld [3725.1,13094.4,5.474];
	_this setVectorDirAndUp [[-0.654478,0.755646,-0.0256284],[-0.00236703,0.0318485,0.99949]];
};

private _item579 = objNull;
if (_layerRoot) then {
	_item579 = createVehicle ["Christmas_Happy_Snowman",[3714.49,13088.5,-0.000525951],[],0,"CAN_COLLIDE"];
	_this = _item579;
	_objects pushback _this;
	_objectIDs pushback 579;
	_this setPosWorld [3714.48,13088.6,5.73154];
	_this setVectorDirAndUp [[-0.204809,-0.978079,0.0376211],[-0.00795608,0.0400981,0.999164]];
};

private _item580 = objNull;
if (_layerRoot) then {
	_item580 = createVehicle ["Christmas_Happy_Snowman_Bucket",[3722.57,13105.3,0],[],0,"CAN_COLLIDE"];
	_this = _item580;
	_objects pushback _this;
	_objectIDs pushback 580;
	_this setPosWorld [3722.56,13105.3,5.23325];
	_this setVectorDirAndUp [[0.0818806,-0.996298,0.0261932],[-0.00461935,0.0259018,0.999654]];
};

private _item581 = objNull;
if (_layerRoot) then {
	_item581 = createVehicle ["Christmas_Clothed_Snowman_Hat",[3724.64,13098.7,0],[],0,"CAN_COLLIDE"];
	_this = _item581;
	_objects pushback _this;
	_objectIDs pushback 581;
	_this setPosWorld [3724.63,13098.8,5.8599];
	_this setVectorDirAndUp [[0.96599,-0.25831,0.0117676],[-0.00460642,0.0283109,0.999589]];
};

private _item585 = objNull;
if (_layerRoot) then {
	_item585 = createVehicle ["Christmas_Bunny_Left",[3787.97,13023,-5.72205e-006],[],0,"CAN_COLLIDE"];
	_this = _item585;
	_objects pushback _this;
	_objectIDs pushback 585;
	_this setPosWorld [3787.97,13023,8.63768];
	_this setVectorDirAndUp [[0.992611,0.121221,0.00546205],[-0.00550263,0,0.999985]];
};

private _item586 = objNull;
if (_layerRoot) then {
	_item586 = createVehicle ["Christmas_Toy_Train",[3784.54,13023.5,-1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item586;
	_objects pushback _this;
	_objectIDs pushback 586;
	_this setPosWorld [3784.54,13023.5,8.34089];
	_this setVectorDirAndUp [[-0.594747,-0.803913,0],[0,0,1]];
};

private _item587 = objNull;
if (_layerRoot) then {
	_item587 = createVehicle ["Christmas_Car_Light",[3785.9,13022.1,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item587;
	_objects pushback _this;
	_objectIDs pushback 587;
	_this setPosWorld [3785.9,13022.1,8.40856];
	_this setVectorDirAndUp [[0.145209,0.989401,0],[0,0,1]];
};

private _item588 = objNull;
if (_layerRoot) then {
	_item588 = createVehicle ["Christmas_Toy_Rocket",[3784.05,13024.5,0],[],0,"CAN_COLLIDE"];
	_this = _item588;
	_objects pushback _this;
	_objectIDs pushback 588;
	_this setPosWorld [3784.05,13024.5,8.21045];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item602 = objNull;
if (_layerRoot) then {
	_item602 = createVehicle ["Christmas_Snowman_Pack",[3726.9,12977.6,-0.000445366],[],0,"CAN_COLLIDE"];
	_this = _item602;
	_objects pushback _this;
	_objectIDs pushback 602;
	_this setPosWorld [3726.9,12977.6,9.80867];
	_this setVectorDirAndUp [[0.579069,0.815278,-0.0007702],[0.000488106,0.00059802,1]];
};

private _item603 = objNull;
if (_layerRoot) then {
	_item603 = createVehicle ["Christmas_Snowman_Pack",[3724.46,13090.2,0],[],0,"CAN_COLLIDE"];
	_this = _item603;
	_objects pushback _this;
	_objectIDs pushback 603;
	_this setPosWorld [3724.46,13090.2,6.46365];
	_this setVectorDirAndUp [[0.806765,0.590391,-0.0238484],[0.00260669,0.0368047,0.999319]];
};

private _item604 = objNull;
if (_layerRoot) then {
	_item604 = createVehicle ["Christmas_Snowman_Pack",[3643.22,13111.4,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item604;
	_objects pushback _this;
	_objectIDs pushback 604;
	_this setPosWorld [3643.22,13111.4,5.69245];
	_this setVectorDirAndUp [[0.594581,0.804036,0.000580646],[-0.000976562,0,1]];
};

private _item608 = objNull;
if (_layerRoot) then {
	_item608 = createVehicle ["sapin",[3649.18,13110,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item608;
	_objects pushback _this;
	_objectIDs pushback 608;
	_this setPosWorld [3649.18,13110,7.9741];
	_this setVectorDirAndUp [[-0.816878,0.57681,-0.000523765],[-0.00260671,-0.00278359,0.999993]];
};

private _item611 = objNull;
if (_layerRoot) then {
	_item611 = createVehicle ["Christmas_Merry_Tree",[3640.62,13108,0],[],0,"CAN_COLLIDE"];
	_this = _item611;
	_objects pushback _this;
	_objectIDs pushback 611;
	_this setPosWorld [3640.62,13108,5.41262];
	_this setVectorDirAndUp [[0.996768,-0.0803309,0.000973406],[-0.000976562,0,1]];
};

private _item612 = objNull;
if (_layerRoot) then {
	_item612 = createVehicle ["Christmas_Merry_Tree",[3655.36,13107.6,-1.00136e-005],[],0,"CAN_COLLIDE"];
	_this = _item612;
	_objects pushback _this;
	_objectIDs pushback 612;
	_this setPosWorld [3655.36,13107.6,5.42784];
	_this setVectorDirAndUp [[-0.999874,-0.0157247,0.00199247],[0.00201303,-0.00129157,0.999997]];
};

private _item613 = objNull;
if (_layerRoot) then {
	_item613 = createVehicle ["Christmas_Happy_Snowman_Bucket",[3655.55,13111.6,-2.76566e-005],[],0,"CAN_COLLIDE"];
	_this = _item613;
	_objects pushback _this;
	_objectIDs pushback 613;
	_this setPosWorld [3655.55,13111.6,4.9286];
	_this setVectorDirAndUp [[0.0291537,0.999572,-0.0023994],[0.00201303,0.00234171,0.999995]];
};

private _item614 = objNull;
if (_layerRoot) then {
	_item614 = createVehicle ["Christmas_Candy_Cane_01",[3636.27,13167.7,0],[],0,"CAN_COLLIDE"];
	_this = _item614;
	_objects pushback _this;
	_objectIDs pushback 614;
	_this setPosWorld [3636.27,13167.7,4.91418];
	_this setVectorDirAndUp [[0,1,-0.000845728],[0,0.000845728,1]];
};

private _item615 = objNull;
if (_layerRoot) then {
	_item615 = createVehicle ["Christmas_Candy_Cane_01",[3635.74,13161.6,-7.15256e-007],[],0,"CAN_COLLIDE"];
	_this = _item615;
	_objects pushback _this;
	_objectIDs pushback 615;
	_this setPosWorld [3635.74,13161.6,4.92421];
	_this setVectorDirAndUp [[0,0.999995,-0.00325724],[0.00158197,0.00325723,0.999993]];
};

private _item616 = objNull;
if (_layerRoot) then {
	_item616 = createVehicle ["Christmas_Candy_Cane_01",[3683.13,13173,0],[],0,"CAN_COLLIDE"];
	_this = _item616;
	_objects pushback _this;
	_objectIDs pushback 616;
	_this setPosWorld [3683.13,13173,5.08659];
	_this setVectorDirAndUp [[0,1,-0.000845728],[-0.00304931,0.000845724,0.999995]];
};

private _item617 = objNull;
if (_layerRoot) then {
	_item617 = createVehicle ["Christmas_Candy_Cane_01",[3689.13,13180.2,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item617;
	_objects pushback _this;
	_objectIDs pushback 617;
	_this setPosWorld [3689.12,13180.2,5.11364];
	_this setVectorDirAndUp [[0.995916,-0.0901431,0.00510027],[-0.00512112,0,0.999987]];
};

private _item618 = objNull;
if (_layerRoot) then {
	_item618 = createVehicle ["Christmas_Candy_Cane_01",[3696.64,13173,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item618;
	_objects pushback _this;
	_objectIDs pushback 618;
	_this setPosWorld [3696.64,13173,5.11798];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item619 = objNull;
if (_layerRoot) then {
	_item619 = createVehicle ["Christmas_Candy_Cane_01",[3697.35,13158.8,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item619;
	_objects pushback _this;
	_objectIDs pushback 619;
	_this setPosWorld [3697.35,13158.8,5.11772];
	_this setVectorDirAndUp [[0,1,0],[-0.00195312,0,0.999998]];
};

private _item620 = objNull;
if (_layerRoot) then {
	_item620 = createVehicle ["Christmas_Candy_Cane_01",[3683.34,13159.1,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item620;
	_objects pushback _this;
	_objectIDs pushback 620;
	_this setPosWorld [3683.34,13159.1,5.07617];
	_this setVectorDirAndUp [[0,0.999996,0.00299007],[-0.00343536,-0.00299005,0.99999]];
};

private _item621 = objNull;
if (_layerRoot) then {
	_item621 = createVehicle ["Christmas_Candy_Cane_01",[3690.07,13151.9,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item621;
	_objects pushback _this;
	_objectIDs pushback 621;
	_this setPosWorld [3690.06,13151.9,5.07297];
	_this setVectorDirAndUp [[0.999247,0.0378479,0.00853787],[-0.00836508,-0.00472128,0.999954]];
};

private _item622 = objNull;
if (_layerRoot) then {
	_item622 = createVehicle ["Christmas_Candy_Cane_01",[3640.42,13112.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item622;
	_objects pushback _this;
	_objectIDs pushback 622;
	_this setPosWorld [3640.42,13112.8,4.92476];
	_this setVectorDirAndUp [[0,1,0],[-0.000976562,0,1]];
};

private _item624 = objNull;
if (_layerRoot) then {
	_item624 = createVehicle ["Christmas_Whole_Tree",[3690.36,13107.4,0],[],0,"CAN_COLLIDE"];
	_this = _item624;
	_objects pushback _this;
	_objectIDs pushback 624;
	_this setPosWorld [3690.36,13107.4,4.93177];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item625 = objNull;
if (_layerRoot) then {
	_item625 = createVehicle ["Christmas_Whole_Tree",[3690.95,13095.7,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item625;
	_objects pushback _this;
	_objectIDs pushback 625;
	_this setPosWorld [3690.95,13095.7,4.96502];
	_this setVectorDirAndUp [[0,0.999987,-0.00515592],[0.00185901,0.00515591,0.999985]];
};

private _item626 = objNull;
if (_layerRoot) then {
	_item626 = createVehicle ["Christmas_Happy_Snowman",[3687.86,13107.4,-1.33514e-005],[],0,"CAN_COLLIDE"];
	_this = _item626;
	_objects pushback _this;
	_objectIDs pushback 626;
	_this setPosWorld [3687.86,13107.4,4.90694];
	_this setVectorDirAndUp [[0.999559,0.0297098,0],[0,0,1]];
};

private _item627 = objNull;
if (_layerRoot) then {
	_item627 = createVehicle ["Christmas_Happy_Snowman",[3693.72,13095.8,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item627;
	_objects pushback _this;
	_objectIDs pushback 627;
	_this setPosWorld [3693.72,13095.8,4.9348];
	_this setVectorDirAndUp [[-0.999416,-0.0341191,0.00203387],[0.00185901,0.00515591,0.999985]];
};

private _item628 = objNull;
if (_layerRoot) then {
	_item628 = createVehicle ["Christmas_Happy_Snowman_Bucket",[3693.57,13107.3,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item628;
	_objects pushback _this;
	_objectIDs pushback 628;
	_this setPosWorld [3693.57,13107.3,4.88595];
	_this setVectorDirAndUp [[0.122661,0.992447,-0.00158656],[0.00176031,0.00138107,0.999997]];
};

private _item629 = objNull;
if (_layerRoot) then {
	_item629 = createVehicle ["Christmas_Happy_Snowman_Bucket",[3687.86,13095.7,-1.04904e-005],[],0,"CAN_COLLIDE"];
	_this = _item629;
	_objects pushback _this;
	_objectIDs pushback 629;
	_this setPosWorld [3687.86,13095.7,4.92371];
	_this setVectorDirAndUp [[-0.0916147,-0.99578,0.00539251],[0,0.00541528,0.999985]];
};

private _item631 = objNull;
if (_layerRoot) then {
	_item631 = createVehicle ["RRP_Gift",[3651.64,13110.9,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item631;
	_objects pushback _this;
	_objectIDs pushback 631;
	_this setPosWorld [3651.64,13110.9,4.14474];
	_this setVectorDirAndUp [[-0.344959,-0.938615,0.00207887],[-0.000345267,0.00234171,0.999997]];
};

private _item632 = objNull;
if (_layerRoot) then {
	_item632 = createVehicle ["Christmas_Gift_Medium_Box",[3650.69,13110.5,-0.407502],[],0,"CAN_COLLIDE"];
	_this = _item632;
	_objects pushback _this;
	_objectIDs pushback 632;
	_this setPosWorld [3650.69,13110.5,3.91193];
	_this setVectorDirAndUp [[0.179949,-0.983676,0.000464943],[-0.00258374,0,0.999997]];
};

private _item633 = objNull;
if (_layerRoot) then {
	_item633 = createVehicle ["Christmas_Gift_Medium_Pattern",[3652.38,13110.4,0],[],0,"CAN_COLLIDE"];
	_this = _item633;
	_objects pushback _this;
	_objectIDs pushback 633;
	_this setPosWorld [3652.38,13110.4,4.02459];
	_this setVectorDirAndUp [[0.178725,-0.983896,0.00236572],[-0.000345267,0.00234171,0.999997]];
};

private _item634 = objNull;
if (_layerRoot) then {
	_item634 = createVehicle ["Christmas_Gift_Medium_Tree",[3651.56,13109.7,0],[],0,"CAN_COLLIDE"];
	_this = _item634;
	_objects pushback _this;
	_objectIDs pushback 634;
	_this setPosWorld [3651.56,13109.7,4.0222];
	_this setVectorDirAndUp [[-0.805607,0.59245,-0.000450846],[-0.00260671,-0.00278359,0.999993]];
};

private _item635 = objNull;
if (_layerRoot) then {
	_item635 = createVehicle ["RRP_Gift",[3647.32,13111.8,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item635;
	_objects pushback _this;
	_objectIDs pushback 635;
	_this setPosWorld [3647.32,13111.8,4.1335];
	_this setVectorDirAndUp [[-0.344958,-0.938618,-0.000891285],[-0.00258374,0,0.999997]];
};

private _item636 = objNull;
if (_layerRoot) then {
	_item636 = createVehicle ["Christmas_Gift_Medium_Box",[3646.42,13109,-0.407545],[],0,"CAN_COLLIDE"];
	_this = _item636;
	_objects pushback _this;
	_objectIDs pushback 636;
	_this setPosWorld [3646.42,13109,3.89808];
	_this setVectorDirAndUp [[0.179949,-0.983673,-0.00226908],[-0.00260671,-0.00278359,0.999993]];
};

private _item637 = objNull;
if (_layerRoot) then {
	_item637 = createVehicle ["Christmas_Gift_Medium_Pattern",[3648.99,13111.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item637;
	_objects pushback _this;
	_objectIDs pushback 637;
	_this setPosWorld [3648.99,13111.1,4.01629];
	_this setVectorDirAndUp [[0.178724,-0.983899,0.000461779],[-0.00258374,0,0.999997]];
};

private _item638 = objNull;
if (_layerRoot) then {
	_item638 = createVehicle ["Christmas_Gift_Medium_Tree",[3647.62,13107.8,0],[],0,"CAN_COLLIDE"];
	_this = _item638;
	_objects pushback _this;
	_objectIDs pushback 638;
	_this setPosWorld [3647.62,13107.8,4.00672];
	_this setVectorDirAndUp [[-0.805607,0.59245,-0.000450846],[-0.00260671,-0.00278359,0.999993]];
};

private _item641 = objNull;
if (_layerRoot) then {
	_item641 = createVehicle ["Christmas_Gift_Medium_Pattern",[3722.71,13107.8,0],[],0,"CAN_COLLIDE"];
	_this = _item641;
	_objects pushback _this;
	_objectIDs pushback 641;
	_this setPosWorld [3722.71,13107.8,4.25202];
	_this setVectorDirAndUp [[0.985839,-0.167694,-0.000471957],[0.00682713,0.037323,0.99928]];
};

private _item642 = objNull;
if (_layerRoot) then {
	_item642 = createVehicle ["Christmas_Gift_Medium_Tree",[3723,13106.9,0],[],0,"CAN_COLLIDE"];
	_this = _item642;
	_objects pushback _this;
	_objectIDs pushback 642;
	_this setPosWorld [3723,13106.9,4.28021];
	_this setVectorDirAndUp [[-0.83154,-0.555365,0.0105474],[-0.00461935,0.0259018,0.999654]];
};

private _item643 = objNull;
if (_layerRoot) then {
	_item643 = createVehicle ["RRP_Gift",[3722.3,13107.2,0],[],0,"CAN_COLLIDE"];
	_this = _item643;
	_objects pushback _this;
	_objectIDs pushback 643;
	_this setPosWorld [3722.3,13107.2,4.39159];
	_this setVectorDirAndUp [[0.764839,-0.643904,0.0202183],[-0.00461935,0.0259018,0.999654]];
};

private _item644 = objNull;
if (_layerRoot) then {
	_item644 = createVehicle ["Christmas_Gift_Medium_Box",[3722.13,13106.5,-0.407232],[],0,"CAN_COLLIDE"];
	_this = _item644;
	_objects pushback _this;
	_objectIDs pushback 644;
	_this setPosWorld [3722.13,13106.5,4.17811];
	_this setVectorDirAndUp [[0.9861,-0.165915,0.00885569],[-0.00461935,0.0259018,0.999654]];
};

private _item645 = objNull;
if (_layerRoot) then {
	_item645 = createVehicle ["Christmas_Gift_Medium_Pattern",[3787.38,13025.6,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item645;
	_objects pushback _this;
	_objectIDs pushback 645;
	_this setPosWorld [3787.38,13025.6,8.13267];
	_this setVectorDirAndUp [[0.178725,-0.983899,0],[0,0,1]];
};

private _item646 = objNull;
if (_layerRoot) then {
	_item646 = createVehicle ["Christmas_Gift_Medium_Tree",[3786.67,13025.3,0],[],0,"CAN_COLLIDE"];
	_this = _item646;
	_objects pushback _this;
	_objectIDs pushback 646;
	_this setPosWorld [3786.67,13025.3,8.13262];
	_this setVectorDirAndUp [[-0.805609,0.592447,0],[0,0,1]];
};

private _item647 = objNull;
if (_layerRoot) then {
	_item647 = createVehicle ["RRP_Gift",[3786.69,13026,0],[],0,"CAN_COLLIDE"];
	_this = _item647;
	_objects pushback _this;
	_objectIDs pushback 647;
	_this setPosWorld [3786.69,13026,8.25444];
	_this setVectorDirAndUp [[-0.344959,-0.938618,0],[0,0,1]];
};

private _item648 = objNull;
if (_layerRoot) then {
	_item648 = createVehicle ["Christmas_Gift_Medium_Box",[3785.74,13025.6,-0.408207],[],0,"CAN_COLLIDE"];
	_this = _item648;
	_objects pushback _this;
	_objectIDs pushback 648;
	_this setPosWorld [3785.74,13025.6,8.02313];
	_this setVectorDirAndUp [[0.17995,-0.983676,0],[0,0,1]];
};

private _item649 = objNull;
if (_layerRoot) then {
	_item649 = createVehicle ["Christmas_Gift_Medium_Pattern",[3786.26,13024.5,0],[],0,"CAN_COLLIDE"];
	_this = _item649;
	_objects pushback _this;
	_objectIDs pushback 649;
	_this setPosWorld [3786.26,13024.5,8.13249];
	_this setVectorDirAndUp [[0.178725,-0.983899,0],[0,0,1]];
};

private _item650 = objNull;
if (_layerRoot) then {
	_item650 = createVehicle ["Christmas_Gift_Medium_Tree",[3785.58,13023.9,0],[],0,"CAN_COLLIDE"];
	_this = _item650;
	_objects pushback _this;
	_objectIDs pushback 650;
	_this setPosWorld [3785.58,13023.9,8.1324];
	_this setVectorDirAndUp [[-0.805609,0.592447,0],[0,0,1]];
};

private _item651 = objNull;
if (_layerRoot) then {
	_item651 = createVehicle ["RRP_Gift",[3785.6,13024.7,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item651;
	_objects pushback _this;
	_objectIDs pushback 651;
	_this setPosWorld [3785.6,13024.7,8.25422];
	_this setVectorDirAndUp [[-0.344959,-0.938618,0],[0,0,1]];
};

private _item652 = objNull;
if (_layerRoot) then {
	_item652 = createVehicle ["Christmas_Gift_Medium_Box",[3784.87,13024.6,-0.40841],[],0,"CAN_COLLIDE"];
	_this = _item652;
	_objects pushback _this;
	_objectIDs pushback 652;
	_this setPosWorld [3784.87,13024.6,8.02276];
	_this setVectorDirAndUp [[0.17995,-0.983676,0],[0,0,1]];
};

private _item653 = objNull;
if (_layerRoot) then {
	_item653 = createVehicle ["Christmas_Gift_Medium_Pattern",[3787.26,13023.1,0],[],0,"CAN_COLLIDE"];
	_this = _item653;
	_objects pushback _this;
	_objectIDs pushback 653;
	_this setPosWorld [3787.26,13023.1,8.13223];
	_this setVectorDirAndUp [[0.178725,-0.983899,0],[0,0,1]];
};

private _item654 = objNull;
if (_layerRoot) then {
	_item654 = createVehicle ["Christmas_Gift_Medium_Tree",[3786.55,13023.1,0],[],0,"CAN_COLLIDE"];
	_this = _item654;
	_objects pushback _this;
	_objectIDs pushback 654;
	_this setPosWorld [3786.55,13023.1,8.13224];
	_this setVectorDirAndUp [[-0.805609,0.592447,0],[0,0,1]];
};

private _item655 = objNull;
if (_layerRoot) then {
	_item655 = createVehicle ["RRP_Gift",[3786.57,13023.8,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item655;
	_objects pushback _this;
	_objectIDs pushback 655;
	_this setPosWorld [3786.57,13023.8,8.25405];
	_this setVectorDirAndUp [[-0.344959,-0.938618,0],[0,0,1]];
};

private _item656 = objNull;
if (_layerRoot) then {
	_item656 = createVehicle ["Christmas_Gift_Medium_Box",[3785.69,13023.1,-0.408408],[],0,"CAN_COLLIDE"];
	_this = _item656;
	_objects pushback _this;
	_objectIDs pushback 656;
	_this setPosWorld [3785.69,13023.1,8.0225];
	_this setVectorDirAndUp [[0.17995,-0.983676,0],[0,0,1]];
};

private _item657 = objNull;
if (_layerRoot) then {
	_item657 = createVehicle ["Christmas_Gift_Medium_Pattern",[3788.03,13024.4,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item657;
	_objects pushback _this;
	_objectIDs pushback 657;
	_this setPosWorld [3788.03,13024.4,8.13539];
	_this setVectorDirAndUp [[0.178722,-0.983899,0.000983458],[-0.00550263,0,0.999985]];
};

private _item658 = objNull;
if (_layerRoot) then {
	_item658 = createVehicle ["Christmas_Gift_Medium_Tree",[3787.35,13023.9,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item658;
	_objects pushback _this;
	_objectIDs pushback 658;
	_this setPosWorld [3787.35,13023.9,8.13237];
	_this setVectorDirAndUp [[-0.805609,0.592447,0],[0,0,1]];
};

private _item659 = objNull;
if (_layerRoot) then {
	_item659 = createVehicle ["RRP_Gift",[3787.37,13024.6,3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item659;
	_objects pushback _this;
	_objectIDs pushback 659;
	_this setPosWorld [3787.37,13024.6,8.25418];
	_this setVectorDirAndUp [[-0.344959,-0.938618,0],[0,0,1]];
};

private _item660 = objNull;
if (_layerRoot) then {
	_item660 = createVehicle ["Christmas_Gift_Medium_Box",[3788.12,13025.3,-0.408279],[],0,"CAN_COLLIDE"];
	_this = _item660;
	_objects pushback _this;
	_objectIDs pushback 660;
	_this setPosWorld [3788.11,13025.3,8.02636];
	_this setVectorDirAndUp [[0.179947,-0.983676,0.000990196],[-0.00550263,0,0.999985]];
};

private _item661 = objNull;
if (_layerRoot) then {
	_item661 = createVehicle ["Christmas_Candy_Cane_01",[3723.31,13087.9,0],[],0,"CAN_COLLIDE"];
	_this = _item661;
	_objects pushback _this;
	_objectIDs pushback 661;
	_this setPosWorld [3723.31,13087.9,5.78555];
	_this setVectorDirAndUp [[0.891537,0.452549,-0.0189928],[0.00260669,0.0368047,0.999319]];
};

private _item662 = objNull;
if (_layerRoot) then {
	_item662 = createVehicle ["Christmas_Sleigh_Bench",[3693.28,13161,-0.000360966],[],0,"CAN_COLLIDE"];
	_this = _item662;
	_objects pushback _this;
	_objectIDs pushback 662;
	_this setPosWorld [3693.28,13161,4.7896];
	_this setVectorDirAndUp [[0.864796,-0.502121,0.00168906],[-0.00195312,0,0.999998]];
};

private _item663 = objNull;
if (_layerRoot) then {
	_item663 = createVehicle ["etoile",[3656.45,13117.4,3.89905],[],0,"CAN_COLLIDE"];
	_this = _item663;
	_objects pushback _this;
	_objectIDs pushback 663;
	_this setPosWorld [3656.45,13117.4,-106.366];
	_this setVectorDirAndUp [[-0.0571234,-0.998367,0],[0,0,1]];
};

private _item664 = objNull;
if (_layerRoot) then {
	_item664 = createVehicle ["etoile",[3638.74,13102.9,3.61015],[],0,"CAN_COLLIDE"];
	_this = _item664;
	_objects pushback _this;
	_objectIDs pushback 664;
	_this setPosWorld [3638.74,13102.9,-106.672];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item665 = objNull;
if (_layerRoot) then {
	_item665 = createVehicle ["etoile",[3640.84,13118.5,3.61015],[],0,"CAN_COLLIDE"];
	_this = _item665;
	_objects pushback _this;
	_objectIDs pushback 665;
	_this setPosWorld [3640.84,13118.5,-106.669];
	_this setVectorDirAndUp [[-0.0831081,-0.996541,0],[0,0,1]];
};

private _item666 = objNull;
if (_layerRoot) then {
	_item666 = createVehicle ["etoile",[3685.98,13094.9,3.61015],[],0,"CAN_COLLIDE"];
	_this = _item666;
	_objects pushback _this;
	_objectIDs pushback 666;
	_this setPosWorld [3685.98,13094.9,-106.657];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item667 = objNull;
if (_layerRoot) then {
	_item667 = createVehicle ["etoile",[3685.89,13108.6,3.61015],[],0,"CAN_COLLIDE"];
	_this = _item667;
	_objects pushback _this;
	_objectIDs pushback 667;
	_this setPosWorld [3685.89,13108.6,-106.696];
	_this setVectorDirAndUp [[-0.027527,-0.999621,0],[0,0,1]];
};

private _item668 = objNull;
if (_layerRoot) then {
	_item668 = createVehicle ["etoile",[3695.17,13094.8,3.61022],[],0,"CAN_COLLIDE"];
	_this = _item668;
	_objects pushback _this;
	_objectIDs pushback 668;
	_this setPosWorld [3695.17,13094.8,-106.658];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item669 = objNull;
if (_layerRoot) then {
	_item669 = createVehicle ["etoile",[3695.59,13108.4,3.61014],[],0,"CAN_COLLIDE"];
	_this = _item669;
	_objects pushback _this;
	_objectIDs pushback 669;
	_this setPosWorld [3695.59,13108.4,-106.704];
	_this setVectorDirAndUp [[0.0802066,-0.996778,0],[0,0,1]];
};

private _item670 = objNull;
if (_layerRoot) then {
	_item670 = createVehicle ["etoile",[3715.26,13087.1,3.61016],[],0,"CAN_COLLIDE"];
	_this = _item670;
	_objects pushback _this;
	_objectIDs pushback 670;
	_this setPosWorld [3715.26,13087.1,-105.807];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item671 = objNull;
if (_layerRoot) then {
	_item671 = createVehicle ["etoile",[3715.47,13113.2,3.6102],[],0,"CAN_COLLIDE"];
	_this = _item671;
	_objects pushback _this;
	_objectIDs pushback 671;
	_this setPosWorld [3715.47,13113.2,-106.567];
	_this setVectorDirAndUp [[-0.115985,-0.993251,0],[0,0,1]];
};

private _item672 = objNull;
if (_layerRoot) then {
	_item672 = createVehicle ["Christmas_Penguin_Light",[3689.79,13159.7,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item672;
	_objects pushback _this;
	_objectIDs pushback 672;
	_this setPosWorld [3689.79,13159.7,4.56056];
	_this setVectorDirAndUp [[0,0.999998,0.00221044],[-0.00265204,-0.00221043,0.999994]];
};

private _item673 = objNull;
if (_layerRoot) then {
	_item673 = createVehicle ["Christmas_Polar_Bear_Light",[3693.12,13165.3,0],[],0,"CAN_COLLIDE"];
	_this = _item673;
	_objects pushback _this;
	_objectIDs pushback 673;
	_this setPosWorld [3693.12,13165.3,4.69723];
	_this setVectorDirAndUp [[-0.309157,0.951011,0.00020048],[-0.00195312,-0.000845733,0.999998]];
};

private _item674 = objNull;
if (_layerRoot) then {
	_item674 = createVehicle ["Christmas_Reindeer_Light",[3685.15,13161,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item674;
	_objects pushback _this;
	_objectIDs pushback 674;
	_this setPosWorld [3685.15,13161,4.99706];
	_this setVectorDirAndUp [[-0.892215,-0.451599,-0.00336444],[-0.00265204,-0.00221043,0.999994]];
};

private _item675 = objNull;
if (_layerRoot) then {
	_item675 = createVehicle ["Christmas_Penguin_Light",[3685.11,13151.3,-3.33786e-006],[],0,"CAN_COLLIDE"];
	_this = _item675;
	_objects pushback _this;
	_objectIDs pushback 675;
	_this setPosWorld [3685.11,13151.3,4.51481];
	_this setVectorDirAndUp [[0,0.999982,0.00595024],[-0.00467067,-0.00595018,0.999971]];
};

private _item676 = objNull;
if (_layerRoot) then {
	_item676 = createVehicle ["Christmas_Polar_Bear_Light",[3682.83,13170,0],[],0,"CAN_COLLIDE"];
	_this = _item676;
	_objects pushback _this;
	_objectIDs pushback 676;
	_this setPosWorld [3682.83,13170,4.67339];
	_this setVectorDirAndUp [[0.970657,-0.24045,0.0027565],[-0.00304931,-0.00084573,0.999995]];
};

private _item677 = objNull;
if (_layerRoot) then {
	_item677 = createVehicle ["Christmas_Reindeer_Light",[3693.49,13155.9,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item677;
	_objects pushback _this;
	_objectIDs pushback 677;
	_this setPosWorld [3693.49,13155.9,5.0132];
	_this setVectorDirAndUp [[0.386342,-0.922355,-0.000438109],[-0.0041432,-0.00221042,0.999989]];
};

private _item682 = objNull;
if (_layerRoot) then {
	_item682 = createVehicle ["Christmas_Whole_Tree",[3725.8,13091.8,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item682;
	_objects pushback _this;
	_objectIDs pushback 682;
	_this setPosWorld [3725.8,13091.8,5.68175];
	_this setVectorDirAndUp [[0,0.999493,-0.0318486],[-0.00236703,0.0318485,0.99949]];
};

private _item683 = objNull;
if (_layerRoot) then {
	_item683 = createVehicle ["Christmas_Toy_Rocket",[3784.19,13025.1,-0.000115395],[],0,"CAN_COLLIDE"];
	_this = _item683;
	_objects pushback _this;
	_objectIDs pushback 683;
	_this setPosWorld [3784.19,13025.1,8.21043];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item684 = objNull;
if (_layerRoot) then {
	_item684 = createVehicle ["Christmas_Toy_Rocket",[3784.63,13025.4,-0.000115395],[],0,"CAN_COLLIDE"];
	_this = _item684;
	_objects pushback _this;
	_objectIDs pushback 684;
	_this setPosWorld [3784.63,13025.4,8.21049];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item686 = objNull;
if (_layerRoot) then {
	_item686 = createVehicle ["Christmas_Toy_Rocket",[3652.43,13107.8,0],[],0,"CAN_COLLIDE"];
	_this = _item686;
	_objects pushback _this;
	_objectIDs pushback 686;
	_this setPosWorld [3652.43,13107.8,4.09711];
	_this setVectorDirAndUp [[0,0.999996,0.0027836],[-0.00260671,-0.00278359,0.999993]];
};

private _item687 = objNull;
if (_layerRoot) then {
	_item687 = createVehicle ["Christmas_Toy_Rocket",[3652.35,13109.3,0],[],0,"CAN_COLLIDE"];
	_this = _item687;
	_objects pushback _this;
	_objectIDs pushback 687;
	_this setPosWorld [3652.35,13109.3,4.10126];
	_this setVectorDirAndUp [[0,0.999996,0.0027836],[-0.00260671,-0.00278359,0.999993]];
};

private _item688 = objNull;
if (_layerRoot) then {
	_item688 = createVehicle ["Christmas_Toy_Rocket",[3642.98,13108,0],[],0,"CAN_COLLIDE"];
	_this = _item688;
	_objects pushback _this;
	_objectIDs pushback 688;
	_this setPosWorld [3642.98,13108,4.08165];
	_this setVectorDirAndUp [[0,1,0],[-0.000976562,0,1]];
};

private _item689 = objNull;
if (_layerRoot) then {
	_item689 = createVehicle ["sapin",[4587.23,15395.4,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item689;
	_objects pushback _this;
	_objectIDs pushback 689;
	_this setPosWorld [4587.23,15395.4,263.03];
	_this setVectorDirAndUp [[-0.348444,-0.937105,-0.0205003],[-0.0080009,-0.0188966,0.999789]];
};

private _item690 = objNull;
if (_layerRoot) then {
	_item690 = createVehicle ["Christmas_Bunny_Left",[4589.13,15396.1,-0.00088501],[],0,"CAN_COLLIDE"];
	_this = _item690;
	_objects pushback _this;
	_objectIDs pushback 690;
	_this setPosWorld [4589.13,15396.1,259.605];
	_this setVectorDirAndUp [[0.209416,0.977619,0.0201534],[-0.0080009,-0.0188966,0.999789]];
};

private _item691 = objNull;
if (_layerRoot) then {
	_item691 = createVehicle ["Christmas_Toy_Train",[4587.54,15393,-0.000427246],[],0,"CAN_COLLIDE"];
	_this = _item691;
	_objects pushback _this;
	_objectIDs pushback 691;
	_this setPosWorld [4587.54,15393,259.239];
	_this setVectorDirAndUp [[0.565905,-0.824397,-0.0110529],[-0.0080009,-0.0188966,0.999789]];
};

private _item692 = objNull;
if (_layerRoot) then {
	_item692 = createVehicle ["Christmas_Car_Light",[4589.33,15393.9,-0.000610352],[],0,"CAN_COLLIDE"];
	_this = _item692;
	_objects pushback _this;
	_objectIDs pushback 692;
	_this setPosWorld [4589.33,15393.9,259.337];
	_this setVectorDirAndUp [[-0.88788,0.460073,0.0015903],[-0.0080009,-0.0188966,0.999789]];
};

private _item693 = objNull;
if (_layerRoot) then {
	_item693 = createVehicle ["Christmas_Toy_Rocket",[4586.42,15392.9,-0.00012207],[],0,"CAN_COLLIDE"];
	_this = _item693;
	_objects pushback _this;
	_objectIDs pushback 693;
	_this setPosWorld [4586.42,15392.9,259.108];
	_this setVectorDirAndUp [[-0.945274,0.326184,0.00782273],[0.00689627,-0.00399657,0.999968]];
};

private _item694 = objNull;
if (_layerRoot) then {
	_item694 = createVehicle ["Christmas_Gift_Medium_Pattern",[4586.49,15396.4,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item694;
	_objects pushback _this;
	_objectIDs pushback 694;
	_this setPosWorld [4586.49,15396.4,259.086];
	_this setVectorDirAndUp [[0.988315,-0.152341,0.00502974],[-0.0080009,-0.0188966,0.999789]];
};

private _item695 = objNull;
if (_layerRoot) then {
	_item695 = createVehicle ["Christmas_Gift_Medium_Tree",[4586.58,15395.6,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item695;
	_objects pushback _this;
	_objectIDs pushback 695;
	_this setPosWorld [4586.58,15395.6,259.072];
	_this setVectorDirAndUp [[-0.822931,-0.567878,-0.0173188],[-0.0080009,-0.0188966,0.999789]];
};

private _item696 = objNull;
if (_layerRoot) then {
	_item696 = createVehicle ["RRP_Gift",[4585.88,15395.9,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item696;
	_objects pushback _this;
	_objectIDs pushback 696;
	_this setPosWorld [4585.88,15395.9,259.193];
	_this setVectorDirAndUp [[0.774585,-0.632444,-0.00575487],[-0.0080009,-0.0188966,0.999789]];
};

private _item697 = objNull;
if (_layerRoot) then {
	_item697 = createVehicle ["Christmas_Gift_Medium_Box",[4585.95,15394.9,-0.408264],[],0,"CAN_COLLIDE"];
	_this = _item697;
	_objects pushback _this;
	_objectIDs pushback 697;
	_this setPosWorld [4585.95,15394.9,258.944];
	_this setVectorDirAndUp [[0.988504,-0.151111,0.0050545],[-0.0080009,-0.0188966,0.999789]];
};

private _item698 = objNull;
if (_layerRoot) then {
	_item698 = createVehicle ["Christmas_Gift_Medium_Pattern",[4587.18,15395,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item698;
	_objects pushback _this;
	_objectIDs pushback 698;
	_this setPosWorld [4587.18,15395,259.065];
	_this setVectorDirAndUp [[0.988315,-0.152341,0.00502974],[-0.0080009,-0.0188966,0.999789]];
};

private _item699 = objNull;
if (_layerRoot) then {
	_item699 = createVehicle ["Christmas_Gift_Medium_Tree",[4587.48,15394.1,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item699;
	_objects pushback _this;
	_objectIDs pushback 699;
	_this setPosWorld [4587.48,15394.1,259.052];
	_this setVectorDirAndUp [[-0.822931,-0.567878,-0.0173188],[-0.0080009,-0.0188966,0.999789]];
};

private _item700 = objNull;
if (_layerRoot) then {
	_item700 = createVehicle ["RRP_Gift",[4586.78,15394.4,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item700;
	_objects pushback _this;
	_objectIDs pushback 700;
	_this setPosWorld [4586.78,15394.4,259.173];
	_this setVectorDirAndUp [[0.774585,-0.632444,-0.00575487],[-0.0080009,-0.0188966,0.999789]];
};

private _item701 = objNull;
if (_layerRoot) then {
	_item701 = createVehicle ["Christmas_Gift_Medium_Box",[4586.63,15393.7,-0.408234],[],0,"CAN_COLLIDE"];
	_this = _item701;
	_objects pushback _this;
	_objectIDs pushback 701;
	_this setPosWorld [4586.62,15393.7,258.927];
	_this setVectorDirAndUp [[0.988504,-0.151111,0.0050545],[-0.0080009,-0.0188966,0.999789]];
};

private _item702 = objNull;
if (_layerRoot) then {
	_item702 = createVehicle ["Christmas_Gift_Medium_Pattern",[4588.86,15395.4,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item702;
	_objects pushback _this;
	_objectIDs pushback 702;
	_this setPosWorld [4588.86,15395.4,259.087];
	_this setVectorDirAndUp [[0.988315,-0.152341,0.00502974],[-0.0080009,-0.0188966,0.999789]];
};

private _item703 = objNull;
if (_layerRoot) then {
	_item703 = createVehicle ["Christmas_Gift_Medium_Tree",[4588.61,15394.8,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item703;
	_objects pushback _this;
	_objectIDs pushback 703;
	_this setPosWorld [4588.61,15394.8,259.073];
	_this setVectorDirAndUp [[-0.822931,-0.567878,-0.0173188],[-0.0080009,-0.0188966,0.999789]];
};

private _item704 = objNull;
if (_layerRoot) then {
	_item704 = createVehicle ["RRP_Gift",[4587.91,15395,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item704;
	_objects pushback _this;
	_objectIDs pushback 704;
	_this setPosWorld [4587.91,15395,259.194];
	_this setVectorDirAndUp [[0.774585,-0.632444,-0.00575487],[-0.0080009,-0.0188966,0.999789]];
};

private _item705 = objNull;
if (_layerRoot) then {
	_item705 = createVehicle ["Christmas_Gift_Medium_Box",[4588.27,15394,-0.408234],[],0,"CAN_COLLIDE"];
	_this = _item705;
	_objects pushback _this;
	_objectIDs pushback 705;
	_this setPosWorld [4588.27,15394,258.946];
	_this setVectorDirAndUp [[0.988504,-0.151111,0.0050545],[-0.0080009,-0.0188966,0.999789]];
};

private _item706 = objNull;
if (_layerRoot) then {
	_item706 = createVehicle ["Christmas_Gift_Medium_Pattern",[4587.81,15396.6,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item706;
	_objects pushback _this;
	_objectIDs pushback 706;
	_this setPosWorld [4587.81,15396.6,259.101];
	_this setVectorDirAndUp [[0.988315,-0.152341,0.00502974],[-0.0080009,-0.0188966,0.999789]];
};

private _item707 = objNull;
if (_layerRoot) then {
	_item707 = createVehicle ["Christmas_Gift_Medium_Tree",[4588.11,15395.8,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item707;
	_objects pushback _this;
	_objectIDs pushback 707;
	_this setPosWorld [4588.11,15395.8,259.088];
	_this setVectorDirAndUp [[-0.822931,-0.567878,-0.0173188],[-0.0080009,-0.0188966,0.999789]];
};

private _item708 = objNull;
if (_layerRoot) then {
	_item708 = createVehicle ["RRP_Gift",[4587.42,15396.1,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item708;
	_objects pushback _this;
	_objectIDs pushback 708;
	_this setPosWorld [4587.42,15396.1,259.209];
	_this setVectorDirAndUp [[0.774585,-0.632444,-0.00575487],[-0.0080009,-0.0188966,0.999789]];
};

private _item709 = objNull;
if (_layerRoot) then {
	_item709 = createVehicle ["Christmas_Gift_Medium_Box",[4587.07,15397,-0.408752],[],0,"CAN_COLLIDE"];
	_this = _item709;
	_objects pushback _this;
	_objectIDs pushback 709;
	_this setPosWorld [4587.07,15397,258.992];
	_this setVectorDirAndUp [[0.988504,-0.151111,0.0050545],[-0.0080009,-0.0188966,0.999789]];
};

private _item710 = objNull;
if (_layerRoot) then {
	_item710 = createVehicle ["Christmas_Toy_Rocket",[4585.97,15393.2,-0.000152588],[],0,"CAN_COLLIDE"];
	_this = _item710;
	_objects pushback _this;
	_objectIDs pushback 710;
	_this setPosWorld [4585.97,15393.2,259.112];
	_this setVectorDirAndUp [[-0.945206,0.326382,0.00782305],[0.00689627,-0.00399657,0.999968]];
};

private _item711 = objNull;
if (_layerRoot) then {
	_item711 = createVehicle ["Christmas_Toy_Rocket",[4585.77,15393.7,-0.00012207],[],0,"CAN_COLLIDE"];
	_this = _item711;
	_objects pushback _this;
	_objectIDs pushback 711;
	_this setPosWorld [4585.78,15393.7,259.115];
	_this setVectorDirAndUp [[-0.945206,0.326382,0.00782305],[0.00689627,-0.00399657,0.999968]];
};

private _item712 = objNull;
if (_layerRoot) then {
	_item712 = createVehicle ["sapin",[12849.9,16695.1,0],[],0,"CAN_COLLIDE"];
	_this = _item712;
	_objects pushback _this;
	_objectIDs pushback 712;
	_this setPosWorld [12849.9,16695.1,86.4023];
	_this setVectorDirAndUp [[-0.999726,0.0234168,0],[0,0,1]];
};

private _item713 = objNull;
if (_layerRoot) then {
	_item713 = createVehicle ["Christmas_Bunny_Left",[12851.3,16693.6,-0.00111389],[],0,"CAN_COLLIDE"];
	_this = _item713;
	_objects pushback _this;
	_objectIDs pushback 713;
	_this setPosWorld [12851.3,16693.6,82.9469];
	_this setVectorDirAndUp [[0.992626,0.121221,0],[0,0,1]];
};

private _item714 = objNull;
if (_layerRoot) then {
	_item714 = createVehicle ["Christmas_Toy_Train",[12847.8,16694.1,-0.00050354],[],0,"CAN_COLLIDE"];
	_this = _item714;
	_objects pushback _this;
	_objectIDs pushback 714;
	_this setPosWorld [12847.8,16694.1,82.6532];
	_this setVectorDirAndUp [[-0.594747,-0.803913,0],[0,0,1]];
};

private _item715 = objNull;
if (_layerRoot) then {
	_item715 = createVehicle ["Christmas_Car_Light",[12849.2,16692.7,0],[],0,"CAN_COLLIDE"];
	_this = _item715;
	_objects pushback _this;
	_objectIDs pushback 715;
	_this setPosWorld [12849.2,16692.7,82.7216];
	_this setVectorDirAndUp [[0.145209,0.989401,0],[0,0,1]];
};

private _item716 = objNull;
if (_layerRoot) then {
	_item716 = createVehicle ["Christmas_Toy_Rocket",[12847.3,16695.1,-0.000297546],[],0,"CAN_COLLIDE"];
	_this = _item716;
	_objects pushback _this;
	_objectIDs pushback 716;
	_this setPosWorld [12847.3,16695.1,82.5227];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item717 = objNull;
if (_layerRoot) then {
	_item717 = createVehicle ["Christmas_Gift_Medium_Pattern",[12850.7,16696.2,0],[],0,"CAN_COLLIDE"];
	_this = _item717;
	_objects pushback _this;
	_objectIDs pushback 717;
	_this setPosWorld [12850.7,16696.2,82.4451];
	_this setVectorDirAndUp [[0.178725,-0.983899,0],[0,0,1]];
};

private _item718 = objNull;
if (_layerRoot) then {
	_item718 = createVehicle ["Christmas_Gift_Medium_Tree",[12850,16695.8,0],[],0,"CAN_COLLIDE"];
	_this = _item718;
	_objects pushback _this;
	_objectIDs pushback 718;
	_this setPosWorld [12850,16695.8,82.4451];
	_this setVectorDirAndUp [[-0.805609,0.592447,0],[0,0,1]];
};

private _item719 = objNull;
if (_layerRoot) then {
	_item719 = createVehicle ["RRP_Gift",[12850,16696.6,0],[],0,"CAN_COLLIDE"];
	_this = _item719;
	_objects pushback _this;
	_objectIDs pushback 719;
	_this setPosWorld [12850,16696.6,82.5668];
	_this setVectorDirAndUp [[-0.344959,-0.938618,0],[0,0,1]];
};

private _item720 = objNull;
if (_layerRoot) then {
	_item720 = createVehicle ["Christmas_Gift_Medium_Box",[12849,16696.2,-0.408302],[],0,"CAN_COLLIDE"];
	_this = _item720;
	_objects pushback _this;
	_objectIDs pushback 720;
	_this setPosWorld [12849,16696.2,82.3355];
	_this setVectorDirAndUp [[0.17995,-0.983676,0],[0,0,1]];
};

private _item721 = objNull;
if (_layerRoot) then {
	_item721 = createVehicle ["Christmas_Gift_Medium_Pattern",[12849.5,16695,0],[],0,"CAN_COLLIDE"];
	_this = _item721;
	_objects pushback _this;
	_objectIDs pushback 721;
	_this setPosWorld [12849.5,16695,82.4451];
	_this setVectorDirAndUp [[0.178725,-0.983899,0],[0,0,1]];
};

private _item722 = objNull;
if (_layerRoot) then {
	_item722 = createVehicle ["Christmas_Gift_Medium_Tree",[12848.9,16694.5,0],[],0,"CAN_COLLIDE"];
	_this = _item722;
	_objects pushback _this;
	_objectIDs pushback 722;
	_this setPosWorld [12848.9,16694.5,82.4451];
	_this setVectorDirAndUp [[-0.805609,0.592447,0],[0,0,1]];
};

private _item723 = objNull;
if (_layerRoot) then {
	_item723 = createVehicle ["RRP_Gift",[12848.9,16695.2,0],[],0,"CAN_COLLIDE"];
	_this = _item723;
	_objects pushback _this;
	_objectIDs pushback 723;
	_this setPosWorld [12848.9,16695.2,82.5668];
	_this setVectorDirAndUp [[-0.344959,-0.938618,0],[0,0,1]];
};

private _item724 = objNull;
if (_layerRoot) then {
	_item724 = createVehicle ["Christmas_Gift_Medium_Box",[12848.2,16695.2,-0.408302],[],0,"CAN_COLLIDE"];
	_this = _item724;
	_objects pushback _this;
	_objectIDs pushback 724;
	_this setPosWorld [12848.2,16695.2,82.3355];
	_this setVectorDirAndUp [[0.17995,-0.983676,0],[0,0,1]];
};

private _item725 = objNull;
if (_layerRoot) then {
	_item725 = createVehicle ["Christmas_Gift_Medium_Pattern",[12850.5,16693.6,0],[],0,"CAN_COLLIDE"];
	_this = _item725;
	_objects pushback _this;
	_objectIDs pushback 725;
	_this setPosWorld [12850.5,16693.6,82.4451];
	_this setVectorDirAndUp [[0.178725,-0.983899,0],[0,0,1]];
};

private _item726 = objNull;
if (_layerRoot) then {
	_item726 = createVehicle ["Christmas_Gift_Medium_Tree",[12849.8,16693.6,0],[],0,"CAN_COLLIDE"];
	_this = _item726;
	_objects pushback _this;
	_objectIDs pushback 726;
	_this setPosWorld [12849.8,16693.6,82.4451];
	_this setVectorDirAndUp [[-0.805609,0.592447,0],[0,0,1]];
};

private _item727 = objNull;
if (_layerRoot) then {
	_item727 = createVehicle ["RRP_Gift",[12849.8,16694.4,0],[],0,"CAN_COLLIDE"];
	_this = _item727;
	_objects pushback _this;
	_objectIDs pushback 727;
	_this setPosWorld [12849.8,16694.4,82.5668];
	_this setVectorDirAndUp [[-0.344959,-0.938618,0],[0,0,1]];
};

private _item728 = objNull;
if (_layerRoot) then {
	_item728 = createVehicle ["Christmas_Gift_Medium_Box",[12849,16693.7,-0.408302],[],0,"CAN_COLLIDE"];
	_this = _item728;
	_objects pushback _this;
	_objectIDs pushback 728;
	_this setPosWorld [12849,16693.7,82.3355];
	_this setVectorDirAndUp [[0.17995,-0.983676,0],[0,0,1]];
};

private _item729 = objNull;
if (_layerRoot) then {
	_item729 = createVehicle ["Christmas_Gift_Medium_Pattern",[12851.3,16695,0],[],0,"CAN_COLLIDE"];
	_this = _item729;
	_objects pushback _this;
	_objectIDs pushback 729;
	_this setPosWorld [12851.3,16695,82.4451];
	_this setVectorDirAndUp [[0.178725,-0.983899,0],[0,0,1]];
};

private _item730 = objNull;
if (_layerRoot) then {
	_item730 = createVehicle ["Christmas_Gift_Medium_Tree",[12850.6,16694.4,0],[],0,"CAN_COLLIDE"];
	_this = _item730;
	_objects pushback _this;
	_objectIDs pushback 730;
	_this setPosWorld [12850.6,16694.4,82.4451];
	_this setVectorDirAndUp [[-0.805609,0.592447,0],[0,0,1]];
};

private _item731 = objNull;
if (_layerRoot) then {
	_item731 = createVehicle ["RRP_Gift",[12850.6,16695.2,0],[],0,"CAN_COLLIDE"];
	_this = _item731;
	_objects pushback _this;
	_objectIDs pushback 731;
	_this setPosWorld [12850.6,16695.2,82.5668];
	_this setVectorDirAndUp [[-0.344959,-0.938618,0],[0,0,1]];
};

private _item732 = objNull;
if (_layerRoot) then {
	_item732 = createVehicle ["Christmas_Gift_Medium_Box",[12851.4,16695.8,-0.408226],[],0,"CAN_COLLIDE"];
	_this = _item732;
	_objects pushback _this;
	_objectIDs pushback 732;
	_this setPosWorld [12851.4,16695.8,82.3355];
	_this setVectorDirAndUp [[0.17995,-0.983676,0],[0,0,1]];
};

private _item733 = objNull;
if (_layerRoot) then {
	_item733 = createVehicle ["Christmas_Toy_Rocket",[12847.5,16695.6,-0.000335693],[],0,"CAN_COLLIDE"];
	_this = _item733;
	_objects pushback _this;
	_objectIDs pushback 733;
	_this setPosWorld [12847.5,16695.6,82.5227];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item734 = objNull;
if (_layerRoot) then {
	_item734 = createVehicle ["Christmas_Toy_Rocket",[12847.9,16696,-0.000335693],[],0,"CAN_COLLIDE"];
	_this = _item734;
	_objects pushback _this;
	_objectIDs pushback 734;
	_this setPosWorld [12847.9,16696,82.5227];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item735 = objNull;
if (_layerRoot) then {
	_item735 = createVehicle ["sapin",[14027,18809.7,0],[],0,"CAN_COLLIDE"];
	_this = _item735;
	_objects pushback _this;
	_objectIDs pushback 735;
	_this setPosWorld [14027,18809.7,27.9233];
	_this setVectorDirAndUp [[-0.999721,0.0234723,0.00253998],[0.00300962,0.0199946,0.999796]];
};

private _item736 = objNull;
if (_layerRoot) then {
	_item736 = createVehicle ["Christmas_Bunny_Left",[14028.3,18808.2,-0.000167847],[],0,"CAN_COLLIDE"];
	_this = _item736;
	_objects pushback _this;
	_objectIDs pushback 736;
	_this setPosWorld [14028.3,18808.2,24.4958];
	_this setVectorDirAndUp [[0.992621,0.121137,-0.00541059],[0.00300962,0.0199946,0.999796]];
};

private _item737 = objNull;
if (_layerRoot) then {
	_item737 = createVehicle ["Christmas_Toy_Train",[14024.9,18808.7,-5.72205e-006],[],0,"CAN_COLLIDE"];
	_this = _item737;
	_objects pushback _this;
	_objectIDs pushback 737;
	_this setPosWorld [14024.9,18808.7,24.1915];
	_this setVectorDirAndUp [[-0.594688,-0.803951,0.00292892],[-0.0139989,0.0139976,0.999804]];
};

private _item738 = objNull;
if (_layerRoot) then {
	_item738 = createVehicle ["Christmas_Car_Light",[14026.2,18807.2,-0.000106812],[],0,"CAN_COLLIDE"];
	_this = _item738;
	_objects pushback _this;
	_objectIDs pushback 738;
	_this setPosWorld [14026.2,18807.2,24.285];
	_this setVectorDirAndUp [[0.145209,0.98931,-0.0134122],[-0.0029901,0.0139946,0.999898]];
};

private _item739 = objNull;
if (_layerRoot) then {
	_item739 = createVehicle ["Christmas_Toy_Rocket",[14024.4,18809.7,3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item739;
	_objects pushback _this;
	_objectIDs pushback 739;
	_this setPosWorld [14024.4,18809.7,24.0399];
	_this setVectorDirAndUp [[0,0.999902,-0.0139989],[-0.0139989,0.0139976,0.999804]];
};

private _item740 = objNull;
if (_layerRoot) then {
	_item740 = createVehicle ["Christmas_Gift_Medium_Pattern",[14027.7,18810.7,0],[],0,"CAN_COLLIDE"];
	_this = _item740;
	_objects pushback _this;
	_objectIDs pushback 740;
	_this setPosWorld [14027.7,18810.7,23.9448];
	_this setVectorDirAndUp [[0.178724,-0.983749,0.0171689],[0.00299007,0.0179929,0.999834]];
};

private _item741 = objNull;
if (_layerRoot) then {
	_item741 = createVehicle ["Christmas_Gift_Medium_Tree",[14027,18810.4,0],[],0,"CAN_COLLIDE"];
	_this = _item741;
	_objects pushback _this;
	_objectIDs pushback 741;
	_this setPosWorld [14027,18810.4,23.953];
	_this setVectorDirAndUp [[-0.805606,0.592394,-0.00825143],[0.00299007,0.0179929,0.999834]];
};

private _item742 = objNull;
if (_layerRoot) then {
	_item742 = createVehicle ["RRP_Gift",[14027,18811.2,0],[],0,"CAN_COLLIDE"];
	_this = _item742;
	_objects pushback _this;
	_objectIDs pushback 742;
	_this setPosWorld [14027,18811.2,24.0612];
	_this setVectorDirAndUp [[-0.344958,-0.938447,0.0179198],[0.00299007,0.0179929,0.999834]];
};

private _item743 = objNull;
if (_layerRoot) then {
	_item743 = createVehicle ["Christmas_Gift_Medium_Box",[14026.1,18810.7,-0.408031],[],0,"CAN_COLLIDE"];
	_this = _item743;
	_objects pushback _this;
	_objectIDs pushback 743;
	_this setPosWorld [14026.1,18810.7,23.8403];
	_this setVectorDirAndUp [[0.179949,-0.983526,0.0171613],[0.00299007,0.0179929,0.999834]];
};

private _item744 = objNull;
if (_layerRoot) then {
	_item744 = createVehicle ["Christmas_Gift_Medium_Pattern",[14026.6,18809.6,0],[],0,"CAN_COLLIDE"];
	_this = _item744;
	_objects pushback _this;
	_objectIDs pushback 744;
	_this setPosWorld [14026.6,18809.6,23.969];
	_this setVectorDirAndUp [[0.178724,-0.983713,0.019135],[0.00300962,0.0199946,0.999796]];
};

private _item745 = objNull;
if (_layerRoot) then {
	_item745 = createVehicle ["Christmas_Gift_Medium_Tree",[14025.9,18809.1,0],[],0,"CAN_COLLIDE"];
	_this = _item745;
	_objects pushback _this;
	_objectIDs pushback 745;
	_this setPosWorld [14025.9,18809.1,23.9819];
	_this setVectorDirAndUp [[-0.805606,0.592355,-0.0106997],[-0.0029901,0.0139946,0.999898]];
};

private _item746 = objNull;
if (_layerRoot) then {
	_item746 = createVehicle ["RRP_Gift",[14025.9,18809.8,0],[],0,"CAN_COLLIDE"];
	_this = _item746;
	_objects pushback _this;
	_objectIDs pushback 746;
	_this setPosWorld [14025.9,18809.8,24.0888];
	_this setVectorDirAndUp [[-0.344958,-0.938409,0.0198054],[0.00300962,0.0199946,0.999796]];
};

private _item747 = objNull;
if (_layerRoot) then {
	_item747 = createVehicle ["Christmas_Gift_Medium_Box",[14025.2,18809.7,-0.407909],[],0,"CAN_COLLIDE"];
	_this = _item747;
	_objects pushback _this;
	_objectIDs pushback 747;
	_this setPosWorld [14025.2,18809.7,23.8613];
	_this setVectorDirAndUp [[0.179949,-0.983572,0.0143042],[-0.0029901,0.0139946,0.999898]];
};

private _item748 = objNull;
if (_layerRoot) then {
	_item748 = createVehicle ["Christmas_Gift_Medium_Pattern",[14027.6,18808.2,0],[],0,"CAN_COLLIDE"];
	_this = _item748;
	_objects pushback _this;
	_objectIDs pushback 748;
	_this setPosWorld [14027.6,18808.2,23.9946];
	_this setVectorDirAndUp [[0.178724,-0.983713,0.019135],[0.00300962,0.0199946,0.999796]];
};

private _item749 = objNull;
if (_layerRoot) then {
	_item749 = createVehicle ["Christmas_Gift_Medium_Tree",[14026.9,18808.2,0],[],0,"CAN_COLLIDE"];
	_this = _item749;
	_objects pushback _this;
	_objectIDs pushback 749;
	_this setPosWorld [14026.9,18808.2,23.9963];
	_this setVectorDirAndUp [[-0.805606,0.592377,-0.00942171],[0.00300962,0.0199946,0.999796]];
};

private _item750 = objNull;
if (_layerRoot) then {
	_item750 = createVehicle ["RRP_Gift",[14026.9,18809,0],[],0,"CAN_COLLIDE"];
	_this = _item750;
	_objects pushback _this;
	_objectIDs pushback 750;
	_this setPosWorld [14026.9,18809,24.1031];
	_this setVectorDirAndUp [[-0.344958,-0.938409,0.0198054],[0.00300962,0.0199946,0.999796]];
};

private _item751 = objNull;
if (_layerRoot) then {
	_item751 = createVehicle ["Christmas_Gift_Medium_Box",[14026,18808.3,-0.407907],[],0,"CAN_COLLIDE"];
	_this = _item751;
	_objects pushback _this;
	_objectIDs pushback 751;
	_this setPosWorld [14026,18808.3,23.8842];
	_this setVectorDirAndUp [[0.179949,-0.983572,0.0143042],[-0.0029901,0.0139946,0.999898]];
};

private _item752 = objNull;
if (_layerRoot) then {
	_item752 = createVehicle ["Christmas_Gift_Medium_Pattern",[14028.3,18809.6,0],[],0,"CAN_COLLIDE"];
	_this = _item752;
	_objects pushback _this;
	_objectIDs pushback 752;
	_this setPosWorld [14028.3,18809.6,23.9648];
	_this setVectorDirAndUp [[0.178724,-0.983713,0.019135],[0.00300962,0.0199946,0.999796]];
};

private _item753 = objNull;
if (_layerRoot) then {
	_item753 = createVehicle ["Christmas_Gift_Medium_Tree",[14027.7,18809,0],[],0,"CAN_COLLIDE"];
	_this = _item753;
	_objects pushback _this;
	_objectIDs pushback 753;
	_this setPosWorld [14027.7,18809,23.978];
	_this setVectorDirAndUp [[-0.805606,0.592377,-0.00942171],[0.00300962,0.0199946,0.999796]];
};

private _item754 = objNull;
if (_layerRoot) then {
	_item754 = createVehicle ["RRP_Gift",[14027.7,18809.8,0],[],0,"CAN_COLLIDE"];
	_this = _item754;
	_objects pushback _this;
	_objectIDs pushback 754;
	_this setPosWorld [14027.7,18809.8,24.0847];
	_this setVectorDirAndUp [[-0.344958,-0.938409,0.0198054],[0.00300962,0.0199946,0.999796]];
};

private _item755 = objNull;
if (_layerRoot) then {
	_item755 = createVehicle ["Christmas_Gift_Medium_Box",[14028.4,18810.4,-0.408007],[],0,"CAN_COLLIDE"];
	_this = _item755;
	_objects pushback _this;
	_objectIDs pushback 755;
	_this setPosWorld [14028.4,18810.4,23.8398];
	_this setVectorDirAndUp [[0.179949,-0.983526,0.0171613],[0.00299007,0.0179929,0.999834]];
};

private _item756 = objNull;
if (_layerRoot) then {
	_item756 = createVehicle ["Christmas_Toy_Rocket",[14024.5,18810.2,-1.71661e-005],[],0,"CAN_COLLIDE"];
	_this = _item756;
	_objects pushback _this;
	_objectIDs pushback 756;
	_this setPosWorld [14024.5,18810.2,24.0338];
	_this setVectorDirAndUp [[0,0.999838,-0.0179929],[-0.0139947,0.0179912,0.99974]];
};

private _item757 = objNull;
if (_layerRoot) then {
	_item757 = createVehicle ["Christmas_Toy_Rocket",[14025,18810.6,-5.14984e-005],[],0,"CAN_COLLIDE"];
	_this = _item757;
	_objects pushback _this;
	_objectIDs pushback 757;
	_this setPosWorld [14024.9,18810.6,24.0334];
	_this setVectorDirAndUp [[0,0.999838,-0.0179929],[-0.0139947,0.0179912,0.99974]];
};

private _item758 = objNull;
if (_layerRoot) then {
	_item758 = createVehicle ["sapin",[16590.1,12716,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item758;
	_objects pushback _this;
	_objectIDs pushback 758;
	_this setPosWorld [16590.1,12716,18.3612];
	_this setVectorDirAndUp [[-0.999724,0.0234087,0.0020765],[0.00198347,-0.00399666,0.99999]];
};

private _item759 = objNull;
if (_layerRoot) then {
	_item759 = createVehicle ["Christmas_Bunny_Left",[16591.4,12714.5,0],[],0,"CAN_COLLIDE"];
	_this = _item759;
	_objects pushback _this;
	_objectIDs pushback 759;
	_this setPosWorld [16591.4,12714.5,14.8981];
	_this setVectorDirAndUp [[0.992624,0.121227,-0.00148435],[0.00198347,-0.00399666,0.99999]];
};

private _item760 = objNull;
if (_layerRoot) then {
	_item760 = createVehicle ["Christmas_Toy_Train",[16588,12715,0],[],0,"CAN_COLLIDE"];
	_this = _item760;
	_objects pushback _this;
	_objectIDs pushback 760;
	_this setPosWorld [16588,12715,14.6085];
	_this setVectorDirAndUp [[-0.594747,-0.803907,-0.00321297],[0,-0.00399666,0.999992]];
};

private _item761 = objNull;
if (_layerRoot) then {
	_item761 = createVehicle ["Christmas_Car_Light",[16589.3,12713.5,0],[],0,"CAN_COLLIDE"];
	_this = _item761;
	_objects pushback _this;
	_objectIDs pushback 761;
	_this setPosWorld [16589.3,12713.5,14.6708];
	_this setVectorDirAndUp [[0.145209,0.989393,0.0039543],[0,-0.00399666,0.999992]];
};

private _item762 = objNull;
if (_layerRoot) then {
	_item762 = createVehicle ["Christmas_Toy_Rocket",[16587.5,12716,0],[],0,"CAN_COLLIDE"];
	_this = _item762;
	_objects pushback _this;
	_objectIDs pushback 762;
	_this setPosWorld [16587.5,12716,14.482];
	_this setVectorDirAndUp [[0,0.999992,0.00399666],[0,-0.00399666,0.999992]];
};

private _item763 = objNull;
if (_layerRoot) then {
	_item763 = createVehicle ["Christmas_Gift_Medium_Pattern",[16590.8,12717.1,0],[],0,"CAN_COLLIDE"];
	_this = _item763;
	_objects pushback _this;
	_objectIDs pushback 763;
	_this setPosWorld [16590.8,12717.1,14.4067];
	_this setVectorDirAndUp [[0.178725,-0.98389,-0.00428681],[0.00198347,-0.00399666,0.99999]];
};

private _item764 = objNull;
if (_layerRoot) then {
	_item764 = createVehicle ["Christmas_Gift_Medium_Tree",[16590.1,12716.7,0],[],0,"CAN_COLLIDE"];
	_this = _item764;
	_objects pushback _this;
	_objectIDs pushback 764;
	_this setPosWorld [16590.1,12716.7,14.4068];
	_this setVectorDirAndUp [[-0.805608,0.592436,0.0039657],[0.00198347,-0.00399666,0.99999]];
};

private _item765 = objNull;
if (_layerRoot) then {
	_item765 = createVehicle ["RRP_Gift",[16590.1,12717.5,0],[],0,"CAN_COLLIDE"];
	_this = _item765;
	_objects pushback _this;
	_objectIDs pushback 765;
	_this setPosWorld [16590.1,12717.5,14.5314];
	_this setVectorDirAndUp [[-0.344959,-0.938613,-0.00306713],[0.00198347,-0.00399666,0.99999]];
};

private _item766 = objNull;
if (_layerRoot) then {
	_item766 = createVehicle ["Christmas_Gift_Medium_Box",[16589.2,12717.1,-0.407502],[],0,"CAN_COLLIDE"];
	_this = _item766;
	_objects pushback _this;
	_objectIDs pushback 766;
	_this setPosWorld [16589.2,12717.1,14.2995];
	_this setVectorDirAndUp [[0.17995,-0.983668,-0.00393142],[0,-0.00399666,0.999992]];
};

private _item767 = objNull;
if (_layerRoot) then {
	_item767 = createVehicle ["Christmas_Gift_Medium_Pattern",[16589.7,12715.9,0],[],0,"CAN_COLLIDE"];
	_this = _item767;
	_objects pushback _this;
	_objectIDs pushback 767;
	_this setPosWorld [16589.7,12715.9,14.4038];
	_this setVectorDirAndUp [[0.178725,-0.983891,-0.00393231],[0,-0.00399666,0.999992]];
};

private _item768 = objNull;
if (_layerRoot) then {
	_item768 = createVehicle ["Christmas_Gift_Medium_Tree",[16589,12715.4,0],[],0,"CAN_COLLIDE"];
	_this = _item768;
	_objects pushback _this;
	_objectIDs pushback 768;
	_this setPosWorld [16589,12715.4,14.4016];
	_this setVectorDirAndUp [[-0.805609,0.592442,0.00236781],[0,-0.00399666,0.999992]];
};

private _item769 = objNull;
if (_layerRoot) then {
	_item769 = createVehicle ["RRP_Gift",[16589,12716.1,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item769;
	_objects pushback _this;
	_objectIDs pushback 769;
	_this setPosWorld [16589,12716.1,14.5263];
	_this setVectorDirAndUp [[-0.344959,-0.93861,-0.00375134],[0,-0.00399666,0.999992]];
};

private _item770 = objNull;
if (_layerRoot) then {
	_item770 = createVehicle ["Christmas_Gift_Medium_Box",[16588.3,12716,-0.407502],[],0,"CAN_COLLIDE"];
	_this = _item770;
	_objects pushback _this;
	_objectIDs pushback 770;
	_this setPosWorld [16588.3,12716,14.2954];
	_this setVectorDirAndUp [[0.17995,-0.983668,-0.00393142],[0,-0.00399666,0.999992]];
};

private _item771 = objNull;
if (_layerRoot) then {
	_item771 = createVehicle ["Christmas_Gift_Medium_Pattern",[16590.7,12714.5,0],[],0,"CAN_COLLIDE"];
	_this = _item771;
	_objects pushback _this;
	_objectIDs pushback 771;
	_this setPosWorld [16590.7,12714.5,14.3967];
	_this setVectorDirAndUp [[0.178725,-0.98389,-0.00428681],[0.00198347,-0.00399666,0.99999]];
};

private _item772 = objNull;
if (_layerRoot) then {
	_item772 = createVehicle ["Christmas_Gift_Medium_Tree",[16590,12714.5,0],[],0,"CAN_COLLIDE"];
	_this = _item772;
	_objects pushback _this;
	_objectIDs pushback 772;
	_this setPosWorld [16590,12714.5,14.3982];
	_this setVectorDirAndUp [[-0.805609,0.592442,0.00236781],[0,-0.00399666,0.999992]];
};

private _item773 = objNull;
if (_layerRoot) then {
	_item773 = createVehicle ["RRP_Gift",[16590,12715.3,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item773;
	_objects pushback _this;
	_objectIDs pushback 773;
	_this setPosWorld [16590,12715.3,14.5229];
	_this setVectorDirAndUp [[-0.344959,-0.93861,-0.00375134],[0,-0.00399666,0.999992]];
};

private _item774 = objNull;
if (_layerRoot) then {
	_item774 = createVehicle ["Christmas_Gift_Medium_Box",[16589.1,12714.6,-0.407502],[],0,"CAN_COLLIDE"];
	_this = _item774;
	_objects pushback _this;
	_objectIDs pushback 774;
	_this setPosWorld [16589.1,12714.6,14.2896];
	_this setVectorDirAndUp [[0.17995,-0.983668,-0.00393142],[0,-0.00399666,0.999992]];
};

private _item775 = objNull;
if (_layerRoot) then {
	_item775 = createVehicle ["Christmas_Gift_Medium_Pattern",[16591.5,12715.9,0],[],0,"CAN_COLLIDE"];
	_this = _item775;
	_objects pushback _this;
	_objectIDs pushback 775;
	_this setPosWorld [16591.5,12715.9,14.4007];
	_this setVectorDirAndUp [[0.178725,-0.98389,-0.00428681],[0.00198347,-0.00399666,0.99999]];
};

private _item776 = objNull;
if (_layerRoot) then {
	_item776 = createVehicle ["Christmas_Gift_Medium_Tree",[16590.8,12715.3,0],[],0,"CAN_COLLIDE"];
	_this = _item776;
	_objects pushback _this;
	_objectIDs pushback 776;
	_this setPosWorld [16590.8,12715.3,14.3998];
	_this setVectorDirAndUp [[-0.805608,0.592436,0.0039657],[0.00198347,-0.00399666,0.99999]];
};

private _item777 = objNull;
if (_layerRoot) then {
	_item777 = createVehicle ["RRP_Gift",[16590.8,12716.1,0],[],0,"CAN_COLLIDE"];
	_this = _item777;
	_objects pushback _this;
	_objectIDs pushback 777;
	_this setPosWorld [16590.8,12716.1,14.5245];
	_this setVectorDirAndUp [[-0.344959,-0.938613,-0.00306713],[0.00198347,-0.00399666,0.99999]];
};

private _item778 = objNull;
if (_layerRoot) then {
	_item778 = createVehicle ["Christmas_Gift_Medium_Box",[16591.5,12716.7,-0.407503],[],0,"CAN_COLLIDE"];
	_this = _item778;
	_objects pushback _this;
	_objectIDs pushback 778;
	_this setPosWorld [16591.5,12716.7,14.2949];
	_this setVectorDirAndUp [[0.179949,-0.983667,-0.00428834],[0.00198347,-0.00399666,0.99999]];
};

private _item779 = objNull;
if (_layerRoot) then {
	_item779 = createVehicle ["Christmas_Toy_Rocket",[16587.6,12716.5,0],[],0,"CAN_COLLIDE"];
	_this = _item779;
	_objects pushback _this;
	_objectIDs pushback 779;
	_this setPosWorld [16587.6,12716.5,14.484];
	_this setVectorDirAndUp [[0,0.999992,0.00399666],[0,-0.00399666,0.999992]];
};

private _item780 = objNull;
if (_layerRoot) then {
	_item780 = createVehicle ["Christmas_Toy_Rocket",[16588.1,12716.9,0],[],0,"CAN_COLLIDE"];
	_this = _item780;
	_objects pushback _this;
	_objectIDs pushback 780;
	_this setPosWorld [16588.1,12716.9,14.4855];
	_this setVectorDirAndUp [[0,0.999992,0.00399666],[0,-0.00399666,0.999992]];
};

private _item804 = objNull;
if (_layerRoot) then {
	_item804 = createVehicle ["sapin",[25834.3,21462.7,0],[],0,"CAN_COLLIDE"];
	_this = _item804;
	_objects pushback _this;
	_objectIDs pushback 804;
	_this setPosWorld [25834.3,21462.7,24.964];
	_this setVectorDirAndUp [[-0.998803,0.022943,0.043199],[0.0429558,-0.0109896,0.999017]];
};

private _item805 = objNull;
if (_layerRoot) then {
	_item805 = createVehicle ["Christmas_Bunny_Left",[25835.6,21461.2,-0.00160217],[],0,"CAN_COLLIDE"];
	_this = _item805;
	_objects pushback _this;
	_objectIDs pushback 805;
	_this setPosWorld [25835.6,21461.2,21.4347];
	_this setVectorDirAndUp [[0.991709,0.121682,-0.0413031],[0.0429558,-0.0109896,0.999017]];
};

private _item806 = objNull;
if (_layerRoot) then {
	_item806 = createVehicle ["Christmas_Toy_Train",[25832.2,21461.7,-0.00110054],[],0,"CAN_COLLIDE"];
	_this = _item806;
	_objects pushback _this;
	_objectIDs pushback 806;
	_this setPosWorld [25832.2,21461.7,21.2982];
	_this setVectorDirAndUp [[-0.594091,-0.804089,0.0222989],[0.0469434,-0.00698297,0.998873]];
};

private _item807 = objNull;
if (_layerRoot) then {
	_item807 = createVehicle ["Christmas_Car_Light",[25833.5,21460.2,-0.00132942],[],0,"CAN_COLLIDE"];
	_this = _item807;
	_objects pushback _this;
	_objectIDs pushback 807;
	_this setPosWorld [25833.5,21460.2,21.2921];
	_this setVectorDirAndUp [[0.145049,0.989424,0.000100128],[0.0469434,-0.00698297,0.998873]];
};

private _item808 = objNull;
if (_layerRoot) then {
	_item808 = createVehicle ["Christmas_Toy_Rocket",[25831.7,21462.7,-0.000663757],[],0,"CAN_COLLIDE"];
	_this = _item808;
	_objects pushback _this;
	_objectIDs pushback 808;
	_this setPosWorld [25831.7,21462.7,21.198];
	_this setVectorDirAndUp [[0,0.999976,0.00699068],[0.0469434,-0.00698297,0.998873]];
};

private _item809 = objNull;
if (_layerRoot) then {
	_item809 = createVehicle ["Christmas_Gift_Medium_Pattern",[25835,21463.7,0],[],0,"CAN_COLLIDE"];
	_this = _item809;
	_objects pushback _this;
	_objectIDs pushback 809;
	_this setPosWorld [25835,21463.7,20.9867];
	_this setVectorDirAndUp [[0.17856,-0.983755,-0.0184995],[0.0429558,-0.0109896,0.999017]];
};

private _item810 = objNull;
if (_layerRoot) then {
	_item810 = createVehicle ["Christmas_Gift_Medium_Tree",[25834.3,21463.4,0],[],0,"CAN_COLLIDE"];
	_this = _item810;
	_objects pushback _this;
	_objectIDs pushback 810;
	_this setPosWorld [25834.3,21463.4,21.0133];
	_this setVectorDirAndUp [[-0.804866,0.59203,0.0411203],[0.0429558,-0.0109896,0.999017]];
};

private _item811 = objNull;
if (_layerRoot) then {
	_item811 = createVehicle ["RRP_Gift",[25834.3,21464.2,0],[],0,"CAN_COLLIDE"];
	_this = _item811;
	_objects pushback _this;
	_objectIDs pushback 811;
	_this setPosWorld [25834.3,21464.2,21.1424];
	_this setVectorDirAndUp [[-0.344641,-0.938724,0.00449256],[0.0429558,-0.0109896,0.999017]];
};

private _item812 = objNull;
if (_layerRoot) then {
	_item812 = createVehicle ["Christmas_Gift_Medium_Box",[25833.4,21463.8,-0.409296],[],0,"CAN_COLLIDE"];
	_this = _item812;
	_objects pushback _this;
	_objectIDs pushback 812;
	_this setPosWorld [25833.4,21463.8,20.9468];
	_this setVectorDirAndUp [[0.179784,-0.983531,-0.0185496],[0.0429558,-0.0109896,0.999017]];
};

private _item813 = objNull;
if (_layerRoot) then {
	_item813 = createVehicle ["Christmas_Gift_Medium_Pattern",[25833.9,21462.6,0],[],0,"CAN_COLLIDE"];
	_this = _item813;
	_objects pushback _this;
	_objectIDs pushback 813;
	_this setPosWorld [25833.9,21462.6,21.0224];
	_this setVectorDirAndUp [[0.17856,-0.983755,-0.0184995],[0.0429558,-0.0109896,0.999017]];
};

private _item814 = objNull;
if (_layerRoot) then {
	_item814 = createVehicle ["Christmas_Gift_Medium_Tree",[25833.2,21462.1,0],[],0,"CAN_COLLIDE"];
	_this = _item814;
	_objects pushback _this;
	_objectIDs pushback 814;
	_this setPosWorld [25833.2,21462.1,21.0456];
	_this setVectorDirAndUp [[-0.804866,0.59203,0.0411203],[0.0429558,-0.0109896,0.999017]];
};

private _item815 = objNull;
if (_layerRoot) then {
	_item815 = createVehicle ["RRP_Gift",[25833.2,21462.8,0],[],0,"CAN_COLLIDE"];
	_this = _item815;
	_objects pushback _this;
	_objectIDs pushback 815;
	_this setPosWorld [25833.2,21462.8,21.1747];
	_this setVectorDirAndUp [[-0.344641,-0.938724,0.00449256],[0.0429558,-0.0109896,0.999017]];
};

private _item816 = objNull;
if (_layerRoot) then {
	_item816 = createVehicle ["Christmas_Gift_Medium_Box",[25832.5,21462.7,-0.409346],[],0,"CAN_COLLIDE"];
	_this = _item816;
	_objects pushback _this;
	_objectIDs pushback 816;
	_this setPosWorld [25832.5,21462.7,20.9729];
	_this setVectorDirAndUp [[0.179784,-0.983531,-0.0185496],[0.0429558,-0.0109896,0.999017]];
};

private _item817 = objNull;
if (_layerRoot) then {
	_item817 = createVehicle ["Christmas_Gift_Medium_Pattern",[25834.9,21461.2,0],[],0,"CAN_COLLIDE"];
	_this = _item817;
	_objects pushback _this;
	_objectIDs pushback 817;
	_this setPosWorld [25834.9,21461.2,20.9635];
	_this setVectorDirAndUp [[0.17856,-0.983755,-0.0184995],[0.0429558,-0.0109896,0.999017]];
};

private _item818 = objNull;
if (_layerRoot) then {
	_item818 = createVehicle ["Christmas_Gift_Medium_Tree",[25834.2,21461.2,0],[],0,"CAN_COLLIDE"];
	_this = _item818;
	_objects pushback _this;
	_objectIDs pushback 818;
	_this setPosWorld [25834.2,21461.2,20.9946];
	_this setVectorDirAndUp [[-0.804866,0.59203,0.0411203],[0.0429558,-0.0109896,0.999017]];
};

private _item819 = objNull;
if (_layerRoot) then {
	_item819 = createVehicle ["RRP_Gift",[25834.2,21462,0],[],0,"CAN_COLLIDE"];
	_this = _item819;
	_objects pushback _this;
	_objectIDs pushback 819;
	_this setPosWorld [25834.2,21462,21.1237];
	_this setVectorDirAndUp [[-0.344641,-0.938724,0.00449256],[0.0429558,-0.0109896,0.999017]];
};

private _item820 = objNull;
if (_layerRoot) then {
	_item820 = createVehicle ["Christmas_Gift_Medium_Box",[25833.3,21461.3,-0.409451],[],0,"CAN_COLLIDE"];
	_this = _item820;
	_objects pushback _this;
	_objectIDs pushback 820;
	_this setPosWorld [25833.3,21461.3,20.9232];
	_this setVectorDirAndUp [[0.179751,-0.983593,-0.0153238],[0.0469434,-0.00698297,0.998873]];
};

private _item821 = objNull;
if (_layerRoot) then {
	_item821 = createVehicle ["Christmas_Gift_Medium_Pattern",[25835.7,21462.6,0],[],0,"CAN_COLLIDE"];
	_this = _item821;
	_objects pushback _this;
	_objectIDs pushback 821;
	_this setPosWorld [25835.7,21462.6,20.9457];
	_this setVectorDirAndUp [[0.17856,-0.983755,-0.0184995],[0.0429558,-0.0109896,0.999017]];
};

private _item822 = objNull;
if (_layerRoot) then {
	_item822 = createVehicle ["Christmas_Gift_Medium_Tree",[25835,21462,0],[],0,"CAN_COLLIDE"];
	_this = _item822;
	_objects pushback _this;
	_objectIDs pushback 822;
	_this setPosWorld [25835,21462,20.9689];
	_this setVectorDirAndUp [[-0.804866,0.59203,0.0411203],[0.0429558,-0.0109896,0.999017]];
};

private _item823 = objNull;
if (_layerRoot) then {
	_item823 = createVehicle ["RRP_Gift",[25835,21462.8,0],[],0,"CAN_COLLIDE"];
	_this = _item823;
	_objects pushback _this;
	_objectIDs pushback 823;
	_this setPosWorld [25835,21462.8,21.0979];
	_this setVectorDirAndUp [[-0.344641,-0.938724,0.00449256],[0.0429558,-0.0109896,0.999017]];
};

private _item824 = objNull;
if (_layerRoot) then {
	_item824 = createVehicle ["Christmas_Gift_Medium_Box",[25835.7,21463.4,-0.409376],[],0,"CAN_COLLIDE"];
	_this = _item824;
	_objects pushback _this;
	_objectIDs pushback 824;
	_this setPosWorld [25835.8,21463.4,20.8408];
	_this setVectorDirAndUp [[0.179784,-0.983531,-0.0185496],[0.0429558,-0.0109896,0.999017]];
};

private _item825 = objNull;
if (_layerRoot) then {
	_item825 = createVehicle ["Christmas_Toy_Rocket",[25831.8,21463.2,-0.000543594],[],0,"CAN_COLLIDE"];
	_this = _item825;
	_objects pushback _this;
	_objectIDs pushback 825;
	_this setPosWorld [25831.8,21463.2,21.1953];
	_this setVectorDirAndUp [[0,0.99994,0.0109998],[0.0429558,-0.0109896,0.999017]];
};

private _item826 = objNull;
if (_layerRoot) then {
	_item826 = createVehicle ["Christmas_Toy_Rocket",[25832.3,21463.6,-0.000484467],[],0,"CAN_COLLIDE"];
	_this = _item826;
	_objects pushback _this;
	_objectIDs pushback 826;
	_this setPosWorld [25832.3,21463.6,21.1802];
	_this setVectorDirAndUp [[0,0.99994,0.0109998],[0.0429558,-0.0109896,0.999017]];
};

private _item827 = objNull;
if (_layerRoot) then {
	_item827 = createVehicle ["sapin",[11218.7,8711.14,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item827;
	_objects pushback _this;
	_objectIDs pushback 827;
	_this setPosWorld [11218.7,8711.14,176.855];
	_this setVectorDirAndUp [[-0.999713,0.0234358,0.00506731],[0.00515584,0.00371858,0.99998]];
};

private _item828 = objNull;
if (_layerRoot) then {
	_item828 = createVehicle ["Christmas_Bunny_Left",[11220,8709.59,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item828;
	_objects pushback _this;
	_objectIDs pushback 828;
	_this setPosWorld [11220,8709.6,173.399];
	_this setVectorDirAndUp [[0.992612,0.121201,-0.00556856],[0.00515584,0.00371858,0.99998]];
};

private _item829 = objNull;
if (_layerRoot) then {
	_item829 = createVehicle ["Christmas_Toy_Train",[11216.6,8710.09,0],[],0,"CAN_COLLIDE"];
	_this = _item829;
	_objects pushback _this;
	_objectIDs pushback 829;
	_this setPosWorld [11216.6,8710.09,173.116];
	_this setVectorDirAndUp [[-0.594747,-0.803912,-0.00111],[0,-0.00138075,0.999999]];
};

private _item830 = objNull;
if (_layerRoot) then {
	_item830 = createVehicle ["Christmas_Car_Light",[11217.9,8708.66,0],[],0,"CAN_COLLIDE"];
	_this = _item830;
	_objects pushback _this;
	_objectIDs pushback 830;
	_this setPosWorld [11217.9,8708.66,173.182];
	_this setVectorDirAndUp [[0.145209,0.9894,0.00136611],[0,-0.00138075,0.999999]];
};

private _item831 = objNull;
if (_layerRoot) then {
	_item831 = createVehicle ["Christmas_Toy_Rocket",[11216.1,8711.1,0],[],0,"CAN_COLLIDE"];
	_this = _item831;
	_objects pushback _this;
	_objectIDs pushback 831;
	_this setPosWorld [11216.1,8711.1,172.987];
	_this setVectorDirAndUp [[0,0.999999,0.00138075],[0,-0.00138075,0.999999]];
};

private _item832 = objNull;
if (_layerRoot) then {
	_item832 = createVehicle ["Christmas_Gift_Medium_Pattern",[11219.4,8712.17,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item832;
	_objects pushback _this;
	_objectIDs pushback 832;
	_this setPosWorld [11219.4,8712.17,172.89];
	_this setVectorDirAndUp [[0.178723,-0.983896,0.00273729],[0.00515584,0.00371858,0.99998]];
};

private _item833 = objNull;
if (_layerRoot) then {
	_item833 = createVehicle ["Christmas_Gift_Medium_Tree",[11218.7,8711.83,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item833;
	_objects pushback _this;
	_objectIDs pushback 833;
	_this setPosWorld [11218.7,8711.83,172.895];
	_this setVectorDirAndUp [[-0.805599,0.592458,0.00195047],[0.00515584,0.00371858,0.99998]];
};

private _item834 = objNull;
if (_layerRoot) then {
	_item834 = createVehicle ["RRP_Gift",[11218.7,8712.58,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item834;
	_objects pushback _this;
	_objectIDs pushback 834;
	_this setPosWorld [11218.7,8712.58,173.014];
	_this setVectorDirAndUp [[-0.344955,-0.938604,0.00526892],[0.00515584,0.00371858,0.99998]];
};

private _item835 = objNull;
if (_layerRoot) then {
	_item835 = createVehicle ["Christmas_Gift_Medium_Box",[11217.8,8712.17,-0.407501],[],0,"CAN_COLLIDE"];
	_this = _item835;
	_objects pushback _this;
	_objectIDs pushback 835;
	_this setPosWorld [11217.8,8712.17,172.789];
	_this setVectorDirAndUp [[0.179947,-0.983672,0.00273014],[0.00515584,0.00371858,0.99998]];
};

private _item836 = objNull;
if (_layerRoot) then {
	_item836 = createVehicle ["Christmas_Gift_Medium_Pattern",[11218.3,8711.05,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item836;
	_objects pushback _this;
	_objectIDs pushback 836;
	_this setPosWorld [11218.3,8711.05,172.9];
	_this setVectorDirAndUp [[0.178723,-0.983896,0.00273729],[0.00515584,0.00371858,0.99998]];
};

private _item837 = objNull;
if (_layerRoot) then {
	_item837 = createVehicle ["Christmas_Gift_Medium_Tree",[11217.6,8710.5,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item837;
	_objects pushback _this;
	_objectIDs pushback 837;
	_this setPosWorld [11217.6,8710.5,172.905];
	_this setVectorDirAndUp [[-0.805599,0.592458,0.00195047],[0.00515584,0.00371858,0.99998]];
};

private _item838 = objNull;
if (_layerRoot) then {
	_item838 = createVehicle ["RRP_Gift",[11217.6,8711.24,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item838;
	_objects pushback _this;
	_objectIDs pushback 838;
	_this setPosWorld [11217.6,8711.24,173.024];
	_this setVectorDirAndUp [[-0.344955,-0.938604,0.00526892],[0.00515584,0.00371858,0.99998]];
};

private _item839 = objNull;
if (_layerRoot) then {
	_item839 = createVehicle ["Christmas_Gift_Medium_Box",[11216.9,8711.16,-0.407471],[],0,"CAN_COLLIDE"];
	_this = _item839;
	_objects pushback _this;
	_objectIDs pushback 839;
	_this setPosWorld [11216.9,8711.16,172.798];
	_this setVectorDirAndUp [[0.179947,-0.983672,0.00273014],[0.00515584,0.00371858,0.99998]];
};

private _item840 = objNull;
if (_layerRoot) then {
	_item840 = createVehicle ["Christmas_Gift_Medium_Pattern",[11219.3,8709.62,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item840;
	_objects pushback _this;
	_objectIDs pushback 840;
	_this setPosWorld [11219.3,8709.62,172.9];
	_this setVectorDirAndUp [[0.178723,-0.983896,0.00273729],[0.00515584,0.00371858,0.99998]];
};

private _item841 = objNull;
if (_layerRoot) then {
	_item841 = createVehicle ["Christmas_Gift_Medium_Tree",[11218.6,8709.64,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item841;
	_objects pushback _this;
	_objectIDs pushback 841;
	_this setPosWorld [11218.6,8709.64,172.904];
	_this setVectorDirAndUp [[-0.805599,0.592458,0.00195047],[0.00515584,0.00371858,0.99998]];
};

private _item842 = objNull;
if (_layerRoot) then {
	_item842 = createVehicle ["RRP_Gift",[11218.6,8710.39,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item842;
	_objects pushback _this;
	_objectIDs pushback 842;
	_this setPosWorld [11218.6,8710.39,173.022];
	_this setVectorDirAndUp [[-0.344955,-0.938604,0.00526892],[0.00515584,0.00371858,0.99998]];
};

private _item843 = objNull;
if (_layerRoot) then {
	_item843 = createVehicle ["Christmas_Gift_Medium_Box",[11217.7,8709.7,-0.407501],[],0,"CAN_COLLIDE"];
	_this = _item843;
	_objects pushback _this;
	_objectIDs pushback 843;
	_this setPosWorld [11217.7,8709.7,172.798];
	_this setVectorDirAndUp [[0.17995,-0.983675,-0.00135821],[0,-0.00138075,0.999999]];
};

private _item844 = objNull;
if (_layerRoot) then {
	_item844 = createVehicle ["Christmas_Gift_Medium_Pattern",[11220,8710.99,0],[],0,"CAN_COLLIDE"];
	_this = _item844;
	_objects pushback _this;
	_objectIDs pushback 844;
	_this setPosWorld [11220,8710.99,172.891];
	_this setVectorDirAndUp [[0.178725,-0.983892,0.00372047],[-0.000345267,0.00371863,0.999993]];
};

private _item845 = objNull;
if (_layerRoot) then {
	_item845 = createVehicle ["Christmas_Gift_Medium_Tree",[11219.4,8710.44,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item845;
	_objects pushback _this;
	_objectIDs pushback 845;
	_this setPosWorld [11219.4,8710.44,172.896];
	_this setVectorDirAndUp [[-0.805599,0.592458,0.00195047],[0.00515584,0.00371858,0.99998]];
};

private _item846 = objNull;
if (_layerRoot) then {
	_item846 = createVehicle ["RRP_Gift",[11219.4,8711.18,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item846;
	_objects pushback _this;
	_objectIDs pushback 846;
	_this setPosWorld [11219.4,8711.18,173.015];
	_this setVectorDirAndUp [[-0.344955,-0.938604,0.00526892],[0.00515584,0.00371858,0.99998]];
};

private _item847 = objNull;
if (_layerRoot) then {
	_item847 = createVehicle ["Christmas_Gift_Medium_Box",[11220.1,8711.81,-0.407516],[],0,"CAN_COLLIDE"];
	_this = _item847;
	_objects pushback _this;
	_objectIDs pushback 847;
	_this setPosWorld [11220.1,8711.81,172.779];
	_this setVectorDirAndUp [[0.17995,-0.983669,0.00372006],[-0.000345267,0.00371863,0.999993]];
};

private _item848 = objNull;
if (_layerRoot) then {
	_item848 = createVehicle ["Christmas_Toy_Rocket",[11216.2,8711.62,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item848;
	_objects pushback _this;
	_objectIDs pushback 848;
	_this setPosWorld [11216.2,8711.62,172.986];
	_this setVectorDirAndUp [[0,0.999993,-0.00371863],[0.00515584,0.00371858,0.99998]];
};

private _item849 = objNull;
if (_layerRoot) then {
	_item849 = createVehicle ["Christmas_Toy_Rocket",[11216.6,8711.98,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item849;
	_objects pushback _this;
	_objectIDs pushback 849;
	_this setPosWorld [11216.6,8711.98,172.983];
	_this setVectorDirAndUp [[0,0.999993,-0.00371863],[0.00515584,0.00371858,0.99998]];
};

private _item873 = objNull;
if (_layerRoot) then {
	_item873 = createVehicle ["sapin",[2999.81,17761.5,0],[],0,"CAN_COLLIDE"];
	_this = _item873;
	_objects pushback _this;
	_objectIDs pushback 873;
	_this setPosWorld [2999.81,17761.5,53.6444];
	_this setVectorDirAndUp [[-0.999726,0.0234168,0],[0,0,1]];
};

private _item874 = objNull;
if (_layerRoot) then {
	_item874 = createVehicle ["Christmas_Bunny_Left",[3001.14,17760,0],[],0,"CAN_COLLIDE"];
	_this = _item874;
	_objects pushback _this;
	_objectIDs pushback 874;
	_this setPosWorld [3001.14,17760,50.19];
	_this setVectorDirAndUp [[0.992626,0.121221,0],[0,0,1]];
};

private _item875 = objNull;
if (_layerRoot) then {
	_item875 = createVehicle ["Christmas_Toy_Train",[2997.71,17760.5,0],[],0,"CAN_COLLIDE"];
	_this = _item875;
	_objects pushback _this;
	_objectIDs pushback 875;
	_this setPosWorld [2997.71,17760.5,49.8957];
	_this setVectorDirAndUp [[-0.594747,-0.803913,0],[0,0,1]];
};

private _item876 = objNull;
if (_layerRoot) then {
	_item876 = createVehicle ["Christmas_Car_Light",[2999.06,17759.1,0],[],0,"CAN_COLLIDE"];
	_this = _item876;
	_objects pushback _this;
	_objectIDs pushback 876;
	_this setPosWorld [2999.06,17759.1,49.9636];
	_this setVectorDirAndUp [[0.145209,0.989401,0],[0,0,1]];
};

private _item877 = objNull;
if (_layerRoot) then {
	_item877 = createVehicle ["Christmas_Toy_Rocket",[2997.21,17761.5,0],[],0,"CAN_COLLIDE"];
	_this = _item877;
	_objects pushback _this;
	_objectIDs pushback 877;
	_this setPosWorld [2997.21,17761.5,49.7651];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item878 = objNull;
if (_layerRoot) then {
	_item878 = createVehicle ["Christmas_Gift_Medium_Pattern",[3000.54,17762.6,0],[],0,"CAN_COLLIDE"];
	_this = _item878;
	_objects pushback _this;
	_objectIDs pushback 878;
	_this setPosWorld [3000.54,17762.6,49.6871];
	_this setVectorDirAndUp [[0.178725,-0.983899,0],[0,0,1]];
};

private _item879 = objNull;
if (_layerRoot) then {
	_item879 = createVehicle ["Christmas_Gift_Medium_Tree",[2999.84,17762.2,0],[],0,"CAN_COLLIDE"];
	_this = _item879;
	_objects pushback _this;
	_objectIDs pushback 879;
	_this setPosWorld [2999.84,17762.2,49.6871];
	_this setVectorDirAndUp [[-0.805609,0.592447,0],[0,0,1]];
};

private _item880 = objNull;
if (_layerRoot) then {
	_item880 = createVehicle ["RRP_Gift",[2999.86,17763,0],[],0,"CAN_COLLIDE"];
	_this = _item880;
	_objects pushback _this;
	_objectIDs pushback 880;
	_this setPosWorld [2999.86,17763,49.8088];
	_this setVectorDirAndUp [[-0.344959,-0.938618,0],[0,0,1]];
};

private _item881 = objNull;
if (_layerRoot) then {
	_item881 = createVehicle ["Christmas_Gift_Medium_Box",[2998.91,17762.6,-0.407501],[],0,"CAN_COLLIDE"];
	_this = _item881;
	_objects pushback _this;
	_objectIDs pushback 881;
	_this setPosWorld [2998.91,17762.6,49.5783];
	_this setVectorDirAndUp [[0.17995,-0.983676,0],[0,0,1]];
};

private _item882 = objNull;
if (_layerRoot) then {
	_item882 = createVehicle ["Christmas_Gift_Medium_Pattern",[2999.43,17761.5,0],[],0,"CAN_COLLIDE"];
	_this = _item882;
	_objects pushback _this;
	_objectIDs pushback 882;
	_this setPosWorld [2999.43,17761.5,49.6871];
	_this setVectorDirAndUp [[0.178725,-0.983899,0],[0,0,1]];
};

private _item883 = objNull;
if (_layerRoot) then {
	_item883 = createVehicle ["Christmas_Gift_Medium_Tree",[2998.74,17760.9,0],[],0,"CAN_COLLIDE"];
	_this = _item883;
	_objects pushback _this;
	_objectIDs pushback 883;
	_this setPosWorld [2998.74,17760.9,49.6871];
	_this setVectorDirAndUp [[-0.805609,0.592447,0],[0,0,1]];
};

private _item884 = objNull;
if (_layerRoot) then {
	_item884 = createVehicle ["RRP_Gift",[2998.76,17761.6,0],[],0,"CAN_COLLIDE"];
	_this = _item884;
	_objects pushback _this;
	_objectIDs pushback 884;
	_this setPosWorld [2998.76,17761.6,49.8088];
	_this setVectorDirAndUp [[-0.344959,-0.938618,0],[0,0,1]];
};

private _item885 = objNull;
if (_layerRoot) then {
	_item885 = createVehicle ["Christmas_Gift_Medium_Box",[2998.04,17761.6,-0.407501],[],0,"CAN_COLLIDE"];
	_this = _item885;
	_objects pushback _this;
	_objectIDs pushback 885;
	_this setPosWorld [2998.04,17761.6,49.5783];
	_this setVectorDirAndUp [[0.17995,-0.983676,0],[0,0,1]];
};

private _item886 = objNull;
if (_layerRoot) then {
	_item886 = createVehicle ["Christmas_Gift_Medium_Pattern",[3000.43,17760,0],[],0,"CAN_COLLIDE"];
	_this = _item886;
	_objects pushback _this;
	_objectIDs pushback 886;
	_this setPosWorld [3000.43,17760,49.6871];
	_this setVectorDirAndUp [[0.178725,-0.983899,0],[0,0,1]];
};

private _item887 = objNull;
if (_layerRoot) then {
	_item887 = createVehicle ["Christmas_Gift_Medium_Tree",[2999.71,17760,0],[],0,"CAN_COLLIDE"];
	_this = _item887;
	_objects pushback _this;
	_objectIDs pushback 887;
	_this setPosWorld [2999.71,17760,49.6871];
	_this setVectorDirAndUp [[-0.805609,0.592447,0],[0,0,1]];
};

private _item888 = objNull;
if (_layerRoot) then {
	_item888 = createVehicle ["RRP_Gift",[2999.73,17760.8,0],[],0,"CAN_COLLIDE"];
	_this = _item888;
	_objects pushback _this;
	_objectIDs pushback 888;
	_this setPosWorld [2999.73,17760.8,49.8088];
	_this setVectorDirAndUp [[-0.344959,-0.938618,0],[0,0,1]];
};

private _item889 = objNull;
if (_layerRoot) then {
	_item889 = createVehicle ["Christmas_Gift_Medium_Box",[2998.86,17760.1,-0.407501],[],0,"CAN_COLLIDE"];
	_this = _item889;
	_objects pushback _this;
	_objectIDs pushback 889;
	_this setPosWorld [2998.86,17760.1,49.5783];
	_this setVectorDirAndUp [[0.17995,-0.983676,0],[0,0,1]];
};

private _item890 = objNull;
if (_layerRoot) then {
	_item890 = createVehicle ["Christmas_Gift_Medium_Pattern",[3001.2,17761.4,0],[],0,"CAN_COLLIDE"];
	_this = _item890;
	_objects pushback _this;
	_objectIDs pushback 890;
	_this setPosWorld [3001.2,17761.4,49.6871];
	_this setVectorDirAndUp [[0.178725,-0.983899,0],[0,0,1]];
};

private _item891 = objNull;
if (_layerRoot) then {
	_item891 = createVehicle ["Christmas_Gift_Medium_Tree",[3000.51,17760.8,0],[],0,"CAN_COLLIDE"];
	_this = _item891;
	_objects pushback _this;
	_objectIDs pushback 891;
	_this setPosWorld [3000.51,17760.8,49.6871];
	_this setVectorDirAndUp [[-0.805609,0.592447,0],[0,0,1]];
};

private _item892 = objNull;
if (_layerRoot) then {
	_item892 = createVehicle ["RRP_Gift",[3000.53,17761.6,0],[],0,"CAN_COLLIDE"];
	_this = _item892;
	_objects pushback _this;
	_objectIDs pushback 892;
	_this setPosWorld [3000.53,17761.6,49.8088];
	_this setVectorDirAndUp [[-0.344959,-0.938618,0],[0,0,1]];
};

private _item893 = objNull;
if (_layerRoot) then {
	_item893 = createVehicle ["Christmas_Gift_Medium_Box",[3001.28,17762.2,-0.407501],[],0,"CAN_COLLIDE"];
	_this = _item893;
	_objects pushback _this;
	_objectIDs pushback 893;
	_this setPosWorld [3001.28,17762.2,49.5783];
	_this setVectorDirAndUp [[0.17995,-0.983676,0],[0,0,1]];
};

private _item894 = objNull;
if (_layerRoot) then {
	_item894 = createVehicle ["Christmas_Toy_Rocket",[2997.35,17762,0],[],0,"CAN_COLLIDE"];
	_this = _item894;
	_objects pushback _this;
	_objectIDs pushback 894;
	_this setPosWorld [2997.35,17762,49.7651];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item895 = objNull;
if (_layerRoot) then {
	_item895 = createVehicle ["Christmas_Toy_Rocket",[2997.8,17762.4,0],[],0,"CAN_COLLIDE"];
	_this = _item895;
	_objects pushback _this;
	_objectIDs pushback 895;
	_this setPosWorld [2997.8,17762.4,49.7651];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item898 = objNull;
if (_layerRoot) then {
	_item898 = createVehicle ["Christmas_Toy_Train",[3723.81,13103.5,0],[],0,"CAN_COLLIDE"];
	_this = _item898;
	_objects pushback _this;
	_objectIDs pushback 898;
	_this setPosWorld [3723.81,13103.5,4.58217];
	_this setVectorDirAndUp [[0.553078,-0.83278,0.0241337],[-0.00461935,0.0259018,0.999654]];
};

private _item899 = objNull;
if (_layerRoot) then {
	_item899 = createVehicle ["Christmas_Car_Light",[3725.19,13104.3,0],[],0,"CAN_COLLIDE"];
	_this = _item899;
	_objects pushback _this;
	_objectIDs pushback 899;
	_this setPosWorld [3725.18,13104.3,4.63517];
	_this setVectorDirAndUp [[-0.880536,0.473697,-0.0163428],[-0.00461935,0.0259018,0.999654]];
};

private _item900 = objNull;
if (_layerRoot) then {
	_item900 = createVehicle ["Christmas_Toy_Rocket",[3724.2,13105.2,-8.15392e-005],[],0,"CAN_COLLIDE"];
	_this = _item900;
	_objects pushback _this;
	_objectIDs pushback 900;
	_this setPosWorld [3724.2,13105.2,4.40843];
	_this setVectorDirAndUp [[-0.94012,0.340589,-0.0131692],[-0.00461935,0.0259018,0.999654]];
};

private _item901 = objNull;
if (_layerRoot) then {
	_item901 = createVehicle ["Christmas_Gift_Medium_Pattern",[3724.33,13108.7,0],[],0,"CAN_COLLIDE"];
	_this = _item901;
	_objects pushback _this;
	_objectIDs pushback 901;
	_this setPosWorld [3724.33,13108.7,4.20605];
	_this setVectorDirAndUp [[0.985829,-0.16775,-0.00046979],[0.00682713,0.037323,0.99928]];
};

private _item902 = objNull;
if (_layerRoot) then {
	_item902 = createVehicle ["Christmas_Gift_Medium_Tree",[3724.41,13107.9,0],[],0,"CAN_COLLIDE"];
	_this = _item902;
	_objects pushback _this;
	_objectIDs pushback 902;
	_this setPosWorld [3724.41,13107.9,4.2347];
	_this setVectorDirAndUp [[-0.831675,-0.554635,0.0263976],[0.00682713,0.037323,0.99928]];
};

private _item903 = objNull;
if (_layerRoot) then {
	_item903 = createVehicle ["RRP_Gift",[3723.72,13108.2,0],[],0,"CAN_COLLIDE"];
	_this = _item903;
	_objects pushback _this;
	_objectIDs pushback 903;
	_this setPosWorld [3723.72,13108.2,4.35099];
	_this setVectorDirAndUp [[0.764661,-0.644158,0.018835],[0.00682713,0.037323,0.99928]];
};

private _item904 = objNull;
if (_layerRoot) then {
	_item904 = createVehicle ["Christmas_Gift_Medium_Box",[3723.77,13107.2,-0.407575],[],0,"CAN_COLLIDE"];
	_this = _item904;
	_objects pushback _this;
	_objectIDs pushback 904;
	_this setPosWorld [3723.77,13107.2,4.15734];
	_this setVectorDirAndUp [[0.986047,-0.166467,-0.000519201],[0.00682713,0.037323,0.99928]];
};

private _item905 = objNull;
if (_layerRoot) then {
	_item905 = createVehicle ["Christmas_Gift_Medium_Pattern",[3725,13107.3,0],[],0,"CAN_COLLIDE"];
	_this = _item905;
	_objects pushback _this;
	_objectIDs pushback 905;
	_this setPosWorld [3725,13107.3,4.25497];
	_this setVectorDirAndUp [[0.985837,-0.167708,-0.000471401],[0.00682713,0.037323,0.99928]];
};

private _item906 = objNull;
if (_layerRoot) then {
	_item906 = createVehicle ["Christmas_Gift_Medium_Tree",[3724.96,13106.1,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item906;
	_objects pushback _this;
	_objectIDs pushback 906;
	_this setPosWorld [3724.96,13106.1,4.29922];
	_this setVectorDirAndUp [[-0.831654,-0.554667,0.0263987],[0.00682713,0.037323,0.99928]];
};

private _item907 = objNull;
if (_layerRoot) then {
	_item907 = createVehicle ["RRP_Gift",[3724.39,13106.6,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item907;
	_objects pushback _this;
	_objectIDs pushback 907;
	_this setPosWorld [3724.39,13106.6,4.40399];
	_this setVectorDirAndUp [[0.76467,-0.644146,0.0188345],[0.00682713,0.037323,0.99928]];
};

private _item908 = objNull;
if (_layerRoot) then {
	_item908 = createVehicle ["Christmas_Gift_Medium_Box",[3725.6,13105.7,-0.407818],[],0,"CAN_COLLIDE"];
	_this = _item908;
	_objects pushback _this;
	_objectIDs pushback 908;
	_this setPosWorld [3725.6,13105.7,4.20033];
	_this setVectorDirAndUp [[0.986088,-0.166223,-0.000528572],[0.00682713,0.037323,0.99928]];
};

private _item909 = objNull;
if (_layerRoot) then {
	_item909 = createVehicle ["Christmas_Gift_Medium_Pattern",[3726.69,13107.7,0],[],0,"CAN_COLLIDE"];
	_this = _item909;
	_objects pushback _this;
	_objectIDs pushback 909;
	_this setPosWorld [3726.69,13107.7,4.22646];
	_this setVectorDirAndUp [[0.985829,-0.16775,-0.00046979],[0.00682713,0.037323,0.99928]];
};

private _item910 = objNull;
if (_layerRoot) then {
	_item910 = createVehicle ["Christmas_Gift_Medium_Tree",[3726.43,13107,0],[],0,"CAN_COLLIDE"];
	_this = _item910;
	_objects pushback _this;
	_objectIDs pushback 910;
	_this setPosWorld [3726.43,13107,4.25315];
	_this setVectorDirAndUp [[-0.831698,-0.5546,0.0263965],[0.00682713,0.037323,0.99928]];
};

private _item911 = objNull;
if (_layerRoot) then {
	_item911 = createVehicle ["RRP_Gift",[3725.73,13107.3,0],[],0,"CAN_COLLIDE"];
	_this = _item911;
	_objects pushback _this;
	_objectIDs pushback 911;
	_this setPosWorld [3725.73,13107.3,4.36938];
	_this setVectorDirAndUp [[0.764661,-0.644158,0.018835],[0.00682713,0.037323,0.99928]];
};

private _item912 = objNull;
if (_layerRoot) then {
	_item912 = createVehicle ["Christmas_Gift_Medium_Box",[3724.27,13104.7,-0.407639],[],0,"CAN_COLLIDE"];
	_this = _item912;
	_objects pushback _this;
	_objectIDs pushback 912;
	_this setPosWorld [3724.27,13104.7,4.23383];
	_this setVectorDirAndUp [[0.986057,-0.166172,0.00886216],[-0.00461935,0.0259018,0.999654]];
};

private _item913 = objNull;
if (_layerRoot) then {
	_item913 = createVehicle ["Christmas_Gift_Medium_Pattern",[3725.78,13108.9,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item913;
	_objects pushback _this;
	_objectIDs pushback 913;
	_this setPosWorld [3725.78,13108.9,4.19001];
	_this setVectorDirAndUp [[0.985829,-0.16775,-0.00046979],[0.00682713,0.037323,0.99928]];
};

private _item914 = objNull;
if (_layerRoot) then {
	_item914 = createVehicle ["Christmas_Gift_Medium_Tree",[3725.95,13108.1,0],[],0,"CAN_COLLIDE"];
	_this = _item914;
	_objects pushback _this;
	_objectIDs pushback 914;
	_this setPosWorld [3725.95,13108.1,4.21807];
	_this setVectorDirAndUp [[-0.831698,-0.5546,0.0263965],[0.00682713,0.037323,0.99928]];
};

private _item915 = objNull;
if (_layerRoot) then {
	_item915 = createVehicle ["RRP_Gift",[3725.21,13108.4,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item915;
	_objects pushback _this;
	_objectIDs pushback 915;
	_this setPosWorld [3725.21,13108.4,4.33244];
	_this setVectorDirAndUp [[0.764633,-0.64419,0.0188364],[0.00682713,0.037323,0.99928]];
};

private _item916 = objNull;
if (_layerRoot) then {
	_item916 = createVehicle ["Christmas_Gift_Medium_Box",[3724.92,13109.3,-0.40713],[],0,"CAN_COLLIDE"];
	_this = _item916;
	_objects pushback _this;
	_objectIDs pushback 916;
	_this setPosWorld [3724.92,13109.3,4.07143];
	_this setVectorDirAndUp [[0.986037,-0.166523,-0.000517026],[0.00682713,0.037323,0.99928]];
};

private _item917 = objNull;
if (_layerRoot) then {
	_item917 = createVehicle ["Christmas_Toy_Rocket",[3723.97,13105.7,0],[],0,"CAN_COLLIDE"];
	_this = _item917;
	_objects pushback _this;
	_objectIDs pushback 917;
	_this setPosWorld [3723.97,13105.7,4.39458];
	_this setVectorDirAndUp [[-0.940116,0.340601,-0.0131694],[-0.00461935,0.0259018,0.999654]];
};

private _item918 = objNull;
if (_layerRoot) then {
	_item918 = createVehicle ["Christmas_Toy_Rocket",[3723.57,13106,-8.15392e-005],[],0,"CAN_COLLIDE"];
	_this = _item918;
	_objects pushback _this;
	_objectIDs pushback 918;
	_this setPosWorld [3723.57,13106,4.38349];
	_this setVectorDirAndUp [[-0.940116,0.340601,-0.0131694],[-0.00461935,0.0259018,0.999654]];
};

private _item919 = objNull;
if (_layerRoot) then {
	_item919 = createVehicle ["pere",[3725.67,13102,0],[],0,"CAN_COLLIDE"];
	_this = _item919;
	_objects pushback _this;
	_objectIDs pushback 919;
	_this setPosWorld [3725.67,13102,8.08311];
	_this setVectorDirAndUp [[0.998012,-0.0626964,0.00637488],[-0.00460642,0.0283109,0.999589]];
};

private _item962 = objNull;
if (_layerRoot) then {
	_item962 = createVehicle ["Christmas_Candy_Cane_01",[3614.45,12578.7,-0.00030899],[],0,"CAN_COLLIDE"];
	_this = _item962;
	_objects pushback _this;
	_objectIDs pushback 962;
	_this setPosWorld [3614.45,12578.7,24.1984];
	_this setVectorDirAndUp [[0.97961,0.200907,0],[0,0,1]];
};

private _item963 = objNull;
if (_layerRoot) then {
	_item963 = createVehicle ["Christmas_Penguin_Light",[3620.2,12577.4,-1.90735e-005],[],0,"CAN_COLLIDE"];
	_this = _item963;
	_objects pushback _this;
	_objectIDs pushback 963;
	_this setPosWorld [3620.2,12577.4,23.663];
	_this setVectorDirAndUp [[-0.775749,-0.631041,0],[0,0,1]];
};

private _item966 = objNull;
if (_layerRoot) then {
	_item966 = createVehicle ["Christmas_Happy_Snowman",[3620.62,12576.1,-4.3869e-005],[],0,"CAN_COLLIDE"];
	_this = _item966;
	_objects pushback _this;
	_objectIDs pushback 966;
	_this setPosWorld [3620.62,12576.1,24.2076];
	_this setVectorDirAndUp [[-0.609353,-0.792899,0],[0,0,1]];
};

private _item967 = objNull;
if (_layerRoot) then {
	_item967 = createVehicle ["Christmas_Happy_Snowman_Bucket",[3618.16,12579.1,3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item967;
	_objects pushback _this;
	_objectIDs pushback 967;
	_this setPosWorld [3618.16,12579.1,24.1886];
	_this setVectorDirAndUp [[-0.590669,0.806914,0],[0,0,1]];
};

private _item968 = objNull;
if (_layerRoot) then {
	_item968 = createVehicle ["Christmas_Clothed_Snowman_Hat",[3612.23,12583.6,-0.00126839],[],0,"CAN_COLLIDE"];
	_this = _item968;
	_objects pushback _this;
	_objectIDs pushback 968;
	_this setPosWorld [3612.23,12583.6,24.6256];
	_this setVectorDirAndUp [[-0.958587,-0.284799,0],[0,0,1]];
};

private _item971 = objNull;
if (_layerRoot) then {
	_item971 = createVehicle ["Christmas_Whole_Tree",[3618.14,12572.7,-0.000644684],[],0,"CAN_COLLIDE"];
	_this = _item971;
	_objects pushback _this;
	_objectIDs pushback 971;
	_this setPosWorld [3618.14,12572.7,24.233];
	_this setVectorDirAndUp [[0.979711,0.200415,0],[0,0,1]];
};

private _item973 = objNull;
if (_layerRoot) then {
	_item973 = createVehicle ["Christmas_Gift_Medium_Pattern",[3619.3,12577,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item973;
	_objects pushback _this;
	_objectIDs pushback 973;
	_this setPosWorld [3619.3,12577,23.2759];
	_this setVectorDirAndUp [[-0.928092,-0.372351,0],[0,0,1]];
};

private _item974 = objNull;
if (_layerRoot) then {
	_item974 = createVehicle ["Christmas_Gift_Medium_Tree",[3618.62,12577.6,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item974;
	_objects pushback _this;
	_objectIDs pushback 974;
	_this setPosWorld [3618.62,12577.6,23.2757];
	_this setVectorDirAndUp [[0.418684,0.908132,0],[0,0,1]];
};

private _item975 = objNull;
if (_layerRoot) then {
	_item975 = createVehicle ["RRP_Gift",[3619.35,12577.7,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item975;
	_objects pushback _this;
	_objectIDs pushback 975;
	_this setPosWorld [3619.35,12577.7,23.3974];
	_this setVectorDirAndUp [[-0.988756,0.149535,0],[0,0,1]];
};

private _item976 = objNull;
if (_layerRoot) then {
	_item976 = createVehicle ["Christmas_Gift_Medium_Box",[3619.09,12578.4,-0.407362],[],0,"CAN_COLLIDE"];
	_this = _item976;
	_objects pushback _this;
	_objectIDs pushback 976;
	_this setPosWorld [3619.09,12578.4,23.167];
	_this setVectorDirAndUp [[-0.927535,-0.373736,0],[0,0,1]];
};

private _item980 = objNull;
if (_layerRoot) then {
	_item980 = createVehicle ["sapin",[3616.24,12577.1,3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item980;
	_objects pushback _this;
	_objectIDs pushback 980;
	_this setPosWorld [3616.24,12577.1,27.2329];
	_this setVectorDirAndUp [[0.399872,0.916571,0],[0,0,1]];
};

private _item981 = objNull;
if (_layerRoot) then {
	_item981 = createVehicle ["Christmas_Bunny_Left",[3615.97,12574.3,-0.000370026],[],0,"CAN_COLLIDE"];
	_this = _item981;
	_objects pushback _this;
	_objectIDs pushback 981;
	_this setPosWorld [3615.97,12574.3,23.7793];
	_this setVectorDirAndUp [[0.317574,-0.948234,0],[0,0,1]];
};

private _item982 = objNull;
if (_layerRoot) then {
	_item982 = createVehicle ["Christmas_Toy_Train",[3616.56,12580.1,3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item982;
	_objects pushback _this;
	_objectIDs pushback 982;
	_this setPosWorld [3616.56,12580.1,23.484];
	_this setVectorDirAndUp [[-0.906946,0.421248,0],[0,0,1]];
};

private _item983 = objNull;
if (_layerRoot) then {
	_item983 = createVehicle ["Christmas_Car_Light",[3615.42,12578.5,-0.000110626],[],0,"CAN_COLLIDE"];
	_this = _item983;
	_objects pushback _this;
	_objectIDs pushback 983;
	_this setPosWorld [3615.42,12578.5,23.5518];
	_this setVectorDirAndUp [[0.998418,0.0562337,0],[0,0,1]];
};

private _item984 = objNull;
if (_layerRoot) then {
	_item984 = createVehicle ["Christmas_Toy_Rocket",[3616.69,12578.4,3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item984;
	_objects pushback _this;
	_objectIDs pushback 984;
	_this setPosWorld [3616.69,12578.4,23.3535];
	_this setVectorDirAndUp [[0.979641,0.200756,0],[0,0,1]];
};

private _item985 = objNull;
if (_layerRoot) then {
	_item985 = createVehicle ["Christmas_Gift_Medium_Pattern",[3618.4,12575.4,3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item985;
	_objects pushback _this;
	_objectIDs pushback 985;
	_this setPosWorld [3618.4,12575.4,23.2763];
	_this setVectorDirAndUp [[-0.928174,-0.372146,0],[0,0,1]];
};

private _item986 = objNull;
if (_layerRoot) then {
	_item986 = createVehicle ["Christmas_Gift_Medium_Tree",[3617.93,12576,3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item986;
	_objects pushback _this;
	_objectIDs pushback 986;
	_this setPosWorld [3617.93,12576,23.2761];
	_this setVectorDirAndUp [[0.41907,0.907954,0],[0,0,1]];
};

private _item987 = objNull;
if (_layerRoot) then {
	_item987 = createVehicle ["RRP_Gift",[3618.66,12576.2,3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item987;
	_objects pushback _this;
	_objectIDs pushback 987;
	_this setPosWorld [3618.66,12576.2,23.3978];
	_this setVectorDirAndUp [[-0.988693,0.149955,0],[0,0,1]];
};

private _item988 = objNull;
if (_layerRoot) then {
	_item988 = createVehicle ["Christmas_Gift_Medium_Box",[3618.04,12577,-0.407354],[],0,"CAN_COLLIDE"];
	_this = _item988;
	_objects pushback _this;
	_objectIDs pushback 988;
	_this setPosWorld [3618.04,12577,23.1671];
	_this setVectorDirAndUp [[-0.927627,-0.373507,0],[0,0,1]];
};

private _item989 = objNull;
if (_layerRoot) then {
	_item989 = createVehicle ["Christmas_Gift_Medium_Pattern",[3617.08,12576.3,3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item989;
	_objects pushback _this;
	_objectIDs pushback 989;
	_this setPosWorld [3617.08,12576.3,23.276];
	_this setVectorDirAndUp [[-0.928158,-0.372186,0],[0,0,1]];
};

private _item990 = objNull;
if (_layerRoot) then {
	_item990 = createVehicle ["Christmas_Gift_Medium_Tree",[3616.4,12576.8,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item990;
	_objects pushback _this;
	_objectIDs pushback 990;
	_this setPosWorld [3616.4,12576.8,23.2758];
	_this setVectorDirAndUp [[0.419017,0.907978,0],[0,0,1]];
};

private _item991 = objNull;
if (_layerRoot) then {
	_item991 = createVehicle ["RRP_Gift",[3617.14,12577,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item991;
	_objects pushback _this;
	_objectIDs pushback 991;
	_this setPosWorld [3617.14,12577,23.3974];
	_this setVectorDirAndUp [[-0.98872,0.149779,0],[0,0,1]];
};

private _item992 = objNull;
if (_layerRoot) then {
	_item992 = createVehicle ["Christmas_Gift_Medium_Box",[3616.88,12577.6,-0.407495],[],0,"CAN_COLLIDE"];
	_this = _item992;
	_objects pushback _this;
	_objectIDs pushback 992;
	_this setPosWorld [3616.88,12577.6,23.1667];
	_this setVectorDirAndUp [[-0.927528,-0.373754,0],[0,0,1]];
};

private _item993 = objNull;
if (_layerRoot) then {
	_item993 = createVehicle ["Christmas_Gift_Medium_Pattern",[3615.88,12575,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item993;
	_objects pushback _this;
	_objectIDs pushback 993;
	_this setPosWorld [3615.88,12575,23.2765];
	_this setVectorDirAndUp [[-0.928167,-0.372165,0],[0,0,1]];
};

private _item994 = objNull;
if (_layerRoot) then {
	_item994 = createVehicle ["Christmas_Gift_Medium_Tree",[3615.76,12575.7,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item994;
	_objects pushback _this;
	_objectIDs pushback 994;
	_this setPosWorld [3615.76,12575.7,23.2762];
	_this setVectorDirAndUp [[0.41909,0.907945,0],[0,0,1]];
};

private _item995 = objNull;
if (_layerRoot) then {
	_item995 = createVehicle ["RRP_Gift",[3616.49,12575.8,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item995;
	_objects pushback _this;
	_objectIDs pushback 995;
	_this setPosWorld [3616.49,12575.8,23.3978];
	_this setVectorDirAndUp [[-0.988696,0.149936,0],[0,0,1]];
};

private _item996 = objNull;
if (_layerRoot) then {
	_item996 = createVehicle ["Christmas_Gift_Medium_Box",[3616.37,12578.9,-0.407495],[],0,"CAN_COLLIDE"];
	_this = _item996;
	_objects pushback _this;
	_objectIDs pushback 996;
	_this setPosWorld [3616.37,12578.9,23.1666];
	_this setVectorDirAndUp [[-0.927626,-0.373511,0],[0,0,1]];
};

private _item997 = objNull;
if (_layerRoot) then {
	_item997 = createVehicle ["Christmas_Gift_Medium_Pattern",[3617.38,12574.5,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item997;
	_objects pushback _this;
	_objectIDs pushback 997;
	_this setPosWorld [3617.38,12574.5,23.2766];
	_this setVectorDirAndUp [[-0.928167,-0.372165,0],[0,0,1]];
};

private _item998 = objNull;
if (_layerRoot) then {
	_item998 = createVehicle ["Christmas_Gift_Medium_Tree",[3616.7,12575.1,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item998;
	_objects pushback _this;
	_objectIDs pushback 998;
	_this setPosWorld [3616.7,12575.1,23.2764];
	_this setVectorDirAndUp [[0.41909,0.907945,0],[0,0,1]];
};

private _item999 = objNull;
if (_layerRoot) then {
	_item999 = createVehicle ["RRP_Gift",[3617.43,12575.2,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item999;
	_objects pushback _this;
	_objectIDs pushback 999;
	_this setPosWorld [3617.43,12575.2,23.398];
	_this setVectorDirAndUp [[-0.988689,0.149978,0],[0,0,1]];
};

private _item1000 = objNull;
if (_layerRoot) then {
	_item1000 = createVehicle ["Christmas_Gift_Medium_Box",[3618.16,12574.6,-0.407509],[],0,"CAN_COLLIDE"];
	_this = _item1000;
	_objects pushback _this;
	_objectIDs pushback 1000;
	_this setPosWorld [3618.16,12574.6,23.1677];
	_this setVectorDirAndUp [[-0.92771,-0.373302,0],[0,0,1]];
};

private _item1001 = objNull;
if (_layerRoot) then {
	_item1001 = createVehicle ["Christmas_Toy_Rocket",[3617.22,12578.4,3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item1001;
	_objects pushback _this;
	_objectIDs pushback 1001;
	_this setPosWorld [3617.22,12578.4,23.3535];
	_this setVectorDirAndUp [[0.979644,0.200744,0],[0,0,1]];
};

private _item1002 = objNull;
if (_layerRoot) then {
	_item1002 = createVehicle ["Christmas_Toy_Rocket",[3617.67,12578.1,3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item1002;
	_objects pushback _this;
	_objectIDs pushback 1002;
	_this setPosWorld [3617.67,12578.1,23.3535];
	_this setVectorDirAndUp [[0.979644,0.200744,0],[0,0,1]];
};

private _item1003 = objNull;
if (_layerRoot) then {
	_item1003 = createVehicle ["pere",[3613.82,12580.4,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item1003;
	_objects pushback _this;
	_objectIDs pushback 1003;
	_this setPosWorld [3613.82,12580.4,26.9366];
	_this setVectorDirAndUp [[-0.883668,-0.468113,0],[0,0,1]];
};

private _item1004 = objNull;
if (_layerRoot) then {
	_item1004 = createVehicle ["Christmas_Candy_Cane_01",[8977.46,15728.8,-0.000198364],[],0,"CAN_COLLIDE"];
	_this = _item1004;
	_objects pushback _this;
	_objectIDs pushback 1004;
	_this setPosWorld [8977.47,15728.8,112.906];
	_this setVectorDirAndUp [[0.677929,0.735111,0.00480924],[0.00699926,-0.0129963,0.999891]];
};

private _item1005 = objNull;
if (_layerRoot) then {
	_item1005 = createVehicle ["Christmas_Penguin_Light",[9044.25,15736.8,-0.00189209],[],0,"CAN_COLLIDE"];
	_this = _item1005;
	_objects pushback _this;
	_objectIDs pushback 1005;
	_this setPosWorld [9044.24,15736.8,112.937];
	_this setVectorDirAndUp [[0.718664,-0.694109,-0.0416586],[-0.0249912,-0.0856533,0.996011]];
};

private _item1006 = objNull;
if (_layerRoot) then {
	_item1006 = createVehicle ["Christmas_Reindeer_Light",[8979.84,15725.8,-4.57764e-005],[],0,"CAN_COLLIDE"];
	_this = _item1006;
	_objects pushback _this;
	_objectIDs pushback 1006;
	_this setPosWorld [8979.84,15725.8,112.799];
	_this setVectorDirAndUp [[0.408795,0.912626,0],[0,0,1]];
};

private _item1007 = objNull;
if (_layerRoot) then {
	_item1007 = createVehicle ["Christmas_Sleigh_Bench",[8977.95,15726.4,-0.163353],[],0,"CAN_COLLIDE"];
	_this = _item1007;
	_objects pushback _this;
	_objectIDs pushback 1007;
	_this setPosWorld [8977.95,15726.4,112.406];
	_this setVectorDirAndUp [[0.0665798,0.997781,0],[0,0,1]];
};

private _item1008 = objNull;
if (_layerRoot) then {
	_item1008 = createVehicle ["Christmas_Happy_Snowman",[9045.44,15737.4,-0.00482941],[],0,"CAN_COLLIDE"];
	_this = _item1008;
	_objects pushback _this;
	_objectIDs pushback 1008;
	_this setPosWorld [9045.48,15737.3,113.532];
	_this setVectorDirAndUp [[0.859294,-0.506266,-0.0728595],[0.0339789,-0.0856306,0.995747]];
};

private _item1009 = objNull;
if (_layerRoot) then {
	_item1009 = createVehicle ["Christmas_Happy_Snowman_Bucket",[9042.79,15734.6,-0.000694275],[],0,"CAN_COLLIDE"];
	_this = _item1009;
	_objects pushback _this;
	_objectIDs pushback 1009;
	_this setPosWorld [9042.79,15734.5,113.312];
	_this setVectorDirAndUp [[-0.73116,-0.681765,-0.0245421],[0,-0.0359747,0.999353]];
};

private _item1010 = objNull;
if (_layerRoot) then {
	_item1010 = createVehicle ["Christmas_Clothed_Snowman_Hat",[8980.42,15723.9,-6.86646e-005],[],0,"CAN_COLLIDE"];
	_this = _item1010;
	_objects pushback _this;
	_objectIDs pushback 1010;
	_this setPosWorld [8980.42,15723.9,113.317];
	_this setVectorDirAndUp [[-0.895192,-0.445681,0],[0,0,1]];
};

private _item1011 = objNull;
if (_layerRoot) then {
	_item1011 = createVehicle ["Christmas_Bunny_Right",[8976.65,15732.7,0.0619354],[],0,"CAN_COLLIDE"];
	_this = _item1011;
	_objects pushback _this;
	_objectIDs pushback 1011;
	_this setPosWorld [8976.66,15732.7,112.44];
	_this setVectorDirAndUp [[-0.716062,0.697895,0.0140835],[0.00699926,-0.0129963,0.999891]];
};

private _item1012 = objNull;
if (_layerRoot) then {
	_item1012 = createVehicle ["Christmas_Bunny_SnowFlakes",[8976.16,15728.4,0.810341],[],0,"CAN_COLLIDE"];
	_this = _item1012;
	_objects pushback _this;
	_objectIDs pushback 1012;
	_this setPosWorld [8976.16,15728.4,113.113];
	_this setVectorDirAndUp [[0.903758,0.428045,0],[0,0,1]];
};

private _item1013 = objNull;
if (_layerRoot) then {
	_item1013 = createVehicle ["Christmas_Whole_Tree",[9049.09,15735.4,-0.00491333],[],0,"CAN_COLLIDE"];
	_this = _item1013;
	_objects pushback _this;
	_objectIDs pushback 1013;
	_this setPosWorld [9049.12,15735.3,113.258];
	_this setVectorDirAndUp [[-0.316269,0.944199,0.09199],[0.0339789,-0.0856306,0.995747]];
};

private _item1014 = objNull;
if (_layerRoot) then {
	_item1014 = createVehicle ["Christmas_Snowman_Pack",[8974.08,15728.7,-0.0524979],[],0,"CAN_COLLIDE"];
	_this = _item1014;
	_objects pushback _this;
	_objectIDs pushback 1014;
	_this setPosWorld [8974.08,15728.6,113.625];
	_this setVectorDirAndUp [[-0.111169,-0.993802,0],[0,0,1]];
};

private _item1015 = objNull;
if (_layerRoot) then {
	_item1015 = createVehicle ["Christmas_Gift_Medium_Pattern",[9044.69,15735.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1015;
	_objects pushback _this;
	_objectIDs pushback 1015;
	_this setPosWorld [9044.69,15735.9,112.487];
	_this setVectorDirAndUp [[0.48002,-0.874978,-0.0632005],[-0.0249912,-0.0856533,0.996011]];
};

private _item1016 = objNull;
if (_layerRoot) then {
	_item1016 = createVehicle ["Christmas_Gift_Medium_Tree",[9044.22,15735.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1016;
	_objects pushback _this;
	_objectIDs pushback 1016;
	_this setPosWorld [9044.22,15735.2,112.427];
	_this setVectorDirAndUp [[-0.950942,0.308796,0.0188352],[0,-0.0608824,0.998145]];
};

private _item1017 = objNull;
if (_layerRoot) then {
	_item1017 = createVehicle ["RRP_Gift",[9044,15735.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1017;
	_objects pushback _this;
	_objectIDs pushback 1017;
	_this setPosWorld [9044,15735.9,112.592];
	_this setVectorDirAndUp [[-0.0307858,-0.997672,-0.0608535],[0,-0.0608824,0.998145]];
};

private _item1018 = objNull;
if (_layerRoot) then {
	_item1018 = createVehicle ["Christmas_Gift_Medium_Box",[9043.35,15735.6,-0.409294],[],0,"CAN_COLLIDE"];
	_this = _item1018;
	_objects pushback _this;
	_objectIDs pushback 1018;
	_this setPosWorld [9043.35,15735.6,112.342];
	_this setVectorDirAndUp [[0.479863,-0.875716,-0.0534148],[0,-0.0608824,0.998145]];
};

private _item1019 = objNull;
if (_layerRoot) then {
	_item1019 = createVehicle ["Christmas_Candy_Cane_01",[8975.09,15732.2,-0.123611],[],0,"CAN_COLLIDE"];
	_this = _item1019;
	_objects pushback _this;
	_objectIDs pushback 1019;
	_this setPosWorld [8975.1,15732.2,112.843];
	_this setVectorDirAndUp [[-0.389689,-0.9209,-0.00924176],[0.00699926,-0.0129963,0.999891]];
};

private _item1020 = objNull;
if (_layerRoot) then {
	_item1020 = createVehicle ["Christmas_Whole_Tree",[8975.12,15726.8,0.745209],[],0,"CAN_COLLIDE"];
	_this = _item1020;
	_objects pushback _this;
	_objectIDs pushback 1020;
	_this setPosWorld [8975.12,15726.8,113.667];
	_this setVectorDirAndUp [[0.670507,-0.741903,0],[0,0,1]];
};

private _item1021 = objNull;
if (_layerRoot) then {
	_item1021 = createVehicle ["Christmas_Toy_Rocket",[8976.31,15728.3,1.18102],[],0,"CAN_COLLIDE"];
	_this = _item1021;
	_objects pushback _this;
	_objectIDs pushback 1021;
	_this setPosWorld [8976.31,15728.3,113.241];
	_this setVectorDirAndUp [[0.573665,-0.81909,0],[0,0,1]];
};

private _item1022 = objNull;
if (_layerRoot) then {
	_item1022 = createVehicle ["sapin",[9046.04,15734.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1022;
	_objects pushback _this;
	_objectIDs pushback 1022;
	_this setPosWorld [9046.04,15734.6,116.338];
	_this setVectorDirAndUp [[-0.95736,0.287057,0.0325488],[0.0339789,0,0.999423]];
};

private _item1023 = objNull;
if (_layerRoot) then {
	_item1023 = createVehicle ["Christmas_Bunny_Left",[9047.78,15733,-0.00050354],[],0,"CAN_COLLIDE"];
	_this = _item1023;
	_objects pushback _this;
	_objectIDs pushback 1023;
	_this setPosWorld [9047.8,15733,112.823];
	_this setVectorDirAndUp [[0.903046,0.428445,-0.0307022],[0.0339789,0,0.999423]];
};

private _item1024 = objNull;
if (_layerRoot) then {
	_item1024 = createVehicle ["Christmas_Toy_Train",[8978.32,15731.2,-3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item1024;
	_objects pushback _this;
	_objectIDs pushback 1024;
	_this setPosWorld [8978.32,15731.2,112.222];
	_this setVectorDirAndUp [[-0.98249,-0.186298,-0.00242055],[0,-0.0129918,0.999916]];
};

private _item1025 = objNull;
if (_layerRoot) then {
	_item1025 = createVehicle ["Christmas_Car_Light",[9043.72,15731.9,-0.000289917],[],0,"CAN_COLLIDE"];
	_this = _item1025;
	_objects pushback _this;
	_objectIDs pushback 1025;
	_this setPosWorld [9043.72,15731.9,112.581];
	_this setVectorDirAndUp [[-0.17469,0.983986,0.0354215],[0,-0.0359747,0.999353]];
};

private _item1026 = objNull;
if (_layerRoot) then {
	_item1026 = createVehicle ["Christmas_Toy_Rocket",[9043.61,15733.2,-8.39233e-005],[],0,"CAN_COLLIDE"];
	_this = _item1026;
	_objects pushback _this;
	_objectIDs pushback 1026;
	_this setPosWorld [9043.61,15733.2,112.427];
	_this setVectorDirAndUp [[-0.316077,0.94812,0.0341304],[0,-0.0359747,0.999353]];
};

private _item1027 = objNull;
if (_layerRoot) then {
	_item1027 = createVehicle ["Christmas_Gift_Medium_Pattern",[9046.43,15735.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1027;
	_objects pushback _this;
	_objectIDs pushback 1027;
	_this setPosWorld [9046.43,15735.2,112.387];
	_this setVectorDirAndUp [[0.480503,-0.872217,-0.0914041],[0.0339789,-0.0856306,0.995747]];
};

private _item1028 = objNull;
if (_layerRoot) then {
	_item1028 = createVehicle ["Christmas_Gift_Medium_Tree",[9045.87,15734.7,0],[],0,"CAN_COLLIDE"];
	_this = _item1028;
	_objects pushback _this;
	_objectIDs pushback 1028;
	_this setPosWorld [9045.87,15734.7,112.386];
	_this setVectorDirAndUp [[-0.951112,0.307149,0.0323364],[0.0339789,0,0.999423]];
};

private _item1029 = objNull;
if (_layerRoot) then {
	_item1029 = createVehicle ["RRP_Gift",[9045.65,15735.4,0],[],0,"CAN_COLLIDE"];
	_this = _item1029;
	_objects pushback _this;
	_objectIDs pushback 1029;
	_this setPosWorld [9045.65,15735.4,112.549];
	_this setVectorDirAndUp [[-0.0310295,-0.995933,-0.0845877],[0.0339789,-0.0856306,0.995747]];
};

private _item1030 = objNull;
if (_layerRoot) then {
	_item1030 = createVehicle ["Christmas_Gift_Medium_Box",[9044.88,15734.7,-0.408493],[],0,"CAN_COLLIDE"];
	_this = _item1030;
	_objects pushback _this;
	_objectIDs pushback 1030;
	_this setPosWorld [9044.88,15734.7,112.296];
	_this setVectorDirAndUp [[0.481262,-0.876009,-0.0315346],[0,-0.0359747,0.999353]];
};

private _item1031 = objNull;
if (_layerRoot) then {
	_item1031 = createVehicle ["Christmas_Gift_Medium_Pattern",[9045.72,15733.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1031;
	_objects pushback _this;
	_objectIDs pushback 1031;
	_this setPosWorld [9045.72,15733.8,112.375];
	_this setVectorDirAndUp [[0.480288,-0.876577,-0.0306018],[-0.00198341,-0.0359746,0.999351]];
};

private _item1032 = objNull;
if (_layerRoot) then {
	_item1032 = createVehicle ["Christmas_Gift_Medium_Tree",[9045.25,15733.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1032;
	_objects pushback _this;
	_objectIDs pushback 1032;
	_this setPosWorld [9045.25,15733.1,112.347];
	_this setVectorDirAndUp [[-0.951493,0.307534,0.00918218],[-0.00198341,-0.0359746,0.999351]];
};

private _item1033 = objNull;
if (_layerRoot) then {
	_item1033 = createVehicle ["RRP_Gift",[9045.04,15733.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1033;
	_objects pushback _this;
	_objectIDs pushback 1033;
	_this setPosWorld [9045.04,15733.8,112.494];
	_this setVectorDirAndUp [[-0.0308586,-0.998875,-0.0360187],[-0.00198341,-0.0359746,0.999351]];
};

private _item1034 = objNull;
if (_layerRoot) then {
	_item1034 = createVehicle ["Christmas_Gift_Medium_Box",[9044.38,15733.5,-0.408493],[],0,"CAN_COLLIDE"];
	_this = _item1034;
	_objects pushback _this;
	_objectIDs pushback 1034;
	_this setPosWorld [9044.38,15733.5,112.252];
	_this setVectorDirAndUp [[0.481631,-0.875807,-0.0315273],[0,-0.0359747,0.999353]];
};

private _item1035 = objNull;
if (_layerRoot) then {
	_item1035 = createVehicle ["Christmas_Gift_Medium_Pattern",[9047.13,15732.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1035;
	_objects pushback _this;
	_objectIDs pushback 1035;
	_this setPosWorld [9047.13,15732.8,112.34];
	_this setVectorDirAndUp [[0.480251,-0.876597,-0.0306026],[-0.00198341,-0.0359746,0.999351]];
};

private _item1036 = objNull;
if (_layerRoot) then {
	_item1036 = createVehicle ["Christmas_Gift_Medium_Tree",[9046.44,15732.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1036;
	_objects pushback _this;
	_objectIDs pushback 1036;
	_this setPosWorld [9046.44,15732.6,112.331];
	_this setVectorDirAndUp [[-0.951461,0.307633,0.0091858],[-0.00198341,-0.0359746,0.999351]];
};

private _item1037 = objNull;
if (_layerRoot) then {
	_item1037 = createVehicle ["RRP_Gift",[9046.22,15733.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1037;
	_objects pushback _this;
	_objectIDs pushback 1037;
	_this setPosWorld [9046.22,15733.3,112.478];
	_this setVectorDirAndUp [[-0.030897,-0.998873,-0.0360187],[-0.00198341,-0.0359746,0.999351]];
};

private _item1038 = objNull;
if (_layerRoot) then {
	_item1038 = createVehicle ["Christmas_Gift_Medium_Box",[9043.2,15732.9,-0.408493],[],0,"CAN_COLLIDE"];
	_this = _item1038;
	_objects pushback _this;
	_objectIDs pushback 1038;
	_this setPosWorld [9043.2,15732.8,112.228];
	_this setVectorDirAndUp [[0.481401,-0.875933,-0.0315318],[0,-0.0359747,0.999353]];
};

private _item1039 = objNull;
if (_layerRoot) then {
	_item1039 = createVehicle ["Christmas_Gift_Medium_Pattern",[9047.42,15734.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1039;
	_objects pushback _this;
	_objectIDs pushback 1039;
	_this setPosWorld [9047.42,15734.3,112.333];
	_this setVectorDirAndUp [[0.480503,-0.876841,-0.0163364],[0.0339789,0,0.999423]];
};

private _item1040 = objNull;
if (_layerRoot) then {
	_item1040 = createVehicle ["Christmas_Gift_Medium_Tree",[9046.95,15733.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1040;
	_objects pushback _this;
	_objectIDs pushback 1040;
	_this setPosWorld [9046.95,15733.6,112.349];
	_this setVectorDirAndUp [[-0.950913,0.307764,0.0323297],[0.0339789,0,0.999423]];
};

private _item1041 = objNull;
if (_layerRoot) then {
	_item1041 = createVehicle ["RRP_Gift",[9046.73,15734.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1041;
	_objects pushback _this;
	_objectIDs pushback 1041;
	_this setPosWorld [9046.73,15734.3,112.478];
	_this setVectorDirAndUp [[-0.0303186,-0.99954,0.00103079],[0.0339789,0,0.999423]];
};

private _item1042 = objNull;
if (_layerRoot) then {
	_item1042 = createVehicle ["Christmas_Gift_Medium_Box",[9047.23,15735.2,-0.41156],[],0,"CAN_COLLIDE"];
	_this = _item1042;
	_objects pushback _this;
	_objectIDs pushback 1042;
	_this setPosWorld [9047.25,15735.1,112.239];
	_this setVectorDirAndUp [[0.481594,-0.871616,-0.0913897],[0.0339789,-0.0856306,0.995747]];
};

private _item1043 = objNull;
if (_layerRoot) then {
	_item1043 = createVehicle ["Christmas_Toy_Rocket",[9043.58,15733.7,-0.000144958],[],0,"CAN_COLLIDE"];
	_this = _item1043;
	_objects pushback _this;
	_objectIDs pushback 1043;
	_this setPosWorld [9043.58,15733.7,112.447];
	_this setVectorDirAndUp [[-0.315521,0.948304,0.034137],[0,-0.0359747,0.999353]];
};

private _item1044 = objNull;
if (_layerRoot) then {
	_item1044 = createVehicle ["Christmas_Toy_Rocket",[9043.89,15734.2,-8.39233e-005],[],0,"CAN_COLLIDE"];
	_this = _item1044;
	_objects pushback _this;
	_objectIDs pushback 1044;
	_this setPosWorld [9043.89,15734.2,112.464];
	_this setVectorDirAndUp [[-0.315521,0.948304,0.034137],[0,-0.0359747,0.999353]];
};

private _item1045 = objNull;
if (_layerRoot) then {
	_item1045 = createVehicle ["pere",[9048.19,15740,0],[],0,"CAN_COLLIDE"];
	_this = _item1045;
	_objects pushback _this;
	_objectIDs pushback 1045;
	_this setPosWorld [9048.19,15740,116.449];
	_this setVectorDirAndUp [[0.704762,-0.704425,-0.0842335],[-0.0339789,-0.152112,0.987779]];
};

private _item1046 = objNull;
if (_layerRoot) then {
	_item1046 = createVehicle ["Christmas_Candy_Cane_01",[12822.7,16608.7,-3.8147e-005],[],0,"CAN_COLLIDE"];
	_this = _item1046;
	_objects pushback _this;
	_objectIDs pushback 1046;
	_this setPosWorld [12822.7,16608.7,84.1707];
	_this setVectorDirAndUp [[0.546339,0.837563,0.00166128],[0,-0.00198347,0.999998]];
};

private _item1047 = objNull;
if (_layerRoot) then {
	_item1047 = createVehicle ["Christmas_Penguin_Light",[12827.6,16611.9,-0.000785828],[],0,"CAN_COLLIDE"];
	_this = _item1047;
	_objects pushback _this;
	_objectIDs pushback 1047;
	_this setPosWorld [12827.6,16611.9,83.6255];
	_this setVectorDirAndUp [[-0.0976587,-0.995209,0.00466119],[0.00699926,0.00399665,0.999968]];
};

private _item1048 = objNull;
if (_layerRoot) then {
	_item1048 = createVehicle ["Christmas_Reindeer_Light",[12816.1,16611.9,-0.000183105],[],0,"CAN_COLLIDE"];
	_this = _item1048;
	_objects pushback _this;
	_objectIDs pushback 1048;
	_this setPosWorld [12816.1,16611.9,84.0587];
	_this setVectorDirAndUp [[-0.195077,0.980786,-0.00192636],[-0.0199917,-0.00201263,0.999798]];
};

private _item1049 = objNull;
if (_layerRoot) then {
	_item1049 = createVehicle ["Christmas_Sleigh_Bench",[12813.5,16611.8,-0.000175476],[],0,"CAN_COLLIDE"];
	_this = _item1049;
	_objects pushback _this;
	_objectIDs pushback 1049;
	_this setPosWorld [12813.5,16611.7,83.7769];
	_this setVectorDirAndUp [[-0.522976,0.852303,-0.00874158],[-0.0199917,-0.00201263,0.999798]];
};

private _item1050 = objNull;
if (_layerRoot) then {
	_item1050 = createVehicle ["Christmas_Happy_Snowman",[12828.8,16611.3,-0.00164032],[],0,"CAN_COLLIDE"];
	_this = _item1050;
	_objects pushback _this;
	_objectIDs pushback 1050;
	_this setPosWorld [12828.8,16611.3,84.1629];
	_this setVectorDirAndUp [[0.134429,-0.990919,0.00301955],[0.00699926,0.00399665,0.999968]];
};

private _item1051 = objNull;
if (_layerRoot) then {
	_item1051 = createVehicle ["Christmas_Happy_Snowman_Bucket",[12824.9,16611.7,-0.00172424],[],0,"CAN_COLLIDE"];
	_this = _item1051;
	_objects pushback _this;
	_objectIDs pushback 1051;
	_this setPosWorld [12824.9,16611.7,84.1647];
	_this setVectorDirAndUp [[-0.988983,0.14803,0.000293614],[0,-0.00198347,0.999998]];
};

private _item1052 = objNull;
if (_layerRoot) then {
	_item1052 = createVehicle ["Christmas_Clothed_Snowman_Hat",[12817.7,16610.7,0],[],0,"CAN_COLLIDE"];
	_this = _item1052;
	_objects pushback _this;
	_objectIDs pushback 1052;
	_this setPosWorld [12817.7,16610.7,84.6031];
	_this setVectorDirAndUp [[-0.472132,-0.881526,-0.00174848],[0,-0.00198347,0.999998]];
};

private _item1053 = objNull;
if (_layerRoot) then {
	_item1053 = createVehicle ["Christmas_Bunny_Right",[12809,16615.5,-3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item1053;
	_objects pushback _this;
	_objectIDs pushback 1053;
	_this setPosWorld [12809,16615.5,83.4521];
	_this setVectorDirAndUp [[-0.904373,0.426578,0.0118115],[0.0139945,0.00198321,0.9999]];
};

private _item1054 = objNull;
if (_layerRoot) then {
	_item1054 = createVehicle ["Christmas_Bunny_SnowFlakes",[12811.4,16612.5,-9.91821e-005],[],0,"CAN_COLLIDE"];
	_this = _item1054;
	_objects pushback _this;
	_objectIDs pushback 1054;
	_this setPosWorld [12811.4,16612.5,83.4522];
	_this setVectorDirAndUp [[-0.562587,0.826637,-0.0129136],[-0.0199917,0.00201283,0.999798]];
};

private _item1055 = objNull;
if (_layerRoot) then {
	_item1055 = createVehicle ["Christmas_Whole_Tree",[12829.5,16607.2,-0.00141144],[],0,"CAN_COLLIDE"];
	_this = _item1055;
	_objects pushback _this;
	_objectIDs pushback 1055;
	_this setPosWorld [12829.5,16607.2,84.1949];
	_this setVectorDirAndUp [[0.54657,0.837413,0.00112732],[0.000976388,-0.00198347,0.999998]];
};

private _item1056 = objNull;
if (_layerRoot) then {
	_item1056 = createVehicle ["Christmas_Snowman_Pack",[12809.7,16613.2,-0.000190735],[],0,"CAN_COLLIDE"];
	_this = _item1056;
	_objects pushback _this;
	_objectIDs pushback 1056;
	_this setPosWorld [12809.7,16613.2,84.7959];
	_this setVectorDirAndUp [[0.391162,-0.920315,-0.00364931],[0.0139945,0.00198321,0.9999]];
};

private _item1057 = objNull;
if (_layerRoot) then {
	_item1057 = createVehicle ["Christmas_Gift_Medium_Pattern",[12827.2,16611,0],[],0,"CAN_COLLIDE"];
	_this = _item1057;
	_objects pushback _this;
	_objectIDs pushback 1057;
	_this setPosWorld [12827.2,16611,83.2454];
	_this setVectorDirAndUp [[-0.388644,-0.921366,0.00640281],[0.00699926,0.00399665,0.999968]];
};

private _item1058 = objNull;
if (_layerRoot) then {
	_item1058 = createVehicle ["Christmas_Gift_Medium_Tree",[12826.4,16610.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1058;
	_objects pushback _this;
	_objectIDs pushback 1058;
	_this setPosWorld [12826.4,16610.9,83.2505];
	_this setVectorDirAndUp [[-0.350485,0.936566,0.00219986],[0.000976388,-0.00198347,0.999998]];
};

private _item1059 = objNull;
if (_layerRoot) then {
	_item1059 = createVehicle ["RRP_Gift",[12826.8,16611.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1059;
	_objects pushback _this;
	_objectIDs pushback 1059;
	_this setPosWorld [12826.8,16611.5,83.3681];
	_this setVectorDirAndUp [[-0.802084,-0.597158,0.00800088],[0.00699926,0.00399665,0.999968]];
};

private _item1060 = objNull;
if (_layerRoot) then {
	_item1060 = createVehicle ["Christmas_Gift_Medium_Box",[12826.1,16611.8,-0.40847],[],0,"CAN_COLLIDE"];
	_this = _item1060;
	_objects pushback _this;
	_objectIDs pushback 1060;
	_this setPosWorld [12826.1,16611.8,83.14];
	_this setVectorDirAndUp [[-0.387024,-0.922048,0.00639419],[0.00699926,0.00399665,0.999968]];
};

private _item1061 = objNull;
if (_layerRoot) then {
	_item1061 = createVehicle ["Christmas_Candy_Cane_01",[12807.8,16614.9,-0.000106812],[],0,"CAN_COLLIDE"];
	_this = _item1061;
	_objects pushback _this;
	_objectIDs pushback 1061;
	_this setPosWorld [12807.8,16614.9,84.054];
	_this setVectorDirAndUp [[0.237546,-0.971375,-0.00139804],[0.0139945,0.00198321,0.9999]];
};

private _item1062 = objNull;
if (_layerRoot) then {
	_item1062 = createVehicle ["Christmas_Whole_Tree",[12812,16611.1,0.607574],[],0,"CAN_COLLIDE"];
	_this = _item1062;
	_objects pushback _this;
	_objectIDs pushback 1062;
	_this setPosWorld [12812,16611.1,84.7069];
	_this setVectorDirAndUp [[0.973621,-0.228172,0],[0,0,1]];
};

private _item1063 = objNull;
if (_layerRoot) then {
	_item1063 = createVehicle ["Christmas_Toy_Rocket",[12811.6,16612.2,-3.8147e-005],[],0,"CAN_COLLIDE"];
	_this = _item1063;
	_objects pushback _this;
	_objectIDs pushback 1063;
	_this setPosWorld [12811.6,16612.2,83.2152];
	_this setVectorDirAndUp [[0.973426,-0.22821,0.019005],[-0.0199917,-0.00201263,0.999798]];
};

private _item1064 = objNull;
if (_layerRoot) then {
	_item1064 = createVehicle ["sapin",[12827.1,16609.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1064;
	_objects pushback _this;
	_objectIDs pushback 1064;
	_this setPosWorld [12827.1,16609.1,87.2034];
	_this setVectorDirAndUp [[-0.369871,0.92908,0.00220394],[0.000976388,-0.00198347,0.999998]];
};

private _item1065 = objNull;
if (_layerRoot) then {
	_item1065 = createVehicle ["Christmas_Bunny_Left",[12826.8,16606.8,-0.00119781],[],0,"CAN_COLLIDE"];
	_this = _item1065;
	_objects pushback _this;
	_objectIDs pushback 1065;
	_this setPosWorld [12826.8,16606.8,83.7434];
	_this setVectorDirAndUp [[0.897127,-0.44177,-0.00175218],[0.000976388,-0.00198347,0.999998]];
};

private _item1066 = objNull;
if (_layerRoot) then {
	_item1066 = createVehicle ["Christmas_Toy_Train",[12823.1,16611.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1066;
	_objects pushback _this;
	_objectIDs pushback 1066;
	_this setPosWorld [12823.1,16611.2,83.461];
	_this setVectorDirAndUp [[-0.937347,-0.348397,-0.000691036],[0,-0.00198347,0.999998]];
};

private _item1067 = objNull;
if (_layerRoot) then {
	_item1067 = createVehicle ["Christmas_Car_Light",[12823.5,16609.3,-0.00075531],[],0,"CAN_COLLIDE"];
	_this = _item1067;
	_objects pushback _this;
	_objectIDs pushback 1067;
	_this setPosWorld [12823.5,16609.3,83.5243];
	_this setVectorDirAndUp [[0.662968,0.748646,0.00148492],[0,-0.00198347,0.999998]];
};

private _item1068 = objNull;
if (_layerRoot) then {
	_item1068 = createVehicle ["Christmas_Toy_Rocket",[12824.4,16610.1,-0.000358582],[],0,"CAN_COLLIDE"];
	_this = _item1068;
	_objects pushback _this;
	_objectIDs pushback 1068;
	_this setPosWorld [12824.4,16610.1,83.3279];
	_this setVectorDirAndUp [[0.546853,0.837227,0.00166061],[0,-0.00198347,0.999998]];
};

private _item1069 = objNull;
if (_layerRoot) then {
	_item1069 = createVehicle ["Christmas_Gift_Medium_Pattern",[12827.8,16609.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1069;
	_objects pushback _this;
	_objectIDs pushback 1069;
	_this setPosWorld [12827.8,16609.2,83.2456];
	_this setVectorDirAndUp [[-0.388706,-0.921361,-0.00144796],[0.000976388,-0.00198347,0.999998]];
};

private _item1070 = objNull;
if (_layerRoot) then {
	_item1070 = createVehicle ["Christmas_Gift_Medium_Tree",[12827,16609.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1070;
	_objects pushback _this;
	_objectIDs pushback 1070;
	_this setPosWorld [12827,16609.3,83.2466];
	_this setVectorDirAndUp [[-0.35024,0.936657,0.0021998],[0.000976388,-0.00198347,0.999998]];
};

private _item1071 = objNull;
if (_layerRoot) then {
	_item1071 = createVehicle ["RRP_Gift",[12827.4,16609.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1071;
	_objects pushback _this;
	_objectIDs pushback 1071;
	_this setPosWorld [12827.4,16609.9,83.3691];
	_this setVectorDirAndUp [[-0.802259,-0.596976,-0.000400766],[0.000976388,-0.00198347,0.999998]];
};

private _item1072 = objNull;
if (_layerRoot) then {
	_item1072 = createVehicle ["Christmas_Gift_Medium_Box",[12826.4,16610.1,-0.408356],[],0,"CAN_COLLIDE"];
	_this = _item1072;
	_objects pushback _this;
	_objectIDs pushback 1072;
	_this setPosWorld [12826.4,16610.1,83.1391];
	_this setVectorDirAndUp [[-0.387506,-0.921866,-0.00145014],[0.000976388,-0.00198347,0.999998]];
};

private _item1073 = objNull;
if (_layerRoot) then {
	_item1073 = createVehicle ["Christmas_Gift_Medium_Pattern",[12826.2,16608.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1073;
	_objects pushback _this;
	_objectIDs pushback 1073;
	_this setPosWorld [12826.2,16608.9,83.2465];
	_this setVectorDirAndUp [[-0.388829,-0.921309,-0.00144774],[0.000976388,-0.00198347,0.999998]];
};

private _item1074 = objNull;
if (_layerRoot) then {
	_item1074 = createVehicle ["Christmas_Gift_Medium_Tree",[12825.4,16608.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1074;
	_objects pushback _this;
	_objectIDs pushback 1074;
	_this setPosWorld [12825.4,16608.8,83.2472];
	_this setVectorDirAndUp [[-0.350111,0.936706,0.00219977],[0.000976388,-0.00198347,0.999998]];
};

private _item1075 = objNull;
if (_layerRoot) then {
	_item1075 = createVehicle ["RRP_Gift",[12825.8,16609.4,0],[],0,"CAN_COLLIDE"];
	_this = _item1075;
	_objects pushback _this;
	_objectIDs pushback 1075;
	_this setPosWorld [12825.8,16609.4,83.3697];
	_this setVectorDirAndUp [[-0.802251,-0.596987,-0.000400797],[0.000976388,-0.00198347,0.999998]];
};

private _item1076 = objNull;
if (_layerRoot) then {
	_item1076 = createVehicle ["Christmas_Gift_Medium_Box",[12825.1,16609.7,-0.408363],[],0,"CAN_COLLIDE"];
	_this = _item1076;
	_objects pushback _this;
	_objectIDs pushback 1076;
	_this setPosWorld [12825.1,16609.7,83.1396];
	_this setVectorDirAndUp [[-0.387278,-0.921962,-0.00145055],[0.000976388,-0.00198347,0.999998]];
};

private _item1077 = objNull;
if (_layerRoot) then {
	_item1077 = createVehicle ["Christmas_Gift_Medium_Pattern",[12826.3,16607.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1077;
	_objects pushback _this;
	_objectIDs pushback 1077;
	_this setPosWorld [12826.3,16607.1,83.243];
	_this setVectorDirAndUp [[-0.388868,-0.921292,-0.00144767],[0.000976388,-0.00198347,0.999998]];
};

private _item1078 = objNull;
if (_layerRoot) then {
	_item1078 = createVehicle ["Christmas_Gift_Medium_Tree",[12825.7,16607.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1078;
	_objects pushback _this;
	_objectIDs pushback 1078;
	_this setPosWorld [12825.7,16607.5,83.2444];
	_this setVectorDirAndUp [[-0.350036,0.936734,0.00219976],[0.000976388,-0.00198347,0.999998]];
};

private _item1079 = objNull;
if (_layerRoot) then {
	_item1079 = createVehicle ["RRP_Gift",[12826.1,16608.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1079;
	_objects pushback _this;
	_objectIDs pushback 1079;
	_this setPosWorld [12826.1,16608.1,83.3669];
	_this setVectorDirAndUp [[-0.802364,-0.596835,-0.000400383],[0.000976388,-0.00198347,0.999998]];
};

private _item1080 = objNull;
if (_layerRoot) then {
	_item1080 = createVehicle ["Christmas_Gift_Medium_Box",[12823.9,16610.2,-0.408371],[],0,"CAN_COLLIDE"];
	_this = _item1080;
	_objects pushback _this;
	_objectIDs pushback 1080;
	_this setPosWorld [12823.9,16610.2,83.1407];
	_this setVectorDirAndUp [[-0.387274,-0.921963,-0.00182869],[0,-0.00198347,0.999998]];
};

private _item1081 = objNull;
if (_layerRoot) then {
	_item1081 = createVehicle ["Christmas_Gift_Medium_Pattern",[12827.7,16607.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1081;
	_objects pushback _this;
	_objectIDs pushback 1081;
	_this setPosWorld [12827.7,16607.9,83.243];
	_this setVectorDirAndUp [[-0.388868,-0.921292,-0.00144767],[0.000976388,-0.00198347,0.999998]];
};

private _item1082 = objNull;
if (_layerRoot) then {
	_item1082 = createVehicle ["Christmas_Gift_Medium_Tree",[12826.8,16607.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1082;
	_objects pushback _this;
	_objectIDs pushback 1082;
	_this setPosWorld [12826.8,16607.8,83.2437];
	_this setVectorDirAndUp [[-0.350036,0.936734,0.00219976],[0.000976388,-0.00198347,0.999998]];
};

private _item1083 = objNull;
if (_layerRoot) then {
	_item1083 = createVehicle ["RRP_Gift",[12827.2,16608.4,0],[],0,"CAN_COLLIDE"];
	_this = _item1083;
	_objects pushback _this;
	_objectIDs pushback 1083;
	_this setPosWorld [12827.2,16608.4,83.3662];
	_this setVectorDirAndUp [[-0.80239,-0.596801,-0.000400291],[0.000976388,-0.00198347,0.999998]];
};

private _item1084 = objNull;
if (_layerRoot) then {
	_item1084 = createVehicle ["Christmas_Gift_Medium_Box",[12828.2,16608.5,-0.408287],[],0,"CAN_COLLIDE"];
	_this = _item1084;
	_objects pushback _this;
	_objectIDs pushback 1084;
	_this setPosWorld [12828.2,16608.5,83.1342];
	_this setVectorDirAndUp [[-0.387721,-0.921776,-0.00144975],[0.000976388,-0.00198347,0.999998]];
};

private _item1085 = objNull;
if (_layerRoot) then {
	_item1085 = createVehicle ["Christmas_Toy_Rocket",[12824.8,16610.5,-0.000350952],[],0,"CAN_COLLIDE"];
	_this = _item1085;
	_objects pushback _this;
	_objectIDs pushback 1085;
	_this setPosWorld [12824.8,16610.5,83.3286];
	_this setVectorDirAndUp [[0.546864,0.83722,0.0016606],[0,-0.00198347,0.999998]];
};

private _item1086 = objNull;
if (_layerRoot) then {
	_item1086 = createVehicle ["Christmas_Toy_Rocket",[12825.4,16610.6,-0.000350952],[],0,"CAN_COLLIDE"];
	_this = _item1086;
	_objects pushback _this;
	_objectIDs pushback 1086;
	_this setPosWorld [12825.4,16610.6,83.3283];
	_this setVectorDirAndUp [[0.546864,0.837221,0.00112665],[0.000976388,-0.00198347,0.999998]];
};

private _item1087 = objNull;
if (_layerRoot) then {
	_item1087 = createVehicle ["pere",[12821,16609.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1087;
	_objects pushback _this;
	_objectIDs pushback 1087;
	_this setPosWorld [12821,16609.5,86.9103];
	_this setVectorDirAndUp [[-0.288913,-0.957353,-0.00189888],[0,-0.00198347,0.999998]];
};

private _item1088 = objNull;
if (_layerRoot) then {
	_item1088 = createVehicle ["Christmas_Candy_Cane_01",[17039.4,12827.9,-0.000645638],[],0,"CAN_COLLIDE"];
	_this = _item1088;
	_objects pushback _this;
	_objectIDs pushback 1088;
	_this setPosWorld [17039.4,12827.9,16.8382];
	_this setVectorDirAndUp [[-0.490741,0.871293,0.00466574],[0.0329514,0.0132077,0.99937]];
};

private _item1089 = objNull;
if (_layerRoot) then {
	_item1089 = createVehicle ["Christmas_Penguin_Light",[17038.9,12833.7,-0.000285149],[],0,"CAN_COLLIDE"];
	_this = _item1089;
	_objects pushback _this;
	_objectIDs pushback 1089;
	_this setPosWorld [17038.9,12833.7,16.2591];
	_this setVectorDirAndUp [[0.837467,-0.545817,-0.0270676],[0.0302815,-0.00310594,0.999537]];
};

private _item1090 = objNull;
if (_layerRoot) then {
	_item1090 = createVehicle ["Christmas_Reindeer_Light",[17033.6,12823.5,-0.000177383],[],0,"CAN_COLLIDE"];
	_this = _item1090;
	_objects pushback _this;
	_objectIDs pushback 1090;
	_this setPosWorld [17033.6,12823.5,17.012];
	_this setVectorDirAndUp [[-0.96008,0.279625,-0.00748329],[0.000345055,0.0279362,0.99961]];
};

private _item1092 = objNull;
if (_layerRoot) then {
	_item1092 = createVehicle ["Christmas_Happy_Snowman",[17040,12834.5,-0.000351906],[],0,"CAN_COLLIDE"];
	_this = _item1092;
	_objects pushback _this;
	_objectIDs pushback 1092;
	_this setPosWorld [17040.1,12834.5,16.7721];
	_this setVectorDirAndUp [[0.940358,-0.337434,-0.0431768],[0.0447551,-0.00310425,0.998993]];
};

private _item1093 = objNull;
if (_layerRoot) then {
	_item1093 = createVehicle ["Christmas_Happy_Snowman_Bucket",[17037.9,12831.3,-0.000149727],[],0,"CAN_COLLIDE"];
	_this = _item1093;
	_objects pushback _this;
	_objectIDs pushback 1093;
	_this setPosWorld [17037.9,12831.3,16.834];
	_this setVectorDirAndUp [[-0.587601,-0.808592,0.0300609],[0.0329514,0.0132077,0.99937]];
};

private _item1094 = objNull;
if (_layerRoot) then {
	_item1094 = createVehicle ["Christmas_Clothed_Snowman_Hat",[17035.4,12824.2,-0.00165939],[],0,"CAN_COLLIDE"];
	_this = _item1094;
	_objects pushback _this;
	_objectIDs pushback 1094;
	_this setPosWorld [17035.4,12824.3,17.4482];
	_this setVectorDirAndUp [[0.564334,-0.825009,0.0297989],[0.026895,0.0544499,0.998154]];
};

private _item1097 = objNull;
if (_layerRoot) then {
	_item1097 = createVehicle ["Christmas_Whole_Tree",[17044,12833.2,-0.000195503],[],0,"CAN_COLLIDE"];
	_this = _item1097;
	_objects pushback _this;
	_objectIDs pushback 1097;
	_this setPosWorld [17044,12833.2,16.6155];
	_this setVectorDirAndUp [[-0.490374,0.871162,0.0246759],[0.0447551,-0.00310425,0.998993]];
};

private _item1099 = objNull;
if (_layerRoot) then {
	_item1099 = createVehicle ["Christmas_Gift_Medium_Pattern",[17039.5,12833,0],[],0,"CAN_COLLIDE"];
	_this = _item1099;
	_objects pushback _this;
	_objectIDs pushback 1099;
	_this setPosWorld [17039.5,12833,15.8512];
	_this setVectorDirAndUp [[0.637772,-0.769919,-0.0217141],[0.0302815,-0.00310594,0.999537]];
};

private _item1100 = objNull;
if (_layerRoot) then {
	_item1100 = createVehicle ["Christmas_Gift_Medium_Tree",[17039.2,12832.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1100;
	_objects pushback _this;
	_objectIDs pushback 1100;
	_this setPosWorld [17039.2,12832.1,15.8663];
	_this setVectorDirAndUp [[-0.992083,0.121675,0.0311031],[0.0329514,0.0132077,0.99937]];
};

private _item1101 = objNull;
if (_layerRoot) then {
	_item1101 = createVehicle ["RRP_Gift",[17038.9,12832.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1101;
	_objects pushback _this;
	_objectIDs pushback 1101;
	_this setPosWorld [17038.9,12832.8,15.9948];
	_this setVectorDirAndUp [[0.15957,-0.98717,-0.00574252],[0.03295,-0.000487841,0.999457]];
};

private _item1102 = objNull;
if (_layerRoot) then {
	_item1102 = createVehicle ["Christmas_Gift_Medium_Box",[17038.3,12832.4,-0.408272],[],0,"CAN_COLLIDE"];
	_this = _item1102;
	_objects pushback _this;
	_objectIDs pushback 1102;
	_this setPosWorld [17038.3,12832.4,15.7844];
	_this setVectorDirAndUp [[0.638868,-0.769239,-0.0108986],[0.0329514,0.0132077,0.99937]];
};

private _item1106 = objNull;
if (_layerRoot) then {
	_item1106 = createVehicle ["sapin",[17041.1,12831.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1106;
	_objects pushback _this;
	_objectIDs pushback 1106;
	_this setPosWorld [17041.1,12831.9,19.741];
	_this setVectorDirAndUp [[-0.993911,0.100614,0.0449297],[0.0447551,-0.00399266,0.99899]];
};

private _item1107 = objNull;
if (_layerRoot) then {
	_item1107 = createVehicle ["Christmas_Bunny_Left",[17043.1,12830.7,-0.00114155],[],0,"CAN_COLLIDE"];
	_this = _item1107;
	_objects pushback _this;
	_objectIDs pushback 1107;
	_this setPosWorld [17043.2,12830.7,16.1899];
	_this setVectorDirAndUp [[0.805411,0.591757,-0.0337176],[0.0447551,-0.00399266,0.99899]];
};

private _item1108 = objNull;
if (_layerRoot) then {
	_item1108 = createVehicle ["Christmas_Toy_Train",[17037.5,12829.4,-5.34058e-005],[],0,"CAN_COLLIDE"];
	_this = _item1108;
	_objects pushback _this;
	_objectIDs pushback 1108;
	_this setPosWorld [17037.5,12829.4,16.1686];
	_this setVectorDirAndUp [[-0.123934,-0.992141,0.0171986],[0.0329514,0.0132077,0.99937]];
};

private _item1109 = objNull;
if (_layerRoot) then {
	_item1109 = createVehicle ["Christmas_Car_Light",[17039.3,12828.8,-0.000198364],[],0,"CAN_COLLIDE"];
	_this = _item1109;
	_objects pushback _this;
	_objectIDs pushback 1109;
	_this setPosWorld [17039.3,12828.8,16.1822];
	_this setVectorDirAndUp [[-0.358833,0.933402,-0.000504397],[0.0329514,0.0132077,0.99937]];
};

private _item1110 = objNull;
if (_layerRoot) then {
	_item1110 = createVehicle ["Christmas_Toy_Rocket",[17039,12830,-3.24249e-005],[],0,"CAN_COLLIDE"];
	_this = _item1110;
	_objects pushback _this;
	_objectIDs pushback 1110;
	_this setPosWorld [17039,12830.1,15.9791];
	_this setVectorDirAndUp [[-0.490203,0.871596,0.00464399],[0.0329514,0.0132077,0.99937]];
};

private _item1111 = objNull;
if (_layerRoot) then {
	_item1111 = createVehicle ["Christmas_Gift_Medium_Pattern",[17041.4,12832.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1111;
	_objects pushback _this;
	_objectIDs pushback 1111;
	_this setPosWorld [17041.4,12832.6,15.7742];
	_this setVectorDirAndUp [[0.637335,-0.769965,-0.0309453],[0.0447551,-0.00310425,0.998993]];
};

private _item1112 = objNull;
if (_layerRoot) then {
	_item1112 = createVehicle ["Christmas_Gift_Medium_Tree",[17040.9,12832,0],[],0,"CAN_COLLIDE"];
	_this = _item1112;
	_objects pushback _this;
	_objectIDs pushback 1112;
	_this setPosWorld [17040.9,12832,15.7919];
	_this setVectorDirAndUp [[-0.991595,0.121334,0.0449088],[0.0447551,-0.00399266,0.99899]];
};

private _item1113 = objNull;
if (_layerRoot) then {
	_item1113 = createVehicle ["RRP_Gift",[17040.6,12832.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1113;
	_objects pushback _this;
	_objectIDs pushback 1113;
	_this setPosWorld [17040.6,12832.6,15.9316];
	_this setVectorDirAndUp [[0.159238,-0.987187,-0.0102015],[0.0447551,-0.00310425,0.998993]];
};

private _item1114 = objNull;
if (_layerRoot) then {
	_item1114 = createVehicle ["Christmas_Gift_Medium_Box",[17040,12831.8,-0.408271],[],0,"CAN_COLLIDE"];
	_this = _item1114;
	_objects pushback _this;
	_objectIDs pushback 1114;
	_this setPosWorld [17040,12831.8,15.7367];
	_this setVectorDirAndUp [[0.638678,-0.769397,-0.0108902],[0.0329514,0.0132077,0.99937]];
};

private _item1115 = objNull;
if (_layerRoot) then {
	_item1115 = createVehicle ["Christmas_Gift_Medium_Pattern",[17041,12831.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1115;
	_objects pushback _this;
	_objectIDs pushback 1115;
	_this setPosWorld [17041,12831.1,15.795];
	_this setVectorDirAndUp [[0.636832,-0.770445,-0.0293138],[0.0618952,0.0131896,0.997995]];
};

private _item1116 = objNull;
if (_layerRoot) then {
	_item1116 = createVehicle ["Christmas_Gift_Medium_Tree",[17040.6,12830.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1116;
	_objects pushback _this;
	_objectIDs pushback 1116;
	_this setPosWorld [17040.6,12830.3,15.8258];
	_this setVectorDirAndUp [[-0.990773,0.121609,0.05984],[0.0618952,0.0131896,0.997995]];
};

private _item1117 = objNull;
if (_layerRoot) then {
	_item1117 = createVehicle ["RRP_Gift",[17040.3,12830.9,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item1117;
	_objects pushback _this;
	_objectIDs pushback 1117;
	_this setPosWorld [17040.3,12830.9,15.9603];
	_this setVectorDirAndUp [[0.15911,-0.987256,0.00317969],[0.0618952,0.0131896,0.997995]];
};

private _item1118 = objNull;
if (_layerRoot) then {
	_item1118 = createVehicle ["Christmas_Gift_Medium_Box",[17039.7,12830.5,-0.408283],[],0,"CAN_COLLIDE"];
	_this = _item1118;
	_objects pushback _this;
	_objectIDs pushback 1118;
	_this setPosWorld [17039.7,12830.5,15.7625];
	_this setVectorDirAndUp [[0.638925,-0.769191,-0.0109011],[0.0329514,0.0132077,0.99937]];
};

private _item1119 = objNull;
if (_layerRoot) then {
	_item1119 = createVehicle ["Christmas_Gift_Medium_Pattern",[17042.5,12830.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1119;
	_objects pushback _this;
	_objectIDs pushback 1119;
	_this setPosWorld [17042.5,12830.3,15.7136];
	_this setVectorDirAndUp [[0.63685,-0.770339,-0.0316099],[0.0447551,-0.00399266,0.99899]];
};

private _item1120 = objNull;
if (_layerRoot) then {
	_item1120 = createVehicle ["Christmas_Gift_Medium_Tree",[17041.9,12830,0],[],0,"CAN_COLLIDE"];
	_this = _item1120;
	_objects pushback _this;
	_objectIDs pushback 1120;
	_this setPosWorld [17041.9,12830,15.7511];
	_this setVectorDirAndUp [[-0.99074,0.121881,0.0598344],[0.0618952,0.0131896,0.997995]];
};

private _item1121 = objNull;
if (_layerRoot) then {
	_item1121 = createVehicle ["RRP_Gift",[17041.6,12830.7,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item1121;
	_objects pushback _this;
	_objectIDs pushback 1121;
	_this setPosWorld [17041.6,12830.7,15.8854];
	_this setVectorDirAndUp [[0.159567,-0.987182,0.00315039],[0.0618952,0.0131896,0.997995]];
};

private _item1122 = objNull;
if (_layerRoot) then {
	_item1122 = createVehicle ["Christmas_Gift_Medium_Box",[17038.7,12829.7,-0.408283],[],0,"CAN_COLLIDE"];
	_this = _item1122;
	_objects pushback _this;
	_objectIDs pushback 1122;
	_this setPosWorld [17038.7,12829.7,15.808];
	_this setVectorDirAndUp [[0.638724,-0.769359,-0.0108922],[0.0329514,0.0132077,0.99937]];
};

private _item1123 = objNull;
if (_layerRoot) then {
	_item1123 = createVehicle ["Christmas_Gift_Medium_Pattern",[17042.5,12831.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1123;
	_objects pushback _this;
	_objectIDs pushback 1123;
	_this setPosWorld [17042.5,12831.9,15.7201];
	_this setVectorDirAndUp [[0.636793,-0.770387,-0.0316076],[0.0447551,-0.00399266,0.99899]];
};

private _item1124 = objNull;
if (_layerRoot) then {
	_item1124 = createVehicle ["Christmas_Gift_Medium_Tree",[17042.2,12831.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1124;
	_objects pushback _this;
	_objectIDs pushback 1124;
	_this setPosWorld [17042.2,12831.1,15.7313];
	_this setVectorDirAndUp [[-0.991655,0.120844,0.0449095],[0.0447551,-0.00399266,0.99899]];
};

private _item1125 = objNull;
if (_layerRoot) then {
	_item1125 = createVehicle ["RRP_Gift",[17041.9,12831.7,0],[],0,"CAN_COLLIDE"];
	_this = _item1125;
	_objects pushback _this;
	_objectIDs pushback 1125;
	_this setPosWorld [17041.9,12831.7,15.8713];
	_this setVectorDirAndUp [[0.159729,-0.987099,-0.011101],[0.0447551,-0.00399266,0.99899]];
};

private _item1126 = objNull;
if (_layerRoot) then {
	_item1126 = createVehicle ["Christmas_Gift_Medium_Box",[17042.2,12832.7,-0.408621],[],0,"CAN_COLLIDE"];
	_this = _item1126;
	_objects pushback _this;
	_objectIDs pushback 1126;
	_this setPosWorld [17042.2,12832.7,15.6279];
	_this setVectorDirAndUp [[0.638646,-0.768876,-0.0310007],[0.0447551,-0.00310425,0.998993]];
};

private _item1127 = objNull;
if (_layerRoot) then {
	_item1127 = createVehicle ["Christmas_Toy_Rocket",[17038.9,12830.6,-3.24249e-005],[],0,"CAN_COLLIDE"];
	_this = _item1127;
	_objects pushback _this;
	_objectIDs pushback 1127;
	_this setPosWorld [17038.9,12830.6,15.9766];
	_this setVectorDirAndUp [[-0.490192,0.871602,0.00464355],[0.0329514,0.0132077,0.99937]];
};

private _item1128 = objNull;
if (_layerRoot) then {
	_item1128 = createVehicle ["Christmas_Toy_Rocket",[17039.1,12831.1,-3.24249e-005],[],0,"CAN_COLLIDE"];
	_this = _item1128;
	_objects pushback _this;
	_objectIDs pushback 1128;
	_this setPosWorld [17039.1,12831.1,15.9625];
	_this setVectorDirAndUp [[-0.490128,0.871638,0.00464095],[0.0329514,0.0132077,0.99937]];
};

private _item1129 = objNull;
if (_layerRoot) then {
	_item1129 = createVehicle ["pere",[17038,12826.7,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item1129;
	_objects pushback _this;
	_objectIDs pushback 1129;
	_this setPosWorld [17038,12826.7,19.6377];
	_this setVectorDirAndUp [[0.715791,-0.698169,-0.0142657],[0.026895,0.00714865,0.999613]];
};

private _item1130 = objNull;
if (_layerRoot) then {
	_item1130 = createVehicle ["Christmas_Candy_Cane_01",[3728.64,12999.3,-0.00123262],[],0,"CAN_COLLIDE"];
	_this = _item1130;
	_objects pushback _this;
	_objectIDs pushback 1130;
	_this setPosWorld [3728.65,12999.3,8.88973];
	_this setVectorDirAndUp [[-0.895062,0.445936,-0.0024374],[0.00119573,0.00786566,0.999968]];
};

private _item1131 = objNull;
if (_layerRoot) then {
	_item1131 = createVehicle ["Christmas_Penguin_Light",[3724.96,13003.9,-0.000431538],[],0,"CAN_COLLIDE"];
	_this = _item1131;
	_objects pushback _this;
	_objectIDs pushback 1131;
	_this setPosWorld [3724.95,13003.9,8.29301];
	_this setVectorDirAndUp [[0.999771,0.0186179,0.0105273],[-0.0106752,0.00786522,0.999912]];
};

private _item1132 = objNull;
if (_layerRoot) then {
	_item1132 = createVehicle ["Christmas_Reindeer_Light",[3726.98,12985.6,-0.000693321],[],0,"CAN_COLLIDE"];
	_this = _item1132;
	_objects pushback _this;
	_objectIDs pushback 1132;
	_this setPosWorld [3726.98,12985.6,8.93538];
	_this setVectorDirAndUp [[-0.910387,-0.413743,0.00363653],[0.00172597,0.00499144,0.999986]];
};

private _item1133 = objNull;
if (_layerRoot) then {
	_item1133 = createVehicle ["Christmas_Sleigh_Bench",[3727.85,12989.7,-0.0015049],[],0,"CAN_COLLIDE"];
	_this = _item1133;
	_objects pushback _this;
	_objectIDs pushback 1133;
	_this setPosWorld [3727.87,12989.7,8.67098];
	_this setVectorDirAndUp [[-0.710324,-0.703873,0.00155549],[0.0187074,-0.0166697,0.999686]];
};

private _item1134 = objNull;
if (_layerRoot) then {
	_item1134 = createVehicle ["Christmas_Happy_Snowman",[3728.88,13006.2,-0.000123501],[],0,"CAN_COLLIDE"];
	_this = _item1134;
	_objects pushback _this;
	_objectIDs pushback 1134;
	_this setPosWorld [3728.87,13006.2,8.83208];
	_this setVectorDirAndUp [[0.258078,-0.965317,0.0394877],[-0.0145049,0.0369962,0.99921]];
};

private _item1135 = objNull;
if (_layerRoot) then {
	_item1135 = createVehicle ["Christmas_Happy_Snowman_Bucket",[3725.55,13005.4,-0.000377655],[],0,"CAN_COLLIDE"];
	_this = _item1135;
	_objects pushback _this;
	_objectIDs pushback 1135;
	_this setPosWorld [3725.54,13005.4,8.80587];
	_this setVectorDirAndUp [[-0.548152,-0.836246,0.0148832],[-0.0106752,0.0247887,0.999636]];
};

private _item1136 = objNull;
if (_layerRoot) then {
	_item1136 = createVehicle ["Christmas_Clothed_Snowman_Hat",[3726.94,12993,-0.0015645],[],0,"CAN_COLLIDE"];
	_this = _item1136;
	_objects pushback _this;
	_objectIDs pushback 1136;
	_this setPosWorld [3726.95,12993,9.39314];
	_this setVectorDirAndUp [[0.965996,-0.258556,0.000408757],[0.00302964,0.0128999,0.999912]];
};

private _item1137 = objNull;
if (_layerRoot) then {
	_item1137 = createVehicle ["Christmas_Bunny_Right",[3726.42,12974.7,-0.000169754],[],0,"CAN_COLLIDE"];
	_this = _item1137;
	_objects pushback _this;
	_objectIDs pushback 1137;
	_this setPosWorld [3726.42,12974.7,8.46051];
	_this setVectorDirAndUp [[-0.208929,-0.97793,-0.00143234],[0,-0.00146467,0.999999]];
};

private _item1138 = objNull;
if (_layerRoot) then {
	_item1138 = createVehicle ["Christmas_Bunny_SnowFlakes",[3727.06,12986.6,-0.000322819],[],0,"CAN_COLLIDE"];
	_this = _item1138;
	_objects pushback _this;
	_objectIDs pushback 1138;
	_this setPosWorld [3727.06,12986.6,8.41728];
	_this setVectorDirAndUp [[-0.676462,-0.736462,0.00484363],[0.00172597,0.00499144,0.999986]];
};

private _item1139 = objNull;
if (_layerRoot) then {
	_item1139 = createVehicle ["Christmas_Whole_Tree",[3751.13,13007.4,0.162749],[],0,"CAN_COLLIDE"];
	_this = _item1139;
	_objects pushback _this;
	_objectIDs pushback 1139;
	_this setPosWorld [3751.14,13007.4,9.03145];
	_this setVectorDirAndUp [[-0.894937,0.446092,0.00940931],[0.00877542,-0.00348679,0.999955]];
};

private _item1140 = objNull;
if (_layerRoot) then {
	_item1140 = createVehicle ["Christmas_Snowman_Pack",[3530.49,13012.7,-0.00404835],[],0,"CAN_COLLIDE"];
	_this = _item1140;
	_objects pushback _this;
	_objectIDs pushback 1140;
	_this setPosWorld [3530.58,13012.8,9.19823];
	_this setVectorDirAndUp [[-0.461294,0.887062,-0.0181398],[0.0486985,0.0457281,0.997766]];
};

private _item1141 = objNull;
if (_layerRoot) then {
	_item1141 = createVehicle ["Christmas_Gift_Medium_Pattern",[3725.88,13003.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1141;
	_objects pushback _this;
	_objectIDs pushback 1141;
	_this setPosWorld [3725.88,13003.6,7.91833];
	_this setVectorDirAndUp [[0.960218,-0.278973,0.0124458],[-0.0106752,0.00786522,0.999912]];
};

private _item1142 = objNull;
if (_layerRoot) then {
	_item1142 = createVehicle ["Christmas_Gift_Medium_Tree",[3726.07,13002.7,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item1142;
	_objects pushback _this;
	_objectIDs pushback 1142;
	_this setPosWorld [3726.07,13002.7,7.92716];
	_this setVectorDirAndUp [[-0.889497,-0.456902,-0.00590248],[-0.0106752,0.00786522,0.999912]];
};

private _item1143 = objNull;
if (_layerRoot) then {
	_item1143 = createVehicle ["RRP_Gift",[3725.41,13003.1,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item1143;
	_objects pushback _this;
	_objectIDs pushback 1143;
	_this setPosWorld [3725.41,13003.1,8.03903];
	_this setVectorDirAndUp [[0.686244,-0.727254,0.013047],[-0.0106752,0.00786522,0.999912]];
};

private _item1144 = objNull;
if (_layerRoot) then {
	_item1144 = createVehicle ["Christmas_Gift_Medium_Box",[3725.16,13002.4,-0.408544],[],0,"CAN_COLLIDE"];
	_this = _item1144;
	_objects pushback _this;
	_objectIDs pushback 1144;
	_this setPosWorld [3725.16,13002.4,7.80994];
	_this setVectorDirAndUp [[0.960641,-0.277514,0.0124389],[-0.0106752,0.00786522,0.999912]];
};

private _item1145 = objNull;
if (_layerRoot) then {
	_item1145 = createVehicle ["Christmas_Candy_Cane_01",[3727.3,12973.7,-0.000388145],[],0,"CAN_COLLIDE"];
	_this = _item1145;
	_objects pushback _this;
	_objectIDs pushback 1145;
	_this setPosWorld [3727.3,12973.7,9.04317];
	_this setVectorDirAndUp [[0.89154,0.452941,0.000663409],[0,-0.00146467,0.999999]];
};

private _item1146 = objNull;
if (_layerRoot) then {
	_item1146 = createVehicle ["Christmas_Whole_Tree",[3726.77,12994.8,-0.000679493],[],0,"CAN_COLLIDE"];
	_this = _item1146;
	_objects pushback _this;
	_objectIDs pushback 1146;
	_this setPosWorld [3726.78,12994.8,8.97593];
	_this setVectorDirAndUp [[0,0.999917,-0.0129],[0.00302964,0.0128999,0.999912]];
};

private _item1147 = objNull;
if (_layerRoot) then {
	_item1147 = createVehicle ["Christmas_Toy_Rocket",[3727.33,12987,-0.00013876],[],0,"CAN_COLLIDE"];
	_this = _item1147;
	_objects pushback _this;
	_objectIDs pushback 1147;
	_this setPosWorld [3727.33,12987,8.17349];
	_this setVectorDirAndUp [[0,0.999988,-0.00499145],[0.00172597,0.00499144,0.999986]];
};

private _item1148 = objNull;
if (_layerRoot) then {
	_item1148 = createVehicle ["sapin",[3727.75,13003.6,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item1148;
	_objects pushback _this;
	_objectIDs pushback 1148;
	_this setPosWorld [3727.75,13003.6,11.8923];
	_this setVectorDirAndUp [[-0.879862,-0.475205,0.00479003],[0.00119573,0.00786566,0.999968]];
};

private _item1149 = objNull;
if (_layerRoot) then {
	_item1149 = createVehicle ["Christmas_Bunny_Left",[3730.16,13003.7,-0.000957489],[],0,"CAN_COLLIDE"];
	_this = _item1149;
	_objects pushback _this;
	_objectIDs pushback 1149;
	_this setPosWorld [3730.16,13003.7,8.4547];
	_this setVectorDirAndUp [[0.334433,0.94234,0.0122567],[-0.0145049,-0.00785719,0.999864]];
};

private _item1150 = objNull;
if (_layerRoot) then {
	_item1150 = createVehicle ["Christmas_Toy_Train",[3726.15,12999.5,-0.000298023],[],0,"CAN_COLLIDE"];
	_this = _item1150;
	_objects pushback _this;
	_objectIDs pushback 1150;
	_this setPosWorld [3726.14,12999.5,8.16164];
	_this setVectorDirAndUp [[0.454293,-0.890773,0.0118569],[-0.0106752,0.00786522,0.999912]];
};

private _item1151 = objNull;
if (_layerRoot) then {
	_item1151 = createVehicle ["Christmas_Car_Light",[3728.02,13000.1,-0.000457287],[],0,"CAN_COLLIDE"];
	_this = _item1151;
	_objects pushback _this;
	_objectIDs pushback 1151;
	_this setPosWorld [3728.03,13000.1,8.23873];
	_this setVectorDirAndUp [[-0.820651,0.571419,-0.00351342],[0.00119573,0.00786566,0.999968]];
};

private _item1152 = objNull;
if (_layerRoot) then {
	_item1152 = createVehicle ["Christmas_Toy_Rocket",[3727.07,13000.9,-0.000157833],[],0,"CAN_COLLIDE"];
	_this = _item1152;
	_objects pushback _this;
	_objectIDs pushback 1152;
	_this setPosWorld [3727.06,13000.9,8.03014];
	_this setVectorDirAndUp [[-0.895013,0.445849,-0.0130623],[-0.0106752,0.00786522,0.999912]];
};

private _item1153 = objNull;
if (_layerRoot) then {
	_item1153 = createVehicle ["Christmas_Gift_Medium_Pattern",[3727.6,13004.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1153;
	_objects pushback _this;
	_objectIDs pushback 1153;
	_this setPosWorld [3727.6,13004.3,7.92973];
	_this setVectorDirAndUp [[0.960256,-0.279118,0.00104727],[0.00119573,0.00786566,0.999968]];
};

private _item1154 = objNull;
if (_layerRoot) then {
	_item1154 = createVehicle ["Christmas_Gift_Medium_Tree",[3727.58,13003.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1154;
	_objects pushback _this;
	_objectIDs pushback 1154;
	_this setPosWorld [3727.58,13003.5,7.9359];
	_this setVectorDirAndUp [[-0.889667,-0.456587,0.00465531],[0.00119573,0.00786566,0.999968]];
};

private _item1155 = objNull;
if (_layerRoot) then {
	_item1155 = createVehicle ["RRP_Gift",[3726.93,13003.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1155;
	_objects pushback _this;
	_objectIDs pushback 1155;
	_this setPosWorld [3726.93,13003.9,8.04881];
	_this setVectorDirAndUp [[0.686034,-0.727452,0.0130463],[-0.0106752,0.00786522,0.999912]];
};

private _item1156 = objNull;
if (_layerRoot) then {
	_item1156 = createVehicle ["Christmas_Gift_Medium_Box",[3726.87,13002.9,-0.408539],[],0,"CAN_COLLIDE"];
	_this = _item1156;
	_objects pushback _this;
	_objectIDs pushback 1156;
	_this setPosWorld [3726.86,13002.9,7.82439];
	_this setVectorDirAndUp [[0.960565,-0.277777,0.0124401],[-0.0106752,0.00786522,0.999912]];
};

private _item1157 = objNull;
if (_layerRoot) then {
	_item1157 = createVehicle ["Christmas_Gift_Medium_Pattern",[3728.1,13002.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1157;
	_objects pushback _this;
	_objectIDs pushback 1157;
	_this setPosWorld [3728.1,13002.8,7.9409];
	_this setVectorDirAndUp [[0.96027,-0.279072,0.00104689],[0.00119573,0.00786566,0.999968]];
};

private _item1158 = objNull;
if (_layerRoot) then {
	_item1158 = createVehicle ["Christmas_Gift_Medium_Tree",[3728.29,13002,0],[],0,"CAN_COLLIDE"];
	_this = _item1158;
	_objects pushback _this;
	_objectIDs pushback 1158;
	_this setPosWorld [3728.29,13002,7.94742];
	_this setVectorDirAndUp [[-0.889647,-0.456625,0.00465558],[0.00119573,0.00786566,0.999968]];
};

private _item1159 = objNull;
if (_layerRoot) then {
	_item1159 = createVehicle ["RRP_Gift",[3727.63,13002.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1159;
	_objects pushback _this;
	_objectIDs pushback 1159;
	_this setPosWorld [3727.63,13002.3,8.06714];
	_this setVectorDirAndUp [[0.686084,-0.727506,0.0049021],[0.00119573,0.00786566,0.999968]];
};

private _item1160 = objNull;
if (_layerRoot) then {
	_item1160 = createVehicle ["Christmas_Gift_Medium_Box",[3727.38,13001.7,-0.408536],[],0,"CAN_COLLIDE"];
	_this = _item1160;
	_objects pushback _this;
	_objectIDs pushback 1160;
	_this setPosWorld [3727.38,13001.7,7.8396];
	_this setVectorDirAndUp [[0.960634,-0.27754,0.012439],[-0.0106752,0.00786522,0.999912]];
};

private _item1161 = objNull;
if (_layerRoot) then {
	_item1161 = createVehicle ["Christmas_Gift_Medium_Pattern",[3729.82,13003.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1161;
	_objects pushback _this;
	_objectIDs pushback 1161;
	_this setPosWorld [3729.82,13003.1,7.94316];
	_this setVectorDirAndUp [[0.960157,-0.279213,0.0117348],[-0.0145049,-0.00785719,0.999864]];
};

private _item1162 = objNull;
if (_layerRoot) then {
	_item1162 = createVehicle ["Christmas_Gift_Medium_Tree",[3729.49,13002.4,0],[],0,"CAN_COLLIDE"];
	_this = _item1162;
	_objects pushback _this;
	_objectIDs pushback 1162;
	_this setPosWorld [3729.49,13002.4,7.94214];
	_this setVectorDirAndUp [[-0.889684,-0.456554,0.00465507],[0.00119573,0.00786566,0.999968]];
};

private _item1163 = objNull;
if (_layerRoot) then {
	_item1163 = createVehicle ["RRP_Gift",[3728.83,13002.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1163;
	_objects pushback _this;
	_objectIDs pushback 1163;
	_this setPosWorld [3728.83,13002.8,8.06188];
	_this setVectorDirAndUp [[0.686077,-0.727513,0.00490216],[0.00119573,0.00786566,0.999968]];
};

private _item1164 = objNull;
if (_layerRoot) then {
	_item1164 = createVehicle ["Christmas_Gift_Medium_Box",[3727.01,13000.4,-0.408546],[],0,"CAN_COLLIDE"];
	_this = _item1164;
	_objects pushback _this;
	_objectIDs pushback 1164;
	_this setPosWorld [3727.01,13000.4,7.84579];
	_this setVectorDirAndUp [[0.960564,-0.277782,0.0124402],[-0.0106752,0.00786522,0.999912]];
};

private _item1165 = objNull;
if (_layerRoot) then {
	_item1165 = createVehicle ["Christmas_Gift_Medium_Pattern",[3728.94,13004.4,0],[],0,"CAN_COLLIDE"];
	_this = _item1165;
	_objects pushback _this;
	_objectIDs pushback 1165;
	_this setPosWorld [3728.94,13004.4,7.94053];
	_this setVectorDirAndUp [[0.960157,-0.279213,0.0117348],[-0.0145049,-0.00785719,0.999864]];
};

private _item1166 = objNull;
if (_layerRoot) then {
	_item1166 = createVehicle ["Christmas_Gift_Medium_Tree",[3729.13,13003.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1166;
	_objects pushback _this;
	_objectIDs pushback 1166;
	_this setPosWorld [3729.13,13003.5,7.93657];
	_this setVectorDirAndUp [[-0.889591,-0.456461,-0.0164922],[-0.0145049,-0.00785719,0.999864]];
};

private _item1167 = objNull;
if (_layerRoot) then {
	_item1167 = createVehicle ["RRP_Gift",[3728.47,13003.9,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item1167;
	_objects pushback _this;
	_objectIDs pushback 1167;
	_this setPosWorld [3728.47,13003.9,8.05386];
	_this setVectorDirAndUp [[0.686046,-0.727542,0.00490242],[0.00119573,0.00786566,0.999968]];
};

private _item1168 = objNull;
if (_layerRoot) then {
	_item1168 = createVehicle ["Christmas_Gift_Medium_Box",[3728.25,13004.9,-0.408626],[],0,"CAN_COLLIDE"];
	_this = _item1168;
	_objects pushback _this;
	_objectIDs pushback 1168;
	_this setPosWorld [3728.25,13004.8,7.82422];
	_this setVectorDirAndUp [[0.960504,-0.278017,0.0117492],[-0.0145049,-0.00785719,0.999864]];
};

private _item1169 = objNull;
if (_layerRoot) then {
	_item1169 = createVehicle ["Christmas_Toy_Rocket",[3726.66,13001.2,-0.000150204],[],0,"CAN_COLLIDE"];
	_this = _item1169;
	_objects pushback _this;
	_objectIDs pushback 1169;
	_this setPosWorld [3726.66,13001.2,8.02308];
	_this setVectorDirAndUp [[-0.895007,0.44586,-0.0130624],[-0.0106752,0.00786522,0.999912]];
};

private _item1170 = objNull;
if (_layerRoot) then {
	_item1170 = createVehicle ["Christmas_Toy_Rocket",[3726.54,13001.8,-0.000150681],[],0,"CAN_COLLIDE"];
	_this = _item1170;
	_objects pushback _this;
	_objectIDs pushback 1170;
	_this setPosWorld [3726.54,13001.8,8.0173];
	_this setVectorDirAndUp [[-0.894995,0.445884,-0.0130624],[-0.0106752,0.00786522,0.999912]];
};

private _item1171 = objNull;
if (_layerRoot) then {
	_item1171 = createVehicle ["pere",[3727.74,12996.9,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item1171;
	_objects pushback _this;
	_objectIDs pushback 1171;
	_this setPosWorld [3727.74,12996.9,11.6477];
	_this setVectorDirAndUp [[0.998536,-0.0510073,-0.0180268],[0.0187074,0.0128977,0.999742]];
};

private _item1174 = objNull;
if (_layerRoot) then {
	_item1174 = createVehicle ["Christmas_Reindeer_Light",[3633.7,13160.8,-3.33786e-006],[],0,"CAN_COLLIDE"];
	_this = _item1174;
	_objects pushback _this;
	_objectIDs pushback 1174;
	_this setPosWorld [3633.7,13160.8,4.8402];
	_this setVectorDirAndUp [[-0.910387,-0.413749,0.0027879],[0.00158197,0.00325723,0.999993]];
};

private _item1175 = objNull;
if (_layerRoot) then {
	_item1175 = createVehicle ["Christmas_Sleigh_Bench",[3633.59,13145.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item1175;
	_objects pushback _this;
	_objectIDs pushback 1175;
	_this setPosWorld [3633.59,13145.3,4.61589];
	_this setVectorDirAndUp [[-0.710449,-0.703749,0],[0,0,1]];
};

private _item1176 = objNull;
if (_layerRoot) then {
	_item1176 = createVehicle ["Christmas_Happy_Snowman",[3637.28,13184.2,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item1176;
	_objects pushback _this;
	_objectIDs pushback 1176;
	_this setPosWorld [3637.28,13184.2,4.92041];
	_this setVectorDirAndUp [[0.904049,-0.427429,0],[0,0,1]];
};

private _item1177 = objNull;
if (_layerRoot) then {
	_item1177 = createVehicle ["Christmas_Happy_Snowman_Bucket",[3752.67,13369.8,0.174125],[],0,"CAN_COLLIDE"];
	_this = _item1177;
	_objects pushback _this;
	_objectIDs pushback 1177;
	_this setPosWorld [3752.62,13369.8,8.84259];
	_this setVectorDirAndUp [[0.192871,-0.979471,-0.058623],[-0.0464999,-0.0688014,0.996546]];
};

private _item1178 = objNull;
if (_layerRoot) then {
	_item1178 = createVehicle ["Christmas_Clothed_Snowman_Hat",[3634.69,13163.1,-7.15256e-007],[],0,"CAN_COLLIDE"];
	_this = _item1178;
	_objects pushback _this;
	_objectIDs pushback 1178;
	_this setPosWorld [3634.69,13163.1,5.35013];
	_this setVectorDirAndUp [[0.965999,-0.258542,-0.000929372],[0.00158197,0.00231612,0.999996]];
};

private _item1179 = objNull;
if (_layerRoot) then {
	_item1179 = createVehicle ["Christmas_Bunny_Right",[3705.83,12642.1,-7.82013e-005],[],0,"CAN_COLLIDE"];
	_this = _item1179;
	_objects pushback _this;
	_objectIDs pushback 1179;
	_this setPosWorld [3705.83,12642.1,23.7983];
	_this setVectorDirAndUp [[0.122897,-0.992419,0],[0,0,1]];
};

private _item1180 = objNull;
if (_layerRoot) then {
	_item1180 = createVehicle ["Christmas_Bunny_SnowFlakes",[3707.1,12645.8,-7.43866e-005],[],0,"CAN_COLLIDE"];
	_this = _item1180;
	_objects pushback _this;
	_objectIDs pushback 1180;
	_this setPosWorld [3707.1,12645.8,23.7792];
	_this setVectorDirAndUp [[-0.39801,-0.917381,0],[0,0,1]];
};

private _item1182 = objNull;
if (_layerRoot) then {
	_item1182 = createVehicle ["Christmas_Snowman_Pack",[3707.44,12644,-0.000320435],[],0,"CAN_COLLIDE"];
	_this = _item1182;
	_objects pushback _this;
	_objectIDs pushback 1182;
	_this setPosWorld [3707.44,12644,25.1474];
	_this setVectorDirAndUp [[0.568713,0.822536,0],[0,0,1]];
};

private _item1187 = objNull;
if (_layerRoot) then {
	_item1187 = createVehicle ["Christmas_Candy_Cane_01",[3706.99,12641.5,-9.91821e-005],[],0,"CAN_COLLIDE"];
	_this = _item1187;
	_objects pushback _this;
	_objectIDs pushback 1187;
	_this setPosWorld [3706.99,12641.5,24.3827];
	_this setVectorDirAndUp [[0.694011,0.719964,0],[0,0,1]];
};

private _item1188 = objNull;
if (_layerRoot) then {
	_item1188 = createVehicle ["Christmas_Whole_Tree",[3707.94,12645.9,-0.000188828],[],0,"CAN_COLLIDE"];
	_this = _item1188;
	_objects pushback _this;
	_objectIDs pushback 1188;
	_this setPosWorld [3707.94,12645.9,24.4157];
	_this setVectorDirAndUp [[-0.327448,0.944869,0],[0,0,1]];
};

private _item1189 = objNull;
if (_layerRoot) then {
	_item1189 = createVehicle ["Christmas_Toy_Rocket",[3707.24,12646.2,-3.24249e-005],[],0,"CAN_COLLIDE"];
	_this = _item1189;
	_objects pushback _this;
	_objectIDs pushback 1189;
	_this setPosWorld [3707.24,12646.2,23.5374];
	_this setVectorDirAndUp [[-0.327495,0.944853,0],[0,0,1]];
};

private _item1214 = objNull;
if (_layerRoot) then {
	_item1214 = createVehicle ["Christmas_Candy_Cane_01",[9146.59,21616.4,-9.53674e-005],[],0,"CAN_COLLIDE"];
	_this = _item1214;
	_objects pushback _this;
	_objectIDs pushback 1214;
	_this setPosWorld [9146.6,21616.4,15.9222];
	_this setVectorDirAndUp [[0.87403,-0.485866,0.00252711],[0.00599983,0.0159937,0.999854]];
};

private _item1215 = objNull;
if (_layerRoot) then {
	_item1215 = createVehicle ["Christmas_Penguin_Light",[9150.09,21611.7,-7.34329e-005],[],0,"CAN_COLLIDE"];
	_this = _item1215;
	_objects pushback _this;
	_objectIDs pushback 1215;
	_this setPosWorld [9150.09,21611.7,15.447];
	_this setVectorDirAndUp [[-0.99964,0.0265991,0.00351714],[0.00399666,0.0179961,0.99983]];
};

private _item1216 = objNull;
if (_layerRoot) then {
	_item1216 = createVehicle ["Christmas_Reindeer_Light",[9149.31,21623.2,-1.43051e-005],[],0,"CAN_COLLIDE"];
	_this = _item1216;
	_objects pushback _this;
	_objectIDs pushback 1216;
	_this setPosWorld [9149.32,21623.2,15.7512];
	_this setVectorDirAndUp [[0.964548,0.26388,-0.00384462],[0.000976388,0.0109997,0.999939]];
};

private _item1217 = objNull;
if (_layerRoot) then {
	_item1217 = createVehicle ["Christmas_Sleigh_Bench",[9148.98,21625.8,-4.29153e-005],[],0,"CAN_COLLIDE"];
	_this = _item1217;
	_objects pushback _this;
	_objectIDs pushback 1217;
	_this setPosWorld [9148.98,21625.8,15.4936];
	_this setVectorDirAndUp [[0.813206,0.581931,-0.00719552],[0.000976388,0.0109997,0.999939]];
};

private _item1218 = objNull;
if (_layerRoot) then {
	_item1218 = createVehicle ["Christmas_Happy_Snowman",[9149.56,21610.4,-0.000149727],[],0,"CAN_COLLIDE"];
	_this = _item1218;
	_objects pushback _this;
	_objectIDs pushback 1218;
	_this setPosWorld [9149.57,21610.4,16.0168];
	_this setVectorDirAndUp [[-0.978831,-0.204449,0.00955379],[0.00599983,0.0179959,0.99982]];
};

private _item1219 = objNull;
if (_layerRoot) then {
	_item1219 = createVehicle ["Christmas_Happy_Snowman_Bucket",[9149.65,21614.3,-0.000151634],[],0,"CAN_COLLIDE"];
	_this = _item1219;
	_objects pushback _this;
	_objectIDs pushback 1219;
	_this setPosWorld [9149.65,21614.3,15.9279];
	_this setVectorDirAndUp [[0.0774664,0.996825,-0.0184069],[0.00599983,0.0179959,0.99982]];
};

private _item1220 = objNull;
if (_layerRoot) then {
	_item1220 = createVehicle ["Christmas_Clothed_Snowman_Hat",[9148.17,21621.5,-7.62939e-006],[],0,"CAN_COLLIDE"];
	_this = _item1220;
	_objects pushback _this;
	_objectIDs pushback 1220;
	_this setPosWorld [9148.17,21621.6,16.2867];
	_this setVectorDirAndUp [[-0.912664,0.40869,-0.00408496],[0,0.00999474,0.99995]];
};

private _item1221 = objNull;
if (_layerRoot) then {
	_item1221 = createVehicle ["Christmas_Bunny_Right",[9152.45,21630.6,-7.62939e-006],[],0,"CAN_COLLIDE"];
	_this = _item1221;
	_objects pushback _this;
	_objectIDs pushback 1221;
	_this setPosWorld [9152.45,21630.6,15.1695];
	_this setVectorDirAndUp [[0.361586,0.932291,-0.00946914],[0.00299007,0.00899671,0.999955]];
};

private _item1222 = objNull;
if (_layerRoot) then {
	_item1222 = createVehicle ["Christmas_Bunny_SnowFlakes",[9149.62,21628,-3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item1222;
	_objects pushback _this;
	_objectIDs pushback 1222;
	_this setPosWorld [9149.62,21628,15.1855];
	_this setVectorDirAndUp [[0.784842,0.61965,-0.00758274],[0.000976388,0.0109997,0.999939]];
};

private _item1223 = objNull;
if (_layerRoot) then {
	_item1223 = createVehicle ["Christmas_Whole_Tree",[9145.49,21609.4,-0.000444412],[],0,"CAN_COLLIDE"];
	_this = _item1223;
	_objects pushback _this;
	_objectIDs pushback 1223;
	_this setPosWorld [9145.51,21609.5,16.1088];
	_this setVectorDirAndUp [[0.87386,-0.486177,-0.000374724],[0.0159975,0.0279837,0.99948]];
};

private _item1224 = objNull;
if (_layerRoot) then {
	_item1224 = createVehicle ["Christmas_Snowman_Pack",[9150.15,21629.7,-1.71661e-005],[],0,"CAN_COLLIDE"];
	_this = _item1224;
	_objects pushback _this;
	_objectIDs pushback 1224;
	_this setPosWorld [9150.15,21629.7,16.5339];
	_this setVectorDirAndUp [[-0.890361,-0.455175,0.00856582],[0.00399666,0.0109996,0.999932]];
};

private _item1225 = objNull;
if (_layerRoot) then {
	_item1225 = createVehicle ["Christmas_Gift_Medium_Pattern",[9149.18,21612,0],[],0,"CAN_COLLIDE"];
	_this = _item1225;
	_objects pushback _this;
	_objectIDs pushback 1225;
	_this setPosWorld [9149.18,21612,15.0592];
	_this setVectorDirAndUp [[-0.946714,0.322074,-0.000115919],[0.00599983,0.0179959,0.99982]];
};

private _item1226 = objNull;
if (_layerRoot) then {
	_item1226 = createVehicle ["Christmas_Gift_Medium_Tree",[9149.03,21612.9,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item1226;
	_objects pushback _this;
	_objectIDs pushback 1226;
	_this setPosWorld [9149.03,21612.9,15.0445];
	_this setVectorDirAndUp [[0.909205,0.416148,-0.0129464],[0.00599983,0.0179959,0.99982]];
};

private _item1227 = objNull;
if (_layerRoot) then {
	_item1227 = createVehicle ["RRP_Gift",[9149.67,21612.5,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item1227;
	_objects pushback _this;
	_objectIDs pushback 1227;
	_this setPosWorld [9149.67,21612.5,15.1692];
	_this setVectorDirAndUp [[-0.652796,0.757472,-0.00971649],[0.00599983,0.0179959,0.99982]];
};

private _item1228 = objNull;
if (_layerRoot) then {
	_item1228 = createVehicle ["Christmas_Gift_Medium_Box",[9149.9,21613.2,-0.407586],[],0,"CAN_COLLIDE"];
	_this = _item1228;
	_objects pushback _this;
	_objectIDs pushback 1228;
	_this setPosWorld [9149.9,21613.2,14.9252];
	_this setVectorDirAndUp [[-0.947192,0.320667,-8.77329e-005],[0.00599983,0.0179959,0.99982]];
};

private _item1229 = objNull;
if (_layerRoot) then {
	_item1229 = createVehicle ["Christmas_Candy_Cane_01",[9151.74,21631.7,-4.00543e-005],[],0,"CAN_COLLIDE"];
	_this = _item1229;
	_objects pushback _this;
	_objectIDs pushback 1229;
	_this setPosWorld [9151.75,21631.7,15.7458];
	_this setVectorDirAndUp [[-0.952155,-0.305565,0.00559633],[0.00299007,0.00899671,0.999955]];
};

private _item1230 = objNull;
if (_layerRoot) then {
	_item1230 = createVehicle ["Christmas_Whole_Tree",[9148.8,21628.2,-2.00272e-005],[],0,"CAN_COLLIDE"];
	_this = _item1230;
	_objects pushback _this;
	_objectIDs pushback 1230;
	_this setPosWorld [9148.8,21628.2,15.82];
	_this setVectorDirAndUp [[-0.158817,-0.987247,0.0110152],[0.000976388,0.0109997,0.999939]];
};

private _item1231 = objNull;
if (_layerRoot) then {
	_item1231 = createVehicle ["Christmas_Toy_Rocket",[9149.3,21627.7,-1.04904e-005],[],0,"CAN_COLLIDE"];
	_this = _item1231;
	_objects pushback _this;
	_objectIDs pushback 1231;
	_this setPosWorld [9149.3,21627.7,14.9473];
	_this setVectorDirAndUp [[-0.158817,-0.987247,0.0110152],[0.000976388,0.0109997,0.999939]];
};

private _item1232 = objNull;
if (_layerRoot) then {
	_item1232 = createVehicle ["sapin",[9147.31,21612.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1232;
	_objects pushback _this;
	_objectIDs pushback 1232;
	_this setPosWorld [9147.31,21612.1,19.0267];
	_this setVectorDirAndUp [[0.900355,0.434956,-0.0132318],[0.00599983,0.0179959,0.99982]];
};

private _item1233 = objNull;
if (_layerRoot) then {
	_item1233 = createVehicle ["Christmas_Bunny_Left",[9144.88,21612.1,-0.000232697],[],0,"CAN_COLLIDE"];
	_this = _item1233;
	_objects pushback _this;
	_objectIDs pushback 1233;
	_this setPosWorld [9144.89,21612.1,15.5916];
	_this setVectorDirAndUp [[-0.376525,-0.925855,0.031949],[0.0159975,0.0279837,0.99948]];
};

private _item1234 = objNull;
if (_layerRoot) then {
	_item1234 = createVehicle ["Christmas_Toy_Train",[9149.1,21616.1,-2.57492e-005],[],0,"CAN_COLLIDE"];
	_this = _item1234;
	_objects pushback _this;
	_objectIDs pushback 1234;
	_this setPosWorld [9149.1,21616.1,15.1979];
	_this setVectorDirAndUp [[-0.413726,0.910356,-0.00909923],[0,0.00999474,0.99995]];
};

private _item1235 = objNull;
if (_layerRoot) then {
	_item1235 = createVehicle ["Christmas_Car_Light",[9147.19,21615.6,-3.14713e-005],[],0,"CAN_COLLIDE"];
	_this = _item1235;
	_objects pushback _this;
	_objectIDs pushback 1235;
	_this setPosWorld [9147.19,21615.6,15.2839];
	_this setVectorDirAndUp [[0.794066,-0.607811,0.0049576],[0.00599983,0.0159937,0.999854]];
};

private _item1236 = objNull;
if (_layerRoot) then {
	_item1236 = createVehicle ["Christmas_Toy_Rocket",[9148.12,21614.8,-4.57764e-005],[],0,"CAN_COLLIDE"];
	_this = _item1236;
	_objects pushback _this;
	_objectIDs pushback 1236;
	_this setPosWorld [9148.12,21614.8,15.0938];
	_this setVectorDirAndUp [[0.874042,-0.485838,0.00349963],[0.00599983,0.0179959,0.99982]];
};

private _item1237 = objNull;
if (_layerRoot) then {
	_item1237 = createVehicle ["Christmas_Gift_Medium_Pattern",[9147.43,21611.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1237;
	_objects pushback _this;
	_objectIDs pushback 1237;
	_this setPosWorld [9147.43,21611.3,15.0817];
	_this setVectorDirAndUp [[-0.946697,0.322126,-0.000116958],[0.00599983,0.0179959,0.99982]];
};

private _item1238 = objNull;
if (_layerRoot) then {
	_item1238 = createVehicle ["Christmas_Gift_Medium_Tree",[9147.48,21612.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1238;
	_objects pushback _this;
	_objectIDs pushback 1238;
	_this setPosWorld [9147.48,21612.1,15.0673];
	_this setVectorDirAndUp [[0.909311,0.415916,-0.0129428],[0.00599983,0.0179959,0.99982]];
};

private _item1239 = objNull;
if (_layerRoot) then {
	_item1239 = createVehicle ["RRP_Gift",[9148.12,21611.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1239;
	_objects pushback _this;
	_objectIDs pushback 1239;
	_this setPosWorld [9148.12,21611.8,15.1919];
	_this setVectorDirAndUp [[-0.652602,0.757638,-0.00972066],[0.00599983,0.0179959,0.99982]];
};

private _item1240 = objNull;
if (_layerRoot) then {
	_item1240 = createVehicle ["Christmas_Gift_Medium_Box",[9148.18,21612.8,-0.40759],[],0,"CAN_COLLIDE"];
	_this = _item1240;
	_objects pushback _this;
	_objectIDs pushback 1240;
	_this setPosWorld [9148.18,21612.8,14.9427];
	_this setVectorDirAndUp [[-0.947115,0.320895,-9.22917e-005],[0.00599983,0.0179959,0.99982]];
};

private _item1241 = objNull;
if (_layerRoot) then {
	_item1241 = createVehicle ["Christmas_Gift_Medium_Pattern",[9147,21612.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1241;
	_objects pushback _this;
	_objectIDs pushback 1241;
	_this setPosWorld [9147,21612.9,15.0569];
	_this setVectorDirAndUp [[-0.94671,0.322088,-0.00011619],[0.00599983,0.0179959,0.99982]];
};

private _item1242 = objNull;
if (_layerRoot) then {
	_item1242 = createVehicle ["Christmas_Gift_Medium_Tree",[9146.85,21613.7,0],[],0,"CAN_COLLIDE"];
	_this = _item1242;
	_objects pushback _this;
	_objectIDs pushback 1242;
	_this setPosWorld [9146.85,21613.7,15.0423];
	_this setVectorDirAndUp [[0.909295,0.415951,-0.0129434],[0.00599983,0.0179959,0.99982]];
};

private _item1243 = objNull;
if (_layerRoot) then {
	_item1243 = createVehicle ["RRP_Gift",[9147.49,21613.3,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item1243;
	_objects pushback _this;
	_objectIDs pushback 1243;
	_this setPosWorld [9147.49,21613.3,15.167];
	_this setVectorDirAndUp [[-0.652614,0.757629,-0.00972041],[0.00599983,0.0179959,0.99982]];
};

private _item1244 = objNull;
if (_layerRoot) then {
	_item1244 = createVehicle ["Christmas_Gift_Medium_Box",[9147.72,21614,-0.407589],[],0,"CAN_COLLIDE"];
	_this = _item1244;
	_objects pushback _this;
	_objectIDs pushback 1244;
	_this setPosWorld [9147.72,21614,14.9229];
	_this setVectorDirAndUp [[-0.947194,0.320661,-8.76063e-005],[0.00599983,0.0179959,0.99982]];
};

private _item1245 = objNull;
if (_layerRoot) then {
	_item1245 = createVehicle ["Christmas_Gift_Medium_Pattern",[9145.26,21612.7,0],[],0,"CAN_COLLIDE"];
	_this = _item1245;
	_objects pushback _this;
	_objectIDs pushback 1245;
	_this setPosWorld [9145.26,21612.7,15.0706];
	_this setVectorDirAndUp [[-0.946696,0.322128,-0.000117003],[0.00599983,0.0179959,0.99982]];
};

private _item1246 = objNull;
if (_layerRoot) then {
	_item1246 = createVehicle ["Christmas_Gift_Medium_Tree",[9145.63,21613.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1246;
	_objects pushback _this;
	_objectIDs pushback 1246;
	_this setPosWorld [9145.63,21613.3,15.0573];
	_this setVectorDirAndUp [[0.909328,0.415878,-0.0129423],[0.00599983,0.0179959,0.99982]];
};

private _item1247 = objNull;
if (_layerRoot) then {
	_item1247 = createVehicle ["RRP_Gift",[9146.27,21612.9,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item1247;
	_objects pushback _this;
	_objectIDs pushback 1247;
	_this setPosWorld [9146.27,21612.9,15.182];
	_this setVectorDirAndUp [[-0.652602,0.757638,-0.00972066],[0.00599983,0.0179959,0.99982]];
};

private _item1248 = objNull;
if (_layerRoot) then {
	_item1248 = createVehicle ["Christmas_Gift_Medium_Box",[9148.15,21615.3,-0.40759],[],0,"CAN_COLLIDE"];
	_this = _item1248;
	_objects pushback _this;
	_objectIDs pushback 1248;
	_this setPosWorld [9148.15,21615.3,14.8979];
	_this setVectorDirAndUp [[-0.947108,0.320914,0.000549971],[0.00599983,0.0159937,0.999854]];
};

private _item1249 = objNull;
if (_layerRoot) then {
	_item1249 = createVehicle ["Christmas_Gift_Medium_Pattern",[9146.09,21611.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1249;
	_objects pushback _this;
	_objectIDs pushback 1249;
	_this setPosWorld [9146.09,21611.3,15.0904];
	_this setVectorDirAndUp [[-0.946593,0.322374,0.00612509],[0.0159975,0.0279837,0.99948]];
};

private _item1250 = objNull;
if (_layerRoot) then {
	_item1250 = createVehicle ["Christmas_Gift_Medium_Tree",[9145.93,21612.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1250;
	_objects pushback _this;
	_objectIDs pushback 1250;
	_this setPosWorld [9145.93,21612.2,15.0751];
	_this setVectorDirAndUp [[0.909328,0.415878,-0.0129423],[0.00599983,0.0179959,0.99982]];
};

private _item1251 = objNull;
if (_layerRoot) then {
	_item1251 = createVehicle ["RRP_Gift",[9146.58,21611.8,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item1251;
	_objects pushback _this;
	_objectIDs pushback 1251;
	_this setPosWorld [9146.58,21611.8,15.1998];
	_this setVectorDirAndUp [[-0.65257,0.757666,-0.00972135],[0.00599983,0.0179959,0.99982]];
};

private _item1252 = objNull;
if (_layerRoot) then {
	_item1252 = createVehicle ["Christmas_Gift_Medium_Box",[9146.71,21610.9,-0.407461],[],0,"CAN_COLLIDE"];
	_this = _item1252;
	_objects pushback _this;
	_objectIDs pushback 1252;
	_this setPosWorld [9146.71,21610.9,14.9856];
	_this setVectorDirAndUp [[-0.947097,0.320947,-9.33413e-005],[0.00599983,0.0179959,0.99982]];
};

private _item1253 = objNull;
if (_layerRoot) then {
	_item1253 = createVehicle ["Christmas_Toy_Rocket",[9148.5,21614.4,-4.57764e-005],[],0,"CAN_COLLIDE"];
	_this = _item1253;
	_objects pushback _this;
	_objectIDs pushback 1253;
	_this setPosWorld [9148.5,21614.4,15.0982];
	_this setVectorDirAndUp [[0.874036,-0.485849,0.00349987],[0.00599983,0.0179959,0.99982]];
};

private _item1254 = objNull;
if (_layerRoot) then {
	_item1254 = createVehicle ["Christmas_Toy_Rocket",[9148.6,21613.8,-4.57764e-005],[],0,"CAN_COLLIDE"];
	_this = _item1254;
	_objects pushback _this;
	_objectIDs pushback 1254;
	_this setPosWorld [9148.6,21613.8,15.1078];
	_this setVectorDirAndUp [[0.874036,-0.485849,0.00349987],[0.00599983,0.0179959,0.99982]];
};

private _item1255 = objNull;
if (_layerRoot) then {
	_item1255 = createVehicle ["pere",[9147.22,21618.1,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item1255;
	_objects pushback _this;
	_objectIDs pushback 1255;
	_this setPosWorld [9147.22,21618.1,18.6304];
	_this setVectorDirAndUp [[-0.975358,0.220616,-0.00220511],[0,0.00999474,0.99995]];
};

private _item1256 = objNull;
if (_layerRoot) then {
	_item1256 = createVehicle ["Christmas_Candy_Cane_01",[25728.4,21325.8,-1.33514e-005],[],0,"CAN_COLLIDE"];
	_this = _item1256;
	_objects pushback _this;
	_objectIDs pushback 1256;
	_this setPosWorld [25728.4,21325.8,21.2116];
	_this setVectorDirAndUp [[-0.342701,0.939062,0.0268111],[0.00699926,-0.0259863,0.999638]];
};

private _item1257 = objNull;
if (_layerRoot) then {
	_item1257 = createVehicle ["Christmas_Penguin_Light",[25714.1,21328.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1257;
	_objects pushback _this;
	_objectIDs pushback 1257;
	_this setPosWorld [25714.1,21328.5,20.8056];
	_this setVectorDirAndUp [[0.155868,-0.987436,-0.0259853],[0.00201303,-0.0259892,0.99966]];
};

private _item1258 = objNull;
if (_layerRoot) then {
	_item1258 = createVehicle ["Christmas_Reindeer_Light",[25721.9,21322.4,1.90735e-005],[],0,"CAN_COLLIDE"];
	_this = _item1258;
	_objects pushback _this;
	_objectIDs pushback 1258;
	_this setPosWorld [25721.9,21322.4,21.0688];
	_this setVectorDirAndUp [[-0.901854,0.431616,0.0191435],[0.00399666,-0.035973,0.999345]];
};

private _item1259 = objNull;
if (_layerRoot) then {
	_item1259 = createVehicle ["Christmas_Sleigh_Bench",[25720.5,21320.3,2.67029e-005],[],0,"CAN_COLLIDE"];
	_this = _item1259;
	_objects pushback _this;
	_objectIDs pushback 1259;
	_this setPosWorld [25720.5,21320.2,20.7668];
	_this setVectorDirAndUp [[-0.995729,0.092033,0.00729507],[0.00399666,-0.035973,0.999345]];
};

private _item1260 = objNull;
if (_layerRoot) then {
	_item1260 = createVehicle ["Christmas_Happy_Snowman",[25715.4,21328.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1260;
	_objects pushback _this;
	_objectIDs pushback 1260;
	_this setPosWorld [25715.4,21328.2,21.3394];
	_this setVectorDirAndUp [[0.379414,-0.924894,-0.0248095],[0.00201303,-0.0259892,0.99966]];
};

private _item1261 = objNull;
if (_layerRoot) then {
	_item1261 = createVehicle ["Christmas_Happy_Snowman_Bucket",[25727.5,21329.4,7.62939e-006],[],0,"CAN_COLLIDE"];
	_this = _item1261;
	_objects pushback _this;
	_objectIDs pushback 1261;
	_this setPosWorld [25727.5,21329.4,21.2989];
	_this setVectorDirAndUp [[-0.71118,-0.70291,-0.0118785],[0.00800059,-0.0249879,0.999656]];
};

private _item1262 = objNull;
if (_layerRoot) then {
	_item1262 = createVehicle ["Christmas_Clothed_Snowman_Hat",[25723.9,21323,-1.90735e-005],[],0,"CAN_COLLIDE"];
	_this = _item1262;
	_objects pushback _this;
	_objectIDs pushback 1262;
	_this setPosWorld [25723.9,21322.9,21.5942];
	_this setVectorDirAndUp [[0.422297,-0.906106,-0.0252454],[0.00399666,-0.0259891,0.999654]];
};

private _item1263 = objNull;
if (_layerRoot) then {
	_item1263 = createVehicle ["Christmas_Bunny_Right",[25714.7,21318.9,-3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item1263;
	_objects pushback _this;
	_objectIDs pushback 1263;
	_this setPosWorld [25714.7,21318.9,20.4899];
	_this setVectorDirAndUp [[-0.883781,-0.467728,-0.012718],[0.00201303,-0.0309816,0.999518]];
};

private _item1264 = objNull;
if (_layerRoot) then {
	_item1264 = createVehicle ["Christmas_Bunny_SnowFlakes",[25718.6,21319,-2.28882e-005],[],0,"CAN_COLLIDE"];
	_this = _item1264;
	_objects pushback _this;
	_objectIDs pushback 1264;
	_this setPosWorld [25718.6,21319,20.4587];
	_this setVectorDirAndUp [[-0.998926,0.0451577,0.0103914],[0.00899667,-0.0309804,0.999479]];
};

private _item1265 = objNull;
if (_layerRoot) then {
	_item1265 = createVehicle ["Christmas_Whole_Tree",[25717.1,21324.3,-0.000253677],[],0,"CAN_COLLIDE"];
	_this = _item1265;
	_objects pushback _this;
	_objectIDs pushback 1265;
	_this setPosWorld [25717.1,21324.3,21.2609];
	_this setVectorDirAndUp [[0.319251,0.947367,0.0239868],[0.00201303,-0.0259892,0.99966]];
};

private _item1266 = objNull;
if (_layerRoot) then {
	_item1266 = createVehicle ["Christmas_Snowman_Pack",[25717.1,21318.1,-5.72205e-006],[],0,"CAN_COLLIDE"];
	_this = _item1266;
	_objects pushback _this;
	_objectIDs pushback 1266;
	_this setPosWorld [25717.1,21318.1,21.8086];
	_this setVectorDirAndUp [[0.97105,-0.238691,-0.0093543],[0.00201303,-0.0309816,0.999518]];
};

private _item1267 = objNull;
if (_layerRoot) then {
	_item1267 = createVehicle ["Christmas_Gift_Medium_Pattern",[25713.9,21327.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1267;
	_objects pushback _this;
	_objectIDs pushback 1267;
	_this setPosWorld [25713.9,21327.5,20.394];
	_this setVectorDirAndUp [[-0.144341,-0.989201,-0.0254267],[0.00201303,-0.0259892,0.99966]];
};

private _item1268 = objNull;
if (_layerRoot) then {
	_item1268 = createVehicle ["Christmas_Gift_Medium_Tree",[25713.1,21327.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1268;
	_objects pushback _this;
	_objectIDs pushback 1268;
	_this setPosWorld [25713.1,21327.2,20.3876];
	_this setVectorDirAndUp [[-0.574841,0.817958,0.0224229],[0.00201303,-0.0259892,0.99966]];
};

private _item1269 = objNull;
if (_layerRoot) then {
	_item1269 = createVehicle ["RRP_Gift",[25713.4,21327.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1269;
	_objects pushback _this;
	_objectIDs pushback 1269;
	_this setPosWorld [25713.4,21327.9,20.527];
	_this setVectorDirAndUp [[-0.626055,-0.779547,-0.019006],[0.00201303,-0.0259892,0.99966]];
};

private _item1270 = objNull;
if (_layerRoot) then {
	_item1270 = createVehicle ["Christmas_Gift_Medium_Box",[25712.7,21328.1,-0.40764],[],0,"CAN_COLLIDE"];
	_this = _item1270;
	_objects pushback _this;
	_objectIDs pushback 1270;
	_this setPosWorld [25712.7,21328.1,20.3017];
	_this setVectorDirAndUp [[-0.142864,-0.989415,-0.0254352],[0.00201303,-0.0259892,0.99966]];
};

private _item1271 = objNull;
if (_layerRoot) then {
	_item1271 = createVehicle ["Christmas_Candy_Cane_01",[25714.6,21317.6,-0.000642776],[],0,"CAN_COLLIDE"];
	_this = _item1271;
	_objects pushback _this;
	_objectIDs pushback 1271;
	_this setPosWorld [25714.6,21317.6,21.0338];
	_this setVectorDirAndUp [[0.919745,-0.392228,-0.0150508],[0.00399666,-0.0289844,0.999572]];
};

private _item1272 = objNull;
if (_layerRoot) then {
	_item1272 = createVehicle ["Christmas_Whole_Tree",[25719,21318.3,-6.86646e-005],[],0,"CAN_COLLIDE"];
	_this = _item1272;
	_objects pushback _this;
	_objectIDs pushback 1272;
	_this setPosWorld [25719,21318.3,21.0685];
	_this setVectorDirAndUp [[0.766182,0.642491,0.0130183],[0.00899667,-0.0309804,0.999479]];
};

private _item1273 = objNull;
if (_layerRoot) then {
	_item1273 = createVehicle ["Christmas_Toy_Rocket",[25719,21319,-1.14441e-005],[],0,"CAN_COLLIDE"];
	_this = _item1273;
	_objects pushback _this;
	_objectIDs pushback 1273;
	_this setPosWorld [25719,21319,20.2136];
	_this setVectorDirAndUp [[0.766434,0.642191,0.0130067],[0.00899667,-0.0309804,0.999479]];
};

private _item1274 = objNull;
if (_layerRoot) then {
	_item1274 = createVehicle ["sapin",[25714.2,21325.7,0],[],0,"CAN_COLLIDE"];
	_this = _item1274;
	_objects pushback _this;
	_objectIDs pushback 1274;
	_this setPosWorld [25714.2,21325.7,24.3026];
	_this setVectorDirAndUp [[-0.591722,0.805838,0.0221418],[0.00201303,-0.0259892,0.99966]];
};

private _item1275 = objNull;
if (_layerRoot) then {
	_item1275 = createVehicle ["Christmas_Bunny_Left",[25714.7,21323.3,-3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item1275;
	_objects pushback _this;
	_objectIDs pushback 1275;
	_this setPosWorld [25714.7,21323.3,20.7852];
	_this setVectorDirAndUp [[0.979453,-0.201542,-0.00721205],[0.00201303,-0.0259892,0.99966]];
};

private _item1276 = objNull;
if (_layerRoot) then {
	_item1276 = createVehicle ["Christmas_Toy_Train",[25726.7,21327.6,-3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item1276;
	_objects pushback _this;
	_objectIDs pushback 1276;
	_this setPosWorld [25726.7,21327.6,20.5565];
	_this setVectorDirAndUp [[-0.283206,-0.958785,-0.0229413],[0.00699926,-0.0259863,0.999638]];
};

private _item1277 = objNull;
if (_layerRoot) then {
	_item1277 = createVehicle ["Christmas_Car_Light",[25710.8,21324.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1277;
	_objects pushback _this;
	_objectIDs pushback 1277;
	_this setPosWorld [25710.8,21324.9,20.6088];
	_this setVectorDirAndUp [[0.453133,0.891165,0.0222561],[0.00201303,-0.0259892,0.99966]];
};

private _item1278 = objNull;
if (_layerRoot) then {
	_item1278 = createVehicle ["Christmas_Toy_Rocket",[25711.4,21326,0],[],0,"CAN_COLLIDE"];
	_this = _item1278;
	_objects pushback _this;
	_objectIDs pushback 1278;
	_this setPosWorld [25711.4,21326,20.4366];
	_this setVectorDirAndUp [[0.318624,0.947577,0.0239936],[0.00201303,-0.0259892,0.99966]];
};

private _item1279 = objNull;
if (_layerRoot) then {
	_item1279 = createVehicle ["Christmas_Gift_Medium_Pattern",[25714.9,21325.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1279;
	_objects pushback _this;
	_objectIDs pushback 1279;
	_this setPosWorld [25714.9,21325.9,20.3504];
	_this setVectorDirAndUp [[-0.144397,-0.989193,-0.0254263],[0.00201303,-0.0259892,0.99966]];
};

private _item1280 = objNull;
if (_layerRoot) then {
	_item1280 = createVehicle ["Christmas_Gift_Medium_Tree",[25714.1,21325.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1280;
	_objects pushback _this;
	_objectIDs pushback 1280;
	_this setPosWorld [25714.1,21325.8,20.3495];
	_this setVectorDirAndUp [[-0.574628,0.818107,0.0224264],[0.00201303,-0.0259892,0.99966]];
};

private _item1281 = objNull;
if (_layerRoot) then {
	_item1281 = createVehicle ["RRP_Gift",[25714.4,21326.5,-1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item1281;
	_objects pushback _this;
	_objectIDs pushback 1281;
	_this setPosWorld [25714.4,21326.5,20.4889];
	_this setVectorDirAndUp [[-0.62626,-0.779383,-0.0190014],[0.00201303,-0.0259892,0.99966]];
};

private _item1282 = objNull;
if (_layerRoot) then {
	_item1282 = createVehicle ["Christmas_Gift_Medium_Box",[25713.4,21326.5,-0.407593],[],0,"CAN_COLLIDE"];
	_this = _item1282;
	_objects pushback _this;
	_objectIDs pushback 1282;
	_this setPosWorld [25713.4,21326.4,20.2582];
	_this setVectorDirAndUp [[-0.143108,-0.98938,-0.0254338],[0.00201303,-0.0259892,0.99966]];
};

private _item1283 = objNull;
if (_layerRoot) then {
	_item1283 = createVehicle ["Christmas_Gift_Medium_Pattern",[25713.5,21325.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1283;
	_objects pushback _this;
	_objectIDs pushback 1283;
	_this setPosWorld [25713.5,21325.2,20.335];
	_this setVectorDirAndUp [[-0.144355,-0.989199,-0.0254266],[0.00201303,-0.0259892,0.99966]];
};

private _item1284 = objNull;
if (_layerRoot) then {
	_item1284 = createVehicle ["Christmas_Gift_Medium_Tree",[25712.7,21324.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1284;
	_objects pushback _this;
	_objectIDs pushback 1284;
	_this setPosWorld [25712.7,21324.9,20.3286];
	_this setVectorDirAndUp [[-0.574659,0.818085,0.0224258],[0.00201303,-0.0259892,0.99966]];
};

private _item1285 = objNull;
if (_layerRoot) then {
	_item1285 = createVehicle ["RRP_Gift",[25712.9,21325.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1285;
	_objects pushback _this;
	_objectIDs pushback 1285;
	_this setPosWorld [25712.9,21325.6,20.468];
	_this setVectorDirAndUp [[-0.626248,-0.779393,-0.0190016],[0.00201303,-0.0259892,0.99966]];
};

private _item1286 = objNull;
if (_layerRoot) then {
	_item1286 = createVehicle ["Christmas_Gift_Medium_Box",[25712.2,21325.8,-0.40764],[],0,"CAN_COLLIDE"];
	_this = _item1286;
	_objects pushback _this;
	_objectIDs pushback 1286;
	_this setPosWorld [25712.2,21325.8,20.2427];
	_this setVectorDirAndUp [[-0.142864,-0.989415,-0.0254352],[0.00201303,-0.0259892,0.99966]];
};

private _item1287 = objNull;
if (_layerRoot) then {
	_item1287 = createVehicle ["Christmas_Gift_Medium_Pattern",[25714,21323.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1287;
	_objects pushback _this;
	_objectIDs pushback 1287;
	_this setPosWorld [25714,21323.5,20.2904];
	_this setVectorDirAndUp [[-0.144377,-0.989196,-0.0254265],[0.00201303,-0.0259892,0.99966]];
};

private _item1288 = objNull;
if (_layerRoot) then {
	_item1288 = createVehicle ["Christmas_Gift_Medium_Tree",[25713.3,21323.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1288;
	_objects pushback _this;
	_objectIDs pushback 1288;
	_this setPosWorld [25713.3,21323.8,20.2983];
	_this setVectorDirAndUp [[-0.57461,0.81812,0.0224266],[0.00201303,-0.0259892,0.99966]];
};

private _item1289 = objNull;
if (_layerRoot) then {
	_item1289 = createVehicle ["RRP_Gift",[25713.6,21324.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1289;
	_objects pushback _this;
	_objectIDs pushback 1289;
	_this setPosWorld [25713.6,21324.5,20.4376];
	_this setVectorDirAndUp [[-0.62626,-0.779383,-0.0190014],[0.00201303,-0.0259892,0.99966]];
};

private _item1290 = objNull;
if (_layerRoot) then {
	_item1290 = createVehicle ["Christmas_Gift_Medium_Box",[25727.9,21327.7,-0.407747],[],0,"CAN_COLLIDE"];
	_this = _item1290;
	_objects pushback _this;
	_objectIDs pushback 1290;
	_this setPosWorld [25727.9,21327.7,20.2308];
	_this setVectorDirAndUp [[0.505942,-0.862187,-0.0256009],[0.00800059,-0.0249879,0.999656]];
};

private _item1291 = objNull;
if (_layerRoot) then {
	_item1291 = createVehicle ["Christmas_Gift_Medium_Pattern",[25715.2,21324.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1291;
	_objects pushback _this;
	_objectIDs pushback 1291;
	_this setPosWorld [25715.2,21324.6,20.3156];
	_this setVectorDirAndUp [[-0.144397,-0.989193,-0.0254263],[0.00201303,-0.0259892,0.99966]];
};

private _item1292 = objNull;
if (_layerRoot) then {
	_item1292 = createVehicle ["Christmas_Gift_Medium_Tree",[25714.3,21324.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1292;
	_objects pushback _this;
	_objectIDs pushback 1292;
	_this setPosWorld [25714.3,21324.3,20.3092];
	_this setVectorDirAndUp [[-0.574593,0.818132,0.0224269],[0.00201303,-0.0259892,0.99966]];
};

private _item1293 = objNull;
if (_layerRoot) then {
	_item1293 = createVehicle ["RRP_Gift",[25714.6,21325,0],[],0,"CAN_COLLIDE"];
	_this = _item1293;
	_objects pushback _this;
	_objectIDs pushback 1293;
	_this setPosWorld [25714.6,21325,20.4486];
	_this setVectorDirAndUp [[-0.626293,-0.779357,-0.0190006],[0.00201303,-0.0259892,0.99966]];
};

private _item1294 = objNull;
if (_layerRoot) then {
	_item1294 = createVehicle ["Christmas_Gift_Medium_Box",[25715.5,21325.3,-0.40764],[],0,"CAN_COLLIDE"];
	_this = _item1294;
	_objects pushback _this;
	_objectIDs pushback 1294;
	_this setPosWorld [25715.5,21325.3,20.2252];
	_this setVectorDirAndUp [[-0.143165,-0.989372,-0.0254335],[0.00201303,-0.0259892,0.99966]];
};

private _item1295 = objNull;
if (_layerRoot) then {
	_item1295 = createVehicle ["Christmas_Toy_Rocket",[25711.7,21326.4,0],[],0,"CAN_COLLIDE"];
	_this = _item1295;
	_objects pushback _this;
	_objectIDs pushback 1295;
	_this setPosWorld [25711.7,21326.4,20.4476];
	_this setVectorDirAndUp [[0.318636,0.947574,0.0239934],[0.00201303,-0.0259892,0.99966]];
};

private _item1296 = objNull;
if (_layerRoot) then {
	_item1296 = createVehicle ["Christmas_Toy_Rocket",[25712.3,21326.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1296;
	_objects pushback _this;
	_objectIDs pushback 1296;
	_this setPosWorld [25712.3,21326.6,20.4518];
	_this setVectorDirAndUp [[0.318636,0.947574,0.0239934],[0.00201303,-0.0259892,0.99966]];
};

private _item1297 = objNull;
if (_layerRoot) then {
	_item1297 = createVehicle ["pere",[25726.3,21325,0],[],0,"CAN_COLLIDE"];
	_this = _item1297;
	_objects pushback _this;
	_objectIDs pushback 1297;
	_this setPosWorld [25726.3,21325,23.943];
	_this setVectorDirAndUp [[0.592981,-0.804826,-0.0250739],[0.00699926,-0.0259863,0.999638]];
};

private _item1298 = objNull;
if (_layerRoot) then {
	_item1298 = createVehicle ["Christmas_Candy_Cane_01",[6065.41,16202.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1298;
	_objects pushback _this;
	_objectIDs pushback 1298;
	_this setPosWorld [6065.41,16202.3,44.0177];
	_this setVectorDirAndUp [[0.165559,0.9862,0],[0,0,1]];
};

private _item1299 = objNull;
if (_layerRoot) then {
	_item1299 = createVehicle ["Christmas_Penguin_Light",[6068.67,16207.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1299;
	_objects pushback _this;
	_objectIDs pushback 1299;
	_this setPosWorld [6068.67,16207.2,43.4816];
	_this setVectorDirAndUp [[0.309283,-0.95097,0],[0,0,1]];
};

private _item1302 = objNull;
if (_layerRoot) then {
	_item1302 = createVehicle ["Christmas_Happy_Snowman",[6070.02,16207.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1302;
	_objects pushback _this;
	_objectIDs pushback 1302;
	_this setPosWorld [6070.02,16207.1,44.0258];
	_this setVectorDirAndUp [[0.520209,-0.854039,0],[0,0,1]];
};

private _item1303 = objNull;
if (_layerRoot) then {
	_item1303 = createVehicle ["Christmas_Happy_Snowman_Bucket",[6066.34,16205.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1303;
	_objects pushback _this;
	_objectIDs pushback 1303;
	_this setPosWorld [6066.34,16205.9,44.0074];
	_this setVectorDirAndUp [[-0.965507,-0.260376,0],[0,0,1]];
};

private _item1304 = objNull;
if (_layerRoot) then {
	_item1304 = createVehicle ["Christmas_Clothed_Snowman_Hat",[6060.03,16202.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1304;
	_objects pushback _this;
	_objectIDs pushback 1304;
	_this setPosWorld [6060.03,16202.1,44.4462];
	_this setVectorDirAndUp [[-0.0799858,-0.996796,0],[0,0,1]];
};

private _item1307 = objNull;
if (_layerRoot) then {
	_item1307 = createVehicle ["Christmas_Whole_Tree",[6072.29,16203.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1307;
	_objects pushback _this;
	_objectIDs pushback 1307;
	_this setPosWorld [6072.29,16203.6,44.0507];
	_this setVectorDirAndUp [[0.165761,0.986166,0],[0,0,1]];
};

private _item1309 = objNull;
if (_layerRoot) then {
	_item1309 = createVehicle ["Christmas_Gift_Medium_Pattern",[6068.66,16206.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1309;
	_objects pushback _this;
	_objectIDs pushback 1309;
	_this setPosWorld [6068.66,16206.2,43.0944];
	_this setVectorDirAndUp [[0.0130851,-0.999914,0],[0,0,1]];
};

private _item1310 = objNull;
if (_layerRoot) then {
	_item1310 = createVehicle ["Christmas_Gift_Medium_Tree",[6067.89,16205.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1310;
	_objects pushback _this;
	_objectIDs pushback 1310;
	_this setPosWorld [6067.89,16205.8,43.0944];
	_this setVectorDirAndUp [[-0.696383,0.717671,0],[0,0,1]];
};

private _item1311 = objNull;
if (_layerRoot) then {
	_item1311 = createVehicle ["RRP_Gift",[6068.04,16206.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1311;
	_objects pushback _this;
	_objectIDs pushback 1311;
	_this setPosWorld [6068.04,16206.5,43.2161];
	_this setVectorDirAndUp [[-0.495624,-0.868537,0],[0,0,1]];
};

private _item1312 = objNull;
if (_layerRoot) then {
	_item1312 = createVehicle ["Christmas_Gift_Medium_Box",[6067.31,16206.6,-0.407501],[],0,"CAN_COLLIDE"];
	_this = _item1312;
	_objects pushback _this;
	_objectIDs pushback 1312;
	_this setPosWorld [6067.31,16206.6,42.9855];
	_this setVectorDirAndUp [[0.0145768,-0.999894,0],[0,0,1]];
};

private _item1316 = objNull;
if (_layerRoot) then {
	_item1316 = createVehicle ["sapin",[6069.24,16204.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1316;
	_objects pushback _this;
	_objectIDs pushback 1316;
	_this setPosWorld [6069.24,16204.5,47.0516];
	_this setVectorDirAndUp [[-0.711146,0.703045,0],[0,0,1]];
};

private _item1317 = objNull;
if (_layerRoot) then {
	_item1317 = createVehicle ["Christmas_Bunny_Left",[6070.02,16202.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1317;
	_objects pushback _this;
	_objectIDs pushback 1317;
	_this setPosWorld [6070.02,16202.2,43.5972];
	_this setVectorDirAndUp [[0.998981,-0.0451271,0],[0,0,1]];
};

private _item1318 = objNull;
if (_layerRoot) then {
	_item1318 = createVehicle ["Christmas_Toy_Train",[6064.82,16204.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1318;
	_objects pushback _this;
	_objectIDs pushback 1318;
	_this setPosWorld [6064.82,16204.8,43.3029];
	_this setVectorDirAndUp [[-0.719648,-0.694339,0],[0,0,1]];
};

private _item1319 = objNull;
if (_layerRoot) then {
	_item1319 = createVehicle ["Christmas_Car_Light",[6065.92,16203.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1319;
	_objects pushback _this;
	_objectIDs pushback 1319;
	_this setPosWorld [6065.92,16203.2,43.3709];
	_this setVectorDirAndUp [[0.307292,0.951615,0],[0,0,1]];
};

private _item1320 = objNull;
if (_layerRoot) then {
	_item1320 = createVehicle ["Christmas_Toy_Rocket",[6066.41,16204.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1320;
	_objects pushback _this;
	_objectIDs pushback 1320;
	_this setPosWorld [6066.41,16204.3,43.1723];
	_this setVectorDirAndUp [[0.165579,0.986196,0],[0,0,1]];
};

private _item1321 = objNull;
if (_layerRoot) then {
	_item1321 = createVehicle ["Christmas_Gift_Medium_Pattern",[6069.87,16204.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1321;
	_objects pushback _this;
	_objectIDs pushback 1321;
	_this setPosWorld [6069.87,16204.8,43.0944];
	_this setVectorDirAndUp [[0.0130282,-0.999915,0],[0,0,1]];
};

private _item1322 = objNull;
if (_layerRoot) then {
	_item1322 = createVehicle ["Christmas_Gift_Medium_Tree",[6069.12,16204.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1322;
	_objects pushback _this;
	_objectIDs pushback 1322;
	_this setPosWorld [6069.12,16204.6,43.0944];
	_this setVectorDirAndUp [[-0.696195,0.717853,0],[0,0,1]];
};

private _item1323 = objNull;
if (_layerRoot) then {
	_item1323 = createVehicle ["RRP_Gift",[6069.26,16205.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1323;
	_objects pushback _this;
	_objectIDs pushback 1323;
	_this setPosWorld [6069.26,16205.3,43.2161];
	_this setVectorDirAndUp [[-0.495852,-0.868407,0],[0,0,1]];
};

private _item1324 = objNull;
if (_layerRoot) then {
	_item1324 = createVehicle ["Christmas_Gift_Medium_Box",[6068.26,16205.1,-0.407501],[],0,"CAN_COLLIDE"];
	_this = _item1324;
	_objects pushback _this;
	_objectIDs pushback 1324;
	_this setPosWorld [6068.26,16205.1,42.9855];
	_this setVectorDirAndUp [[0.0143303,-0.999897,0],[0,0,1]];
};

private _item1325 = objNull;
if (_layerRoot) then {
	_item1325 = createVehicle ["Christmas_Gift_Medium_Pattern",[6068.58,16203.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1325;
	_objects pushback _this;
	_objectIDs pushback 1325;
	_this setPosWorld [6068.58,16203.9,43.0944];
	_this setVectorDirAndUp [[0.0130706,-0.999915,0],[0,0,1]];
};

private _item1326 = objNull;
if (_layerRoot) then {
	_item1326 = createVehicle ["Christmas_Gift_Medium_Tree",[6067.82,16203.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1326;
	_objects pushback _this;
	_objectIDs pushback 1326;
	_this setPosWorld [6067.82,16203.5,43.0944];
	_this setVectorDirAndUp [[-0.696222,0.717826,0],[0,0,1]];
};

private _item1327 = objNull;
if (_layerRoot) then {
	_item1327 = createVehicle ["RRP_Gift",[6067.96,16204.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1327;
	_objects pushback _this;
	_objectIDs pushback 1327;
	_this setPosWorld [6067.96,16204.2,43.2161];
	_this setVectorDirAndUp [[-0.495839,-0.868415,0],[0,0,1]];
};

private _item1328 = objNull;
if (_layerRoot) then {
	_item1328 = createVehicle ["Christmas_Gift_Medium_Box",[6067.23,16204.2,-0.407501],[],0,"CAN_COLLIDE"];
	_this = _item1328;
	_objects pushback _this;
	_objectIDs pushback 1328;
	_this setPosWorld [6067.23,16204.2,42.9855];
	_this setVectorDirAndUp [[0.0145773,-0.999894,0],[0,0,1]];
};

private _item1329 = objNull;
if (_layerRoot) then {
	_item1329 = createVehicle ["Christmas_Gift_Medium_Pattern",[6069.34,16202.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1329;
	_objects pushback _this;
	_objectIDs pushback 1329;
	_this setPosWorld [6069.34,16202.3,43.0944];
	_this setVectorDirAndUp [[0.0130282,-0.999915,0],[0,0,1]];
};

private _item1330 = objNull;
if (_layerRoot) then {
	_item1330 = createVehicle ["Christmas_Gift_Medium_Tree",[6068.63,16202.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1330;
	_objects pushback _this;
	_objectIDs pushback 1330;
	_this setPosWorld [6068.63,16202.5,43.0944];
	_this setVectorDirAndUp [[-0.696165,0.717882,0],[0,0,1]];
};

private _item1331 = objNull;
if (_layerRoot) then {
	_item1331 = createVehicle ["RRP_Gift",[6068.77,16203.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1331;
	_objects pushback _this;
	_objectIDs pushback 1331;
	_this setPosWorld [6068.77,16203.2,43.2161];
	_this setVectorDirAndUp [[-0.495852,-0.868407,0],[0,0,1]];
};

private _item1332 = objNull;
if (_layerRoot) then {
	_item1332 = createVehicle ["Christmas_Gift_Medium_Box",[6065.89,16204.2,-0.407501],[],0,"CAN_COLLIDE"];
	_this = _item1332;
	_objects pushback _this;
	_objectIDs pushback 1332;
	_this setPosWorld [6065.89,16204.2,42.9855];
	_this setVectorDirAndUp [[0.0143155,-0.999898,0],[0,0,1]];
};

private _item1333 = objNull;
if (_layerRoot) then {
	_item1333 = createVehicle ["Christmas_Gift_Medium_Pattern",[6070.32,16203.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1333;
	_objects pushback _this;
	_objectIDs pushback 1333;
	_this setPosWorld [6070.32,16203.5,43.0944];
	_this setVectorDirAndUp [[0.0130282,-0.999915,0],[0,0,1]];
};

private _item1334 = objNull;
if (_layerRoot) then {
	_item1334 = createVehicle ["Christmas_Gift_Medium_Tree",[6069.56,16203.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1334;
	_objects pushback _this;
	_objectIDs pushback 1334;
	_this setPosWorld [6069.56,16203.1,43.0944];
	_this setVectorDirAndUp [[-0.696165,0.717882,0],[0,0,1]];
};

private _item1335 = objNull;
if (_layerRoot) then {
	_item1335 = createVehicle ["RRP_Gift",[6069.7,16203.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1335;
	_objects pushback _this;
	_objectIDs pushback 1335;
	_this setPosWorld [6069.7,16203.8,43.2161];
	_this setVectorDirAndUp [[-0.495889,-0.868386,0],[0,0,1]];
};

private _item1336 = objNull;
if (_layerRoot) then {
	_item1336 = createVehicle ["Christmas_Gift_Medium_Box",[6070.53,16204.3,-0.407501],[],0,"CAN_COLLIDE"];
	_this = _item1336;
	_objects pushback _this;
	_objectIDs pushback 1336;
	_this setPosWorld [6070.53,16204.3,42.9855];
	_this setVectorDirAndUp [[0.0142731,-0.999898,0],[0,0,1]];
};

private _item1337 = objNull;
if (_layerRoot) then {
	_item1337 = createVehicle ["Christmas_Toy_Rocket",[6066.63,16204.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1337;
	_objects pushback _this;
	_objectIDs pushback 1337;
	_this setPosWorld [6066.63,16204.8,43.1723];
	_this setVectorDirAndUp [[0.165592,0.986194,0],[0,0,1]];
};

private _item1338 = objNull;
if (_layerRoot) then {
	_item1338 = createVehicle ["Christmas_Toy_Rocket",[6067.13,16205.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1338;
	_objects pushback _this;
	_objectIDs pushback 1338;
	_this setPosWorld [6067.13,16205.1,43.1723];
	_this setVectorDirAndUp [[0.165592,0.986194,0],[0,0,1]];
};

private _item1339 = objNull;
if (_layerRoot) then {
	_item1339 = createVehicle ["pere",[6063.53,16202.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1339;
	_objects pushback _this;
	_objectIDs pushback 1339;
	_this setPosWorld [6063.53,16202.3,46.7557];
	_this setVectorDirAndUp [[0.118268,-0.992982,0],[0,0,1]];
};

private _item1340 = objNull;
if (_layerRoot) then {
	_item1340 = createVehicle ["Christmas_Candy_Cane_01",[17103.9,22164.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1340;
	_objects pushback _this;
	_objectIDs pushback 1340;
	_this setPosWorld [17103.9,22164.8,4.80242];
	_this setVectorDirAndUp [[0.524027,-0.851702,0],[0,0,1]];
};

private _item1341 = objNull;
if (_layerRoot) then {
	_item1341 = createVehicle ["Christmas_Penguin_Light",[17107.5,22151.6,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item1341;
	_objects pushback _this;
	_objectIDs pushback 1341;
	_this setPosWorld [17107.5,22151.6,4.2706];
	_this setVectorDirAndUp [[-0.967627,-0.252385,0.00017428],[0,0.000690534,1]];
};

private _item1344 = objNull;
if (_layerRoot) then {
	_item1344 = createVehicle ["Christmas_Happy_Snowman",[17107.4,22150.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1344;
	_objects pushback _this;
	_objectIDs pushback 1344;
	_this setPosWorld [17107.4,22150.2,4.81581];
	_this setVectorDirAndUp [[-0.883365,-0.468685,0.00022885],[0,0.000488281,1]];
};

private _item1345 = objNull;
if (_layerRoot) then {
	_item1345 = createVehicle ["Christmas_Happy_Snowman_Bucket",[17106.4,22154,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item1345;
	_objects pushback _this;
	_objectIDs pushback 1345;
	_this setPosWorld [17106.4,22154,4.79463];
	_this setVectorDirAndUp [[-0.202704,0.97924,-0.000676199],[0,0.000690534,1]];
};

private _item1346 = objNull;
if (_layerRoot) then {
	_item1346 = createVehicle ["Christmas_Clothed_Snowman_Hat",[17108.5,22166.5,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item1346;
	_objects pushback _this;
	_objectIDs pushback 1346;
	_this setPosWorld [17108.5,22166.5,5.2309];
	_this setVectorDirAndUp [[-0.65493,0.755689,0],[0,0,1]];
};

private _item1349 = objNull;
if (_layerRoot) then {
	_item1349 = createVehicle ["Christmas_Whole_Tree",[17103.7,22148.2,2.07424e-005],[],0,"CAN_COLLIDE"];
	_this = _item1349;
	_objects pushback _this;
	_objectIDs pushback 1349;
	_this setPosWorld [17103.7,22148.2,4.84224];
	_this setVectorDirAndUp [[0.974592,-0.223909,-0.00590036],[0.00616624,0.000488272,0.999981]];
};

private _item1351 = objNull;
if (_layerRoot) then {
	_item1351 = createVehicle ["Christmas_Gift_Medium_Pattern",[17106.6,22151.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1351;
	_objects pushback _this;
	_objectIDs pushback 1351;
	_this setPosWorld [17106.6,22151.6,3.88336];
	_this setVectorDirAndUp [[-0.998933,0.0461919,-3.18971e-005],[0,0.000690534,1]];
};

private _item1352 = objNull;
if (_layerRoot) then {
	_item1352 = createVehicle ["Christmas_Gift_Medium_Tree",[17106.2,22152.4,0],[],0,"CAN_COLLIDE"];
	_this = _item1352;
	_objects pushback _this;
	_objectIDs pushback 1352;
	_this setPosWorld [17106.2,22152.4,3.88279];
	_this setVectorDirAndUp [[0.757677,0.65263,-0.000450663],[0,0.000690534,1]];
};

private _item1353 = objNull;
if (_layerRoot) then {
	_item1353 = createVehicle ["RRP_Gift",[17106.9,22152.2,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item1353;
	_objects pushback _this;
	_objectIDs pushback 1353;
	_this setPosWorld [17106.9,22152.2,4.00461];
	_this setVectorDirAndUp [[-0.83764,0.546222,-0.000377185],[0,0.000690534,1]];
};

private _item1354 = objNull;
if (_layerRoot) then {
	_item1354 = createVehicle ["Christmas_Gift_Medium_Box",[17106.9,22153,-0.407501],[],0,"CAN_COLLIDE"];
	_this = _item1354;
	_objects pushback _this;
	_objectIDs pushback 1354;
	_this setPosWorld [17106.9,22153,3.77354];
	_this setVectorDirAndUp [[-0.999,0.0447019,-3.08682e-005],[0,0.000690534,1]];
};

private _item1358 = objNull;
if (_layerRoot) then {
	_item1358 = createVehicle ["sapin",[17104.8,22151.2,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item1358;
	_objects pushback _this;
	_objectIDs pushback 1358;
	_this setPosWorld [17104.8,22151.2,7.84091];
	_this setVectorDirAndUp [[0.743951,0.668234,-0.000461438],[0,0.000690534,1]];
};

private _item1359 = objNull;
if (_layerRoot) then {
	_item1359 = createVehicle ["Christmas_Bunny_Left",[17102.4,22150.5,1.14441e-005],[],0,"CAN_COLLIDE"];
	_this = _item1359;
	_objects pushback _this;
	_objectIDs pushback 1359;
	_this setPosWorld [17102.4,22150.5,4.38703];
	_this setVectorDirAndUp [[-0.104245,-0.994551,0.00112843],[0.00616624,0.000488272,0.999981]];
};

private _item1360 = objNull;
if (_layerRoot) then {
	_item1360 = createVehicle ["Christmas_Toy_Train",[17105.3,22155.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1360;
	_objects pushback _this;
	_objectIDs pushback 1360;
	_this setPosWorld [17105.3,22155.6,4.08933];
	_this setVectorDirAndUp [[-0.650473,0.75953,0],[0,0,1]];
};

private _item1361 = objNull;
if (_layerRoot) then {
	_item1361 = createVehicle ["Christmas_Car_Light",[17104,22163.8,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item1361;
	_objects pushback _this;
	_objectIDs pushback 1361;
	_this setPosWorld [17104,22163.8,4.15562];
	_this setVectorDirAndUp [[0.394526,-0.918885,0],[0,0,1]];
};

private _item1362 = objNull;
if (_layerRoot) then {
	_item1362 = createVehicle ["Christmas_Toy_Rocket",[17104.8,22154,0],[],0,"CAN_COLLIDE"];
	_this = _item1362;
	_objects pushback _this;
	_objectIDs pushback 1362;
	_this setPosWorld [17104.8,22154,3.95957];
	_this setVectorDirAndUp [[0.974651,-0.22373,0.000154493],[0,0.000690534,1]];
};

private _item1363 = objNull;
if (_layerRoot) then {
	_item1363 = createVehicle ["Christmas_Gift_Medium_Pattern",[17105.1,22150.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1363;
	_objects pushback _this;
	_objectIDs pushback 1363;
	_this setPosWorld [17105.1,22150.5,3.88418];
	_this setVectorDirAndUp [[-0.998911,0.0462521,0.00613706],[0.00616624,0.000488272,0.999981]];
};

private _item1364 = objNull;
if (_layerRoot) then {
	_item1364 = createVehicle ["Christmas_Gift_Medium_Tree",[17104.9,22151.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1364;
	_objects pushback _this;
	_objectIDs pushback 1364;
	_this setPosWorld [17104.9,22151.3,3.88362];
	_this setVectorDirAndUp [[0.757847,0.652432,-0.000450527],[0,0.000690534,1]];
};

private _item1365 = objNull;
if (_layerRoot) then {
	_item1365 = createVehicle ["RRP_Gift",[17105.6,22151.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item1365;
	_objects pushback _this;
	_objectIDs pushback 1365;
	_this setPosWorld [17105.6,22151.1,4.00543];
	_this setVectorDirAndUp [[-0.837497,0.546442,-0.000377337],[0,0.000690534,1]];
};

private _item1366 = objNull;
if (_layerRoot) then {
	_item1366 = createVehicle ["Christmas_Gift_Medium_Box",[17105.4,22152.1,-0.4075],[],0,"CAN_COLLIDE"];
	_this = _item1366;
	_objects pushback _this;
	_objectIDs pushback 1366;
	_this setPosWorld [17105.4,22152.1,3.77417];
	_this setVectorDirAndUp [[-0.998989,0.0449487,-3.10386e-005],[0,0.000690534,1]];
};

private _item1367 = objNull;
if (_layerRoot) then {
	_item1367 = createVehicle ["Christmas_Gift_Medium_Pattern",[17104.2,22151.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1367;
	_objects pushback _this;
	_objectIDs pushback 1367;
	_this setPosWorld [17104.2,22151.9,3.8832];
	_this setVectorDirAndUp [[-0.998932,0.0462072,-3.19076e-005],[0,0.000690534,1]];
};

private _item1368 = objNull;
if (_layerRoot) then {
	_item1368 = createVehicle ["Christmas_Gift_Medium_Tree",[17103.8,22152.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1368;
	_objects pushback _this;
	_objectIDs pushback 1368;
	_this setPosWorld [17103.8,22152.6,3.88263];
	_this setVectorDirAndUp [[0.757822,0.652461,-0.000450547],[0,0.000690534,1]];
};

private _item1369 = objNull;
if (_layerRoot) then {
	_item1369 = createVehicle ["RRP_Gift",[17104.6,22152.5,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item1369;
	_objects pushback _this;
	_objectIDs pushback 1369;
	_this setPosWorld [17104.6,22152.5,4.00445];
	_this setVectorDirAndUp [[-0.837505,0.546429,-0.000377328],[0,0.000690534,1]];
};

private _item1370 = objNull;
if (_layerRoot) then {
	_item1370 = createVehicle ["Christmas_Gift_Medium_Box",[17104.6,22153.2,-0.407501],[],0,"CAN_COLLIDE"];
	_this = _item1370;
	_objects pushback _this;
	_objectIDs pushback 1370;
	_this setPosWorld [17104.6,22153.2,3.77339];
	_this setVectorDirAndUp [[-0.999,0.0447019,-3.08682e-005],[0,0.000690534,1]];
};

private _item1371 = objNull;
if (_layerRoot) then {
	_item1371 = createVehicle ["Christmas_Gift_Medium_Pattern",[17102.6,22151.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1371;
	_objects pushback _this;
	_objectIDs pushback 1371;
	_this setPosWorld [17102.6,22151.2,3.88368];
	_this setVectorDirAndUp [[-0.99893,0.0462491,-3.19366e-005],[0,0.000690534,1]];
};

private _item1372 = objNull;
if (_layerRoot) then {
	_item1372 = createVehicle ["Christmas_Gift_Medium_Tree",[17102.8,22151.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1372;
	_objects pushback _this;
	_objectIDs pushback 1372;
	_this setPosWorld [17102.8,22151.9,3.88318];
	_this setVectorDirAndUp [[0.757875,0.6524,-0.000450504],[0,0.000690534,1]];
};

private _item1373 = objNull;
if (_layerRoot) then {
	_item1373 = createVehicle ["RRP_Gift",[17103.5,22151.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item1373;
	_objects pushback _this;
	_objectIDs pushback 1373;
	_this setPosWorld [17103.5,22151.7,4.005];
	_this setVectorDirAndUp [[-0.837497,0.546442,-0.000377337],[0,0.000690534,1]];
};

private _item1374 = objNull;
if (_layerRoot) then {
	_item1374 = createVehicle ["Christmas_Gift_Medium_Box",[17104.7,22154.5,-0.407501],[],0,"CAN_COLLIDE"];
	_this = _item1374;
	_objects pushback _this;
	_objectIDs pushback 1374;
	_this setPosWorld [17104.7,22154.5,3.77241];
	_this setVectorDirAndUp [[-0.998989,0.044963,-3.10485e-005],[0,0.000690534,1]];
};

private _item1375 = objNull;
if (_layerRoot) then {
	_item1375 = createVehicle ["Christmas_Gift_Medium_Pattern",[17103.8,22150.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1375;
	_objects pushback _this;
	_objectIDs pushback 1375;
	_this setPosWorld [17103.8,22150.1,3.88445];
	_this setVectorDirAndUp [[-0.998911,0.0462521,0.00613706],[0.00616624,0.000488272,0.999981]];
};

private _item1376 = objNull;
if (_layerRoot) then {
	_item1376 = createVehicle ["Christmas_Gift_Medium_Tree",[17103.4,22150.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1376;
	_objects pushback _this;
	_objectIDs pushback 1376;
	_this setPosWorld [17103.4,22150.9,3.88387];
	_this setVectorDirAndUp [[0.757875,0.6524,-0.000450504],[0,0.000690534,1]];
};

private _item1377 = objNull;
if (_layerRoot) then {
	_item1377 = createVehicle ["RRP_Gift",[17104.1,22150.7,0],[],0,"CAN_COLLIDE"];
	_this = _item1377;
	_objects pushback _this;
	_objectIDs pushback 1377;
	_this setPosWorld [17104.1,22150.7,4.00569];
	_this setVectorDirAndUp [[-0.837474,0.546477,-0.000377361],[0,0.000690534,1]];
};

private _item1378 = objNull;
if (_layerRoot) then {
	_item1378 = createVehicle ["Christmas_Gift_Medium_Box",[17104.5,22149.9,-0.407499],[],0,"CAN_COLLIDE"];
	_this = _item1378;
	_objects pushback _this;
	_objectIDs pushback 1378;
	_this setPosWorld [17104.5,22149.9,3.77579];
	_this setVectorDirAndUp [[-0.998968,0.0450089,0.00613802],[0.00616624,0.000488272,0.999981]];
};

private _item1379 = objNull;
if (_layerRoot) then {
	_item1379 = createVehicle ["Christmas_Toy_Rocket",[17105.2,22153.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1379;
	_objects pushback _this;
	_objectIDs pushback 1379;
	_this setPosWorld [17105.2,22153.8,3.95975];
	_this setVectorDirAndUp [[0.974648,-0.223742,0.000154501],[0,0.000690534,1]];
};

private _item1380 = objNull;
if (_layerRoot) then {
	_item1380 = createVehicle ["Christmas_Toy_Rocket",[17105.5,22153.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1380;
	_objects pushback _this;
	_objectIDs pushback 1380;
	_this setPosWorld [17105.5,22153.2,3.96013];
	_this setVectorDirAndUp [[0.974648,-0.223742,0.000154501],[0,0.000690534,1]];
};

private _item1381 = objNull;
if (_layerRoot) then {
	_item1381 = createVehicle ["pere",[17105.3,22166,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item1381;
	_objects pushback _this;
	_objectIDs pushback 1381;
	_this setPosWorld [17105.3,22166,7.54045];
	_this setVectorDirAndUp [[-0.742264,0.670107,0],[0,0,1]];
};

private _item1382 = objNull;
if (_layerRoot) then {
	_item1382 = createVehicle ["Christmas_Candy_Cane_01",[13803.6,20162.5,-0.000453949],[],0,"CAN_COLLIDE"];
	_this = _item1382;
	_objects pushback _this;
	_objectIDs pushback 1382;
	_this setPosWorld [13803.6,20162.5,35.9585];
	_this setVectorDirAndUp [[0.435543,0.900015,0.016561],[-0.00727518,-0.0148776,0.999863]];
};

private _item1383 = objNull;
if (_layerRoot) then {
	_item1383 = createVehicle ["Christmas_Penguin_Light",[13794.6,20172.1,-0.000278473],[],0,"CAN_COLLIDE"];
	_this = _item1383;
	_objects pushback _this;
	_objectIDs pushback 1383;
	_this setPosWorld [13794.6,20172,35.69];
	_this setVectorDirAndUp [[-0.988681,-0.14931,-0.0146819],[-0.0064223,-0.0556507,0.99843]];
};

private _item1384 = objNull;
if (_layerRoot) then {
	_item1384 = createVehicle ["Christmas_Reindeer_Light",[13796.6,20164.7,-8.7738e-005],[],0,"CAN_COLLIDE"];
	_this = _item1384;
	_objects pushback _this;
	_objectIDs pushback 1384;
	_this setPosWorld [13796.6,20164.7,35.8547];
	_this setVectorDirAndUp [[-0.317494,0.948183,0.0120723],[-0.00641302,-0.0148777,0.999869]];
};

private _item1386 = objNull;
if (_layerRoot) then {
	_item1386 = createVehicle ["Christmas_Happy_Snowman",[13794.3,20170.8,-0.00259018],[],0,"CAN_COLLIDE"];
	_this = _item1386;
	_objects pushback _this;
	_objectIDs pushback 1386;
	_this setPosWorld [13794.3,20170.7,36.1588];
	_this setVectorDirAndUp [[-0.927484,-0.372905,-0.026751],[-0.0064223,-0.0556507,0.99843]];
};

private _item1387 = objNull;
if (_layerRoot) then {
	_item1387 = createVehicle ["Christmas_Happy_Snowman_Bucket",[13793.7,20174.6,-0.00172424],[],0,"CAN_COLLIDE"];
	_this = _item1387;
	_objects pushback _this;
	_objectIDs pushback 1387;
	_this setPosWorld [13793.7,20174.6,36.3444];
	_this setVectorDirAndUp [[-0.0992342,0.993944,0.0471947],[0.00204259,-0.0472253,0.998882]];
};

private _item1388 = objNull;
if (_layerRoot) then {
	_item1388 = createVehicle ["Christmas_Clothed_Snowman_Hat",[13798.3,20163.7,-4.19617e-005],[],0,"CAN_COLLIDE"];
	_this = _item1388;
	_objects pushback _this;
	_objectIDs pushback 1388;
	_this setPosWorld [13798.3,20163.7,36.3691];
	_this setVectorDirAndUp [[-0.356936,-0.933989,-0.0161868],[-0.00641302,-0.0148777,0.999869]];
};

private _item1389 = objNull;
if (_layerRoot) then {
	_item1389 = createVehicle ["Christmas_Bunny_Right",[13818.2,20128.8,3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item1389;
	_objects pushback _this;
	_objectIDs pushback 1389;
	_this setPosWorld [13818.1,20128.8,35.4556];
	_this setVectorDirAndUp [[-0.208879,-0.977757,-0.019016],[-0.0219442,-0.0147538,0.99965]];
};

private _item1391 = objNull;
if (_layerRoot) then {
	_item1391 = createVehicle ["Christmas_Whole_Tree",[13790.5,20169.1,-0.00477982],[],0,"CAN_COLLIDE"];
	_this = _item1391;
	_objects pushback _this;
	_objectIDs pushback 1391;
	_this setPosWorld [13790.4,20169.1,36.0632];
	_this setVectorDirAndUp [[0.945734,-0.324925,-0.00348368],[-0.0218898,-0.0744023,0.996988]];
};

private _item1393 = objNull;
if (_layerRoot) then {
	_item1393 = createVehicle ["Christmas_Gift_Medium_Pattern",[13793.6,20172.2,0.00175476],[],0,"CAN_COLLIDE"];
	_this = _item1393;
	_objects pushback _this;
	_objectIDs pushback 1393;
	_this setPosWorld [13793.6,20172.2,35.305];
	_this setVectorDirAndUp [[-0.988617,0.150439,0.002026],[-0.0064223,-0.0556507,0.99843]];
};

private _item1394 = objNull;
if (_layerRoot) then {
	_item1394 = createVehicle ["Christmas_Gift_Medium_Tree",[13793.3,20173,0.00175476],[],0,"CAN_COLLIDE"];
	_this = _item1394;
	_objects pushback _this;
	_objectIDs pushback 1394;
	_this setPosWorld [13793.3,20173,35.3492];
	_this setVectorDirAndUp [[0.820746,0.57009,0.0370551],[-0.0064223,-0.0556507,0.99843]];
};

private _item1395 = objNull;
if (_layerRoot) then {
	_item1395 = createVehicle ["RRP_Gift",[13794,20172.7,0.00175476],[],0,"CAN_COLLIDE"];
	_this = _item1395;
	_objects pushback _this;
	_objectIDs pushback 1395;
	_this setPosWorld [13794,20172.7,35.4605];
	_this setVectorDirAndUp [[-0.775964,0.630057,0.0301269],[-0.0064223,-0.0556507,0.99843]];
};

private _item1396 = objNull;
if (_layerRoot) then {
	_item1396 = createVehicle ["Christmas_Gift_Medium_Box",[13794.1,20173.4,-0.407349],[],0,"CAN_COLLIDE"];
	_this = _item1396;
	_objects pushback _this;
	_objectIDs pushback 1396;
	_this setPosWorld [13794.1,20173.4,35.269];
	_this setVectorDirAndUp [[-0.988849,0.14865,0.00904995],[0.00204259,-0.0472253,0.998882]];
};

private _item1397 = objNull;
if (_layerRoot) then {
	_item1397 = createVehicle ["Christmas_Candy_Cane_01",[13819,20127.8,3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item1397;
	_objects pushback _this;
	_objectIDs pushback 1397;
	_this setPosWorld [13819,20127.8,36.0448];
	_this setVectorDirAndUp [[0.891326,0.452603,0.0262462],[-0.0219442,-0.0147538,0.99965]];
};

private _item1400 = objNull;
if (_layerRoot) then {
	_item1400 = createVehicle ["sapin",[13792.1,20172.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1400;
	_objects pushback _this;
	_objectIDs pushback 1400;
	_this setPosWorld [13792.1,20172.5,39.2701];
	_this setVectorDirAndUp [[0.809651,0.585862,0.0350957],[-0.00300996,-0.0556516,0.998446]];
};

private _item1401 = objNull;
if (_layerRoot) then {
	_item1401 = createVehicle ["Christmas_Bunny_Left",[13789.3,20171.5,-0.000576019],[],0,"CAN_COLLIDE"];
	_this = _item1401;
	_objects pushback _this;
	_objectIDs pushback 1401;
	_this setPosWorld [13789.3,20171.5,35.7541];
	_this setVectorDirAndUp [[-0.207477,-0.976689,-0.0550643],[-0.00300996,-0.0556516,0.998446]];
};

private _item1402 = objNull;
if (_layerRoot) then {
	_item1402 = createVehicle ["Christmas_Toy_Train",[13803.7,20165,-6.86646e-005],[],0,"CAN_COLLIDE"];
	_this = _item1402;
	_objects pushback _this;
	_objectIDs pushback 1402;
	_this setPosWorld [13803.7,20165,35.276];
	_this setVectorDirAndUp [[-0.885694,-0.46423,-0.00604228],[-0.00185932,-0.00946775,0.999953]];
};

private _item1403 = objNull;
if (_layerRoot) then {
	_item1403 = createVehicle ["Christmas_Car_Light",[13804.3,20163.1,-0.000198364],[],0,"CAN_COLLIDE"];
	_this = _item1403;
	_objects pushback _this;
	_objectIDs pushback 1403;
	_this setPosWorld [13804.3,20163.1,35.3264];
	_this setVectorDirAndUp [[0.562182,0.826851,0.0163938],[-0.00727518,-0.0148776,0.999863]];
};

private _item1404 = objNull;
if (_layerRoot) then {
	_item1404 = createVehicle ["Christmas_Toy_Rocket",[13805.1,20164,-0.000183105],[],0,"CAN_COLLIDE"];
	_this = _item1404;
	_objects pushback _this;
	_objectIDs pushback 1404;
	_this setPosWorld [13805.1,20164,35.1392];
	_this setVectorDirAndUp [[0.435791,0.9,0.00933168],[-0.00185932,-0.00946775,0.999953]];
};

private _item1405 = objNull;
if (_layerRoot) then {
	_item1405 = createVehicle ["Christmas_Gift_Medium_Pattern",[13792,20171.2,0.00175476],[],0,"CAN_COLLIDE"];
	_this = _item1405;
	_objects pushback _this;
	_objectIDs pushback 1405;
	_this setPosWorld [13792,20171.2,35.2428];
	_this setVectorDirAndUp [[-0.988631,0.150266,0.00539519],[-0.00300996,-0.0556516,0.998446]];
};

private _item1406 = objNull;
if (_layerRoot) then {
	_item1406 = createVehicle ["Christmas_Gift_Medium_Tree",[13791.9,20172,0.00175476],[],0,"CAN_COLLIDE"];
	_this = _item1406;
	_objects pushback _this;
	_objectIDs pushback 1406;
	_this setPosWorld [13791.9,20172,35.286];
	_this setVectorDirAndUp [[0.821821,0.56872,0.0341769],[-0.00300996,-0.0556516,0.998446]];
};

private _item1407 = objNull;
if (_layerRoot) then {
	_item1407 = createVehicle ["RRP_Gift",[13792.6,20171.7,0.00175476],[],0,"CAN_COLLIDE"];
	_this = _item1407;
	_objects pushback _this;
	_objectIDs pushback 1407;
	_this setPosWorld [13792.6,20171.7,35.3956];
	_this setVectorDirAndUp [[-0.775817,0.630238,0.030138],[-0.0064223,-0.0556507,0.99843]];
};

private _item1408 = objNull;
if (_layerRoot) then {
	_item1408 = createVehicle ["Christmas_Gift_Medium_Box",[13792.5,20172.8,-0.407455],[],0,"CAN_COLLIDE"];
	_this = _item1408;
	_objects pushback _this;
	_objectIDs pushback 1408;
	_this setPosWorld [13792.5,20172.7,35.2203];
	_this setVectorDirAndUp [[-0.988826,0.148979,0.00532284],[-0.00300996,-0.0556516,0.998446]];
};

private _item1409 = objNull;
if (_layerRoot) then {
	_item1409 = createVehicle ["Christmas_Gift_Medium_Pattern",[13791.3,20172.6,0.00175476],[],0,"CAN_COLLIDE"];
	_this = _item1409;
	_objects pushback _this;
	_objectIDs pushback 1409;
	_this setPosWorld [13791.3,20172.6,35.3199];
	_this setVectorDirAndUp [[-0.988643,0.150185,0.00539061],[-0.00300996,-0.0556516,0.998446]];
};

private _item1410 = objNull;
if (_layerRoot) then {
	_item1410 = createVehicle ["Christmas_Gift_Medium_Tree",[13791,20173.4,0.00175476],[],0,"CAN_COLLIDE"];
	_this = _item1410;
	_objects pushback _this;
	_objectIDs pushback 1410;
	_this setPosWorld [13791,20173.4,35.3649];
	_this setVectorDirAndUp [[0.821799,0.568751,0.0341786],[-0.00300996,-0.0556516,0.998446]];
};

private _item1411 = objNull;
if (_layerRoot) then {
	_item1411 = createVehicle ["RRP_Gift",[13791.7,20173.2,0.00175476],[],0,"CAN_COLLIDE"];
	_this = _item1411;
	_objects pushback _this;
	_objectIDs pushback 1411;
	_this setPosWorld [13791.7,20173.2,35.4742];
	_this setVectorDirAndUp [[-0.775872,0.630038,0.0327782],[-0.00300996,-0.0556516,0.998446]];
};

private _item1412 = objNull;
if (_layerRoot) then {
	_item1412 = createVehicle ["Christmas_Gift_Medium_Box",[13791.8,20173.9,-0.407459],[],0,"CAN_COLLIDE"];
	_this = _item1412;
	_objects pushback _this;
	_objectIDs pushback 1412;
	_this setPosWorld [13791.8,20173.9,35.2822];
	_this setVectorDirAndUp [[-0.988863,0.148735,0.00530914],[-0.00300996,-0.0556516,0.998446]];
};

private _item1413 = objNull;
if (_layerRoot) then {
	_item1413 = createVehicle ["Christmas_Gift_Medium_Pattern",[13789.6,20172.1,0.00175476],[],0,"CAN_COLLIDE"];
	_this = _item1413;
	_objects pushback _this;
	_objectIDs pushback 1413;
	_this setPosWorld [13789.6,20172.1,35.2879];
	_this setVectorDirAndUp [[-0.988643,0.150187,0.00539072],[-0.00300996,-0.0556516,0.998446]];
};

private _item1414 = objNull;
if (_layerRoot) then {
	_item1414 = createVehicle ["Christmas_Gift_Medium_Tree",[13789.9,20172.8,0.00175476],[],0,"CAN_COLLIDE"];
	_this = _item1414;
	_objects pushback _this;
	_objectIDs pushback 1414;
	_this setPosWorld [13789.9,20172.8,35.3258];
	_this setVectorDirAndUp [[0.821845,0.568685,0.034175],[-0.00300996,-0.0556516,0.998446]];
};

private _item1415 = objNull;
if (_layerRoot) then {
	_item1415 = createVehicle ["RRP_Gift",[13790.6,20172.5,0.00175476],[],0,"CAN_COLLIDE"];
	_this = _item1415;
	_objects pushback _this;
	_objectIDs pushback 1415;
	_this setPosWorld [13790.6,20172.5,35.4353];
	_this setVectorDirAndUp [[-0.775863,0.63005,0.0327789],[-0.00300996,-0.0556516,0.998446]];
};

private _item1416 = objNull;
if (_layerRoot) then {
	_item1416 = createVehicle ["Christmas_Gift_Medium_Box",[13804.5,20164.1,-0.407516],[],0,"CAN_COLLIDE"];
	_this = _item1416;
	_objects pushback _this;
	_objectIDs pushback 1416;
	_this setPosWorld [13804.5,20164.1,34.9519];
	_this setVectorDirAndUp [[-0.267096,-0.963622,-0.00962039],[-0.00185932,-0.00946775,0.999953]];
};

private _item1417 = objNull;
if (_layerRoot) then {
	_item1417 = createVehicle ["Christmas_Gift_Medium_Pattern",[13790.7,20171,0.00175476],[],0,"CAN_COLLIDE"];
	_this = _item1417;
	_objects pushback _this;
	_objectIDs pushback 1417;
	_this setPosWorld [13790.7,20171,35.2256];
	_this setVectorDirAndUp [[-0.988641,0.150201,0.00539151],[-0.00300996,-0.0556516,0.998446]];
};

private _item1418 = objNull;
if (_layerRoot) then {
	_item1418 = createVehicle ["Christmas_Gift_Medium_Tree",[13790.4,20171.8,0.00175476],[],0,"CAN_COLLIDE"];
	_this = _item1418;
	_objects pushback _this;
	_objectIDs pushback 1418;
	_this setPosWorld [13790.4,20171.8,35.2707];
	_this setVectorDirAndUp [[0.821822,0.568718,0.0341768],[-0.00300996,-0.0556516,0.998446]];
};

private _item1419 = objNull;
if (_layerRoot) then {
	_item1419 = createVehicle ["RRP_Gift",[13791.1,20171.5,0.00175476],[],0,"CAN_COLLIDE"];
	_this = _item1419;
	_objects pushback _this;
	_objectIDs pushback 1419;
	_this setPosWorld [13791.1,20171.5,35.3801];
	_this setVectorDirAndUp [[-0.775836,0.630082,0.0327808],[-0.00300996,-0.0556516,0.998446]];
};

private _item1420 = objNull;
if (_layerRoot) then {
	_item1420 = createVehicle ["Christmas_Gift_Medium_Box",[13791.4,20170.6,-0.407585],[],0,"CAN_COLLIDE"];
	_this = _item1420;
	_objects pushback _this;
	_objectIDs pushback 1420;
	_this setPosWorld [13791.4,20170.6,35.0986];
	_this setVectorDirAndUp [[-0.988829,0.148958,0.00532165],[-0.00300996,-0.0556516,0.998446]];
};

private _item1421 = objNull;
if (_layerRoot) then {
	_item1421 = createVehicle ["Christmas_Toy_Rocket",[13792.5,20174.4,0.000988007],[],0,"CAN_COLLIDE"];
	_this = _item1421;
	_objects pushback _this;
	_objectIDs pushback 1421;
	_this setPosWorld [13792.5,20174.4,35.5007];
	_this setVectorDirAndUp [[0.945929,-0.324153,-0.0119831],[-0.0064223,-0.0556507,0.99843]];
};

private _item1422 = objNull;
if (_layerRoot) then {
	_item1422 = createVehicle ["Christmas_Toy_Rocket",[13792.7,20173.9,0.00109482],[],0,"CAN_COLLIDE"];
	_this = _item1422;
	_objects pushback _this;
	_objectIDs pushback 1422;
	_this setPosWorld [13792.7,20173.9,35.4718];
	_this setVectorDirAndUp [[0.945929,-0.324153,-0.0119831],[-0.0064223,-0.0556507,0.99843]];
};

private _item1423 = objNull;
if (_layerRoot) then {
	_item1423 = createVehicle ["pere",[13801.7,20163,0],[],0,"CAN_COLLIDE"];
	_this = _item1423;
	_objects pushback _this;
	_objectIDs pushback 1423;
	_this setPosWorld [13801.7,20163,38.6912];
	_this setVectorDirAndUp [[-0.165021,-0.986162,-0.0158745],[-0.00727518,-0.0148776,0.999863]];
};

private _item1426 = objNull;
if (_layerRoot) then {
	_item1426 = createVehicle ["Christmas_Candy_Cane_01",[23673.9,24275.9,-0.00385284],[],0,"CAN_COLLIDE"];
	_this = _item1426;
	_objects pushback _this;
	_objectIDs pushback 1426;
	_this setPosWorld [23673.7,24275.9,61.295];
	_this setVectorDirAndUp [[0.651257,-0.756247,0.0628899],[-0.106265,-0.00882625,0.994299]];
};

private _item1427 = objNull;
if (_layerRoot) then {
	_item1427 = createVehicle ["Christmas_Penguin_Light",[23675.5,24270.3,-0.00185013],[],0,"CAN_COLLIDE"];
	_this = _item1427;
	_objects pushback _this;
	_objectIDs pushback 1427;
	_this setPosWorld [23675.5,24270.3,60.9109];
	_this setVectorDirAndUp [[-0.926055,0.366638,-0.0894377],[-0.0952172,0.00233107,0.995454]];
};

private _item1428 = objNull;
if (_layerRoot) then {
	_item1428 = createVehicle ["Christmas_Reindeer_Light",[23687.1,24280.3,-0.000499725],[],0,"CAN_COLLIDE"];
	_this = _item1428;
	_objects pushback _this;
	_objectIDs pushback 1428;
	_this setPosWorld [23687.1,24280.3,62.3123];
	_this setVectorDirAndUp [[-0.726962,-0.686223,-0.0249983],[-0.0387427,0.00464159,0.999238]];
};

private _item1429 = objNull;
if (_layerRoot) then {
	_item1429 = createVehicle ["Christmas_Sleigh_Bench",[23688.6,24278.1,-0.00038147],[],0,"CAN_COLLIDE"];
	_this = _item1429;
	_objects pushback _this;
	_objectIDs pushback 1429;
	_this setPosWorld [23688.6,24278.1,62.1505];
	_this setVectorDirAndUp [[-0.44415,-0.895857,-0.0130593],[-0.0387427,0.00464159,0.999238]];
};

private _item1430 = objNull;
if (_layerRoot) then {
	_item1430 = createVehicle ["Christmas_Happy_Snowman",[23674.6,24269.3,-0.00309753],[],0,"CAN_COLLIDE"];
	_this = _item1430;
	_objects pushback _this;
	_objectIDs pushback 1430;
	_this setPosWorld [23674.5,24269.3,61.3497];
	_this setVectorDirAndUp [[-0.985294,0.144594,-0.0910433],[-0.0952179,-0.0222036,0.995209]];
};

private _item1431 = objNull;
if (_layerRoot) then {
	_item1431 = createVehicle ["Christmas_Happy_Snowman_Bucket",[23676,24272.9,-0.00411987],[],0,"CAN_COLLIDE"];
	_this = _item1431;
	_objects pushback _this;
	_objectIDs pushback 1431;
	_this setPosWorld [23675.9,24272.9,61.4911];
	_this setVectorDirAndUp [[0.411365,0.909984,0.0520423],[-0.106265,-0.00882625,0.994299]];
};

private _item1432 = objNull;
if (_layerRoot) then {
	_item1432 = createVehicle ["Christmas_Clothed_Snowman_Hat",[23686.5,24271.6,-0.000354767],[],0,"CAN_COLLIDE"];
	_this = _item1432;
	_objects pushback _this;
	_objectIDs pushback 1432;
	_this setPosWorld [23686.5,24271.5,62.7709];
	_this setVectorDirAndUp [[0.881391,-0.47143,0.030075],[-0.038482,-0.0082005,0.999226]];
};

private _item1433 = objNull;
if (_layerRoot) then {
	_item1433 = createVehicle ["Christmas_Bunny_Right",[23687.8,24272.3,-0.000270844],[],0,"CAN_COLLIDE"];
	_this = _item1433;
	_objects pushback _this;
	_objectIDs pushback 1433;
	_this setPosWorld [23687.8,24272.3,61.8134];
	_this setVectorDirAndUp [[0.118628,-0.992932,-0.00358028],[-0.038482,-0.0082005,0.999226]];
};

private _item1434 = objNull;
if (_layerRoot) then {
	_item1434 = createVehicle ["Christmas_Bunny_SnowFlakes",[23689.1,24275.9,-0.00012207],[],0,"CAN_COLLIDE"];
	_this = _item1434;
	_objects pushback _this;
	_objectIDs pushback 1434;
	_this setPosWorld [23689,24275.9,61.8742];
	_this setVectorDirAndUp [[-0.40149,-0.915567,-0.0233161],[-0.0387412,-0.00845771,0.999213]];
};

private _item1435 = objNull;
if (_layerRoot) then {
	_item1435 = createVehicle ["Christmas_Whole_Tree",[23670.5,24269.8,-0.00369263],[],0,"CAN_COLLIDE"];
	_this = _item1435;
	_objects pushback _this;
	_objectIDs pushback 1435;
	_this setPosWorld [23670.4,24269.7,60.9898];
	_this setVectorDirAndUp [[0.652239,-0.756645,0.0455227],[-0.0952179,-0.0222036,0.995209]];
};

private _item1436 = objNull;
if (_layerRoot) then {
	_item1436 = createVehicle ["Christmas_Snowman_Pack",[23689.4,24274.2,-0.000537872],[],0,"CAN_COLLIDE"];
	_this = _item1436;
	_objects pushback _this;
	_objectIDs pushback 1436;
	_this setPosWorld [23689.4,24274.2,63.2411];
	_this setVectorDirAndUp [[0.571769,0.819898,0.0291083],[-0.0387412,-0.00845771,0.999213]];
};

private _item1437 = objNull;
if (_layerRoot) then {
	_item1437 = createVehicle ["Christmas_Gift_Medium_Pattern",[23674.7,24270.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1437;
	_objects pushback _this;
	_objectIDs pushback 1437;
	_this setPosWorld [23674.7,24270.9,60.4532];
	_this setVectorDirAndUp [[-0.775933,0.626259,-0.0756861],[-0.0952172,0.00233107,0.995454]];
};

private _item1438 = objNull;
if (_layerRoot) then {
	_item1438 = createVehicle ["Christmas_Gift_Medium_Tree",[23674.9,24271.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1438;
	_objects pushback _this;
	_objectIDs pushback 1438;
	_this setPosWorld [23674.9,24271.8,60.4656];
	_this setVectorDirAndUp [[0.99225,0.0804251,0.0947224],[-0.0952172,0.00233107,0.995454]];
};

private _item1439 = objNull;
if (_layerRoot) then {
	_item1439 = createVehicle ["RRP_Gift",[23675.4,24271.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1439;
	_objects pushback _this;
	_objectIDs pushback 1439;
	_this setPosWorld [23675.4,24271.2,60.634];
	_this setVectorDirAndUp [[-0.352711,0.935043,-0.0359271],[-0.0952172,0.00233107,0.995454]];
};

private _item1440 = objNull;
if (_layerRoot) then {
	_item1440 = createVehicle ["Christmas_Gift_Medium_Box",[23675.8,24271.8,-0.407284],[],0,"CAN_COLLIDE"];
	_this = _item1440;
	_objects pushback _this;
	_objectIDs pushback 1440;
	_this setPosWorld [23675.8,24271.8,60.4471];
	_this setVectorDirAndUp [[-0.776064,0.625888,-0.0773858],[-0.106265,-0.00882625,0.994299]];
};

private _item1441 = objNull;
if (_layerRoot) then {
	_item1441 = createVehicle ["Christmas_Candy_Cane_01",[23688.9,24271.7,-0.000362396],[],0,"CAN_COLLIDE"];
	_this = _item1441;
	_objects pushback _this;
	_objectIDs pushback 1441;
	_this setPosWorld [23688.9,24271.7,62.4369];
	_this setVectorDirAndUp [[0.656839,0.753374,0.0314789],[-0.038482,-0.0082005,0.999226]];
};

private _item1442 = objNull;
if (_layerRoot) then {
	_item1442 = createVehicle ["Christmas_Whole_Tree",[23689.9,24276.1,-0.000366211],[],0,"CAN_COLLIDE"];
	_this = _item1442;
	_objects pushback _this;
	_objectIDs pushback 1442;
	_this setPosWorld [23689.9,24276.1,62.545];
	_this setVectorDirAndUp [[-0.323305,0.946284,-0.0045254],[-0.0387412,-0.00845771,0.999213]];
};

private _item1443 = objNull;
if (_layerRoot) then {
	_item1443 = createVehicle ["Christmas_Toy_Rocket",[23689.2,24276.3,-6.48499e-005],[],0,"CAN_COLLIDE"];
	_this = _item1443;
	_objects pushback _this;
	_objectIDs pushback 1443;
	_this setPosWorld [23689.2,24276.3,61.6413];
	_this setVectorDirAndUp [[-0.323305,0.946284,-0.0045254],[-0.0387412,-0.00845771,0.999213]];
};

private _item1444 = objNull;
if (_layerRoot) then {
	_item1444 = createVehicle ["sapin",[23673,24271.6,3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item1444;
	_objects pushback _this;
	_objectIDs pushback 1444;
	_this setPosWorld [23673,24271.6,64.2421];
	_this setVectorDirAndUp [[0.990376,0.101121,0.0944948],[-0.0952172,0.00233107,0.995454]];
};

private _item1445 = objNull;
if (_layerRoot) then {
	_item1445 = createVehicle ["Christmas_Bunny_Left",[23670.8,24272.4,-0.00242996],[],0,"CAN_COLLIDE"];
	_this = _item1445;
	_objects pushback _this;
	_objectIDs pushback 1445;
	_this setPosWorld [23670.7,24272.4,60.5671];
	_this setVectorDirAndUp [[-0.66747,-0.742042,-0.0621073],[-0.0952172,0.00233107,0.995454]];
};

private _item1446 = objNull;
if (_layerRoot) then {
	_item1446 = createVehicle ["Christmas_Toy_Train",[23676.1,24274.8,-0.00107956],[],0,"CAN_COLLIDE"];
	_this = _item1446;
	_objects pushback _this;
	_objectIDs pushback 1446;
	_this setPosWorld [23676,24274.8,60.8145];
	_this setVectorDirAndUp [[-0.0770499,0.997027,0.000615774],[-0.106265,-0.00882625,0.994299]];
};

private _item1447 = objNull;
if (_layerRoot) then {
	_item1447 = createVehicle ["Christmas_Car_Light",[23674.1,24275,-0.00147247],[],0,"CAN_COLLIDE"];
	_this = _item1447;
	_objects pushback _this;
	_objectIDs pushback 1447;
	_this setPosWorld [23674.1,24275,60.6747];
	_this setVectorDirAndUp [[0.534999,-0.84339,0.0496912],[-0.106265,-0.00882625,0.994299]];
};

private _item1448 = objNull;
if (_layerRoot) then {
	_item1448 = createVehicle ["Christmas_Toy_Rocket",[23674.7,24273.9,-0.000770569],[],0,"CAN_COLLIDE"];
	_this = _item1448;
	_objects pushback _this;
	_objectIDs pushback 1448;
	_this setPosWorld [23674.7,24273.9,60.5292];
	_this setVectorDirAndUp [[0.651242,-0.75626,0.0628881],[-0.106265,-0.00882625,0.994299]];
};

private _item1449 = objNull;
if (_layerRoot) then {
	_item1449 = createVehicle ["Christmas_Gift_Medium_Pattern",[23672.9,24270.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1449;
	_objects pushback _this;
	_objectIDs pushback 1449;
	_this setPosWorld [23672.9,24270.9,60.274];
	_this setVectorDirAndUp [[-0.775897,0.626303,-0.0756828],[-0.0952172,0.00233107,0.995454]];
};

private _item1450 = objNull;
if (_layerRoot) then {
	_item1450 = createVehicle ["Christmas_Gift_Medium_Tree",[23673.2,24271.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1450;
	_objects pushback _this;
	_objectIDs pushback 1450;
	_this setPosWorld [23673.2,24271.6,60.3022];
	_this setVectorDirAndUp [[0.992271,0.0801648,0.094725],[-0.0952172,0.00233107,0.995454]];
};

private _item1451 = objNull;
if (_layerRoot) then {
	_item1451 = createVehicle ["RRP_Gift",[23673.7,24271,0],[],0,"CAN_COLLIDE"];
	_this = _item1451;
	_objects pushback _this;
	_objectIDs pushback 1451;
	_this setPosWorld [23673.7,24271,60.4706];
	_this setVectorDirAndUp [[-0.352467,0.935135,-0.035904],[-0.0952172,0.00233107,0.995454]];
};

private _item1452 = objNull;
if (_layerRoot) then {
	_item1452 = createVehicle ["Christmas_Gift_Medium_Box",[23674.1,24272,-0.407005],[],0,"CAN_COLLIDE"];
	_this = _item1452;
	_objects pushback _this;
	_objectIDs pushback 1452;
	_this setPosWorld [23674.1,24272,60.278];
	_this setVectorDirAndUp [[-0.776709,0.625287,-0.0757581],[-0.0952172,0.00233107,0.995454]];
};

private _item1453 = objNull;
if (_layerRoot) then {
	_item1453 = createVehicle ["Christmas_Gift_Medium_Pattern",[23673,24272.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1453;
	_objects pushback _this;
	_objectIDs pushback 1453;
	_this setPosWorld [23673,24272.5,60.2808];
	_this setVectorDirAndUp [[-0.775924,0.62627,-0.0756853],[-0.0952172,0.00233107,0.995454]];
};

private _item1454 = objNull;
if (_layerRoot) then {
	_item1454 = createVehicle ["Christmas_Gift_Medium_Tree",[23673.1,24273.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1454;
	_objects pushback _this;
	_objectIDs pushback 1454;
	_this setPosWorld [23673.1,24273.3,60.2931];
	_this setVectorDirAndUp [[0.992267,0.0802028,0.0947247],[-0.0952172,0.00233107,0.995454]];
};

private _item1455 = objNull;
if (_layerRoot) then {
	_item1455 = createVehicle ["RRP_Gift",[23673.6,24272.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1455;
	_objects pushback _this;
	_objectIDs pushback 1455;
	_this setPosWorld [23673.6,24272.8,60.4617];
	_this setVectorDirAndUp [[-0.352481,0.93513,-0.0359054],[-0.0952172,0.00233107,0.995454]];
};

private _item1456 = objNull;
if (_layerRoot) then {
	_item1456 = createVehicle ["Christmas_Gift_Medium_Box",[23674.1,24273.3,-0.406998],[],0,"CAN_COLLIDE"];
	_this = _item1456;
	_objects pushback _this;
	_objectIDs pushback 1456;
	_this setPosWorld [23674,24273.3,60.274];
	_this setVectorDirAndUp [[-0.776689,0.625312,-0.0757562],[-0.0952172,0.00233107,0.995454]];
};

private _item1457 = objNull;
if (_layerRoot) then {
	_item1457 = createVehicle ["Christmas_Gift_Medium_Pattern",[23671.3,24272.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1457;
	_objects pushback _this;
	_objectIDs pushback 1457;
	_this setPosWorld [23671.3,24272.9,60.1176];
	_this setVectorDirAndUp [[-0.77608,0.626074,-0.0756998],[-0.0952172,0.00233107,0.995454]];
};

private _item1458 = objNull;
if (_layerRoot) then {
	_item1458 = createVehicle ["Christmas_Gift_Medium_Tree",[23671.8,24273.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1458;
	_objects pushback _this;
	_objectIDs pushback 1458;
	_this setPosWorld [23671.8,24273.3,60.1694];
	_this setVectorDirAndUp [[0.992274,0.0801225,0.0947255],[-0.0952172,0.00233107,0.995454]];
};

private _item1459 = objNull;
if (_layerRoot) then {
	_item1459 = createVehicle ["RRP_Gift",[23672.3,24272.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1459;
	_objects pushback _this;
	_objectIDs pushback 1459;
	_this setPosWorld [23672.3,24272.8,60.3378];
	_this setVectorDirAndUp [[-0.352467,0.935135,-0.035904],[-0.0952172,0.00233107,0.995454]];
};

private _item1460 = objNull;
if (_layerRoot) then {
	_item1460 = createVehicle ["Christmas_Gift_Medium_Box",[23674.9,24274.4,-0.407478],[],0,"CAN_COLLIDE"];
	_this = _item1460;
	_objects pushback _this;
	_objectIDs pushback 1460;
	_this setPosWorld [23674.9,24274.4,60.3713];
	_this setVectorDirAndUp [[-0.775902,0.626092,-0.0773666],[-0.106265,-0.00882625,0.994299]];
};

private _item1461 = objNull;
if (_layerRoot) then {
	_item1461 = createVehicle ["Christmas_Gift_Medium_Pattern",[23671.6,24271.4,0],[],0,"CAN_COLLIDE"];
	_this = _item1461;
	_objects pushback _this;
	_objectIDs pushback 1461;
	_this setPosWorld [23671.6,24271.4,60.152];
	_this setVectorDirAndUp [[-0.775897,0.626303,-0.0756828],[-0.0952172,0.00233107,0.995454]];
};

private _item1462 = objNull;
if (_layerRoot) then {
	_item1462 = createVehicle ["Christmas_Gift_Medium_Tree",[23671.8,24272.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1462;
	_objects pushback _this;
	_objectIDs pushback 1462;
	_this setPosWorld [23671.8,24272.2,60.1644];
	_this setVectorDirAndUp [[0.992274,0.0801225,0.0947255],[-0.0952172,0.00233107,0.995454]];
};

private _item1463 = objNull;
if (_layerRoot) then {
	_item1463 = createVehicle ["RRP_Gift",[23672.2,24271.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1463;
	_objects pushback _this;
	_objectIDs pushback 1463;
	_this setPosWorld [23672.2,24271.6,60.3326];
	_this setVectorDirAndUp [[-0.352427,0.93515,-0.0359003],[-0.0952172,0.00233107,0.995454]];
};

private _item1464 = objNull;
if (_layerRoot) then {
	_item1464 = createVehicle ["Christmas_Gift_Medium_Box",[23672.1,24270.7,-0.406841],[],0,"CAN_COLLIDE"];
	_this = _item1464;
	_objects pushback _this;
	_objectIDs pushback 1464;
	_this setPosWorld [23672,24270.7,60.0871];
	_this setVectorDirAndUp [[-0.776673,0.625332,-0.0757548],[-0.0952172,0.00233107,0.995454]];
};

private _item1465 = objNull;
if (_layerRoot) then {
	_item1465 = createVehicle ["Christmas_Toy_Rocket",[23674.9,24273.4,-0.000774384],[],0,"CAN_COLLIDE"];
	_this = _item1465;
	_objects pushback _this;
	_objectIDs pushback 1465;
	_this setPosWorld [23674.9,24273.4,60.55];
	_this setVectorDirAndUp [[0.651232,-0.756268,0.062887],[-0.106265,-0.00882625,0.994299]];
};

private _item1466 = objNull;
if (_layerRoot) then {
	_item1466 = createVehicle ["Christmas_Toy_Rocket",[23674.8,24272.8,-0.00075531],[],0,"CAN_COLLIDE"];
	_this = _item1466;
	_objects pushback _this;
	_objectIDs pushback 1466;
	_this setPosWorld [23674.8,24272.8,60.5348];
	_this setVectorDirAndUp [[0.651232,-0.756268,0.062887],[-0.106265,-0.00882625,0.994299]];
};

private _item1467 = objNull;
if (_layerRoot) then {
	_item1467 = createVehicle ["pere",[23675,24277.4,0],[],0,"CAN_COLLIDE"];
	_this = _item1467;
	_objects pushback _this;
	_objectIDs pushback 1467;
	_this setPosWorld [23675,24277.4,64.1766];
	_this setVectorDirAndUp [[-0.836417,0.541528,-0.0845848],[-0.106265,-0.00882625,0.994299]];
};

private _item1471 = objNull;
if (_layerRoot) then {
	_item1471 = createVehicle ["Christmas_Candy_Cane_01",[9207.94,19198.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1471;
	_objects pushback _this;
	_objectIDs pushback 1471;
	_this setPosWorld [9207.94,19198.2,273.545];
	_this setVectorDirAndUp [[0.163503,0.986543,0],[0,0,1]];
};

private _item1472 = objNull;
if (_layerRoot) then {
	_item1472 = createVehicle ["Christmas_Penguin_Light",[9211.18,19203,0],[],0,"CAN_COLLIDE"];
	_this = _item1472;
	_objects pushback _this;
	_objectIDs pushback 1472;
	_this setPosWorld [9211.18,19203,273.009];
	_this setVectorDirAndUp [[0.311265,-0.950323,0],[0,0,1]];
};

private _item1473 = objNull;
if (_layerRoot) then {
	_item1473 = createVehicle ["Christmas_Reindeer_Light",[9201.42,19200,0],[],0,"CAN_COLLIDE"];
	_this = _item1473;
	_objects pushback _this;
	_objectIDs pushback 1473;
	_this setPosWorld [9201.42,19200,273.455];
	_this setVectorDirAndUp [[-0.61695,0.787003,0],[0,0,1]];
};

private _item1474 = objNull;
if (_layerRoot) then {
	_item1474 = createVehicle ["Christmas_Sleigh_Bench",[9199.52,19196.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1474;
	_objects pushback _this;
	_objectIDs pushback 1474;
	_this setPosWorld [9199.52,19196.3,273.225];
	_this setVectorDirAndUp [[-0.851556,0.524263,0],[0,0,1]];
};

private _item1475 = objNull;
if (_layerRoot) then {
	_item1475 = createVehicle ["Christmas_Happy_Snowman",[9212.54,19203,0],[],0,"CAN_COLLIDE"];
	_this = _item1475;
	_objects pushback _this;
	_objectIDs pushback 1475;
	_this setPosWorld [9212.54,19203,273.553];
	_this setVectorDirAndUp [[0.521989,-0.852952,0],[0,0,1]];
};

private _item1476 = objNull;
if (_layerRoot) then {
	_item1476 = createVehicle ["Christmas_Happy_Snowman_Bucket",[9208.86,19201.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1476;
	_objects pushback _this;
	_objectIDs pushback 1476;
	_this setPosWorld [9208.86,19201.8,273.534];
	_this setVectorDirAndUp [[-0.964962,-0.262389,0],[0,0,1]];
};

private _item1477 = objNull;
if (_layerRoot) then {
	_item1477 = createVehicle ["Christmas_Clothed_Snowman_Hat",[9202.56,19197.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1477;
	_objects pushback _this;
	_objectIDs pushback 1477;
	_this setPosWorld [9202.56,19197.9,273.973];
	_this setVectorDirAndUp [[-0.0779073,-0.996961,0],[0,0,1]];
};

private _item1478 = objNull;
if (_layerRoot) then {
	_item1478 = createVehicle ["Christmas_Bunny_Right",[9195.51,19201.9,-0.00268555],[],0,"CAN_COLLIDE"];
	_this = _item1478;
	_objects pushback _this;
	_objectIDs pushback 1478;
	_this setPosWorld [9195.51,19201.9,272.958];
	_this setVectorDirAndUp [[-0.999539,-0.0303584,0],[0,0,1]];
};

private _item1479 = objNull;
if (_layerRoot) then {
	_item1479 = createVehicle ["Christmas_Bunny_SnowFlakes",[9198.96,19200.3,0.0992126],[],0,"CAN_COLLIDE"];
	_this = _item1479;
	_objects pushback _this;
	_objectIDs pushback 1479;
	_this setPosWorld [9198.96,19200.3,273.04];
	_this setVectorDirAndUp [[-0.875393,0.483412,0],[0,0,1]];
};

private _item1480 = objNull;
if (_layerRoot) then {
	_item1480 = createVehicle ["Christmas_Whole_Tree",[9214.82,19199.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1480;
	_objects pushback _this;
	_objectIDs pushback 1480;
	_this setPosWorld [9214.82,19199.5,273.578];
	_this setVectorDirAndUp [[0.163705,0.986509,0],[0,0,1]];
};

private _item1481 = objNull;
if (_layerRoot) then {
	_item1481 = createVehicle ["Christmas_Snowman_Pack",[9197.37,19200,-0.0108337],[],0,"CAN_COLLIDE"];
	_this = _item1481;
	_objects pushback _this;
	_objectIDs pushback 1481;
	_this setPosWorld [9197.37,19200,274.299];
	_this setVectorDirAndUp [[0.766241,-0.642553,0],[0,0,1]];
};

private _item1482 = objNull;
if (_layerRoot) then {
	_item1482 = createVehicle ["Christmas_Gift_Medium_Pattern",[9211.18,19202.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1482;
	_objects pushback _this;
	_objectIDs pushback 1482;
	_this setPosWorld [9211.18,19202.1,272.622];
	_this setVectorDirAndUp [[0.0151699,-0.999885,0],[0,0,1]];
};

private _item1483 = objNull;
if (_layerRoot) then {
	_item1483 = createVehicle ["Christmas_Gift_Medium_Tree",[9210.41,19201.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1483;
	_objects pushback _this;
	_objectIDs pushback 1483;
	_this setPosWorld [9210.41,19201.6,272.622];
	_this setVectorDirAndUp [[-0.697877,0.716217,0],[0,0,1]];
};

private _item1484 = objNull;
if (_layerRoot) then {
	_item1484 = createVehicle ["RRP_Gift",[9210.56,19202.4,0],[],0,"CAN_COLLIDE"];
	_this = _item1484;
	_objects pushback _this;
	_objectIDs pushback 1484;
	_this setPosWorld [9210.56,19202.4,272.743];
	_this setVectorDirAndUp [[-0.493813,-0.869568,0],[0,0,1]];
};

private _item1485 = objNull;
if (_layerRoot) then {
	_item1485 = createVehicle ["Christmas_Gift_Medium_Box",[9209.83,19202.4,-0.407501],[],0,"CAN_COLLIDE"];
	_this = _item1485;
	_objects pushback _this;
	_objectIDs pushback 1485;
	_this setPosWorld [9209.83,19202.4,272.513];
	_this setVectorDirAndUp [[0.0166615,-0.999861,0],[0,0,1]];
};

private _item1486 = objNull;
if (_layerRoot) then {
	_item1486 = createVehicle ["Christmas_Candy_Cane_01",[9194.82,19200.8,-0.00622559],[],0,"CAN_COLLIDE"];
	_this = _item1486;
	_objects pushback _this;
	_objectIDs pushback 1486;
	_this setPosWorld [9194.82,19200.8,273.539];
	_this setVectorDirAndUp [[0.652519,-0.757772,0],[0,0,1]];
};

private _item1487 = objNull;
if (_layerRoot) then {
	_item1487 = createVehicle ["Christmas_Whole_Tree",[9203.71,19199.7,-0.000274658],[],0,"CAN_COLLIDE"];
	_this = _item1487;
	_objects pushback _this;
	_objectIDs pushback 1487;
	_this setPosWorld [9203.71,19199.7,273.578];
	_this setVectorDirAndUp [[0.971717,0.23615,0],[0,0,1]];
};

private _item1488 = objNull;
if (_layerRoot) then {
	_item1488 = createVehicle ["Christmas_Toy_Rocket",[9199.35,19200.2,0.106506],[],0,"CAN_COLLIDE"];
	_this = _item1488;
	_objects pushback _this;
	_objectIDs pushback 1488;
	_this setPosWorld [9199.35,19200.2,272.806];
	_this setVectorDirAndUp [[0.971717,0.23615,0],[0,0,1]];
};

private _item1489 = objNull;
if (_layerRoot) then {
	_item1489 = createVehicle ["sapin",[9211.76,19200.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1489;
	_objects pushback _this;
	_objectIDs pushback 1489;
	_this setPosWorld [9211.76,19200.3,276.579];
	_this setVectorDirAndUp [[-0.71261,0.701561,0],[0,0,1]];
};

private _item1490 = objNull;
if (_layerRoot) then {
	_item1490 = createVehicle ["Christmas_Bunny_Left",[9212.55,19198,0],[],0,"CAN_COLLIDE"];
	_this = _item1490;
	_objects pushback _this;
	_objectIDs pushback 1490;
	_this setPosWorld [9212.55,19198,273.124];
	_this setVectorDirAndUp [[0.999073,-0.0430443,0],[0,0,1]];
};

private _item1491 = objNull;
if (_layerRoot) then {
	_item1491 = createVehicle ["Christmas_Toy_Train",[9207.34,19200.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1491;
	_objects pushback _this;
	_objectIDs pushback 1491;
	_this setPosWorld [9207.34,19200.6,272.83];
	_this setVectorDirAndUp [[-0.718199,-0.695837,0],[0,0,1]];
};

private _item1492 = objNull;
if (_layerRoot) then {
	_item1492 = createVehicle ["Christmas_Car_Light",[9208.45,19199,0],[],0,"CAN_COLLIDE"];
	_this = _item1492;
	_objects pushback _this;
	_objectIDs pushback 1492;
	_this setPosWorld [9208.45,19199,272.898];
	_this setVectorDirAndUp [[0.305307,0.952254,0],[0,0,1]];
};

private _item1493 = objNull;
if (_layerRoot) then {
	_item1493 = createVehicle ["Christmas_Toy_Rocket",[9208.93,19200.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1493;
	_objects pushback _this;
	_objectIDs pushback 1493;
	_this setPosWorld [9208.93,19200.1,272.699];
	_this setVectorDirAndUp [[0.163523,0.986539,0],[0,0,1]];
};

private _item1494 = objNull;
if (_layerRoot) then {
	_item1494 = createVehicle ["Christmas_Gift_Medium_Pattern",[9212.39,19200.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1494;
	_objects pushback _this;
	_objectIDs pushback 1494;
	_this setPosWorld [9212.39,19200.6,272.622];
	_this setVectorDirAndUp [[0.0151127,-0.999886,0],[0,0,1]];
};

private _item1495 = objNull;
if (_layerRoot) then {
	_item1495 = createVehicle ["Christmas_Gift_Medium_Tree",[9211.64,19200.4,0],[],0,"CAN_COLLIDE"];
	_this = _item1495;
	_objects pushback _this;
	_objectIDs pushback 1495;
	_this setPosWorld [9211.64,19200.4,272.622];
	_this setVectorDirAndUp [[-0.69769,0.7164,0],[0,0,1]];
};

private _item1496 = objNull;
if (_layerRoot) then {
	_item1496 = createVehicle ["RRP_Gift",[9211.78,19201.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1496;
	_objects pushback _this;
	_objectIDs pushback 1496;
	_this setPosWorld [9211.78,19201.2,272.743];
	_this setVectorDirAndUp [[-0.49404,-0.869439,0],[0,0,1]];
};

private _item1497 = objNull;
if (_layerRoot) then {
	_item1497 = createVehicle ["Christmas_Gift_Medium_Box",[9210.78,19200.9,-0.407501],[],0,"CAN_COLLIDE"];
	_this = _item1497;
	_objects pushback _this;
	_objectIDs pushback 1497;
	_this setPosWorld [9210.78,19200.9,272.513];
	_this setVectorDirAndUp [[0.016415,-0.999865,0],[0,0,1]];
};

private _item1498 = objNull;
if (_layerRoot) then {
	_item1498 = createVehicle ["Christmas_Gift_Medium_Pattern",[9211.11,19199.7,0],[],0,"CAN_COLLIDE"];
	_this = _item1498;
	_objects pushback _this;
	_objectIDs pushback 1498;
	_this setPosWorld [9211.11,19199.7,272.622];
	_this setVectorDirAndUp [[0.0151551,-0.999885,0],[0,0,1]];
};

private _item1499 = objNull;
if (_layerRoot) then {
	_item1499 = createVehicle ["Christmas_Gift_Medium_Tree",[9210.34,19199.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1499;
	_objects pushback _this;
	_objectIDs pushback 1499;
	_this setPosWorld [9210.34,19199.3,272.622];
	_this setVectorDirAndUp [[-0.697717,0.716373,0],[0,0,1]];
};

private _item1500 = objNull;
if (_layerRoot) then {
	_item1500 = createVehicle ["RRP_Gift",[9210.48,19200,0],[],0,"CAN_COLLIDE"];
	_this = _item1500;
	_objects pushback _this;
	_objectIDs pushback 1500;
	_this setPosWorld [9210.48,19200,272.743];
	_this setVectorDirAndUp [[-0.494027,-0.869446,0],[0,0,1]];
};

private _item1501 = objNull;
if (_layerRoot) then {
	_item1501 = createVehicle ["Christmas_Gift_Medium_Box",[9209.76,19200.1,-0.407501],[],0,"CAN_COLLIDE"];
	_this = _item1501;
	_objects pushback _this;
	_objectIDs pushback 1501;
	_this setPosWorld [9209.76,19200.1,272.513];
	_this setVectorDirAndUp [[0.016662,-0.999861,0],[0,0,1]];
};

private _item1502 = objNull;
if (_layerRoot) then {
	_item1502 = createVehicle ["Christmas_Gift_Medium_Pattern",[9211.86,19198.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1502;
	_objects pushback _this;
	_objectIDs pushback 1502;
	_this setPosWorld [9211.86,19198.2,272.622];
	_this setVectorDirAndUp [[0.0151127,-0.999886,0],[0,0,1]];
};

private _item1503 = objNull;
if (_layerRoot) then {
	_item1503 = createVehicle ["Christmas_Gift_Medium_Tree",[9211.16,19198.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1503;
	_objects pushback _this;
	_objectIDs pushback 1503;
	_this setPosWorld [9211.16,19198.3,272.622];
	_this setVectorDirAndUp [[-0.69766,0.716429,0],[0,0,1]];
};

private _item1504 = objNull;
if (_layerRoot) then {
	_item1504 = createVehicle ["RRP_Gift",[9211.3,19199,0],[],0,"CAN_COLLIDE"];
	_this = _item1504;
	_objects pushback _this;
	_objectIDs pushback 1504;
	_this setPosWorld [9211.3,19199,272.743];
	_this setVectorDirAndUp [[-0.49404,-0.869439,0],[0,0,1]];
};

private _item1505 = objNull;
if (_layerRoot) then {
	_item1505 = createVehicle ["Christmas_Gift_Medium_Box",[9208.41,19200,-0.407501],[],0,"CAN_COLLIDE"];
	_this = _item1505;
	_objects pushback _this;
	_objectIDs pushback 1505;
	_this setPosWorld [9208.41,19200,272.513];
	_this setVectorDirAndUp [[0.0164002,-0.999866,0],[0,0,1]];
};

private _item1506 = objNull;
if (_layerRoot) then {
	_item1506 = createVehicle ["Christmas_Gift_Medium_Pattern",[9212.84,19199.4,0],[],0,"CAN_COLLIDE"];
	_this = _item1506;
	_objects pushback _this;
	_objectIDs pushback 1506;
	_this setPosWorld [9212.84,19199.4,272.622];
	_this setVectorDirAndUp [[0.0151127,-0.999886,0],[0,0,1]];
};

private _item1507 = objNull;
if (_layerRoot) then {
	_item1507 = createVehicle ["Christmas_Gift_Medium_Tree",[9212.08,19198.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1507;
	_objects pushback _this;
	_objectIDs pushback 1507;
	_this setPosWorld [9212.08,19198.9,272.622];
	_this setVectorDirAndUp [[-0.69766,0.716429,0],[0,0,1]];
};

private _item1508 = objNull;
if (_layerRoot) then {
	_item1508 = createVehicle ["RRP_Gift",[9212.22,19199.7,0],[],0,"CAN_COLLIDE"];
	_this = _item1508;
	_objects pushback _this;
	_objectIDs pushback 1508;
	_this setPosWorld [9212.22,19199.7,272.743];
	_this setVectorDirAndUp [[-0.494077,-0.869418,0],[0,0,1]];
};

private _item1509 = objNull;
if (_layerRoot) then {
	_item1509 = createVehicle ["Christmas_Gift_Medium_Box",[9213.05,19200.2,-0.407501],[],0,"CAN_COLLIDE"];
	_this = _item1509;
	_objects pushback _this;
	_objectIDs pushback 1509;
	_this setPosWorld [9213.05,19200.2,272.513];
	_this setVectorDirAndUp [[0.0163576,-0.999866,0],[0,0,1]];
};

private _item1510 = objNull;
if (_layerRoot) then {
	_item1510 = createVehicle ["Christmas_Toy_Rocket",[9209.15,19200.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1510;
	_objects pushback _this;
	_objectIDs pushback 1510;
	_this setPosWorld [9209.15,19200.6,272.699];
	_this setVectorDirAndUp [[0.163535,0.986537,0],[0,0,1]];
};

private _item1511 = objNull;
if (_layerRoot) then {
	_item1511 = createVehicle ["Christmas_Toy_Rocket",[9209.66,19200.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1511;
	_objects pushback _this;
	_objectIDs pushback 1511;
	_this setPosWorld [9209.66,19200.9,272.699];
	_this setVectorDirAndUp [[0.163535,0.986537,0],[0,0,1]];
};

private _item1512 = objNull;
if (_layerRoot) then {
	_item1512 = createVehicle ["pere",[9206.06,19198.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1512;
	_objects pushback _this;
	_objectIDs pushback 1512;
	_this setPosWorld [9206.06,19198.2,276.283];
	_this setVectorDirAndUp [[0.120338,-0.992733,0],[0,0,1]];
};

private _item896 = objNull;
if (_layerRoot) then {
	_item896 = createVehicle ["sapin",[3725.03,13108.1,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item896;
	_objects pushback _this;
	_objectIDs pushback 896;
	_this setPosWorld [3725.03,13108.1,8.18115];
	_this setVectorDirAndUp [[-0.819808,-0.572004,0.0269652],[0.00682713,0.037323,0.99928]];
};


///////////////////////////////////////////////////////////////////////////////////////////
// Triggers
private _triggers = [];
private _triggerIDs = [];


///////////////////////////////////////////////////////////////////////////////////////////
// Group attributes (applied only once group units exist)


///////////////////////////////////////////////////////////////////////////////////////////
// Waypoints
private _waypoints = [];
private _waypointIDs = [];


///////////////////////////////////////////////////////////////////////////////////////////
// Logics
private _logics = [];
private _logicIDs = [];

private _item299 = objNull;
if (_layerRoot) then {
	_item299 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3672.84,13146.3,0.422591],[],0,"CAN_COLLIDE"];
	_this = _item299;
	_logics pushback _this;
	_logicIDs pushback 299;
	_this setPosWorld [3672.84,13146.3,4.36928];
	_this setVectorDirAndUp [[-0.682317,0.731056,0],[0,0,1]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item300 = objNull;
if (_layerRoot) then {
	_item300 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3673.31,13160.7,0.421579],[],0,"CAN_COLLIDE"];
	_this = _item300;
	_logics pushback _this;
	_logicIDs pushback 300;
	_this setPosWorld [3673.31,13160.7,4.42407];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item301 = objNull;
if (_layerRoot) then {
	_item301 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3673.64,13174.1,0.422054],[],0,"CAN_COLLIDE"];
	_this = _item301;
	_logics pushback _this;
	_logicIDs pushback 301;
	_this setPosWorld [3673.64,13174.1,4.41853];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item302 = objNull;
if (_layerRoot) then {
	_item302 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3674.08,13185,0.422312],[],0,"CAN_COLLIDE"];
	_this = _item302;
	_logics pushback _this;
	_logicIDs pushback 302;
	_this setPosWorld [3674.08,13185,4.36691];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item303 = objNull;
if (_layerRoot) then {
	_item303 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3637.88,13182.2,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item303;
	_logics pushback _this;
	_logicIDs pushback 303;
	_this setPosWorld [3637.88,13182.2,3.88208];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item304 = objNull;
if (_layerRoot) then {
	_item304 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3636.89,13170.4,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item304;
	_logics pushback _this;
	_logicIDs pushback 304;
	_this setPosWorld [3636.89,13170.4,3.88121];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item305 = objNull;
if (_layerRoot) then {
	_item305 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3636.22,13164.5,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item305;
	_logics pushback _this;
	_logicIDs pushback 305;
	_this setPosWorld [3636.22,13164.5,3.88628];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item306 = objNull;
if (_layerRoot) then {
	_item306 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3635.17,13158.4,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item306;
	_logics pushback _this;
	_logicIDs pushback 306;
	_this setPosWorld [3635.17,13158.4,3.90475];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item307 = objNull;
if (_layerRoot) then {
	_item307 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3636.66,13144.6,0],[],0,"CAN_COLLIDE"];
	_this = _item307;
	_logics pushback _this;
	_logicIDs pushback 307;
	_this setPosWorld [3636.66,13144.6,3.90482];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item308 = objNull;
if (_layerRoot) then {
	_item308 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3631.27,13144.2,0],[],0,"CAN_COLLIDE"];
	_this = _item308;
	_logics pushback _this;
	_logicIDs pushback 308;
	_this setPosWorld [3631.27,13144.2,3.90498];
	_this setVectorDirAndUp [[-0.682317,0.731056,0],[0,0,1]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item309 = objNull;
if (_layerRoot) then {
	_item309 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3647.74,13197,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item309;
	_logics pushback _this;
	_logicIDs pushback 309;
	_this setPosWorld [3647.74,13197,3.88179];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item310 = objNull;
if (_layerRoot) then {
	_item310 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3652.18,13196.6,0],[],0,"CAN_COLLIDE"];
	_this = _item310;
	_logics pushback _this;
	_logicIDs pushback 310;
	_this setPosWorld [3652.18,13196.6,3.91904];
	_this setVectorDirAndUp [[-0.682284,0.731087,0.000404828],[-0.00985058,-0.0097467,0.999904]];
	_this setVariable ["objectArea",[1,1,316.978,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item311 = objNull;
if (_layerRoot) then {
	_item311 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3670.91,13212.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item311;
	_logics pushback _this;
	_logicIDs pushback 311;
	_this setPosWorld [3670.91,13212.6,3.98821];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item312 = objNull;
if (_layerRoot) then {
	_item312 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3668.93,13216.5,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item312;
	_logics pushback _this;
	_logicIDs pushback 312;
	_this setPosWorld [3668.93,13216.5,3.97518];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item313 = objNull;
if (_layerRoot) then {
	_item313 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3675.14,13212.5,0],[],0,"CAN_COLLIDE"];
	_this = _item313;
	_logics pushback _this;
	_logicIDs pushback 313;
	_this setPosWorld [3675.14,13212.5,4.02088];
	_this setVectorDirAndUp [[-0.682312,0.731053,-0.00340502],[-0.00401163,0.000913483,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item314 = objNull;
if (_layerRoot) then {
	_item314 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3669.26,13209.1,0],[],0,"CAN_COLLIDE"];
	_this = _item314;
	_logics pushback _this;
	_logicIDs pushback 314;
	_this setPosWorld [3669.26,13209.1,3.974];
	_this setVectorDirAndUp [[-0.68229,0.731056,-0.00608415],[-0.00891689,0,0.99996]];
	_this setVariable ["objectArea",[1,1,316.976,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item316 = objNull;
if (_layerRoot) then {
	_item316 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3680.93,13195.9,0],[],0,"CAN_COLLIDE"];
	_this = _item316;
	_logics pushback _this;
	_logicIDs pushback 316;
	_this setPosWorld [3680.93,13195.9,4.02597];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item317 = objNull;
if (_layerRoot) then {
	_item317 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3684.17,13196.3,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item317;
	_logics pushback _this;
	_logicIDs pushback 317;
	_this setPosWorld [3684.17,13196.3,4.03809];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item318 = objNull;
if (_layerRoot) then {
	_item318 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3716.83,13216,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item318;
	_logics pushback _this;
	_logicIDs pushback 318;
	_this setPosWorld [3716.83,13216,4.06033];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item319 = objNull;
if (_layerRoot) then {
	_item319 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3738.52,13201,0.139295],[],0,"CAN_COLLIDE"];
	_this = _item319;
	_logics pushback _this;
	_logicIDs pushback 319;
	_this setPosWorld [3738.52,13201,3.83193];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item320 = objNull;
if (_layerRoot) then {
	_item320 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3716.55,13191.5,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item320;
	_logics pushback _this;
	_logicIDs pushback 320;
	_this setPosWorld [3716.55,13191.5,4.08644];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item321 = objNull;
if (_layerRoot) then {
	_item321 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3734.48,13140.6,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item321;
	_logics pushback _this;
	_logicIDs pushback 321;
	_this setPosWorld [3734.48,13140.6,3.94846];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item322 = objNull;
if (_layerRoot) then {
	_item322 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3714.63,13140.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item322;
	_logics pushback _this;
	_logicIDs pushback 322;
	_this setPosWorld [3714.63,13140.7,3.94658];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item323 = objNull;
if (_layerRoot) then {
	_item323 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3607.37,13150,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item323;
	_logics pushback _this;
	_logicIDs pushback 323;
	_this setPosWorld [3607.37,13150,3.91035];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item324 = objNull;
if (_layerRoot) then {
	_item324 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3594.51,13151.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item324;
	_logics pushback _this;
	_logicIDs pushback 324;
	_this setPosWorld [3594.51,13151.8,3.95682];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item325 = objNull;
if (_layerRoot) then {
	_item325 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3587.74,13145.9,0],[],0,"CAN_COLLIDE"];
	_this = _item325;
	_logics pushback _this;
	_logicIDs pushback 325;
	_this setPosWorld [3587.74,13145.9,3.90534];
	_this setVectorDirAndUp [[-0.682317,0.731056,0],[0,0,1]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item326 = objNull;
if (_layerRoot) then {
	_item326 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3565.09,13161.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item326;
	_logics pushback _this;
	_logicIDs pushback 326;
	_this setPosWorld [3565.09,13161.3,3.90544];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item327 = objNull;
if (_layerRoot) then {
	_item327 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3545.49,13165.5,0],[],0,"CAN_COLLIDE"];
	_this = _item327;
	_logics pushback _this;
	_logicIDs pushback 327;
	_this setPosWorld [3545.49,13165.5,3.90599];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item328 = objNull;
if (_layerRoot) then {
	_item328 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3532.83,13153.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item328;
	_logics pushback _this;
	_logicIDs pushback 328;
	_this setPosWorld [3532.83,13153.8,3.93053];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item329 = objNull;
if (_layerRoot) then {
	_item329 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3543.57,13123.6,0],[],0,"CAN_COLLIDE"];
	_this = _item329;
	_logics pushback _this;
	_logicIDs pushback 329;
	_this setPosWorld [3543.57,13123.6,4.06863];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item330 = objNull;
if (_layerRoot) then {
	_item330 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3534.43,13132.5,0],[],0,"CAN_COLLIDE"];
	_this = _item330;
	_logics pushback _this;
	_logicIDs pushback 330;
	_this setPosWorld [3534.43,13132.5,4.1402];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item331 = objNull;
if (_layerRoot) then {
	_item331 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3525.29,13142.4,0],[],0,"CAN_COLLIDE"];
	_this = _item331;
	_logics pushback _this;
	_logicIDs pushback 331;
	_this setPosWorld [3525.29,13142.4,4.13635];
	_this setVectorDirAndUp [[-0.682314,0.731056,-0.00188933],[0.00295001,0.00533766,0.999981]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item332 = objNull;
if (_layerRoot) then {
	_item332 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3729,13105.6,0],[],0,"CAN_COLLIDE"];
	_this = _item332;
	_logics pushback _this;
	_logicIDs pushback 332;
	_this setPosWorld [3729,13105.6,4.18952];
	_this setVectorDirAndUp [[-0.75816,0.651666,-0.022905],[0.00189096,0.0373238,0.999301]];
	_this setVariable ["objectArea",[1,1,310.68,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item333 = objNull;
if (_layerRoot) then {
	_item333 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3722.18,13081.7,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item333;
	_logics pushback _this;
	_logicIDs pushback 333;
	_this setPosWorld [3722.18,13081.7,4.99803];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item334 = objNull;
if (_layerRoot) then {
	_item334 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3683.03,13180.5,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item334;
	_logics pushback _this;
	_logicIDs pushback 334;
	_this setPosWorld [3683.03,13180.5,4.05223];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item335 = objNull;
if (_layerRoot) then {
	_item335 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3696.62,13180.1,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item335;
	_logics pushback _this;
	_logicIDs pushback 335;
	_this setPosWorld [3696.62,13180.1,4.08713];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item336 = objNull;
if (_layerRoot) then {
	_item336 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3696.46,13166,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item336;
	_logics pushback _this;
	_logicIDs pushback 336;
	_this setPosWorld [3696.46,13166,4.08615];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item337 = objNull;
if (_layerRoot) then {
	_item337 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3683.76,13166.3,0],[],0,"CAN_COLLIDE"];
	_this = _item337;
	_logics pushback _this;
	_logicIDs pushback 337;
	_this setPosWorld [3683.76,13166.3,4.05788];
	_this setVectorDirAndUp [[-0.682315,0.731057,-0.0014527],[-0.00265204,-0.000488105,0.999996]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item338 = objNull;
if (_layerRoot) then {
	_item338 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3683.78,13152.2,0],[],0,"CAN_COLLIDE"];
	_this = _item338;
	_logics pushback _this;
	_logicIDs pushback 338;
	_this setPosWorld [3683.78,13152.2,4.01962];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item339 = objNull;
if (_layerRoot) then {
	_item339 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3696.82,13151.4,0],[],0,"CAN_COLLIDE"];
	_this = _item339;
	_logics pushback _this;
	_logicIDs pushback 339;
	_this setPosWorld [3696.82,13151.4,4.08251];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item340 = objNull;
if (_layerRoot) then {
	_item340 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3583.71,13245.6,0],[],0,"CAN_COLLIDE"];
	_this = _item340;
	_logics pushback _this;
	_logicIDs pushback 340;
	_this setPosWorld [3583.71,13245.6,3.6789];
	_this setVectorDirAndUp [[-0.671615,0.737029,-0.0756423],[-0.176423,-0.0599307,0.982488]];
	_this setVariable ["objectArea",[1,1,317.659,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item341 = objNull;
if (_layerRoot) then {
	_item341 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3578.86,13256.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item341;
	_logics pushback _this;
	_logicIDs pushback 341;
	_this setPosWorld [3578.86,13256.6,3.40673];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item342 = objNull;
if (_layerRoot) then {
	_item342 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3418.24,13150.2,-7.15256e-007],[],0,"CAN_COLLIDE"];
	_this = _item342;
	_logics pushback _this;
	_logicIDs pushback 342;
	_this setPosWorld [3418.24,13150.2,3.70438];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item343 = objNull;
if (_layerRoot) then {
	_item343 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3428.97,13138.3,0],[],0,"CAN_COLLIDE"];
	_this = _item343;
	_logics pushback _this;
	_logicIDs pushback 343;
	_this setPosWorld [3428.97,13138.3,4.20477];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item344 = objNull;
if (_layerRoot) then {
	_item344 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3490.41,13147.5,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item344;
	_logics pushback _this;
	_logicIDs pushback 344;
	_this setPosWorld [3490.41,13147.5,4.67384];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item345 = objNull;
if (_layerRoot) then {
	_item345 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3570.51,13121.7,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item345;
	_logics pushback _this;
	_logicIDs pushback 345;
	_this setPosWorld [3570.51,13121.7,4.00896];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item346 = objNull;
if (_layerRoot) then {
	_item346 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3588.8,13117.6,0],[],0,"CAN_COLLIDE"];
	_this = _item346;
	_logics pushback _this;
	_logicIDs pushback 346;
	_this setPosWorld [3588.8,13117.6,3.96938];
	_this setVectorDirAndUp [[-0.682217,0.731126,0.00583893],[0.0171065,0.00797735,0.999822]];
	_this setVariable ["objectArea",[1,1,316.982,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item347 = objNull;
if (_layerRoot) then {
	_item347 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3582.98,13121.7,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item347;
	_logics pushback _this;
	_logicIDs pushback 347;
	_this setPosWorld [3582.98,13121.7,4.01166];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item348 = objNull;
if (_layerRoot) then {
	_item348 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3599.52,13117.5,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item348;
	_logics pushback _this;
	_logicIDs pushback 348;
	_this setPosWorld [3599.52,13117.5,3.92148];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item349 = objNull;
if (_layerRoot) then {
	_item349 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3603.1,13115.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item349;
	_logics pushback _this;
	_logicIDs pushback 349;
	_this setPosWorld [3603.1,13115.8,3.90386];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item350 = objNull;
if (_layerRoot) then {
	_item350 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3560.69,13101.2,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item350;
	_logics pushback _this;
	_logicIDs pushback 350;
	_this setPosWorld [3560.69,13101.2,4.03244];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item351 = objNull;
if (_layerRoot) then {
	_item351 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3600.42,13061.5,0.280077],[],0,"CAN_COLLIDE"];
	_this = _item351;
	_logics pushback _this;
	_logicIDs pushback 351;
	_this setPosWorld [3600.42,13061.5,4.31148];
	_this setVectorDirAndUp [[-0.534586,0.496045,0.68422],[0.62141,-0.317994,0.716051]];
	_this setVariable ["objectArea",[1,1,312.858,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item352 = objNull;
if (_layerRoot) then {
	_item352 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3582.24,13048.8,0],[],0,"CAN_COLLIDE"];
	_this = _item352;
	_logics pushback _this;
	_logicIDs pushback 352;
	_this setPosWorld [3582.24,13048.8,4.0314];
	_this setVectorDirAndUp [[-0.682317,0.731056,0],[0,0,1]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item353 = objNull;
if (_layerRoot) then {
	_item353 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3533.81,13034.8,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item353;
	_logics pushback _this;
	_logicIDs pushback 353;
	_this setPosWorld [3533.81,13034.8,5.93063];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item354 = objNull;
if (_layerRoot) then {
	_item354 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3568.3,13001.9,0],[],0,"CAN_COLLIDE"];
	_this = _item354;
	_logics pushback _this;
	_logicIDs pushback 354;
	_this setPosWorld [3568.3,13001.9,6.14739];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item355 = objNull;
if (_layerRoot) then {
	_item355 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3558.47,12983.2,0],[],0,"CAN_COLLIDE"];
	_this = _item355;
	_logics pushback _this;
	_logicIDs pushback 355;
	_this setPosWorld [3558.47,12983.2,8.79766];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item356 = objNull;
if (_layerRoot) then {
	_item356 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3781.74,13159.2,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item356;
	_logics pushback _this;
	_logicIDs pushback 356;
	_this setPosWorld [3781.74,13159.2,3.46182];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item357 = objNull;
if (_layerRoot) then {
	_item357 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3630.97,13052.2,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item357;
	_logics pushback _this;
	_logicIDs pushback 357;
	_this setPosWorld [3630.97,13052.2,4.08272];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item358 = objNull;
if (_layerRoot) then {
	_item358 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3630.78,13042.1,0],[],0,"CAN_COLLIDE"];
	_this = _item358;
	_logics pushback _this;
	_logicIDs pushback 358;
	_this setPosWorld [3630.78,13042.1,4.26354];
	_this setVectorDirAndUp [[-0.679518,0.726955,-0.0989543],[-0.0904941,0.0507977,0.994601]];
	_this setVariable ["objectArea",[1,1,316.932,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item359 = objNull;
if (_layerRoot) then {
	_item359 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3629.74,13010.2,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item359;
	_logics pushback _this;
	_logicIDs pushback 359;
	_this setPosWorld [3629.74,13010.2,5.80271];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item360 = objNull;
if (_layerRoot) then {
	_item360 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3628.17,12999.4,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item360;
	_logics pushback _this;
	_logicIDs pushback 360;
	_this setPosWorld [3628.17,12999.4,6.70122];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item361 = objNull;
if (_layerRoot) then {
	_item361 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3626.37,12986.3,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item361;
	_logics pushback _this;
	_logicIDs pushback 361;
	_this setPosWorld [3626.37,12986.3,7.80289];
	_this setVectorDirAndUp [[-0.680067,0.723765,-0.116936],[-0.0811544,0.0842037,0.993138]];
	_this setVariable ["objectArea",[1,1,316.783,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item362 = objNull;
if (_layerRoot) then {
	_item362 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3625.01,12976.6,0],[],0,"CAN_COLLIDE"];
	_this = _item362;
	_logics pushback _this;
	_logicIDs pushback 362;
	_this setPosWorld [3625.01,12976.6,8.56625];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item363 = objNull;
if (_layerRoot) then {
	_item363 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3650.31,12958,0],[],0,"CAN_COLLIDE"];
	_this = _item363;
	_logics pushback _this;
	_logicIDs pushback 363;
	_this setPosWorld [3650.31,12958,11.3486];
	_this setVectorDirAndUp [[-0.68212,0.725119,-0.0944137],[-0.0240285,0.106818,0.993988]];
	_this setVariable ["objectArea",[1,1,316.75,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item364 = objNull;
if (_layerRoot) then {
	_item364 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3663.37,12948.6,0],[],0,"CAN_COLLIDE"];
	_this = _item364;
	_logics pushback _this;
	_logicIDs pushback 364;
	_this setPosWorld [3663.37,12948.6,12.2678];
	_this setVectorDirAndUp [[-0.682177,0.727031,-0.0778517],[0.020264,0.12523,0.991921]];
	_this setVariable ["objectArea",[1,1,316.823,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item365 = objNull;
if (_layerRoot) then {
	_item365 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3701.92,12968.3,0],[],0,"CAN_COLLIDE"];
	_this = _item365;
	_logics pushback _this;
	_logicIDs pushback 365;
	_this setPosWorld [3701.92,12968.3,8.39647];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item366 = objNull;
if (_layerRoot) then {
	_item366 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3709.46,13022.5,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item366;
	_logics pushback _this;
	_logicIDs pushback 366;
	_this setPosWorld [3709.46,13022.5,7.19885];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item368 = objNull;
if (_layerRoot) then {
	_item368 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3648.08,13109.8,0],[],0,"CAN_COLLIDE"];
	_this = _item368;
	_logics pushback _this;
	_logicIDs pushback 368;
	_this setPosWorld [3648.08,13109.8,3.90595];
	_this setVectorDirAndUp [[0.99894,-0.0459629,0.00247602],[-0.00260671,-0.00278359,0.999993]];
	_this setVariable ["objectArea",[3,9,92.6344,true,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item369 = objNull;
if (_layerRoot) then {
	_item369 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3559.89,12919.5,0],[],0,"CAN_COLLIDE"];
	_this = _item369;
	_logics pushback _this;
	_logicIDs pushback 369;
	_this setPosWorld [3559.89,12919.5,12.3071];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item370 = objNull;
if (_layerRoot) then {
	_item370 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3565.95,12913.4,0],[],0,"CAN_COLLIDE"];
	_this = _item370;
	_logics pushback _this;
	_logicIDs pushback 370;
	_this setPosWorld [3565.95,12913.4,12.7396];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item371 = objNull;
if (_layerRoot) then {
	_item371 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3578.24,12945,0],[],0,"CAN_COLLIDE"];
	_this = _item371;
	_logics pushback _this;
	_logicIDs pushback 371;
	_this setPosWorld [3578.24,12945,10.6845];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item372 = objNull;
if (_layerRoot) then {
	_item372 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3590.21,12934.5,0],[],0,"CAN_COLLIDE"];
	_this = _item372;
	_logics pushback _this;
	_logicIDs pushback 372;
	_this setPosWorld [3590.21,12934.5,11.0356];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item373 = objNull;
if (_layerRoot) then {
	_item373 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3690.78,13095.9,0],[],0,"CAN_COLLIDE"];
	_this = _item373;
	_logics pushback _this;
	_logicIDs pushback 373;
	_this setPosWorld [3690.78,13095.9,3.90076];
	_this setVectorDirAndUp [[-0.999998,0.00100427,0.00185386],[0.00185901,0.00515591,0.999985]];
	_this setVariable ["objectArea",[1,4,270.058,true,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item374 = objNull;
if (_layerRoot) then {
	_item374 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3690.64,13107.5,0],[],0,"CAN_COLLIDE"];
	_this = _item374;
	_logics pushback _this;
	_logicIDs pushback 374;
	_this setPosWorld [3690.64,13107.5,3.86781];
	_this setVectorDirAndUp [[-0.999998,0.00219251,0],[0,0,1]];
	_this setVariable ["objectArea",[1,4,270.126,true,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item376 = objNull;
if (_layerRoot) then {
	_item376 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3728.08,12987.2,0],[],0,"CAN_COLLIDE"];
	_this = _item376;
	_logics pushback _this;
	_logicIDs pushback 376;
	_this setPosWorld [3728.08,12987.2,7.96337];
	_this setVectorDirAndUp [[-0.0152065,0.999875,-0.00436492],[0.040345,0.00497544,0.999173]];
	_this setVariable ["objectArea",[2,17,359.129,true,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item379 = objNull;
if (_layerRoot) then {
	_item379 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3615.76,12907.3,0],[],0,"CAN_COLLIDE"];
	_this = _item379;
	_logics pushback _this;
	_logicIDs pushback 379;
	_this setPosWorld [3615.76,12907.3,13.6545];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item380 = objNull;
if (_layerRoot) then {
	_item380 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3641.75,12865,0],[],0,"CAN_COLLIDE"];
	_this = _item380;
	_logics pushback _this;
	_logicIDs pushback 380;
	_this setPosWorld [3641.75,12865,15.9572];
	_this setVectorDirAndUp [[-0.676003,0.730193,-0.0991826],[-0.135728,0.00891349,0.990706]];
	_this setVariable ["objectArea",[1,1,317.207,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item381 = objNull;
if (_layerRoot) then {
	_item381 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3577.74,12845,0],[],0,"CAN_COLLIDE"];
	_this = _item381;
	_logics pushback _this;
	_logicIDs pushback 381;
	_this setPosWorld [3577.74,12845,12.397];
	_this setVectorDirAndUp [[-0.681687,0.730324,-0.0439239],[-0.0429602,0.0199762,0.998877]];
	_this setVariable ["objectArea",[1,1,316.973,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item382 = objNull;
if (_layerRoot) then {
	_item382 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3572.85,12830.5,0],[],0,"CAN_COLLIDE"];
	_this = _item382;
	_logics pushback _this;
	_logicIDs pushback 382;
	_this setPosWorld [3572.85,12830.5,11.8549];
	_this setVectorDirAndUp [[-0.681876,0.731468,0.000308273],[-0.0359766,-0.0339583,0.998775]];
	_this setVariable ["objectArea",[1,1,317.01,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item383 = objNull;
if (_layerRoot) then {
	_item383 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3585.23,12840.5,0],[],0,"CAN_COLLIDE"];
	_this = _item383;
	_logics pushback _this;
	_logicIDs pushback 383;
	_this setPosWorld [3585.23,12840.5,12.8073];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item384 = objNull;
if (_layerRoot) then {
	_item384 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3618.34,12809,0],[],0,"CAN_COLLIDE"];
	_this = _item384;
	_logics pushback _this;
	_logicIDs pushback 384;
	_this setPosWorld [3618.34,12809,14.3438];
	_this setVectorDirAndUp [[-0.681876,0.730952,-0.0274691],[-0.0359766,0.00399416,0.999345]];
	_this setVariable ["objectArea",[1,1,316.989,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item385 = objNull;
if (_layerRoot) then {
	_item385 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3622.09,12801.4,0],[],0,"CAN_COLLIDE"];
	_this = _item385;
	_logics pushback _this;
	_logicIDs pushback 385;
	_this setPosWorld [3622.09,12801.4,14.4925];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item386 = objNull;
if (_layerRoot) then {
	_item386 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3418.83,12623,0],[],0,"CAN_COLLIDE"];
	_this = _item386;
	_logics pushback _this;
	_logicIDs pushback 386;
	_this setPosWorld [3418.83,12623,4.72835];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item387 = objNull;
if (_layerRoot) then {
	_item387 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3413.12,12614.2,0],[],0,"CAN_COLLIDE"];
	_this = _item387;
	_logics pushback _this;
	_logicIDs pushback 387;
	_this setPosWorld [3413.12,12614.2,4.58483];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item388 = objNull;
if (_layerRoot) then {
	_item388 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3436.23,12610.7,0],[],0,"CAN_COLLIDE"];
	_this = _item388;
	_logics pushback _this;
	_logicIDs pushback 388;
	_this setPosWorld [3436.23,12610.7,6.3353];
	_this setVectorDirAndUp [[-0.678373,0.730124,-0.0820301],[-0.107373,0.0119306,0.994147]];
	_this setVariable ["objectArea",[1,1,317.104,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item389 = objNull;
if (_layerRoot) then {
	_item389 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3387.08,12617.8,0.187152],[],0,"CAN_COLLIDE"];
	_this = _item389;
	_logics pushback _this;
	_logicIDs pushback 389;
	_this setPosWorld [3387.08,12617.8,4.00126];
	_this setVectorDirAndUp [[-0.681603,0.730548,-0.0414336],[-0.0457395,0.0139758,0.998856]];
	_this setVariable ["objectArea",[1,1,316.985,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item390 = objNull;
if (_layerRoot) then {
	_item390 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3414.11,12659.1,0.124807],[],0,"CAN_COLLIDE"];
	_this = _item390;
	_logics pushback _this;
	_logicIDs pushback 390;
	_this setPosWorld [3414.11,12659.1,3.90104];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item391 = objNull;
if (_layerRoot) then {
	_item391 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3419.56,12668,0.119268],[],0,"CAN_COLLIDE"];
	_this = _item391;
	_logics pushback _this;
	_logicIDs pushback 391;
	_this setPosWorld [3419.56,12668,3.86972];
	_this setVectorDirAndUp [[-0.681024,0.730639,-0.0487268],[-0.0615523,0.00918885,0.998062]];
	_this setVariable ["objectArea",[1,1,317.013,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item392 = objNull;
if (_layerRoot) then {
	_item392 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3445.03,12709.2,0.149042],[],0,"CAN_COLLIDE"];
	_this = _item392;
	_logics pushback _this;
	_logicIDs pushback 392;
	_this setPosWorld [3445.03,12709.2,4.25894];
	_this setVectorDirAndUp [[-0.681733,0.730281,-0.0439263],[-0.041367,0.0214675,0.998913]];
	_this setVariable ["objectArea",[1,1,316.969,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item393 = objNull;
if (_layerRoot) then {
	_item393 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3457.17,12732.6,0],[],0,"CAN_COLLIDE"];
	_this = _item393;
	_logics pushback _this;
	_logicIDs pushback 393;
	_this setPosWorld [3457.17,12732.6,4.36722];
	_this setVectorDirAndUp [[-0.681325,0.730123,-0.0521292],[-0.0539205,0.0209616,0.998325]];
	_this setVariable ["objectArea",[1,1,316.98,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item394 = objNull;
if (_layerRoot) then {
	_item394 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3461.72,12743.3,0],[],0,"CAN_COLLIDE"];
	_this = _item394;
	_logics pushback _this;
	_logicIDs pushback 394;
	_this setPosWorld [3461.72,12743.3,4.72714];
	_this setVectorDirAndUp [[-0.681851,0.731151,-0.0223062],[-0.0369743,-0.00399393,0.999308]];
	_this setVariable ["objectArea",[1,1,316.998,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item395 = objNull;
if (_layerRoot) then {
	_item395 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3451.41,12750,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item395;
	_logics pushback _this;
	_logicIDs pushback 395;
	_this setPosWorld [3451.41,12750,4.25049];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item396 = objNull;
if (_layerRoot) then {
	_item396 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3444.32,12760.4,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item396;
	_logics pushback _this;
	_logicIDs pushback 396;
	_this setPosWorld [3444.32,12760.4,3.7963];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item397 = objNull;
if (_layerRoot) then {
	_item397 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3443.57,12777,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item397;
	_logics pushback _this;
	_logicIDs pushback 397;
	_this setPosWorld [3443.57,12777,3.53709];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item398 = objNull;
if (_layerRoot) then {
	_item398 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3442.45,12786.6,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item398;
	_logics pushback _this;
	_logicIDs pushback 398;
	_this setPosWorld [3442.45,12786.6,3.60716];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item399 = objNull;
if (_layerRoot) then {
	_item399 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3440.61,12799.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item399;
	_logics pushback _this;
	_logicIDs pushback 399;
	_this setPosWorld [3440.61,12799.1,3.10718];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item400 = objNull;
if (_layerRoot) then {
	_item400 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3437.47,12817.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item400;
	_logics pushback _this;
	_logicIDs pushback 400;
	_this setPosWorld [3437.47,12817.7,2.91247];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item401 = objNull;
if (_layerRoot) then {
	_item401 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3433.41,12838.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item401;
	_logics pushback _this;
	_logicIDs pushback 401;
	_this setPosWorld [3433.41,12838.1,2.83869];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item402 = objNull;
if (_layerRoot) then {
	_item402 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3428.23,12856.5,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item402;
	_logics pushback _this;
	_logicIDs pushback 402;
	_this setPosWorld [3428.23,12856.5,2.96136];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item403 = objNull;
if (_layerRoot) then {
	_item403 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3421.61,12873.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item403;
	_logics pushback _this;
	_logicIDs pushback 403;
	_this setPosWorld [3421.61,12873.8,2.68932];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item404 = objNull;
if (_layerRoot) then {
	_item404 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3403.66,12868.4,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item404;
	_logics pushback _this;
	_logicIDs pushback 404;
	_this setPosWorld [3403.66,12868.4,2.49344];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item405 = objNull;
if (_layerRoot) then {
	_item405 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3398.06,12866.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item405;
	_logics pushback _this;
	_logicIDs pushback 405;
	_this setPosWorld [3398.06,12866.3,2.30351];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item406 = objNull;
if (_layerRoot) then {
	_item406 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3455.29,12836.3,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item406;
	_logics pushback _this;
	_logicIDs pushback 406;
	_this setPosWorld [3455.29,12836.3,3.48829];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item407 = objNull;
if (_layerRoot) then {
	_item407 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3491.16,12818.9,0],[],0,"CAN_COLLIDE"];
	_this = _item407;
	_logics pushback _this;
	_logicIDs pushback 407;
	_this setPosWorld [3491.16,12818.9,7.29724];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item408 = objNull;
if (_layerRoot) then {
	_item408 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3496.41,12757.7,0],[],0,"CAN_COLLIDE"];
	_this = _item408;
	_logics pushback _this;
	_logicIDs pushback 408;
	_this setPosWorld [3496.41,12757.7,6.21507];
	_this setVectorDirAndUp [[-0.681968,0.731376,-0.00281507],[-0.0319849,-0.0259784,0.999151]];
	_this setVariable ["objectArea",[1,1,317.002,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item409 = objNull;
if (_layerRoot) then {
	_item409 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3470.04,12785.5,0],[],0,"CAN_COLLIDE"];
	_this = _item409;
	_logics pushback _this;
	_logicIDs pushback 409;
	_this setPosWorld [3470.04,12785.5,5.06176];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item410 = objNull;
if (_layerRoot) then {
	_item410 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3483.4,12803,0],[],0,"CAN_COLLIDE"];
	_this = _item410;
	_logics pushback _this;
	_logicIDs pushback 410;
	_this setPosWorld [3483.4,12803,6.4135];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item411 = objNull;
if (_layerRoot) then {
	_item411 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3414.19,12939.1,0],[],0,"CAN_COLLIDE"];
	_this = _item411;
	_logics pushback _this;
	_logicIDs pushback 411;
	_this setPosWorld [3414.19,12939.1,2.74483];
	_this setVectorDirAndUp [[-0.681851,0.731425,-0.00987315],[-0.0369727,-0.0209805,0.999096]];
	_this setVariable ["objectArea",[1,1,317.009,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item412 = objNull;
if (_layerRoot) then {
	_item412 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3398.24,12916.2,0.17279],[],0,"CAN_COLLIDE"];
	_this = _item412;
	_logics pushback _this;
	_logicIDs pushback 412;
	_this setPosWorld [3398.24,12916.2,2.04503];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item413 = objNull;
if (_layerRoot) then {
	_item413 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3379.73,12933.4,0.0306],[],0,"CAN_COLLIDE"];
	_this = _item413;
	_logics pushback _this;
	_logicIDs pushback 413;
	_this setPosWorld [3379.73,12933.4,2.0183];
	_this setVectorDirAndUp [[-0.682317,0.731057,-2.12792e-005],[0.00119573,0.00114512,0.999999]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item414 = objNull;
if (_layerRoot) then {
	_item414 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3397.46,12975,0],[],0,"CAN_COLLIDE"];
	_this = _item414;
	_logics pushback _this;
	_logicIDs pushback 414;
	_this setPosWorld [3397.46,12975,2.46774];
	_this setVectorDirAndUp [[-0.682317,0.731056,0.000666206],[0.000976388,0,1]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item415 = objNull;
if (_layerRoot) then {
	_item415 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3351.97,13000.4,0],[],0,"CAN_COLLIDE"];
	_this = _item415;
	_logics pushback _this;
	_logicIDs pushback 415;
	_this setPosWorld [3351.97,13000.4,3.3097];
	_this setVectorDirAndUp [[-0.680745,0.724933,0.105159],[0.0678421,-0.0805469,0.994439]];
	_this setVariable ["objectArea",[1,1,316.801,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item416 = objNull;
if (_layerRoot) then {
	_item416 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3291.72,12969.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item416;
	_logics pushback _this;
	_logicIDs pushback 416;
	_this setPosWorld [3291.72,12969.3,2.26021];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item417 = objNull;
if (_layerRoot) then {
	_item417 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3244.28,12946.4,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item417;
	_logics pushback _this;
	_logicIDs pushback 417;
	_this setPosWorld [3244.28,12946.4,2.05238];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item418 = objNull;
if (_layerRoot) then {
	_item418 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3251.32,12946.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item418;
	_logics pushback _this;
	_logicIDs pushback 418;
	_this setPosWorld [3251.32,12946.3,2.04629];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item419 = objNull;
if (_layerRoot) then {
	_item419 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3257.77,12947.2,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item419;
	_logics pushback _this;
	_logicIDs pushback 419;
	_this setPosWorld [3257.77,12947.2,2.07632];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item420 = objNull;
if (_layerRoot) then {
	_item420 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3263.92,12947.2,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item420;
	_logics pushback _this;
	_logicIDs pushback 420;
	_this setPosWorld [3263.92,12947.2,2.10094];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item421 = objNull;
if (_layerRoot) then {
	_item421 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3270.7,12947.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item421;
	_logics pushback _this;
	_logicIDs pushback 421;
	_this setPosWorld [3270.7,12947.8,2.13431];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item422 = objNull;
if (_layerRoot) then {
	_item422 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3279.94,12948.4,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item422;
	_logics pushback _this;
	_logicIDs pushback 422;
	_this setPosWorld [3279.94,12948.4,2.1778];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item423 = objNull;
if (_layerRoot) then {
	_item423 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3285.84,12948.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item423;
	_logics pushback _this;
	_logicIDs pushback 423;
	_this setPosWorld [3285.84,12948.6,2.18586];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item424 = objNull;
if (_layerRoot) then {
	_item424 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3292.37,12949.2,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item424;
	_logics pushback _this;
	_logicIDs pushback 424;
	_this setPosWorld [3292.37,12949.2,2.19542];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item425 = objNull;
if (_layerRoot) then {
	_item425 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3298.06,12949.4,0],[],0,"CAN_COLLIDE"];
	_this = _item425;
	_logics pushback _this;
	_logicIDs pushback 425;
	_this setPosWorld [3298.06,12949.4,2.18895];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item426 = objNull;
if (_layerRoot) then {
	_item426 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3446.88,12925.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item426;
	_logics pushback _this;
	_logicIDs pushback 426;
	_this setPosWorld [3446.88,12925.3,3.9213];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item427 = objNull;
if (_layerRoot) then {
	_item427 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3467.12,12899.5,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item427;
	_logics pushback _this;
	_logicIDs pushback 427;
	_this setPosWorld [3467.12,12899.5,5.1113];
	_this setVectorDirAndUp [[-0.6783,0.7271,-0.105995],[-0.108355,0.0436976,0.993151]];
	_this setVariable ["objectArea",[1,1,316.989,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item428 = objNull;
if (_layerRoot) then {
	_item428 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3470.36,12691.2,0],[],0,"CAN_COLLIDE"];
	_this = _item428;
	_logics pushback _this;
	_logicIDs pushback 428;
	_this setPosWorld [3470.36,12691.2,5.83909];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item429 = objNull;
if (_layerRoot) then {
	_item429 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3479.61,12685,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item429;
	_logics pushback _this;
	_logicIDs pushback 429;
	_this setPosWorld [3479.61,12685,7.54243];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item430 = objNull;
if (_layerRoot) then {
	_item430 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3542.63,12689.4,0],[],0,"CAN_COLLIDE"];
	_this = _item430;
	_logics pushback _this;
	_logicIDs pushback 430;
	_this setPosWorld [3542.63,12689.4,10.9004];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item431 = objNull;
if (_layerRoot) then {
	_item431 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3551.16,12684.9,0],[],0,"CAN_COLLIDE"];
	_this = _item431;
	_logics pushback _this;
	_logicIDs pushback 431;
	_this setPosWorld [3551.16,12684.9,11.8449];
	_this setVectorDirAndUp [[-0.67516,0.726405,-0.128434],[-0.144465,0.0405323,0.988679]];
	_this setVariable ["objectArea",[1,1,317.094,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item443 = objNull;
if (_layerRoot) then {
	_item443 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3659.51,13196.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item443;
	_logics pushback _this;
	_logicIDs pushback 443;
	_this setPosWorld [3659.51,13196.1,3.91836];
	_this setVectorDirAndUp [[-0.682317,0.731051,0.00285799],[0,-0.0039094,0.999992]];
	_this setVariable ["objectArea",[1,1,316.975,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item526 = objNull;
if (_layerRoot) then {
	_item526 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3549.32,12818.3,0],[],0,"CAN_COLLIDE"];
	_this = _item526;
	_logics pushback _this;
	_logicIDs pushback 526;
	_this setPosWorld [3549.32,12818.3,10.3202];
	_this setVectorDirAndUp [[-0.681212,0.732085,-0.00154346],[-0.0569062,-0.0508496,0.997084]];
	_this setVariable ["objectArea",[1,1,317.062,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item527 = objNull;
if (_layerRoot) then {
	_item527 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[3535.93,12822.9,0],[],0,"CAN_COLLIDE"];
	_this = _item527;
	_logics pushback _this;
	_logicIDs pushback 527;
	_this setPosWorld [3535.93,12822.9,9.81057];
	_this setVectorDirAndUp [[-0.681876,0.731468,0.000308273],[-0.0359766,-0.0339583,0.998775]];
	_this setVariable ["objectArea",[1,1,317.01,false,-1]];
	_this setVariable ["#filter",4];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item1424 = objNull;
if (_layerRoot) then {
	_item1424 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[13792.6,20172.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1424;
	_logics pushback _this;
	_logicIDs pushback 1424;
	_this setPosWorld [13792.6,20172.1,35.1849];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this setVariable ["objectArea",[1,1,0,false,-1]];
	_this setVariable ["#filter",15];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item1425 = objNull;
if (_layerRoot) then {
	_item1425 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[13800.5,20161.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1425;
	_logics pushback _this;
	_logicIDs pushback 1425;
	_this setPosWorld [13800.5,20161.9,34.8974];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this setVariable ["objectArea",[1,1,0,false,-1]];
	_this setVariable ["#filter",15];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item1468 = objNull;
if (_layerRoot) then {
	_item1468 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[9198.09,19199.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1468;
	_logics pushback _this;
	_logicIDs pushback 1468;
	_this setPosWorld [9198.09,19199.5,272.514];
	_this setVectorDirAndUp [[-0.0547348,0.998501,0],[0,0,1]];
	_this setVariable ["objectArea",[1,1,356.862,false,-1]];
	_this setVariable ["#filter",15];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item1469 = objNull;
if (_layerRoot) then {
	_item1469 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[9211.93,19199.4,0],[],0,"CAN_COLLIDE"];
	_this = _item1469;
	_logics pushback _this;
	_logicIDs pushback 1469;
	_this setPosWorld [9211.93,19199.4,272.514];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this setVariable ["objectArea",[1,1,0,false,-1]];
	_this setVariable ["#filter",15];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};

private _item1470 = objNull;
if (_layerRoot) then {
	_item1470 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleHideTerrainObjects_F",[9205.12,19201.7,0],[],0,"CAN_COLLIDE"];
	_this = _item1470;
	_logics pushback _this;
	_logicIDs pushback 1470;
	_this setPosWorld [9205.12,19201.7,272.514];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this setVariable ["objectArea",[1,1,0,false,-1]];
	_this setVariable ["#filter",15];
	_this setVariable ["#hideLocally",false];
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];
};


///////////////////////////////////////////////////////////////////////////////////////////
// Layers


///////////////////////////////////////////////////////////////////////////////////////////
// Crews


///////////////////////////////////////////////////////////////////////////////////////////
// Vehicle cargo


///////////////////////////////////////////////////////////////////////////////////////////
// Connections


///////////////////////////////////////////////////////////////////////////////////////////
// Inits (executed only once all entities exist; isNil used to ensure non-scheduled environment)
isNil {
};


///////////////////////////////////////////////////////////////////////////////////////////
// Module activations (only once everything is spawned and connected)
if !(isNull _item299) then {_item299 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item300) then {_item300 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item301) then {_item301 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item302) then {_item302 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item303) then {_item303 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item304) then {_item304 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item305) then {_item305 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item306) then {_item306 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item307) then {_item307 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item308) then {_item308 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item309) then {_item309 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item310) then {_item310 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item311) then {_item311 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item312) then {_item312 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item313) then {_item313 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item314) then {_item314 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item316) then {_item316 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item317) then {_item317 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item318) then {_item318 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item319) then {_item319 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item320) then {_item320 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item321) then {_item321 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item322) then {_item322 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item323) then {_item323 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item324) then {_item324 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item325) then {_item325 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item326) then {_item326 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item327) then {_item327 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item328) then {_item328 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item329) then {_item329 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item330) then {_item330 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item331) then {_item331 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item332) then {_item332 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item333) then {_item333 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item334) then {_item334 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item335) then {_item335 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item336) then {_item336 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item337) then {_item337 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item338) then {_item338 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item339) then {_item339 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item340) then {_item340 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item341) then {_item341 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item342) then {_item342 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item343) then {_item343 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item344) then {_item344 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item345) then {_item345 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item346) then {_item346 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item347) then {_item347 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item348) then {_item348 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item349) then {_item349 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item350) then {_item350 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item351) then {_item351 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item352) then {_item352 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item353) then {_item353 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item354) then {_item354 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item355) then {_item355 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item356) then {_item356 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item357) then {_item357 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item358) then {_item358 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item359) then {_item359 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item360) then {_item360 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item361) then {_item361 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item362) then {_item362 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item363) then {_item363 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item364) then {_item364 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item365) then {_item365 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item366) then {_item366 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item368) then {_item368 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item369) then {_item369 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item370) then {_item370 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item371) then {_item371 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item372) then {_item372 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item373) then {_item373 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item374) then {_item374 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item376) then {_item376 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item379) then {_item379 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item380) then {_item380 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item381) then {_item381 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item382) then {_item382 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item383) then {_item383 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item384) then {_item384 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item385) then {_item385 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item386) then {_item386 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item387) then {_item387 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item388) then {_item388 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item389) then {_item389 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item390) then {_item390 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item391) then {_item391 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item392) then {_item392 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item393) then {_item393 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item394) then {_item394 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item395) then {_item395 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item396) then {_item396 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item397) then {_item397 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item398) then {_item398 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item399) then {_item399 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item400) then {_item400 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item401) then {_item401 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item402) then {_item402 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item403) then {_item403 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item404) then {_item404 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item405) then {_item405 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item406) then {_item406 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item407) then {_item407 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item408) then {_item408 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item409) then {_item409 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item410) then {_item410 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item411) then {_item411 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item412) then {_item412 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item413) then {_item413 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item414) then {_item414 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item415) then {_item415 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item416) then {_item416 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item417) then {_item417 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item418) then {_item418 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item419) then {_item419 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item420) then {_item420 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item421) then {_item421 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item422) then {_item422 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item423) then {_item423 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item424) then {_item424 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item425) then {_item425 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item426) then {_item426 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item427) then {_item427 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item428) then {_item428 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item429) then {_item429 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item430) then {_item430 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item431) then {_item431 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item443) then {_item443 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item526) then {_item526 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item527) then {_item527 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item1424) then {_item1424 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item1425) then {_item1425 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item1468) then {_item1468 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item1469) then {_item1469 setvariable ["BIS_fnc_initModules_activate",true];};
if !(isNull _item1470) then {_item1470 setvariable ["BIS_fnc_initModules_activate",true];};


///////////////////////////////////////////////////////////////////////////////////////////
[[_objects,_groups,_triggers,_waypoints,_logics,_markers],[_objectIDs,_groupIDs,_triggerIDs,_waypointIDs,_logicIDs,_markerIDs]]
