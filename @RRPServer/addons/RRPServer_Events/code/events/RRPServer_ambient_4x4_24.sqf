// Export of '4x4Fomka2023.RRpMap' by Fairy Tale on v0.9

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

private _item7 = objNull;
if (_layerRoot) then {
	_item7 = createVehicle ["Land_VR_Slope_01_F",[23338.6,18545.4,-0.00186133],[],0,"CAN_COLLIDE"];
	_this = _item7;
	_objects pushback _this;
	_objectIDs pushback 7;
	_this setPosWorld [23338.6,18545.4,5.17814];
	_this setVectorDirAndUp [[0.197856,-0.980231,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item8 = objNull;
if (_layerRoot) then {
	_item8 = createVehicle ["Land_VR_Slope_01_F",[23331.6,18544.1,-0.00186133],[],0,"CAN_COLLIDE"];
	_this = _item8;
	_objects pushback _this;
	_objectIDs pushback 8;
	_this setPosWorld [23331.6,18544.1,5.17814];
	_this setVectorDirAndUp [[0.205291,-0.978701,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item9 = objNull;
if (_layerRoot) then {
	_item9 = createVehicle ["Land_VR_Block_02_F",[23337.2,18534,-0.00186133],[],0,"CAN_COLLIDE"];
	_this = _item9;
	_objects pushback _this;
	_objectIDs pushback 9;
	_this setPosWorld [23337.2,18534,5.17814];
	_this setVectorDirAndUp [[0.982265,0.187501,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item10 = objNull;
if (_layerRoot) then {
	_item10 = createVehicle ["Land_VR_Slope_01_F",[23327.3,18528.5,3.945],[],0,"CAN_COLLIDE"];
	_this = _item10;
	_objects pushback _this;
	_objectIDs pushback 10;
	_this setPosWorld [23327.3,18528.5,9.125];
	_this setVectorDirAndUp [[-0.984195,-0.177087,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item11 = objNull;
if (_layerRoot) then {
	_item11 = createVehicle ["Land_VR_Slope_01_F",[23348.5,18532.4,3.9663],[],0,"CAN_COLLIDE"];
	_this = _item11;
	_objects pushback _this;
	_objectIDs pushback 11;
	_this setPosWorld [23348.5,18532.4,9.1463];
	_this setVectorDirAndUp [[0.984429,0.17578,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item13 = objNull;
if (_layerRoot) then {
	_item13 = createVehicle ["Land_VR_Block_05_F",[23320.4,18524.8,3.96059],[],0,"CAN_COLLIDE"];
	_this = _item13;
	_objects pushback _this;
	_objectIDs pushback 13;
	_this setPosWorld [23320.4,18524.8,9.14059];
	_this setVectorDirAndUp [[0.171712,-0.985147,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item14 = objNull;
if (_layerRoot) then {
	_item14 = createVehicle ["Land_VR_Block_05_F",[23356.3,18531.3,3.97664],[],0,"CAN_COLLIDE"];
	_this = _item14;
	_objects pushback _this;
	_objectIDs pushback 14;
	_this setPosWorld [23356.3,18531.3,9.15664];
	_this setVectorDirAndUp [[0.185024,-0.982734,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item15 = objNull;
if (_layerRoot) then {
	_item15 = createVehicle ["Land_VR_Slope_01_F",[23349.6,18527.4,7.78793],[],0,"CAN_COLLIDE"];
	_this = _item15;
	_objects pushback _this;
	_objectIDs pushback 15;
	_this setPosWorld [23349.6,18527.4,12.9679];
	_this setVectorDirAndUp [[-0.97854,-0.206059,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item16 = objNull;
if (_layerRoot) then {
	_item16 = createVehicle ["Land_VR_Slope_01_F",[23327.8,18523.5,7.84619],[],0,"CAN_COLLIDE"];
	_this = _item16;
	_objects pushback _this;
	_objectIDs pushback 16;
	_this setPosWorld [23327.8,18523.5,13.0262];
	_this setVectorDirAndUp [[0.988366,0.152097,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item18 = objNull;
if (_layerRoot) then {
	_item18 = createVehicle ["Land_VR_Block_05_F",[23338.5,18525.6,7.83687],[],0,"CAN_COLLIDE"];
	_this = _item18;
	_objects pushback _this;
	_objectIDs pushback 18;
	_this setPosWorld [23338.5,18525.6,13.0169];
	_this setVectorDirAndUp [[-0.987647,-0.156694,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item19 = objNull;
if (_layerRoot) then {
	_item19 = createVehicle ["Land_VR_Slope_01_F",[23342,18518.8,11.5396],[],0,"CAN_COLLIDE"];
	_this = _item19;
	_objects pushback _this;
	_objectIDs pushback 19;
	_this setPosWorld [23342,18518.8,16.7196];
	_this setVectorDirAndUp [[0.169164,-0.985588,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item20 = objNull;
if (_layerRoot) then {
	_item20 = createVehicle ["Land_VR_Slope_01_F",[23345.3,18509.9,14.7627],[],0,"CAN_COLLIDE"];
	_this = _item20;
	_objects pushback _this;
	_objectIDs pushback 20;
	_this setPosWorld [23345.3,18509.9,19.9427];
	_this setVectorDirAndUp [[0.463602,-0.886043,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item21 = objNull;
if (_layerRoot) then {
	_item21 = createVehicle ["Land_VR_Slope_01_F",[23346.8,18500.4,17.1105],[],0,"CAN_COLLIDE"];
	_this = _item21;
	_objects pushback _this;
	_objectIDs pushback 21;
	_this setPosWorld [23346.8,18500.4,22.2905];
	_this setVectorDirAndUp [[-0.298847,-0.954301,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item22 = objNull;
if (_layerRoot) then {
	_item22 = createVehicle ["Land_VR_Slope_01_F",[23348.3,18475.2,21.1716],[],0,"CAN_COLLIDE"];
	_this = _item22;
	_objects pushback _this;
	_objectIDs pushback 22;
	_this setPosWorld [23348.3,18475.2,26.3516];
	_this setVectorDirAndUp [[-0.142591,-0.989782,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item23 = objNull;
if (_layerRoot) then {
	_item23 = createVehicle ["Land_VR_Slope_01_F",[23336.8,18508.8,15.0387],[],0,"CAN_COLLIDE"];
	_this = _item23;
	_objects pushback _this;
	_objectIDs pushback 23;
	_this setPosWorld [23336.8,18508.8,20.2187];
	_this setVectorDirAndUp [[-0.16069,-0.987005,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item24 = objNull;
if (_layerRoot) then {
	_item24 = createVehicle ["Land_VR_Slope_01_F",[23341.5,18474.8,21.4973],[],0,"CAN_COLLIDE"];
	_this = _item24;
	_objects pushback _this;
	_objectIDs pushback 24;
	_this setPosWorld [23341.5,18474.8,26.6773];
	_this setVectorDirAndUp [[0.278571,-0.960416,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item25 = objNull;
if (_layerRoot) then {
	_item25 = createVehicle ["Land_VR_Block_01_F",[23346.2,18460.5,17.0484],[],0,"CAN_COLLIDE"];
	_this = _item25;
	_objects pushback _this;
	_objectIDs pushback 25;
	_this setPosWorld [23346.2,18460.5,24.2284];
	_this setVectorDirAndUp [[0.225773,-0.974156,-0.00688675],[0.125414,0.0220542,0.991859]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item26 = objNull;
if (_layerRoot) then {
	_item26 = createVehicle ["Land_VR_Slope_01_F",[23346.1,18445.4,24.8576],[],0,"CAN_COLLIDE"];
	_this = _item26;
	_objects pushback _this;
	_objectIDs pushback 26;
	_this setPosWorld [23346.1,18445.4,30.0376];
	_this setVectorDirAndUp [[0.303546,-0.952299,-0.0314095],[0.102926,0,0.994689]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item27 = objNull;
if (_layerRoot) then {
	_item27 = createVehicle ["Land_VR_Slope_01_F",[23350.7,18434.4,26.6517],[],0,"CAN_COLLIDE"];
	_this = _item27;
	_objects pushback _this;
	_objectIDs pushback 27;
	_this setPosWorld [23350.7,18434.4,31.8317];
	_this setVectorDirAndUp [[-0.256415,-0.966567,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item28 = objNull;
if (_layerRoot) then {
	_item28 = createVehicle ["Land_VR_Slope_01_F",[23357.1,18426.1,29.1957],[],0,"CAN_COLLIDE"];
	_this = _item28;
	_objects pushback _this;
	_objectIDs pushback 28;
	_this setPosWorld [23357.1,18426.1,34.3757];
	_this setVectorDirAndUp [[0.602454,-0.798153,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item29 = objNull;
if (_layerRoot) then {
	_item29 = createVehicle ["Land_VR_Slope_01_F",[23359.7,18416.6,32.1416],[],0,"CAN_COLLIDE"];
	_this = _item29;
	_objects pushback _this;
	_objectIDs pushback 29;
	_this setPosWorld [23359.7,18416.6,37.3216];
	_this setVectorDirAndUp [[0.531159,-0.847272,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item30 = objNull;
if (_layerRoot) then {
	_item30 = createVehicle ["Land_VR_Slope_01_F",[23361.6,18409,32.2871],[],0,"CAN_COLLIDE"];
	_this = _item30;
	_objects pushback _this;
	_objectIDs pushback 30;
	_this setPosWorld [23361.6,18409,37.4671];
	_this setVectorDirAndUp [[0.855679,0.517507,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item31 = objNull;
if (_layerRoot) then {
	_item31 = createVehicle ["Land_VR_Slope_01_F",[23365.3,18405.9,29.291],[],0,"CAN_COLLIDE"];
	_this = _item31;
	_objects pushback _this;
	_objectIDs pushback 31;
	_this setPosWorld [23365.3,18405.9,34.471];
	_this setVectorDirAndUp [[-0.811685,-0.584096,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item49 = objNull;
if (_layerRoot) then {
	_item49 = createVehicle ["Land_VR_Slope_01_F",[23371.9,18407.3,25.7488],[],0,"CAN_COLLIDE"];
	_this = _item49;
	_objects pushback _this;
	_objectIDs pushback 49;
	_this setPosWorld [23371.9,18407.3,30.9288];
	_this setVectorDirAndUp [[-0.55579,0.831323,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item50 = objNull;
if (_layerRoot) then {
	_item50 = createVehicle ["Land_VR_Slope_01_F",[23376.2,18406.3,25.4775],[],0,"CAN_COLLIDE"];
	_this = _item50;
	_objects pushback _this;
	_objectIDs pushback 50;
	_this setPosWorld [23376.2,18406.3,30.6575];
	_this setVectorDirAndUp [[0.914266,0.405115,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item51 = objNull;
if (_layerRoot) then {
	_item51 = createVehicle ["Land_VR_Slope_01_F",[23357.1,18406,33.0522],[],0,"CAN_COLLIDE"];
	_this = _item51;
	_objects pushback _this;
	_objectIDs pushback 51;
	_this setPosWorld [23357.1,18406,38.2322];
	_this setVectorDirAndUp [[-0.815749,-0.578405,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item52 = objNull;
if (_layerRoot) then {
	_item52 = createVehicle ["Land_VR_Slope_01_F",[23382.2,18411.2,25.7833],[],0,"CAN_COLLIDE"];
	_this = _item52;
	_objects pushback _this;
	_objectIDs pushback 52;
	_this setPosWorld [23382.2,18411.2,30.9633];
	_this setVectorDirAndUp [[-0.384073,0.923303,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item53 = objNull;
if (_layerRoot) then {
	_item53 = createVehicle ["Land_VR_Slope_01_F",[23387.7,18416.1,26.9343],[],0,"CAN_COLLIDE"];
	_this = _item53;
	_objects pushback _this;
	_objectIDs pushback 53;
	_this setPosWorld [23387.7,18416.1,32.1143];
	_this setVectorDirAndUp [[0.920958,0.389661,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item54 = objNull;
if (_layerRoot) then {
	_item54 = createVehicle ["Land_VR_Slope_01_F",[23398.6,18420.8,24.6973],[],0,"CAN_COLLIDE"];
	_this = _item54;
	_objects pushback _this;
	_objectIDs pushback 54;
	_this setPosWorld [23398.6,18420.8,29.8773];
	_this setVectorDirAndUp [[-0.922265,-0.386559,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item55 = objNull;
if (_layerRoot) then {
	_item55 = createVehicle ["Land_VR_Slope_01_F",[23404.1,18423,26.0945],[],0,"CAN_COLLIDE"];
	_this = _item55;
	_objects pushback _this;
	_objectIDs pushback 55;
	_this setPosWorld [23404.1,18423,31.2745];
	_this setVectorDirAndUp [[0.921404,0.388607,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item58 = objNull;
if (_layerRoot) then {
	_item58 = createVehicle ["Land_VR_Block_03_F",[23412.1,18426.3,24.0466],[],0,"CAN_COLLIDE"];
	_this = _item58;
	_objects pushback _this;
	_objectIDs pushback 58;
	_this setPosWorld [23412.1,18426.3,30.2266];
	_this setVectorDirAndUp [[0.389085,-0.921202,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item66 = objNull;
if (_layerRoot) then {
	_item66 = createVehicle ["Land_Lavaboulder_01_F",[23429.8,18432.4,27.4956],[],0,"CAN_COLLIDE"];
	_this = _item66;
	_objects pushback _this;
	_objectIDs pushback 66;
	_this setPosWorld [23429.8,18432.4,30.1469];
	_this setVectorDirAndUp [[-0.954468,-0.298313,0],[0,0,1]];
};

private _item67 = objNull;
if (_layerRoot) then {
	_item67 = createVehicle ["Land_R_rock_general2",[23452.6,18442.5,26.2796],[],0,"CAN_COLLIDE"];
	_this = _item67;
	_objects pushback _this;
	_objectIDs pushback 67;
	_this setPosWorld [23452.6,18442.5,32.4071];
	_this setVectorDirAndUp [[-0.538456,0.842654,0],[0,0,1]];
};

private _item72 = objNull;
if (_layerRoot) then {
	_item72 = createVehicle ["Land_FuelStation_Shed_ruins_F",[23464.9,18468.1,29.9608],[],0,"CAN_COLLIDE"];
	_this = _item72;
	_objects pushback _this;
	_objectIDs pushback 72;
	_this setPosWorld [23464.9,18468.1,34.5985];
	_this setVectorDirAndUp [[0.966761,-0.255681,0],[0,0,1]];
};

private _item73 = objNull;
if (_layerRoot) then {
	_item73 = createVehicle ["Land_FuelStation_Shed_ruins_F",[23479.6,18484.5,30.2182],[],0,"CAN_COLLIDE"];
	_this = _item73;
	_objects pushback _this;
	_objectIDs pushback 73;
	_this setPosWorld [23479.6,18484.5,34.856];
	_this setVectorDirAndUp [[-0.700977,0.713184,0],[0,0,1]];
};

private _item75 = objNull;
if (_layerRoot) then {
	_item75 = createVehicle ["Land_Sea_Wall_F",[23493.2,18511.1,31.4371],[],0,"CAN_COLLIDE"];
	_this = _item75;
	_objects pushback _this;
	_objectIDs pushback 75;
	_this setPosWorld [23493.2,18511.1,32.4984];
	_this setVectorDirAndUp [[0.988641,-0.150295,0],[0,0,1]];
};

private _item76 = objNull;
if (_layerRoot) then {
	_item76 = createVehicle ["Land_nav_pier_m_F",[23506.9,18685.9,26.5655],[],0,"CAN_COLLIDE"];
	_this = _item76;
	_objects pushback _this;
	_objectIDs pushback 76;
	_this setPosWorld [23506.9,18685.9,11.8714];
	_this setVectorDirAndUp [[0.188624,-0.982049,-0.000729633],[0.0293874,0.00490186,0.999556]];
};

private _item77 = objNull;
if (_layerRoot) then {
	_item77 = createVehicle ["Land_FinishGate_01_wide_F",[23487.4,18686.1,33.7378],[],0,"CAN_COLLIDE"];
	_this = _item77;
	_objects pushback _this;
	_objectIDs pushback 77;
	_this setPosWorld [23487.4,18686.1,39.8214];
	_this setVectorDirAndUp [[0.983565,0.178078,-0.0297905],[0.0293874,0.00490186,0.999556]];
};

private _item79 = objNull;
if (_layerRoot) then {
	_item79 = createVehicle ["Land_Tribune_F",[23522,18692.7,31.5838],[],0,"CAN_COLLIDE"];
	_this = _item79;
	_objects pushback _this;
	_objectIDs pushback 79;
	_this setPosWorld [23522,18692.7,37.3235];
	_this setVectorDirAndUp [[0.985817,0.165156,-0.0297934],[0.0293874,0.00490186,0.999556]];
};

private _item80 = objNull;
if (_layerRoot) then {
	_item80 = createVehicle ["Land_WinnersPodium_01_F",[23516.9,18697,32.1841],[],0,"CAN_COLLIDE"];
	_this = _item80;
	_objects pushback _this;
	_objectIDs pushback 80;
	_this setPosWorld [23516.9,18697,35.7996];
	_this setVectorDirAndUp [[0.776972,0.629001,-0.0259219],[0.0293869,0.00489288,0.999556]];
};

private _item99 = objNull;
if (_layerRoot) then {
	_item99 = createVehicle ["Land_GH_Stairs_F",[23487.6,18575.5,33.6979],[],0,"CAN_COLLIDE"];
	_this = _item99;
	_objects pushback _this;
	_objectIDs pushback 99;
	_this setPosWorld [23487.6,18575.5,38.3802];
	_this setVectorDirAndUp [[0.00566566,-0.999984,0],[0,0,1]];
};

private _item100 = objNull;
if (_layerRoot) then {
	_item100 = createVehicle ["Land_GH_Stairs_F",[23489,18575.5,33.6979],[],0,"CAN_COLLIDE"];
	_this = _item100;
	_objects pushback _this;
	_objectIDs pushback 100;
	_this setPosWorld [23489,18575.5,38.3802];
	_this setVectorDirAndUp [[0.00566566,-0.999984,0],[0,0,1]];
};

private _item101 = objNull;
if (_layerRoot) then {
	_item101 = createVehicle ["Land_GH_Stairs_F",[23489,18583.2,33.6387],[],0,"CAN_COLLIDE"];
	_this = _item101;
	_objects pushback _this;
	_objectIDs pushback 101;
	_this setPosWorld [23489,18583.2,38.321];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item102 = objNull;
if (_layerRoot) then {
	_item102 = createVehicle ["Land_GH_Stairs_F",[23487.5,18583.2,33.6387],[],0,"CAN_COLLIDE"];
	_this = _item102;
	_objects pushback _this;
	_objectIDs pushback 102;
	_this setPosWorld [23487.5,18583.2,38.321];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item103 = objNull;
if (_layerRoot) then {
	_item103 = createVehicle ["Land_Mine_01_rail_track_F",[23488.2,18591.5,33.218],[],0,"CAN_COLLIDE"];
	_this = _item103;
	_objects pushback _this;
	_objectIDs pushback 103;
	_this setPosWorld [23488.2,18591.5,36.3239];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item104 = objNull;
if (_layerRoot) then {
	_item104 = createVehicle ["Land_Mine_01_rail_track_F",[23488.2,18610.7,33.2743],[],0,"CAN_COLLIDE"];
	_this = _item104;
	_objects pushback _this;
	_objectIDs pushback 104;
	_this setPosWorld [23488.2,18610.7,36.3802];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item105 = objNull;
if (_layerRoot) then {
	_item105 = createVehicle ["Land_Mine_01_rail_track_F",[23488.2,18601.2,33.1669],[],0,"CAN_COLLIDE"];
	_this = _item105;
	_objects pushback _this;
	_objectIDs pushback 105;
	_this setPosWorld [23488.2,18601.2,36.2727];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item110 = objNull;
if (_layerRoot) then {
	_item110 = createVehicle ["Land_MobileCrane_01_F",[23357.7,18522.6,-0.00186133],[],0,"CAN_COLLIDE"];
	_this = _item110;
	_objects pushback _this;
	_objectIDs pushback 110;
	_this setPosWorld [23357.7,18522.6,26.3323];
	_this setVectorDirAndUp [[0.654339,0.756202,0],[0,0,1]];
};

private _item111 = objNull;
if (_layerRoot) then {
	_item111 = createVehicle ["Land_MobileCrane_01_hook_F",[23328,18450.9,-0.00186133],[],0,"CAN_COLLIDE"];
	_this = _item111;
	_objects pushback _this;
	_objectIDs pushback 111;
	_this setPosWorld [23328,18450.9,26.3323];
	_this setVectorDirAndUp [[0.369789,-0.929116,0],[0,0,1]];
};

private _item112 = objNull;
if (_layerRoot) then {
	_item112 = createVehicle ["Land_MobileCrane_01_F",[23342.8,18392.7,1.50487],[],0,"CAN_COLLIDE"];
	_this = _item112;
	_objects pushback _this;
	_objectIDs pushback 112;
	_this setPosWorld [23342.8,18392.7,27.839];
	_this setVectorDirAndUp [[0.593564,-0.804787,0],[0,0,1]];
};

private _item113 = objNull;
if (_layerRoot) then {
	_item113 = createVehicle ["Land_MobileCrane_01_F",[23406,18446.7,-0.00186133],[],0,"CAN_COLLIDE"];
	_this = _item113;
	_objects pushback _this;
	_objectIDs pushback 113;
	_this setPosWorld [23406,18446.7,26.3323];
	_this setVectorDirAndUp [[-0.968603,-0.248613,0],[0,0,1]];
};

private _item114 = objNull;
if (_layerRoot) then {
	_item114 = createVehicle ["Land_MobileCrane_01_hook_F",[23458.3,18423.5,-0.00186133],[],0,"CAN_COLLIDE"];
	_this = _item114;
	_objects pushback _this;
	_objectIDs pushback 114;
	_this setPosWorld [23458.3,18423.5,26.3323];
	_this setVectorDirAndUp [[0.554602,0.832116,0],[0,0,1]];
};

private _item115 = objNull;
if (_layerRoot) then {
	_item115 = createVehicle ["Land_MobileCrane_01_F",[23483.1,18445.5,-0.00186133],[],0,"CAN_COLLIDE"];
	_this = _item115;
	_objects pushback _this;
	_objectIDs pushback 115;
	_this setPosWorld [23483.1,18445.5,26.3323];
	_this setVectorDirAndUp [[0.624634,0.780918,0],[0,0,1]];
};

private _item117 = objNull;
if (_layerRoot) then {
	_item117 = createVehicle ["Land_MobileCrane_01_hook_F",[23511.1,18538.9,-0.00186133],[],0,"CAN_COLLIDE"];
	_this = _item117;
	_objects pushback _this;
	_objectIDs pushback 117;
	_this setPosWorld [23511.1,18538.9,26.3323];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item119 = objNull;
if (_layerRoot) then {
	_item119 = createVehicle ["Land_MobileCrane_01_hook_F",[23472,18585.3,-0.00186133],[],0,"CAN_COLLIDE"];
	_this = _item119;
	_objects pushback _this;
	_objectIDs pushback 119;
	_this setPosWorld [23472,18585.3,26.3323];
	_this setVectorDirAndUp [[-0.261125,-0.965305,0],[0,0,1]];
};

private _item129 = objNull;
if (_layerRoot) then {
	_item129 = createVehicle ["Land_Sea_Wall_F",[23472.3,18544.4,31.4371],[],0,"CAN_COLLIDE"];
	_this = _item129;
	_objects pushback _this;
	_objectIDs pushback 129;
	_this setPosWorld [23472.3,18544.4,32.4984];
	_this setVectorDirAndUp [[-0.775002,-0.631959,0],[0,0,1]];
};

private _item130 = objNull;
if (_layerRoot) then {
	_item130 = createVehicle ["Land_R_rock_general2",[23484.8,18558,27.349],[],0,"CAN_COLLIDE"];
	_this = _item130;
	_objects pushback _this;
	_objectIDs pushback 130;
	_this setPosWorld [23484.8,18558,33.4764];
	_this setVectorDirAndUp [[-0.538456,0.842654,0],[0,0,1]];
};

private _item131 = objNull;
if (_layerRoot) then {
	_item131 = createVehicle ["Land_R_rock_general2",[23494.9,18567.8,28.0519],[],0,"CAN_COLLIDE"];
	_this = _item131;
	_objects pushback _this;
	_objectIDs pushback 131;
	_this setPosWorld [23494.9,18567.8,34.1794];
	_this setVectorDirAndUp [[0.486587,0.873632,0],[0,0,1]];
};

private _item160 = objNull;
if (_layerRoot) then {
	_item160 = createVehicle ["Land_MobileCrane_01_F",[23447.7,18573,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item160;
	_objects pushback _this;
	_objectIDs pushback 160;
	_this setPosWorld [23447.7,18573,26.3342];
	_this setVectorDirAndUp [[-0.916873,-0.399179,0],[0,0,1]];
};

private _item161 = objNull;
if (_layerRoot) then {
	_item161 = createVehicle ["Land_MobileCrane_01_F",[23453.3,18508.4,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item161;
	_objects pushback _this;
	_objectIDs pushback 161;
	_this setPosWorld [23453.3,18508.4,26.3342];
	_this setVectorDirAndUp [[0.137279,-0.990532,0],[0,0,1]];
};

private _item315 = objNull;
if (_layerRoot) then {
	_item315 = createVehicle ["Land_nav_pier_m_F",[23504.9,18693.5,26.5744],[],0,"CAN_COLLIDE"];
	_this = _item315;
	_objects pushback _this;
	_objectIDs pushback 315;
	_this setPosWorld [23504.9,18693.5,11.8803];
	_this setVectorDirAndUp [[0.188624,-0.982049,-0.000729633],[0.0293874,0.00490186,0.999556]];
};

private _item316 = objNull;
if (_layerRoot) then {
	_item316 = createVehicle ["Land_VR_Slope_01_F",[23336.6,18518,11.7099],[],0,"CAN_COLLIDE"];
	_this = _item316;
	_objects pushback _this;
	_objectIDs pushback 316;
	_this setPosWorld [23336.6,18518,16.8899];
	_this setVectorDirAndUp [[0.169164,-0.985588,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item317 = objNull;
if (_layerRoot) then {
	_item317 = createVehicle ["Land_VR_Slope_01_F",[23336.8,18499.3,16.4372],[],0,"CAN_COLLIDE"];
	_this = _item317;
	_objects pushback _this;
	_objectIDs pushback 317;
	_this setPosWorld [23336.8,18499.3,21.6172];
	_this setVectorDirAndUp [[0.252713,-0.967541,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item318 = objNull;
if (_layerRoot) then {
	_item318 = createVehicle ["Land_VR_Slope_01_F",[23339.3,18489.7,16.4257],[],0,"CAN_COLLIDE"];
	_this = _item318;
	_objects pushback _this;
	_objectIDs pushback 318;
	_this setPosWorld [23339.3,18489.7,21.6057];
	_this setVectorDirAndUp [[-0.256139,0.96664,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item319 = objNull;
if (_layerRoot) then {
	_item319 = createVehicle ["Land_VR_Slope_01_F",[23346.3,18489.6,17.0832],[],0,"CAN_COLLIDE"];
	_this = _item319;
	_objects pushback _this;
	_objectIDs pushback 319;
	_this setPosWorld [23346.3,18489.6,22.2632];
	_this setVectorDirAndUp [[-0.207063,0.978328,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item320 = objNull;
if (_layerRoot) then {
	_item320 = createVehicle ["Land_VR_Slope_01_F",[23339.9,18484.7,18.0247],[],0,"CAN_COLLIDE"];
	_this = _item320;
	_objects pushback _this;
	_objectIDs pushback 320;
	_this setPosWorld [23339.9,18484.7,23.2047];
	_this setVectorDirAndUp [[0.355837,-0.934548,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item321 = objNull;
if (_layerRoot) then {
	_item321 = createVehicle ["Land_VR_Slope_01_F",[23348,18483.7,17.7193],[],0,"CAN_COLLIDE"];
	_this = _item321;
	_objects pushback _this;
	_objectIDs pushback 321;
	_this setPosWorld [23348,18483.7,22.8993];
	_this setVectorDirAndUp [[-0.173204,-0.984886,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item322 = objNull;
if (_layerRoot) then {
	_item322 = createVehicle ["Land_VR_Slope_01_F",[23352.6,18445.9,24.2533],[],0,"CAN_COLLIDE"];
	_this = _item322;
	_objects pushback _this;
	_objectIDs pushback 322;
	_this setPosWorld [23352.6,18445.9,29.4333];
	_this setVectorDirAndUp [[-0.0175272,-0.999844,-0.00198943],[-0.112781,0,0.99362]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item536 = objNull;
if (_layerRoot) then {
	_item536 = createVehicle ["Land_SharpStone_02",[23448,18444.3,30.2087],[],0,"CAN_COLLIDE"];
	_this = _item536;
	_objects pushback _this;
	_objectIDs pushback 536;
	_this setPosWorld [23448,18444.3,33.6311];
	_this setVectorDirAndUp [[0,0.996794,0.0800152],[-0.130435,-0.0793316,0.988278]];
};

private _item538 = objNull;
if (_layerRoot) then {
	_item538 = createVehicle ["Land_BluntStone_02",[23447.1,18439.5,30.3562],[],0,"CAN_COLLIDE"];
	_this = _item538;
	_objects pushback _this;
	_objectIDs pushback 538;
	_this setPosWorld [23447.1,18439.5,33.9251];
	_this setVectorDirAndUp [[0,0.998927,0.0463228],[0.0173244,-0.0463158,0.998777]];
};

private _item539 = objNull;
if (_layerRoot) then {
	_item539 = createVehicle ["Land_SharpStone_02",[23453.9,18450.4,29.2743],[],0,"CAN_COLLIDE"];
	_this = _item539;
	_objects pushback _this;
	_objectIDs pushback 539;
	_this setPosWorld [23453.9,18450.4,32.6967];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item68 = objNull;
if (_layerRoot) then {
	_item68 = createVehicle ["Land_R_rock_general2",[23462.6,18452.4,26.9825],[],0,"CAN_COLLIDE"];
	_this = _item68;
	_objects pushback _this;
	_objectIDs pushback 68;
	_this setPosWorld [23462.6,18452.4,33.11];
	_this setVectorDirAndUp [[0.486587,0.873632,0],[0,0,1]];
};

private _item540 = objNull;
if (_layerRoot) then {
	_item540 = createVehicle ["Land_SharpStone_02",[23459.1,18449.8,32.6688],[],0,"CAN_COLLIDE"];
	_this = _item540;
	_objects pushback _this;
	_objectIDs pushback 540;
	_this setPosWorld [23459.1,18449.8,36.0912];
	_this setVectorDirAndUp [[-0.934868,0.354996,0],[0,0,1]];
};

private _item541 = objNull;
if (_layerRoot) then {
	_item541 = createVehicle ["Land_SharpStone_02",[23456.8,18450.4,31.6859],[],0,"CAN_COLLIDE"];
	_this = _item541;
	_objects pushback _this;
	_objectIDs pushback 541;
	_this setPosWorld [23456.8,18450.4,35.1083];
	_this setVectorDirAndUp [[-0.999369,0.0355283,0],[0,0,1]];
};

private _item542 = objNull;
if (_layerRoot) then {
	_item542 = createVehicle ["Land_SharpStone_02",[23437,18435.4,29.5135],[],0,"CAN_COLLIDE"];
	_this = _item542;
	_objects pushback _this;
	_objectIDs pushback 542;
	_this setPosWorld [23437,18435.4,32.9359];
	_this setVectorDirAndUp [[0.982094,0.188389,0],[0,0,1]];
};

private _item543 = objNull;
if (_layerRoot) then {
	_item543 = createVehicle ["Land_SharpStone_02",[23436.6,18438.5,29.7114],[],0,"CAN_COLLIDE"];
	_this = _item543;
	_objects pushback _this;
	_objectIDs pushback 543;
	_this setPosWorld [23436.6,18438.5,33.1338];
	_this setVectorDirAndUp [[0.982419,0.18669,0],[0,0,1]];
};

private _item544 = objNull;
if (_layerRoot) then {
	_item544 = createVehicle ["Land_SharpStone_02",[23450.5,18445.3,31.3416],[],0,"CAN_COLLIDE"];
	_this = _item544;
	_objects pushback _this;
	_objectIDs pushback 544;
	_this setPosWorld [23450.5,18445.3,34.7639];
	_this setVectorDirAndUp [[0.00157069,-0.992113,0.12534],[-0.106503,0.124461,0.986492]];
};

private _item545 = objNull;
if (_layerRoot) then {
	_item545 = createVehicle ["Land_SharpStone_02",[23447.9,18441.3,30.3402],[],0,"CAN_COLLIDE"];
	_this = _item545;
	_objects pushback _this;
	_objectIDs pushback 545;
	_this setPosWorld [23447.9,18441.3,33.7625];
	_this setVectorDirAndUp [[0,0.999991,0.00432616],[-0.0403585,-0.00432263,0.999176]];
};

private _item546 = objNull;
if (_layerRoot) then {
	_item546 = createVehicle ["Land_SharpStone_02",[23453.9,18445.6,32.1759],[],0,"CAN_COLLIDE"];
	_this = _item546;
	_objects pushback _this;
	_objectIDs pushback 546;
	_this setPosWorld [23453.9,18445.6,35.5983];
	_this setVectorDirAndUp [[0.115021,-0.993363,0],[0,0,1]];
};

private _item547 = objNull;
if (_layerRoot) then {
	_item547 = createVehicle ["Land_SharpStone_02",[23450.6,18448.9,30.2106],[],0,"CAN_COLLIDE"];
	_this = _item547;
	_objects pushback _this;
	_objectIDs pushback 547;
	_this setPosWorld [23450.6,18448.9,33.633];
	_this setVectorDirAndUp [[-0.608579,0.793494,0],[0,0,1]];
};

private _item548 = objNull;
if (_layerRoot) then {
	_item548 = createVehicle ["Land_SharpStone_02",[23454.6,18447.9,31.6626],[],0,"CAN_COLLIDE"];
	_this = _item548;
	_objects pushback _this;
	_objectIDs pushback 548;
	_this setPosWorld [23454.6,18447.9,35.085];
	_this setVectorDirAndUp [[0.816765,-0.57697,0],[0,0,1]];
};

private _item549 = objNull;
if (_layerRoot) then {
	_item549 = createVehicle ["Land_SharpStone_02",[23454.5,18452.5,31.1185],[],0,"CAN_COLLIDE"];
	_this = _item549;
	_objects pushback _this;
	_objectIDs pushback 549;
	_this setPosWorld [23454.5,18452.5,34.5408];
	_this setVectorDirAndUp [[-0.957563,-0.288224,0],[0,0,1]];
};

private _item550 = objNull;
if (_layerRoot) then {
	_item550 = createVehicle ["Land_VR_Block_05_F",[23442.6,18443.7,25.0791],[],0,"CAN_COLLIDE"];
	_this = _item550;
	_objects pushback _this;
	_objectIDs pushback 550;
	_this setPosWorld [23442.6,18443.7,30.2591];
	_this setVectorDirAndUp [[-0.987647,-0.156694,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item551 = objNull;
if (_layerRoot) then {
	_item551 = createVehicle ["Land_SharpStone_02",[23485.5,18526.7,32.5983],[],0,"CAN_COLLIDE"];
	_this = _item551;
	_objects pushback _this;
	_objectIDs pushback 551;
	_this setPosWorld [23485.5,18526.7,36.0207];
	_this setVectorDirAndUp [[0.115021,-0.993363,0],[0,0,1]];
};

private _item552 = objNull;
if (_layerRoot) then {
	_item552 = createVehicle ["Land_SharpStone_02",[23488.1,18530.1,34.0982],[],0,"CAN_COLLIDE"];
	_this = _item552;
	_objects pushback _this;
	_objectIDs pushback 552;
	_this setPosWorld [23488.1,18530.1,37.5205];
	_this setVectorDirAndUp [[0.761132,-0.647287,0.0412073],[0.112254,0.194039,0.97455]];
};

private _item553 = objNull;
if (_layerRoot) then {
	_item553 = createVehicle ["Land_SharpStone_02",[23487,18524.7,31.9965],[],0,"CAN_COLLIDE"];
	_this = _item553;
	_objects pushback _this;
	_objectIDs pushback 553;
	_this setPosWorld [23487,18524.7,35.4189];
	_this setVectorDirAndUp [[0.113126,-0.976203,-0.185013],[-0.180785,-0.203323,0.962277]];
};

private _item554 = objNull;
if (_layerRoot) then {
	_item554 = createVehicle ["Land_SharpStone_02",[23488.2,18526.3,33.4473],[],0,"CAN_COLLIDE"];
	_this = _item554;
	_objects pushback _this;
	_objectIDs pushback 554;
	_this setPosWorld [23488.2,18526.3,36.8697];
	_this setVectorDirAndUp [[0.115016,-0.993364,0],[0,0,1]];
};

private _item555 = objNull;
if (_layerRoot) then {
	_item555 = createVehicle ["Land_SharpStone_02",[23458.7,18544.2,30.9784],[],0,"CAN_COLLIDE"];
	_this = _item555;
	_objects pushback _this;
	_objectIDs pushback 555;
	_this setPosWorld [23458.7,18544.2,34.4008];
	_this setVectorDirAndUp [[0.115021,-0.993363,0],[0,0,1]];
};

private _item556 = objNull;
if (_layerRoot) then {
	_item556 = createVehicle ["Land_SharpStone_02",[23476.3,18561,29.629],[],0,"CAN_COLLIDE"];
	_this = _item556;
	_objects pushback _this;
	_objectIDs pushback 556;
	_this setPosWorld [23476.3,18561,33.0514];
	_this setVectorDirAndUp [[0.115021,-0.993363,0],[0,0,1]];
};

private _item557 = objNull;
if (_layerRoot) then {
	_item557 = createVehicle ["Land_SharpStone_02",[23486,18528.4,33.7529],[],0,"CAN_COLLIDE"];
	_this = _item557;
	_objects pushback _this;
	_objectIDs pushback 557;
	_this setPosWorld [23486,18528.4,37.1752];
	_this setVectorDirAndUp [[0.104008,-0.956225,-0.273527],[-0.426996,-0.291314,0.856044]];
};

private _item558 = objNull;
if (_layerRoot) then {
	_item558 = createVehicle ["Land_SharpStone_02",[23487.5,18557.7,33.5474],[],0,"CAN_COLLIDE"];
	_this = _item558;
	_objects pushback _this;
	_objectIDs pushback 558;
	_this setPosWorld [23487.5,18557.7,36.9698];
	_this setVectorDirAndUp [[-0.115017,0.993364,0],[0,0,1]];
};

private _item559 = objNull;
if (_layerRoot) then {
	_item559 = createVehicle ["Land_SharpStone_02",[23483.9,18568.1,29.0033],[],0,"CAN_COLLIDE"];
	_this = _item559;
	_objects pushback _this;
	_objectIDs pushback 559;
	_this setPosWorld [23483.9,18568.1,32.4257];
	_this setVectorDirAndUp [[0.115021,-0.993363,0],[0,0,1]];
};

private _item560 = objNull;
if (_layerRoot) then {
	_item560 = createVehicle ["Land_SharpStone_02",[23482.2,18565.7,29.2681],[],0,"CAN_COLLIDE"];
	_this = _item560;
	_objects pushback _this;
	_objectIDs pushback 560;
	_this setPosWorld [23482.2,18565.7,32.6905];
	_this setVectorDirAndUp [[0.115021,-0.993363,0],[0,0,1]];
};

private _item561 = objNull;
if (_layerRoot) then {
	_item561 = createVehicle ["Land_SharpStone_02",[23483.6,18570.5,30.7305],[],0,"CAN_COLLIDE"];
	_this = _item561;
	_objects pushback _this;
	_objectIDs pushback 561;
	_this setPosWorld [23483.6,18570.5,34.1529];
	_this setVectorDirAndUp [[-0.745504,0.666501,0],[0,0,1]];
};

private _item562 = objNull;
if (_layerRoot) then {
	_item562 = createVehicle ["Land_W_sharpStone_01",[23481.3,18487.9,31.9538],[],0,"CAN_COLLIDE"];
	_this = _item562;
	_objects pushback _this;
	_objectIDs pushback 562;
	_this setPosWorld [23481.3,18487.9,35.4657];
	_this setVectorDirAndUp [[0.675725,0.737154,0],[0,0,1]];
};

private _item563 = objNull;
if (_layerRoot) then {
	_item563 = createVehicle ["Land_SharpStone_02",[23460.4,18461.3,30.2192],[],0,"CAN_COLLIDE"];
	_this = _item563;
	_objects pushback _this;
	_objectIDs pushback 563;
	_this setPosWorld [23460.4,18461.3,33.6416];
	_this setVectorDirAndUp [[0.966864,-0.25529,0],[0,0,1]];
};

private _item564 = objNull;
if (_layerRoot) then {
	_item564 = createVehicle ["Land_VR_Slope_01_F",[23350.6,18425.1,29.6701],[],0,"CAN_COLLIDE"];
	_this = _item564;
	_objects pushback _this;
	_objectIDs pushback 564;
	_this setPosWorld [23350.6,18425.1,34.8501];
	_this setVectorDirAndUp [[0.70412,-0.710081,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item565 = objNull;
if (_layerRoot) then {
	_item565 = createVehicle ["Land_VR_Slope_01_F",[23355,18415.8,32.5553],[],0,"CAN_COLLIDE"];
	_this = _item565;
	_objects pushback _this;
	_objectIDs pushback 565;
	_this setPosWorld [23355,18415.8,37.7353];
	_this setVectorDirAndUp [[-0.557408,0.68979,-0.462045],[0.241481,0.66716,0.704688]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item570 = objNull;
if (_layerRoot) then {
	_item570 = createVehicle ["Land_Grave_V3_F",[23345.4,18548.9,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item570;
	_objects pushback _this;
	_objectIDs pushback 570;
	_this setPosWorld [23345.4,18548.9,3.98919];
	_this setVectorDirAndUp [[0.232425,-0.972614,0],[0,0,1]];
};

private _item571 = objNull;
if (_layerRoot) then {
	_item571 = createVehicle ["Land_Grave_V3_F",[23324.4,18545.2,0],[],0,"CAN_COLLIDE"];
	_this = _item571;
	_objects pushback _this;
	_objectIDs pushback 571;
	_this setPosWorld [23324.4,18545.2,3.98919];
	_this setVectorDirAndUp [[0.145084,-0.989419,0],[0,0,1]];
};

private _item574 = objNull;
if (_layerRoot) then {
	_item574 = createVehicle ["Land_GH_Stairs_F",[23515.3,18710.7,22.7996],[],0,"CAN_COLLIDE"];
	_this = _item574;
	_objects pushback _this;
	_objectIDs pushback 574;
	_this setPosWorld [23515.3,18710.7,27.4819];
	_this setVectorDirAndUp [[-0.122205,0.992505,0],[0,0,1]];
};

private _item575 = objNull;
if (_layerRoot) then {
	_item575 = createVehicle ["Land_GH_Stairs_F",[23451.3,18539,19.8584],[],0,"CAN_COLLIDE"];
	_this = _item575;
	_objects pushback _this;
	_objectIDs pushback 575;
	_this setPosWorld [23451.3,18539,24.5407];
	_this setVectorDirAndUp [[-0.999101,0.0423867,0],[0,0,1]];
};

private _item577 = objNull;
if (_layerRoot) then {
	_item577 = createVehicle ["Land_GH_Stairs_F",[23516.5,18703.4,27.5189],[],0,"CAN_COLLIDE"];
	_this = _item577;
	_objects pushback _this;
	_objectIDs pushback 577;
	_this setPosWorld [23516.5,18703.4,32.2012];
	_this setVectorDirAndUp [[-0.152552,0.988295,0],[0,0,1]];
};

private _item578 = objNull;
if (_layerRoot) then {
	_item578 = createVehicle ["Land_GH_Stairs_F",[23458.7,18538.8,24.5731],[],0,"CAN_COLLIDE"];
	_this = _item578;
	_objects pushback _this;
	_objectIDs pushback 578;
	_this setPosWorld [23458.7,18538.8,29.2554];
	_this setVectorDirAndUp [[-0.999931,0.011759,0],[0,0,1]];
};

private _item580 = objNull;
if (_layerRoot) then {
	_item580 = createVehicle ["Land_GH_Stairs_F",[23513.6,18726,12.901],[],0,"CAN_COLLIDE"];
	_this = _item580;
	_objects pushback _this;
	_objectIDs pushback 580;
	_this setPosWorld [23513.6,18726,17.5833];
	_this setVectorDirAndUp [[-0.0716766,0.997428,0],[0,0,1]];
};

private _item581 = objNull;
if (_layerRoot) then {
	_item581 = createVehicle ["Land_GH_Stairs_F",[23435.9,18540.1,9.98654],[],0,"CAN_COLLIDE"];
	_this = _item581;
	_objects pushback _this;
	_objectIDs pushback 581;
	_this setPosWorld [23435.9,18540.1,14.6689];
	_this setVectorDirAndUp [[-0.995663,0.0930373,0],[0,0,1]];
};

private _item583 = objNull;
if (_layerRoot) then {
	_item583 = createVehicle ["Land_GH_Stairs_F",[23514.4,18718.3,17.8863],[],0,"CAN_COLLIDE"];
	_this = _item583;
	_objects pushback _this;
	_objectIDs pushback 583;
	_this setPosWorld [23514.4,18718.3,22.5686];
	_this setVectorDirAndUp [[-0.0937972,0.995591,0],[0,0,1]];
};

private _item584 = objNull;
if (_layerRoot) then {
	_item584 = createVehicle ["Land_GH_Stairs_F",[23443.6,18539.5,14.9469],[],0,"CAN_COLLIDE"];
	_this = _item584;
	_objects pushback _this;
	_objectIDs pushback 584;
	_this setPosWorld [23443.6,18539.5,19.6293];
	_this setVectorDirAndUp [[-0.997482,0.0709162,0],[0,0,1]];
};

private _item585 = objNull;
if (_layerRoot) then {
	_item585 = createVehicle ["Land_GH_Stairs_F",[23513,18733.7,8.04532],[],0,"CAN_COLLIDE"];
	_this = _item585;
	_objects pushback _this;
	_objectIDs pushback 585;
	_this setPosWorld [23513,18733.7,12.7276];
	_this setVectorDirAndUp [[-0.0381061,0.999274,0],[0,0,1]];
};

private _item586 = objNull;
if (_layerRoot) then {
	_item586 = createVehicle ["Land_GH_Stairs_F",[23428.1,18541,5.15559],[],0,"CAN_COLLIDE"];
	_this = _item586;
	_objects pushback _this;
	_objectIDs pushback 586;
	_this setPosWorld [23428.1,18541,9.83792];
	_this setVectorDirAndUp [[-0.991973,0.126454,0],[0,0,1]];
};

private _item587 = objNull;
if (_layerRoot) then {
	_item587 = createVehicle ["Land_GH_Stairs_F",[23512.5,18745.1,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item587;
	_objects pushback _this;
	_objectIDs pushback 587;
	_this setPosWorld [23512.5,18745.1,4.68233];
	_this setVectorDirAndUp [[-0.005554,0.999985,0],[0,0,1]];
};

private _item589 = objNull;
if (_layerRoot) then {
	_item589 = createVehicle ["Land_GH_Stairs_F",[23512.7,18740.9,3.20146],[],0,"CAN_COLLIDE"];
	_this = _item589;
	_objects pushback _this;
	_objectIDs pushback 589;
	_this setPosWorld [23512.7,18740.9,7.88378];
	_this setVectorDirAndUp [[-0.0107194,0.999943,0],[0,0,1]];
};

private _item590 = objNull;
if (_layerRoot) then {
	_item590 = createVehicle ["Land_GH_Stairs_F",[23420.9,18542,0.0715137],[],0,"CAN_COLLIDE"];
	_this = _item590;
	_objects pushback _this;
	_objectIDs pushback 590;
	_this setPosWorld [23420.9,18542,4.75384];
	_this setVectorDirAndUp [[-0.988136,0.153581,0],[0,0,1]];
};

private _item593 = objNull;
if (_layerRoot) then {
	_item593 = createVehicle ["Land_Caravan_01_green_F",[23488.4,18619,30.2011],[],0,"CAN_COLLIDE"];
	_this = _item593;
	_objects pushback _this;
	_objectIDs pushback 593;
	_this setPosWorld [23488.4,18619,35.0451];
	_this setVectorDirAndUp [[-0.0324031,0.998728,0.0386217],[-0.160806,-0.043348,0.986034]];
};

private _item594 = objNull;
if (_layerRoot) then {
	_item594 = createVehicle ["Land_Caravan_01_green_F",[23488.8,18626,30.2923],[],0,"CAN_COLLIDE"];
	_this = _item594;
	_objects pushback _this;
	_objectIDs pushback 594;
	_this setPosWorld [23488.8,18626,35.1363];
	_this setVectorDirAndUp [[-0.0693373,0.997333,-0.0227669],[-0.17542,0.0102769,0.98444]];
};

private _item595 = objNull;
if (_layerRoot) then {
	_item595 = createVehicle ["Land_Caravan_01_green_F",[23487.2,18632.9,30.2217],[],0,"CAN_COLLIDE"];
	_this = _item595;
	_objects pushback _this;
	_objectIDs pushback 595;
	_this setPosWorld [23487.2,18632.9,35.0658];
	_this setVectorDirAndUp [[-0.427565,0.903523,0.0288718],[0.0673726,0,0.997728]];
};

private _item596 = objNull;
if (_layerRoot) then {
	_item596 = createVehicle ["Land_Caravan_01_green_F",[23483,18639.1,30.1827],[],0,"CAN_COLLIDE"];
	_this = _item596;
	_objects pushback _this;
	_objectIDs pushback 596;
	_this setPosWorld [23483,18639.1,35.0268];
	_this setVectorDirAndUp [[-0.692126,0.720556,-0.0419625],[-0.128089,-0.0654044,0.989604]];
};

private _item597 = objNull;
if (_layerRoot) then {
	_item597 = createVehicle ["Land_Caravan_01_green_F",[23477.1,18643,30.3204],[],0,"CAN_COLLIDE"];
	_this = _item597;
	_objects pushback _this;
	_objectIDs pushback 597;
	_this setPosWorld [23477.1,18643,35.1645];
	_this setVectorDirAndUp [[0.939175,-0.343319,0.00906627],[-0.00965299,0,0.999953]];
};

private _item598 = objNull;
if (_layerRoot) then {
	_item598 = createVehicle ["Land_Caravan_01_green_F",[23469.6,18644.7,30.4851],[],0,"CAN_COLLIDE"];
	_this = _item598;
	_objects pushback _this;
	_objectIDs pushback 598;
	_this setPosWorld [23469.6,18644.7,35.3292];
	_this setVectorDirAndUp [[0.967366,-0.227006,-0.11257],[0.101016,-0.0619237,0.992956]];
};

private _item599 = objNull;
if (_layerRoot) then {
	_item599 = createVehicle ["Land_Caravan_01_green_F",[23462.1,18647.7,30.6453],[],0,"CAN_COLLIDE"];
	_this = _item599;
	_objects pushback _this;
	_objectIDs pushback 599;
	_this setPosWorld [23462.1,18647.7,35.4894];
	_this setVectorDirAndUp [[-0.904522,0.426412,-0.00367426],[-0.0183927,-0.0304041,0.999368]];
};

private _item600 = objNull;
if (_layerRoot) then {
	_item600 = createVehicle ["Land_Caravan_01_green_F",[23456.9,18652,30.735],[],0,"CAN_COLLIDE"];
	_this = _item600;
	_objects pushback _this;
	_objectIDs pushback 600;
	_this setPosWorld [23456.9,18652,35.5791];
	_this setVectorDirAndUp [[-0.445168,0.894802,-0.0339785],[-0.0761061,0,0.9971]];
};

private _item601 = objNull;
if (_layerRoot) then {
	_item601 = createVehicle ["Land_Caravan_01_green_F",[23454.8,18659.3,30.7011],[],0,"CAN_COLLIDE"];
	_this = _item601;
	_objects pushback _this;
	_objectIDs pushback 601;
	_this setPosWorld [23454.8,18659.3,35.5452];
	_this setVectorDirAndUp [[0,1,0],[0.0680667,0,0.997681]];
};

private _item602 = objNull;
if (_layerRoot) then {
	_item602 = createVehicle ["Land_Caravan_01_green_F",[23455.2,18666.6,30.5216],[],0,"CAN_COLLIDE"];
	_this = _item602;
	_objects pushback _this;
	_objectIDs pushback 602;
	_this setPosWorld [23455.2,18666.6,35.3657];
	_this setVectorDirAndUp [[3.08381e-006,1,3.6052e-006],[0.0112358,-3.63962e-006,0.999937]];
};

private _item603 = objNull;
if (_layerRoot) then {
	_item603 = createVehicle ["Land_Caravan_01_green_F",[23456,18673.5,30.5438],[],0,"CAN_COLLIDE"];
	_this = _item603;
	_objects pushback _this;
	_objectIDs pushback 603;
	_this setPosWorld [23456,18673.5,35.3878];
	_this setVectorDirAndUp [[-0.484432,-0.868719,0.103209],[0.152398,0.0323726,0.987789]];
};

private _item604 = objNull;
if (_layerRoot) then {
	_item604 = createVehicle ["Land_Caravan_01_green_F",[23460.6,18680,30.0942],[],0,"CAN_COLLIDE"];
	_this = _item604;
	_objects pushback _this;
	_objectIDs pushback 604;
	_this setPosWorld [23460.6,18680,34.9383];
	_this setVectorDirAndUp [[0.671901,0.740641,0],[0,0,1]];
};

private _item605 = objNull;
if (_layerRoot) then {
	_item605 = createVehicle ["Land_Caravan_01_green_F",[23467.7,18683.1,30.0884],[],0,"CAN_COLLIDE"];
	_this = _item605;
	_objects pushback _this;
	_objectIDs pushback 605;
	_this setPosWorld [23467.7,18683.1,34.9325];
	_this setVectorDirAndUp [[0.977709,0.209885,0.00571928],[0.00627782,-0.0564496,0.998386]];
};

private _item606 = objNull;
if (_layerRoot) then {
	_item606 = createVehicle ["Land_Caravan_01_green_F",[23475.9,18684.3,29.9075],[],0,"CAN_COLLIDE"];
	_this = _item606;
	_objects pushback _this;
	_objectIDs pushback 606;
	_this setPosWorld [23475.9,18684.3,34.7515];
	_this setVectorDirAndUp [[0.987764,0.154531,0.0210446],[-0.0247179,0.0218876,0.999455]];
};

private _item607 = objNull;
if (_layerRoot) then {
	_item607 = createVehicle ["Land_Caravan_01_green_F",[23483.5,18684.8,30.5619],[],0,"CAN_COLLIDE"];
	_this = _item607;
	_objects pushback _this;
	_objectIDs pushback 607;
	_this setPosWorld [23483.5,18684.8,35.406];
	_this setVectorDirAndUp [[0.976126,0.0154343,0.216657],[-0.215102,-0.0697962,0.974094]];
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


///////////////////////////////////////////////////////////////////////////////////////////
[[_objects,_groups,_triggers,_waypoints,_logics,_markers],[_objectIDs,_groupIDs,_triggerIDs,_waypointIDs,_logicIDs,_markerIDs]]
