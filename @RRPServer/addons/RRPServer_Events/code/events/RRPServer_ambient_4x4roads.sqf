// Export of '4x4Fomka.RRpMap' by Fairy Tale on v0.9

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
	_item7 = createVehicle ["Land_VR_Slope_01_F",[23338.6,18545.4,-2.38419e-007],[],0,"CAN_COLLIDE"];
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
	_item8 = createVehicle ["Land_VR_Slope_01_F",[23331.6,18544.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
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
	_item9 = createVehicle ["Land_VR_Block_02_F",[23337.2,18534,-2.38419e-007],[],0,"CAN_COLLIDE"];
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
	_item10 = createVehicle ["Land_VR_Slope_01_F",[23327.3,18528.5,3.94686],[],0,"CAN_COLLIDE"];
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
	_item11 = createVehicle ["Land_VR_Slope_01_F",[23348.5,18532.4,3.96816],[],0,"CAN_COLLIDE"];
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
	_item13 = createVehicle ["Land_VR_Block_05_F",[23320.4,18524.8,3.96245],[],0,"CAN_COLLIDE"];
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
	_item14 = createVehicle ["Land_VR_Block_05_F",[23356.3,18531.3,3.9785],[],0,"CAN_COLLIDE"];
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
	_item15 = createVehicle ["Land_VR_Slope_01_F",[23349.6,18527.4,7.78979],[],0,"CAN_COLLIDE"];
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
	_item16 = createVehicle ["Land_VR_Slope_01_F",[23327.8,18523.5,7.84805],[],0,"CAN_COLLIDE"];
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
	_item18 = createVehicle ["Land_VR_Block_05_F",[23338.1,18526.8,7.85145],[],0,"CAN_COLLIDE"];
	_this = _item18;
	_objects pushback _this;
	_objectIDs pushback 18;
	_this setPosWorld [23338.1,18526.8,13.0296];
	_this setVectorDirAndUp [[-0.987647,-0.156694,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item19 = objNull;
if (_layerRoot) then {
	_item19 = createVehicle ["Land_VR_Slope_01_F",[23339.3,18518.7,11.5415],[],0,"CAN_COLLIDE"];
	_this = _item19;
	_objects pushback _this;
	_objectIDs pushback 19;
	_this setPosWorld [23339.3,18518.7,16.7196];
	_this setVectorDirAndUp [[0.169164,-0.985588,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item20 = objNull;
if (_layerRoot) then {
	_item20 = createVehicle ["Land_VR_Slope_01_F",[23342.6,18509.5,14.7645],[],0,"CAN_COLLIDE"];
	_this = _item20;
	_objects pushback _this;
	_objectIDs pushback 20;
	_this setPosWorld [23342.6,18509.5,19.9427];
	_this setVectorDirAndUp [[0.463602,-0.886043,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item21 = objNull;
if (_layerRoot) then {
	_item21 = createVehicle ["Land_VR_Slope_01_F",[23341.5,18499.8,18.0437],[],0,"CAN_COLLIDE"];
	_this = _item21;
	_objects pushback _this;
	_objectIDs pushback 21;
	_this setPosWorld [23341.5,18499.8,23.2218];
	_this setVectorDirAndUp [[-0.298847,-0.954301,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item22 = objNull;
if (_layerRoot) then {
	_item22 = createVehicle ["Land_VR_Slope_01_F",[23343,18490.9,21.1735],[],0,"CAN_COLLIDE"];
	_this = _item22;
	_objects pushback _this;
	_objectIDs pushback 22;
	_this setPosWorld [23343,18490.9,26.3516];
	_this setVectorDirAndUp [[-0.246165,-0.969228,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item23 = objNull;
if (_layerRoot) then {
	_item23 = createVehicle ["Land_VR_Slope_01_F",[23340.6,18481.4,21.1096],[],0,"CAN_COLLIDE"];
	_this = _item23;
	_objects pushback _this;
	_objectIDs pushback 23;
	_this setPosWorld [23340.6,18481.4,26.2877];
	_this setVectorDirAndUp [[0.245157,0.969483,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item24 = objNull;
if (_layerRoot) then {
	_item24 = createVehicle ["Land_VR_Slope_01_F",[23343.3,18475.2,21.4804],[],0,"CAN_COLLIDE"];
	_this = _item24;
	_objects pushback _this;
	_objectIDs pushback 24;
	_this setPosWorld [23343.3,18475.2,26.6586];
	_this setVectorDirAndUp [[0.278571,-0.960416,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item25 = objNull;
if (_layerRoot) then {
	_item25 = createVehicle ["Land_VR_Block_01_F",[23345.5,18459.6,17.0503],[],0,"CAN_COLLIDE"];
	_this = _item25;
	_objects pushback _this;
	_objectIDs pushback 25;
	_this setPosWorld [23345.5,18459.6,24.2284];
	_this setVectorDirAndUp [[0.0540828,-0.998536,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item26 = objNull;
if (_layerRoot) then {
	_item26 = createVehicle ["Land_VR_Slope_01_F",[23347.2,18444.2,24.8594],[],0,"CAN_COLLIDE"];
	_this = _item26;
	_objects pushback _this;
	_objectIDs pushback 26;
	_this setPosWorld [23347.2,18444.2,30.0376];
	_this setVectorDirAndUp [[0.50931,-0.860583,0],[0,0,1]];
	_this setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
	_this setObjectMaterialGlobal [0,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_basic.rvmat"];
	_this setObjectTextureGlobal [1,"#(argb,8,8,3)color(1.0,1.0,1.0,1.0,co)"];
	_this setObjectMaterialGlobal [1,"a3\structures_f_bootcamp\vr\coverobjects\data\vr_coverobject_emmisive.rvmat"];
};

private _item27 = objNull;
if (_layerRoot) then {
	_item27 = createVehicle ["Land_VR_Slope_01_F",[23350.7,18434.4,26.6536],[],0,"CAN_COLLIDE"];
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
	_item28 = createVehicle ["Land_VR_Slope_01_F",[23357.1,18426.1,29.1976],[],0,"CAN_COLLIDE"];
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
	_item29 = createVehicle ["Land_VR_Slope_01_F",[23359.7,18416.6,32.1435],[],0,"CAN_COLLIDE"];
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
	_item30 = createVehicle ["Land_VR_Slope_01_F",[23361.6,18409,32.2889],[],0,"CAN_COLLIDE"];
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
	_item31 = createVehicle ["Land_VR_Slope_01_F",[23365.3,18405.9,29.2929],[],0,"CAN_COLLIDE"];
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
	_item49 = createVehicle ["Land_VR_Slope_01_F",[23371.9,18407.3,25.7506],[],0,"CAN_COLLIDE"];
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
	_item50 = createVehicle ["Land_VR_Slope_01_F",[23376.2,18406.3,25.4794],[],0,"CAN_COLLIDE"];
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
	_item51 = createVehicle ["Land_VR_Slope_01_F",[23357.1,18406,33.054],[],0,"CAN_COLLIDE"];
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
	_item52 = createVehicle ["Land_VR_Slope_01_F",[23382.2,18411.2,25.7852],[],0,"CAN_COLLIDE"];
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
	_item53 = createVehicle ["Land_VR_Slope_01_F",[23387.7,18416.1,26.9362],[],0,"CAN_COLLIDE"];
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
	_item54 = createVehicle ["Land_VR_Slope_01_F",[23398.6,18420.8,24.6992],[],0,"CAN_COLLIDE"];
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
	_item55 = createVehicle ["Land_VR_Slope_01_F",[23404.1,18423,26.0964],[],0,"CAN_COLLIDE"];
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
	_item58 = createVehicle ["Land_VR_Block_03_F",[23412.1,18426.3,24.0484],[],0,"CAN_COLLIDE"];
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
	_item66 = createVehicle ["Land_Lavaboulder_01_F",[23429.8,18432.4,27.4974],[],0,"CAN_COLLIDE"];
	_this = _item66;
	_objects pushback _this;
	_objectIDs pushback 66;
	_this setPosWorld [23429.8,18432.4,30.1469];
	_this setVectorDirAndUp [[-0.954468,-0.298313,0],[0,0,1]];
};

private _item67 = objNull;
if (_layerRoot) then {
	_item67 = createVehicle ["Land_R_rock_general2",[23452.6,18442.5,26.2815],[],0,"CAN_COLLIDE"];
	_this = _item67;
	_objects pushback _this;
	_objectIDs pushback 67;
	_this setPosWorld [23452.6,18442.5,32.4071];
	_this setVectorDirAndUp [[-0.538456,0.842654,0],[0,0,1]];
};

private _item68 = objNull;
if (_layerRoot) then {
	_item68 = createVehicle ["Land_R_rock_general2",[23462.6,18452.4,26.9844],[],0,"CAN_COLLIDE"];
	_this = _item68;
	_objects pushback _this;
	_objectIDs pushback 68;
	_this setPosWorld [23462.6,18452.4,33.11];
	_this setVectorDirAndUp [[0.486587,0.873632,0],[0,0,1]];
};

private _item72 = objNull;
if (_layerRoot) then {
	_item72 = createVehicle ["Land_FuelStation_Shed_ruins_F",[23464.9,18468.1,29.9626],[],0,"CAN_COLLIDE"];
	_this = _item72;
	_objects pushback _this;
	_objectIDs pushback 72;
	_this setPosWorld [23464.9,18468.1,34.5985];
	_this setVectorDirAndUp [[0.966761,-0.255681,0],[0,0,1]];
};

private _item73 = objNull;
if (_layerRoot) then {
	_item73 = createVehicle ["Land_FuelStation_Shed_ruins_F",[23479.6,18484.5,30.2201],[],0,"CAN_COLLIDE"];
	_this = _item73;
	_objects pushback _this;
	_objectIDs pushback 73;
	_this setPosWorld [23479.6,18484.5,34.856];
	_this setVectorDirAndUp [[-0.700977,0.713184,0],[0,0,1]];
};

private _item75 = objNull;
if (_layerRoot) then {
	_item75 = createVehicle ["Land_Sea_Wall_F",[23493.2,18511.1,31.439],[],0,"CAN_COLLIDE"];
	_this = _item75;
	_objects pushback _this;
	_objectIDs pushback 75;
	_this setPosWorld [23493.2,18511.1,32.4984];
	_this setVectorDirAndUp [[0.988641,-0.150295,0],[0,0,1]];
};

private _item76 = objNull;
if (_layerRoot) then {
	_item76 = createVehicle ["Land_nav_pier_m_F",[23644,18694,26.4469],[],0,"CAN_COLLIDE"];
	_this = _item76;
	_objects pushback _this;
	_objectIDs pushback 76;
	_this setPosWorld [23644,18694,11.7509];
	_this setVectorDirAndUp [[0.198251,-0.980151,0],[0,0,1]];
};

private _item77 = objNull;
if (_layerRoot) then {
	_item77 = createVehicle ["Land_FinishGate_01_wide_F",[23635.2,18688.4,32.4119],[],0,"CAN_COLLIDE"];
	_this = _item77;
	_objects pushback _this;
	_objectIDs pushback 77;
	_this setPosWorld [23635.2,18688.4,38.4936];
	_this setVectorDirAndUp [[0.985638,0.168874,0],[0,0,1]];
};

private _item79 = objNull;
if (_layerRoot) then {
	_item79 = createVehicle ["Land_Tribune_F",[23660.6,18693.8,32.8305],[],0,"CAN_COLLIDE"];
	_this = _item79;
	_objects pushback _this;
	_objectIDs pushback 79;
	_this setPosWorld [23660.6,18693.8,38.5683];
	_this setVectorDirAndUp [[0.987772,0.155905,0],[0,0,1]];
};

private _item80 = objNull;
if (_layerRoot) then {
	_item80 = createVehicle ["Land_WinnersPodium_01_F",[23644.4,18683.7,32.4793],[],0,"CAN_COLLIDE"];
	_this = _item80;
	_objects pushback _this;
	_objectIDs pushback 80;
	_this setPosWorld [23644.4,18683.7,36.093];
	_this setVectorDirAndUp [[-0.472178,-0.881503,0],[0,0,1]];
};

private _item99 = objNull;
if (_layerRoot) then {
	_item99 = createVehicle ["Land_GH_Stairs_F",[23487.6,18575.5,33.6997],[],0,"CAN_COLLIDE"];
	_this = _item99;
	_objects pushback _this;
	_objectIDs pushback 99;
	_this setPosWorld [23487.6,18575.5,38.3802];
	_this setVectorDirAndUp [[0.00566566,-0.999984,0],[0,0,1]];
};

private _item100 = objNull;
if (_layerRoot) then {
	_item100 = createVehicle ["Land_GH_Stairs_F",[23489,18575.5,33.6997],[],0,"CAN_COLLIDE"];
	_this = _item100;
	_objects pushback _this;
	_objectIDs pushback 100;
	_this setPosWorld [23489,18575.5,38.3802];
	_this setVectorDirAndUp [[0.00566566,-0.999984,0],[0,0,1]];
};

private _item101 = objNull;
if (_layerRoot) then {
	_item101 = createVehicle ["Land_GH_Stairs_F",[23489,18583.2,33.6405],[],0,"CAN_COLLIDE"];
	_this = _item101;
	_objects pushback _this;
	_objectIDs pushback 101;
	_this setPosWorld [23489,18583.2,38.321];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item102 = objNull;
if (_layerRoot) then {
	_item102 = createVehicle ["Land_GH_Stairs_F",[23487.5,18583.2,33.6405],[],0,"CAN_COLLIDE"];
	_this = _item102;
	_objects pushback _this;
	_objectIDs pushback 102;
	_this setPosWorld [23487.5,18583.2,38.321];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item103 = objNull;
if (_layerRoot) then {
	_item103 = createVehicle ["Land_Mine_01_rail_track_F",[23488.2,18591.5,33.2199],[],0,"CAN_COLLIDE"];
	_this = _item103;
	_objects pushback _this;
	_objectIDs pushback 103;
	_this setPosWorld [23488.2,18591.5,36.3239];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item104 = objNull;
if (_layerRoot) then {
	_item104 = createVehicle ["Land_Mine_01_rail_track_F",[23488.2,18610.7,33.2762],[],0,"CAN_COLLIDE"];
	_this = _item104;
	_objects pushback _this;
	_objectIDs pushback 104;
	_this setPosWorld [23488.2,18610.7,36.3802];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item105 = objNull;
if (_layerRoot) then {
	_item105 = createVehicle ["Land_Mine_01_rail_track_F",[23488.2,18601.2,33.1687],[],0,"CAN_COLLIDE"];
	_this = _item105;
	_objects pushback _this;
	_objectIDs pushback 105;
	_this setPosWorld [23488.2,18601.2,36.2727];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item106 = objNull;
if (_layerRoot) then {
	_item106 = createVehicle ["Land_Track_01_20m_F",[23488.2,18625.2,33.2272],[],0,"CAN_COLLIDE"];
	_this = _item106;
	_objects pushback _this;
	_objectIDs pushback 106;
	_this setPosWorld [23488.2,18625.2,36.3838];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item107 = objNull;
if (_layerRoot) then {
	_item107 = createVehicle ["Land_Track_01_30deg_F",[23489.4,18640.2,33.2174],[],0,"CAN_COLLIDE"];
	_this = _item107;
	_objects pushback _this;
	_objectIDs pushback 107;
	_this setPosWorld [23489.4,18640.2,36.3725];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item108 = objNull;
if (_layerRoot) then {
	_item108 = createVehicle ["Land_Track_01_30deg_F",[23494.4,18648.3,33.2116],[],0,"CAN_COLLIDE"];
	_this = _item108;
	_objects pushback _this;
	_objectIDs pushback 108;
	_this setPosWorld [23494.4,18648.3,36.3667];
	_this setVectorDirAndUp [[0.52203,0.852927,0],[0,0,1]];
};

private _item109 = objNull;
if (_layerRoot) then {
	_item109 = createVehicle ["Land_Track_01_30deg_F",[23502.8,18652.9,33.2116],[],0,"CAN_COLLIDE"];
	_this = _item109;
	_objects pushback _this;
	_objectIDs pushback 109;
	_this setPosWorld [23502.8,18652.9,36.3667];
	_this setVectorDirAndUp [[0.871144,0.491027,0],[0,0,1]];
};

private _item110 = objNull;
if (_layerRoot) then {
	_item110 = createVehicle ["Land_MobileCrane_01_F",[23357.7,18522.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item110;
	_objects pushback _this;
	_objectIDs pushback 110;
	_this setPosWorld [23357.7,18522.6,26.3323];
	_this setVectorDirAndUp [[0.654339,0.756202,0],[0,0,1]];
};

private _item111 = objNull;
if (_layerRoot) then {
	_item111 = createVehicle ["Land_MobileCrane_01_hook_F",[23328,18450.9,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item111;
	_objects pushback _this;
	_objectIDs pushback 111;
	_this setPosWorld [23328,18450.9,26.3323];
	_this setVectorDirAndUp [[0.369789,-0.929116,0],[0,0,1]];
};

private _item112 = objNull;
if (_layerRoot) then {
	_item112 = createVehicle ["Land_MobileCrane_01_F",[23342.8,18392.7,1.50673],[],0,"CAN_COLLIDE"];
	_this = _item112;
	_objects pushback _this;
	_objectIDs pushback 112;
	_this setPosWorld [23342.8,18392.7,27.839];
	_this setVectorDirAndUp [[0.593564,-0.804787,0],[0,0,1]];
};

private _item113 = objNull;
if (_layerRoot) then {
	_item113 = createVehicle ["Land_MobileCrane_01_F",[23406,18446.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item113;
	_objects pushback _this;
	_objectIDs pushback 113;
	_this setPosWorld [23406,18446.7,26.3323];
	_this setVectorDirAndUp [[-0.968603,-0.248613,0],[0,0,1]];
};

private _item114 = objNull;
if (_layerRoot) then {
	_item114 = createVehicle ["Land_MobileCrane_01_hook_F",[23458.3,18423.5,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item114;
	_objects pushback _this;
	_objectIDs pushback 114;
	_this setPosWorld [23458.3,18423.5,26.3323];
	_this setVectorDirAndUp [[0.554602,0.832116,0],[0,0,1]];
};

private _item115 = objNull;
if (_layerRoot) then {
	_item115 = createVehicle ["Land_MobileCrane_01_F",[23483.1,18445.5,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item115;
	_objects pushback _this;
	_objectIDs pushback 115;
	_this setPosWorld [23483.1,18445.5,26.3323];
	_this setVectorDirAndUp [[0.624634,0.780918,0],[0,0,1]];
};

private _item116 = objNull;
if (_layerRoot) then {
	_item116 = createVehicle ["Land_nav_pier_m_F",[23645.5,18686.3,26.5143],[],0,"CAN_COLLIDE"];
	_this = _item116;
	_objects pushback _this;
	_objectIDs pushback 116;
	_this setPosWorld [23645.5,18686.3,11.8184];
	_this setVectorDirAndUp [[0.198251,-0.980151,0],[0,0,1]];
};

private _item117 = objNull;
if (_layerRoot) then {
	_item117 = createVehicle ["Land_MobileCrane_01_hook_F",[23511.1,18538.9,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item117;
	_objects pushback _this;
	_objectIDs pushback 117;
	_this setPosWorld [23511.1,18538.9,26.3323];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item119 = objNull;
if (_layerRoot) then {
	_item119 = createVehicle ["Land_MobileCrane_01_hook_F",[23472,18585.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item119;
	_objects pushback _this;
	_objectIDs pushback 119;
	_this setPosWorld [23472,18585.3,26.3323];
	_this setVectorDirAndUp [[-0.261125,-0.965305,0],[0,0,1]];
};

private _item129 = objNull;
if (_layerRoot) then {
	_item129 = createVehicle ["Land_Sea_Wall_F",[23472.3,18544.4,31.439],[],0,"CAN_COLLIDE"];
	_this = _item129;
	_objects pushback _this;
	_objectIDs pushback 129;
	_this setPosWorld [23472.3,18544.4,32.4984];
	_this setVectorDirAndUp [[-0.775002,-0.631959,0],[0,0,1]];
};

private _item130 = objNull;
if (_layerRoot) then {
	_item130 = createVehicle ["Land_R_rock_general2",[23484.8,18558,27.3509],[],0,"CAN_COLLIDE"];
	_this = _item130;
	_objects pushback _this;
	_objectIDs pushback 130;
	_this setPosWorld [23484.8,18558,33.4764];
	_this setVectorDirAndUp [[-0.538456,0.842654,0],[0,0,1]];
};

private _item131 = objNull;
if (_layerRoot) then {
	_item131 = createVehicle ["Land_R_rock_general2",[23494.9,18567.8,28.0538],[],0,"CAN_COLLIDE"];
	_this = _item131;
	_objects pushback _this;
	_objectIDs pushback 131;
	_this setPosWorld [23494.9,18567.8,34.1794];
	_this setVectorDirAndUp [[0.486587,0.873632,0],[0,0,1]];
};

private _item132 = objNull;
if (_layerRoot) then {
	_item132 = createVehicle ["Land_Caravan_01_green_F",[23511,18653.9,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item132;
	_objects pushback _this;
	_objectIDs pushback 132;
	_this setPosWorld [23511,18653.9,34.548];
	_this setVectorDirAndUp [[0.999836,0.0181182,0],[0,0,1]];
};

private _item133 = objNull;
if (_layerRoot) then {
	_item133 = createVehicle ["Land_Caravan_01_green_F",[23518.5,18652.4,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item133;
	_objects pushback _this;
	_objectIDs pushback 133;
	_this setPosWorld [23518.5,18652.4,34.548];
	_this setVectorDirAndUp [[0.735165,-0.677888,0],[0,0,1]];
};

private _item134 = objNull;
if (_layerRoot) then {
	_item134 = createVehicle ["Land_Caravan_01_green_F",[23523,18646.9,29.5796],[],0,"CAN_COLLIDE"];
	_this = _item134;
	_objects pushback _this;
	_objectIDs pushback 134;
	_this setPosWorld [23523,18646.9,34.4218];
	_this setVectorDirAndUp [[0.11253,-0.993648,0],[0,0,1]];
};

private _item135 = objNull;
if (_layerRoot) then {
	_item135 = createVehicle ["Land_Caravan_01_green_F",[23525.9,18639.7,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item135;
	_objects pushback _this;
	_objectIDs pushback 135;
	_this setPosWorld [23525.9,18639.7,34.548];
	_this setVectorDirAndUp [[0.693542,-0.720416,0],[0,0,1]];
};

private _item136 = objNull;
if (_layerRoot) then {
	_item136 = createVehicle ["Land_Caravan_01_green_F",[23530.6,18633.7,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item136;
	_objects pushback _this;
	_objectIDs pushback 136;
	_this setPosWorld [23530.6,18633.7,34.548];
	_this setVectorDirAndUp [[0.415571,-0.909561,0],[0,0,1]];
};

private _item137 = objNull;
if (_layerRoot) then {
	_item137 = createVehicle ["Land_Caravan_01_green_F",[23542,18637.6,29.7749],[],0,"CAN_COLLIDE"];
	_this = _item137;
	_objects pushback _this;
	_objectIDs pushback 137;
	_this setPosWorld [23542,18637.6,34.6171];
	_this setVectorDirAndUp [[0.13924,0.990259,0],[0,0,1]];
};

private _item138 = objNull;
if (_layerRoot) then {
	_item138 = createVehicle ["Land_Caravan_01_green_F",[23537,18632.2,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item138;
	_objects pushback _this;
	_objectIDs pushback 138;
	_this setPosWorld [23537,18632.2,34.548];
	_this setVectorDirAndUp [[0.893467,0.449129,0],[0,0,1]];
};

private _item139 = objNull;
if (_layerRoot) then {
	_item139 = createVehicle ["Land_Caravan_01_green_F",[23540.8,18645.7,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item139;
	_objects pushback _this;
	_objectIDs pushback 139;
	_this setPosWorld [23540.8,18645.7,34.548];
	_this setVectorDirAndUp [[-0.217054,0.97616,0],[0,0,1]];
};

private _item140 = objNull;
if (_layerRoot) then {
	_item140 = createVehicle ["Land_Caravan_01_green_F",[23580.2,18643.8,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item140;
	_objects pushback _this;
	_objectIDs pushback 140;
	_this setPosWorld [23580.2,18643.8,34.548];
	_this setVectorDirAndUp [[0.402647,0.915355,0],[0,0,1]];
};

private _item141 = objNull;
if (_layerRoot) then {
	_item141 = createVehicle ["Land_Caravan_01_green_F",[23547.1,18664.7,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item141;
	_objects pushback _this;
	_objectIDs pushback 141;
	_this setPosWorld [23547.1,18664.7,34.548];
	_this setVectorDirAndUp [[0.999836,0.0181182,0],[0,0,1]];
};

private _item142 = objNull;
if (_layerRoot) then {
	_item142 = createVehicle ["Land_Caravan_01_green_F",[23541.5,18660.6,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item142;
	_objects pushback _this;
	_objectIDs pushback 142;
	_this setPosWorld [23541.5,18660.6,34.548];
	_this setVectorDirAndUp [[0.322697,0.946502,0],[0,0,1]];
};

private _item143 = objNull;
if (_layerRoot) then {
	_item143 = createVehicle ["Land_Caravan_01_green_F",[23539.5,18653.2,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item143;
	_objects pushback _this;
	_objectIDs pushback 143;
	_this setPosWorld [23539.5,18653.2,34.548];
	_this setVectorDirAndUp [[0.111819,0.993729,0],[0,0,1]];
};

private _item144 = objNull;
if (_layerRoot) then {
	_item144 = createVehicle ["Land_Caravan_01_green_F",[23574.3,18639.2,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item144;
	_objects pushback _this;
	_objectIDs pushback 144;
	_this setPosWorld [23574.3,18639.2,34.548];
	_this setVectorDirAndUp [[0.999836,0.0181182,0],[0,0,1]];
};

private _item145 = objNull;
if (_layerRoot) then {
	_item145 = createVehicle ["Land_Caravan_01_green_F",[23567.1,18641.5,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item145;
	_objects pushback _this;
	_objectIDs pushback 145;
	_this setPosWorld [23567.1,18641.5,34.548];
	_this setVectorDirAndUp [[0.606919,-0.794764,0],[0,0,1]];
};

private _item146 = objNull;
if (_layerRoot) then {
	_item146 = createVehicle ["Land_Caravan_01_green_F",[23563.1,18648.2,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item146;
	_objects pushback _this;
	_objectIDs pushback 146;
	_this setPosWorld [23563.1,18648.2,34.548];
	_this setVectorDirAndUp [[0.26788,-0.963452,0],[0,0,1]];
};

private _item147 = objNull;
if (_layerRoot) then {
	_item147 = createVehicle ["Land_Caravan_01_green_F",[23559.7,18655.4,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item147;
	_objects pushback _this;
	_objectIDs pushback 147;
	_this setPosWorld [23559.7,18655.4,34.548];
	_this setVectorDirAndUp [[0.714669,-0.699463,0],[0,0,1]];
};

private _item148 = objNull;
if (_layerRoot) then {
	_item148 = createVehicle ["Land_Caravan_01_green_F",[23554,18661.1,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item148;
	_objects pushback _this;
	_objectIDs pushback 148;
	_this setPosWorld [23554,18661.1,34.548];
	_this setVectorDirAndUp [[0.715007,-0.699118,0],[0,0,1]];
};

private _item149 = objNull;
if (_layerRoot) then {
	_item149 = createVehicle ["Land_Caravan_01_green_F",[23584.1,18650.4,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item149;
	_objects pushback _this;
	_objectIDs pushback 149;
	_this setPosWorld [23584.1,18650.4,34.548];
	_this setVectorDirAndUp [[0.708723,0.705487,0],[0,0,1]];
};

private _item150 = objNull;
if (_layerRoot) then {
	_item150 = createVehicle ["Land_Caravan_01_green_F",[23587.4,18656.8,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item150;
	_objects pushback _this;
	_objectIDs pushback 150;
	_this setPosWorld [23587.4,18656.8,34.548];
	_this setVectorDirAndUp [[-0.196454,-0.980513,0],[0,0,1]];
};

private _item151 = objNull;
if (_layerRoot) then {
	_item151 = createVehicle ["Land_Caravan_01_green_F",[23590.9,18664.2,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item151;
	_objects pushback _this;
	_objectIDs pushback 151;
	_this setPosWorld [23590.9,18664.2,34.548];
	_this setVectorDirAndUp [[0.634162,0.7732,0],[0,0,1]];
};

private _item152 = objNull;
if (_layerRoot) then {
	_item152 = createVehicle ["Land_Caravan_01_green_F",[23598.4,18688.4,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item152;
	_objects pushback _this;
	_objectIDs pushback 152;
	_this setPosWorld [23598.4,18688.4,34.548];
	_this setVectorDirAndUp [[0.999836,0.0181182,0],[0,0,1]];
};

private _item153 = objNull;
if (_layerRoot) then {
	_item153 = createVehicle ["Land_Caravan_01_green_F",[23593.1,18684.1,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item153;
	_objects pushback _this;
	_objectIDs pushback 153;
	_this setPosWorld [23593.1,18684.1,34.548];
	_this setVectorDirAndUp [[0.465192,0.88521,0],[0,0,1]];
};

private _item154 = objNull;
if (_layerRoot) then {
	_item154 = createVehicle ["Land_Caravan_01_green_F",[23594.8,18677.2,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item154;
	_objects pushback _this;
	_objectIDs pushback 154;
	_this setPosWorld [23594.8,18677.2,34.548];
	_this setVectorDirAndUp [[-0.456222,0.889866,0],[0,0,1]];
};

private _item155 = objNull;
if (_layerRoot) then {
	_item155 = createVehicle ["Land_Caravan_01_green_F",[23595.1,18670.1,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item155;
	_objects pushback _this;
	_objectIDs pushback 155;
	_this setPosWorld [23595.1,18670.1,34.548];
	_this setVectorDirAndUp [[-0.528005,-0.849241,0],[0,0,1]];
};

private _item156 = objNull;
if (_layerRoot) then {
	_item156 = createVehicle ["Land_Caravan_01_green_F",[23618,18689.3,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item156;
	_objects pushback _this;
	_objectIDs pushback 156;
	_this setPosWorld [23618,18689.3,34.548];
	_this setVectorDirAndUp [[0.837749,-0.546056,0],[0,0,1]];
};

private _item157 = objNull;
if (_layerRoot) then {
	_item157 = createVehicle ["Land_Caravan_01_green_F",[23612.4,18687.4,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item157;
	_objects pushback _this;
	_objectIDs pushback 157;
	_this setPosWorld [23612.4,18687.4,34.548];
	_this setVectorDirAndUp [[0.692303,0.721607,0],[0,0,1]];
};

private _item158 = objNull;
if (_layerRoot) then {
	_item158 = createVehicle ["Land_Caravan_01_green_F",[23605.8,18686.8,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item158;
	_objects pushback _this;
	_objectIDs pushback 158;
	_this setPosWorld [23605.8,18686.8,34.548];
	_this setVectorDirAndUp [[0.962244,-0.272189,0],[0,0,1]];
};

private _item159 = objNull;
if (_layerRoot) then {
	_item159 = createVehicle ["Land_Caravan_01_green_F",[23623.4,18684.5,29.7058],[],0,"CAN_COLLIDE"];
	_this = _item159;
	_objects pushback _this;
	_objectIDs pushback 159;
	_this setPosWorld [23623.4,18684.5,34.548];
	_this setVectorDirAndUp [[0.464634,-0.885503,0],[0,0,1]];
};

private _item160 = objNull;
if (_layerRoot) then {
	_item160 = createVehicle ["Land_MobileCrane_01_F",[23524.9,18657.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item160;
	_objects pushback _this;
	_objectIDs pushback 160;
	_this setPosWorld [23524.9,18657.8,26.3323];
	_this setVectorDirAndUp [[-0.916873,-0.399179,0],[0,0,1]];
};

private _item161 = objNull;
if (_layerRoot) then {
	_item161 = createVehicle ["Land_MobileCrane_01_F",[23611.1,18674.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item161;
	_objects pushback _this;
	_objectIDs pushback 161;
	_this setPosWorld [23611.1,18674.7,26.3323];
	_this setVectorDirAndUp [[0.654339,0.756202,0],[0,0,1]];
};

// Triggers
private _triggers = [];
private _triggerIDs = [];
// Waypoints
private _waypoints = [];
private _waypointIDs = [];

// Logics
private _logics = [];
private _logicIDs = [];
isNil {
};

[[_objects,_groups,_triggers,_waypoints,_logics,_markers],[_objectIDs,_groupIDs,_triggerIDs,_waypointIDs,_logicIDs,_markerIDs]]
