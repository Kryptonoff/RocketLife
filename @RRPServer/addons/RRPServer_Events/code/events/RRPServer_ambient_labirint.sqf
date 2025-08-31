// Export of 'Lab%20Bess%2047.RRpMap' by Fairy Tale on v0.9

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

private _item2 = objNull;
if (_layerRoot) then {
	_item2 = createVehicle ["RRP_Wall_G_C_02",[23456.8,18407,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item2;
	_objects pushback _this;
	_objectIDs pushback 2;
	_this setPosWorld [23456.8,18407,8.16355];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item3 = objNull;
if (_layerRoot) then {
	_item3 = createVehicle ["RRP_Wall_G_C_02",[23457.2,18446.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item3;
	_objects pushback _this;
	_objectIDs pushback 3;
	_this setPosWorld [23457.2,18446.7,8.16355];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item4 = objNull;
if (_layerRoot) then {
	_item4 = createVehicle ["RRP_Wall_G_C_02",[23437,18426.9,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item4;
	_objects pushback _this;
	_objectIDs pushback 4;
	_this setPosWorld [23437,18426.9,8.16355];
	_this setVectorDirAndUp [[0.999926,-0.0121302,0],[0,0,1]];
};

private _item6 = objNull;
if (_layerRoot) then {
	_item6 = createVehicle ["RRP_Wall_G_C_01",[23477.1,18436.9,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item6;
	_objects pushback _this;
	_objectIDs pushback 6;
	_this setPosWorld [23477.1,18436.9,8.19001];
	_this setVectorDirAndUp [[0.999999,0.00149126,0],[0,0,1]];
};

private _item8 = objNull;
if (_layerRoot) then {
	_item8 = createVehicle ["RRP_Wall_G_C_01",[23475.7,18396.9,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item8;
	_objects pushback _this;
	_objectIDs pushback 8;
	_this setPosWorld [23475.7,18396.9,8.19001];
	_this setVectorDirAndUp [[0.0145627,0.999894,0],[0,0,1]];
};

private _item15 = objNull;
if (_layerRoot) then {
	_item15 = createVehicle ["RRP_Wall_G_C_01",[23487.1,18426.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item15;
	_objects pushback _this;
	_objectIDs pushback 15;
	_this setPosWorld [23487.1,18426.8,8.19001];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item18 = objNull;
if (_layerRoot) then {
	_item18 = createVehicle ["RRP_Wall_G_C_03",[23486,18426.8,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item18;
	_objects pushback _this;
	_objectIDs pushback 18;
	_this setPosWorld [23486,18426.8,8.18813];
	_this setVectorDirAndUp [[-0.999912,0.013259,0],[0,0,1]];
};

private _item19 = objNull;
if (_layerRoot) then {
	_item19 = createVehicle ["RRP_Wall_G_C_02",[23466.3,18456.5,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item19;
	_objects pushback _this;
	_objectIDs pushback 19;
	_this setPosWorld [23466.3,18456.5,8.16355];
	_this setVectorDirAndUp [[0.011891,-0.999929,0],[0,0,1]];
};

private _item20 = objNull;
if (_layerRoot) then {
	_item20 = createVehicle ["RRP_Wall_G_C_01",[23456.8,18392.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item20;
	_objects pushback _this;
	_objectIDs pushback 20;
	_this setPosWorld [23456.8,18392.1,8.19001];
	_this setVectorDirAndUp [[0.999285,-0.037821,0],[0,0,1]];
};

private _item21 = objNull;
if (_layerRoot) then {
	_item21 = createVehicle ["RRP_Wall_G_C_02",[23436.7,18396,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item21;
	_objects pushback _this;
	_objectIDs pushback 21;
	_this setPosWorld [23436.7,18396,8.16355];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item23 = objNull;
if (_layerRoot) then {
	_item23 = createVehicle ["RRP_Wall_G_C_03",[23436.1,18377.9,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item23;
	_objects pushback _this;
	_objectIDs pushback 23;
	_this setPosWorld [23436.1,18377.9,8.18813];
	_this setVectorDirAndUp [[0.0345084,0.999404,0],[0,0,1]];
};

private _item24 = objNull;
if (_layerRoot) then {
	_item24 = createVehicle ["RRP_Wall_G_C_03",[23407.3,18409.3,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item24;
	_objects pushback _this;
	_objectIDs pushback 24;
	_this setPosWorld [23407.3,18409.3,8.18813];
	_this setVectorDirAndUp [[-0.999377,0.0352896,0],[0,0,1]];
};

private _item25 = objNull;
if (_layerRoot) then {
	_item25 = createVehicle ["RRP_Wall_G_C_01",[23426.9,18415.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item25;
	_objects pushback _this;
	_objectIDs pushback 25;
	_this setPosWorld [23426.9,18415.6,8.19001];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item26 = objNull;
if (_layerRoot) then {
	_item26 = createVehicle ["RRP_Wall_G_C_02",[23427.9,18435.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item26;
	_objects pushback _this;
	_objectIDs pushback 26;
	_this setPosWorld [23427.9,18435.6,8.16355];
	_this setVectorDirAndUp [[0.999972,-0.00741789,0],[0,0,1]];
};

private _item27 = objNull;
if (_layerRoot) then {
	_item27 = createVehicle ["RRP_Wall_G_C_01",[23427.9,18455.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item27;
	_objects pushback _this;
	_objectIDs pushback 27;
	_this setPosWorld [23427.9,18455.7,8.19001];
	_this setVectorDirAndUp [[-0.0214411,0.99977,0],[0,0,1]];
};

private _item28 = objNull;
if (_layerRoot) then {
	_item28 = createVehicle ["RRP_Wall_G_C_01",[23426.5,18395.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item28;
	_objects pushback _this;
	_objectIDs pushback 28;
	_this setPosWorld [23426.5,18395.3,8.19001];
	_this setVectorDirAndUp [[0.999733,-0.0230973,0],[0,0,1]];
};

private _item30 = objNull;
if (_layerRoot) then {
	_item30 = createVehicle ["RRP_Wall_G_C_02",[23473,18376.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item30;
	_objects pushback _this;
	_objectIDs pushback 30;
	_this setPosWorld [23473,18376.8,8.16355];
	_this setVectorDirAndUp [[0.0163287,0.999867,0],[0,0,1]];
};

private _item32 = objNull;
if (_layerRoot) then {
	_item32 = createVehicle ["RRP_Wall_G_C_02",[23493.5,18396.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item32;
	_objects pushback _this;
	_objectIDs pushback 32;
	_this setPosWorld [23493.5,18396.6,8.16355];
	_this setVectorDirAndUp [[-0.999743,0.0226536,0],[0,0,1]];
};

private _item34 = objNull;
if (_layerRoot) then {
	_item34 = createVehicle ["RRP_Wall_G_C_01",[23503.4,18400.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item34;
	_objects pushback _this;
	_objectIDs pushback 34;
	_this setPosWorld [23503.4,18400.6,8.19001];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item35 = objNull;
if (_layerRoot) then {
	_item35 = createVehicle ["RRP_Wall_G_C_02",[23505,18421.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item35;
	_objects pushback _this;
	_objectIDs pushback 35;
	_this setPosWorld [23505,18421.1,8.16355];
	_this setVectorDirAndUp [[-0.999928,0.0120413,0],[0,0,1]];
};

private _item36 = objNull;
if (_layerRoot) then {
	_item36 = createVehicle ["RRP_Wall_G_C_02",[23497.2,18446.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item36;
	_objects pushback _this;
	_objectIDs pushback 36;
	_this setPosWorld [23497.2,18446.8,8.16355];
	_this setVectorDirAndUp [[-0.99991,0.0134436,0],[0,0,1]];
};

private _item37 = objNull;
if (_layerRoot) then {
	_item37 = createVehicle ["RRP_Wall_G_C_01",[23487.4,18466.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item37;
	_objects pushback _this;
	_objectIDs pushback 37;
	_this setPosWorld [23487.4,18466.6,8.19001];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item38 = objNull;
if (_layerRoot) then {
	_item38 = createVehicle ["RRP_Wall_G_C_01",[23484.9,18376.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item38;
	_objects pushback _this;
	_objectIDs pushback 38;
	_this setPosWorld [23484.9,18376.7,8.19001];
	_this setVectorDirAndUp [[0.99982,-0.0189559,0],[0,0,1]];
};

private _item40 = objNull;
if (_layerRoot) then {
	_item40 = createVehicle ["RRP_Wall_G_C_01",[23494.7,18366.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item40;
	_objects pushback _this;
	_objectIDs pushback 40;
	_this setPosWorld [23494.7,18366.8,8.19001];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item41 = objNull;
if (_layerRoot) then {
	_item41 = createVehicle ["RRP_Wall_G_C_01",[23504.5,18376.9,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item41;
	_objects pushback _this;
	_objectIDs pushback 41;
	_this setPosWorld [23504.5,18376.9,8.19001];
	_this setVectorDirAndUp [[-1,0.000106347,0],[0,0,1]];
};

private _item42 = objNull;
if (_layerRoot) then {
	_item42 = createVehicle ["RRP_Wall_G_C_01",[23492.7,18366.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item42;
	_objects pushback _this;
	_objectIDs pushback 42;
	_this setPosWorld [23492.7,18366.7,8.19001];
	_this setVectorDirAndUp [[-0.999712,0.0239874,0],[0,0,1]];
};

private _item43 = objNull;
if (_layerRoot) then {
	_item43 = createVehicle ["RRP_Wall_G_C_02",[23472.5,18357.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item43;
	_objects pushback _this;
	_objectIDs pushback 43;
	_this setPosWorld [23472.5,18357.3,8.16355];
	_this setVectorDirAndUp [[0.0230215,0.999735,0],[0,0,1]];
};

private _item44 = objNull;
if (_layerRoot) then {
	_item44 = createVehicle ["RRP_Wall_G_C_02",[23456.7,18367.4,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item44;
	_objects pushback _this;
	_objectIDs pushback 44;
	_this setPosWorld [23456.7,18367.4,8.16355];
	_this setVectorDirAndUp [[0.0196268,0.999807,0],[0,0,1]];
};

private _item45 = objNull;
if (_layerRoot) then {
	_item45 = createVehicle ["RRP_Wall_G_C_01",[23437.2,18377.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item45;
	_objects pushback _this;
	_objectIDs pushback 45;
	_this setPosWorld [23437.2,18377.8,8.19001];
	_this setVectorDirAndUp [[-0.999094,0.0425611,0],[0,0,1]];
};

private _item46 = objNull;
if (_layerRoot) then {
	_item46 = createVehicle ["RRP_Wall_G_C_01",[23444.5,18357.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item46;
	_objects pushback _this;
	_objectIDs pushback 46;
	_this setPosWorld [23444.5,18357.8,8.19001];
	_this setVectorDirAndUp [[0.998796,-0.0490586,0],[0,0,1]];
};

private _item47 = objNull;
if (_layerRoot) then {
	_item47 = createVehicle ["RRP_Wall_G_C_03",[23414.5,18358.6,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item47;
	_objects pushback _this;
	_objectIDs pushback 47;
	_this setPosWorld [23414.5,18358.6,8.18813];
	_this setVectorDirAndUp [[0.0327007,0.999465,0],[0,0,1]];
};

private _item48 = objNull;
if (_layerRoot) then {
	_item48 = createVehicle ["RRP_Wall_G_C_01",[23416.6,18368.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item48;
	_objects pushback _this;
	_objectIDs pushback 48;
	_this setPosWorld [23416.6,18368.7,8.19001];
	_this setVectorDirAndUp [[0.0131006,0.999914,0],[0,0,1]];
};

private _item49 = objNull;
if (_layerRoot) then {
	_item49 = createVehicle ["RRP_Wall_G_C_01",[23404.3,18369,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item49;
	_objects pushback _this;
	_objectIDs pushback 49;
	_this setPosWorld [23404.3,18369,8.19001];
	_this setVectorDirAndUp [[0.0214511,0.99977,0],[0,0,1]];
};

private _item50 = objNull;
if (_layerRoot) then {
	_item50 = createVehicle ["RRP_Wall_G_C_03",[23395.5,18399.3,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item50;
	_objects pushback _this;
	_objectIDs pushback 50;
	_this setPosWorld [23395.5,18399.3,8.18813];
	_this setVectorDirAndUp [[-0.999291,0.0376531,0],[0,0,1]];
};

private _item52 = objNull;
if (_layerRoot) then {
	_item52 = createVehicle ["RRP_Wall_G_C_01",[23412,18426.4,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item52;
	_objects pushback _this;
	_objectIDs pushback 52;
	_this setPosWorld [23412,18426.4,8.19001];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item53 = objNull;
if (_layerRoot) then {
	_item53 = createVehicle ["RRP_Wall_G_C_01",[23408.2,18455.4,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item53;
	_objects pushback _this;
	_objectIDs pushback 53;
	_this setPosWorld [23408.2,18455.4,8.19001];
	_this setVectorDirAndUp [[0.999493,-0.0318542,0],[0,0,1]];
};

private _item54 = objNull;
if (_layerRoot) then {
	_item54 = createVehicle ["RRP_Wall_G_C_01",[23468.7,18466.5,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item54;
	_objects pushback _this;
	_objectIDs pushback 54;
	_this setPosWorld [23468.7,18466.5,8.19001];
	_this setVectorDirAndUp [[0.999874,-0.0158812,0],[0,0,1]];
};

private _item55 = objNull;
if (_layerRoot) then {
	_item55 = createVehicle ["RRP_Wall_G_C_03",[23438.4,18466.2,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item55;
	_objects pushback _this;
	_objectIDs pushback 55;
	_this setPosWorld [23438.4,18466.2,8.18813];
	_this setVectorDirAndUp [[0.0178846,-0.99984,0],[0,0,1]];
};

private _item56 = objNull;
if (_layerRoot) then {
	_item56 = createVehicle ["RRP_Wall_G_C_02",[23397.1,18449.2,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item56;
	_objects pushback _this;
	_objectIDs pushback 56;
	_this setPosWorld [23397.1,18449.2,8.16355];
	_this setVectorDirAndUp [[-0.999576,0.0291049,0],[0,0,1]];
};

private _item58 = objNull;
if (_layerRoot) then {
	_item58 = createVehicle ["RRP_Wall_G_C_02",[23417.6,18475.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item58;
	_objects pushback _this;
	_objectIDs pushback 58;
	_this setPosWorld [23417.6,18475.6,8.16355];
	_this setVectorDirAndUp [[0.0293991,-0.999568,0],[0,0,1]];
};

private _item59 = objNull;
if (_layerRoot) then {
	_item59 = createVehicle ["RRP_Wall_G_C_01",[23468.7,18476.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item59;
	_objects pushback _this;
	_objectIDs pushback 59;
	_this setPosWorld [23468.7,18476.8,8.19001];
	_this setVectorDirAndUp [[-0.00104055,-0.999999,0],[0,0,1]];
};

private _item60 = objNull;
if (_layerRoot) then {
	_item60 = createVehicle ["RRP_Wall_G_C_01",[23442.4,18476.2,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item60;
	_objects pushback _this;
	_objectIDs pushback 60;
	_this setPosWorld [23442.4,18476.2,8.19001];
	_this setVectorDirAndUp [[-0.0186931,0.999825,0],[0,0,1]];
};

private _item61 = objNull;
if (_layerRoot) then {
	_item61 = createVehicle ["RRP_Wall_G_C_01",[23501.4,18446.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item61;
	_objects pushback _this;
	_objectIDs pushback 61;
	_this setPosWorld [23501.4,18446.7,8.19001];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item63 = objNull;
if (_layerRoot) then {
	_item63 = createVehicle ["RRP_Wall_G_C_01",[23511.1,18456.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item63;
	_objects pushback _this;
	_objectIDs pushback 63;
	_this setPosWorld [23511.1,18456.8,8.19001];
	_this setVectorDirAndUp [[-1,0.00056268,0],[0,0,1]];
};

private _item64 = objNull;
if (_layerRoot) then {
	_item64 = createVehicle ["RRP_Wall_G_C_01",[23511.1,18467.9,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item64;
	_objects pushback _this;
	_objectIDs pushback 64;
	_this setPosWorld [23511.1,18467.9,8.19001];
	_this setVectorDirAndUp [[-0.999964,-0.00846375,0],[0,0,1]];
};

private _item65 = objNull;
if (_layerRoot) then {
	_item65 = createVehicle ["RRP_Wall_G_C_01",[23501,18477.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item65;
	_objects pushback _this;
	_objectIDs pushback 65;
	_this setPosWorld [23501,18477.6,8.19001];
	_this setVectorDirAndUp [[0.00971651,-0.999953,0],[0,0,1]];
};

private _item66 = objNull;
if (_layerRoot) then {
	_item66 = createVehicle ["RRP_Wall_G_C_01",[23385,18389.9,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item66;
	_objects pushback _this;
	_objectIDs pushback 66;
	_this setPosWorld [23385,18389.9,8.19001];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item67 = objNull;
if (_layerRoot) then {
	_item67 = createVehicle ["RRP_Wall_G_C_02",[23385,18410.4,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item67;
	_objects pushback _this;
	_objectIDs pushback 67;
	_this setPosWorld [23385,18410.4,8.16355];
	_this setVectorDirAndUp [[-0.999492,0.031875,0],[0,0,1]];
};

private _item68 = objNull;
if (_layerRoot) then {
	_item68 = createVehicle ["RRP_Wall_G_C_01",[23375.1,18410.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item68;
	_objects pushback _this;
	_objectIDs pushback 68;
	_this setPosWorld [23375.1,18410.1,8.19001];
	_this setVectorDirAndUp [[-0.0194192,0.999811,0],[0,0,1]];
};

private _item69 = objNull;
if (_layerRoot) then {
	_item69 = createVehicle ["RRP_Wall_G_C_02",[23375.5,18418,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item69;
	_objects pushback _this;
	_objectIDs pushback 69;
	_this setPosWorld [23375.5,18418,8.16355];
	_this setVectorDirAndUp [[-0.999624,0.0274123,0],[0,0,1]];
};

private _item71 = objNull;
if (_layerRoot) then {
	_item71 = createVehicle ["RRP_Wall_G_C_01",[23385,18369.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item71;
	_objects pushback _this;
	_objectIDs pushback 71;
	_this setPosWorld [23385,18369.7,8.19001];
	_this setVectorDirAndUp [[0.998634,-0.0522464,0],[0,0,1]];
};

private _item72 = objNull;
if (_layerRoot) then {
	_item72 = createVehicle ["RRP_Wall_G_C_01",[23396.7,18349.2,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item72;
	_objects pushback _this;
	_objectIDs pushback 72;
	_this setPosWorld [23396.7,18349.2,8.19001];
	_this setVectorDirAndUp [[-0.998062,0.0622228,0],[0,0,1]];
};

private _item73 = objNull;
if (_layerRoot) then {
	_item73 = createVehicle ["RRP_Wall_G_C_02",[23424,18348.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item73;
	_objects pushback _this;
	_objectIDs pushback 73;
	_this setPosWorld [23424,18348.7,8.16355];
	_this setVectorDirAndUp [[0.0396873,0.999212,0],[0,0,1]];
};

private _item74 = objNull;
if (_layerRoot) then {
	_item74 = createVehicle ["RRP_Wall_G_C_03",[23426,18338.1,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item74;
	_objects pushback _this;
	_objectIDs pushback 74;
	_this setPosWorld [23426,18338.1,8.18813];
	_this setVectorDirAndUp [[-0.044335,-0.999017,0],[0,0,1]];
};

private _item75 = objNull;
if (_layerRoot) then {
	_item75 = createVehicle ["RRP_Wall_G_C_02",[23383.8,18340.2,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item75;
	_objects pushback _this;
	_objectIDs pushback 75;
	_this setPosWorld [23383.8,18340.2,8.16355];
	_this setVectorDirAndUp [[-0.0654147,-0.997858,0],[0,0,1]];
};

private _item76 = objNull;
if (_layerRoot) then {
	_item76 = createVehicle ["RRP_Wall_G_C_03",[23365.8,18371.6,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item76;
	_objects pushback _this;
	_objectIDs pushback 76;
	_this setPosWorld [23365.8,18371.6,8.18813];
	_this setVectorDirAndUp [[-0.998253,0.059081,0],[0,0,1]];
};

private _item77 = objNull;
if (_layerRoot) then {
	_item77 = createVehicle ["RRP_Wall_G_C_01",[23374.5,18351.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item77;
	_objects pushback _this;
	_objectIDs pushback 77;
	_this setPosWorld [23374.5,18351.6,8.19001];
	_this setVectorDirAndUp [[-0.038697,-0.999251,0],[0,0,1]];
};

private _item78 = objNull;
if (_layerRoot) then {
	_item78 = createVehicle ["RRP_Wall_G_C_01",[23368.3,18372.9,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item78;
	_objects pushback _this;
	_objectIDs pushback 78;
	_this setPosWorld [23368.3,18372.9,8.19001];
	_this setVectorDirAndUp [[-0.0196855,-0.999806,0],[0,0,1]];
};

private _item79 = objNull;
if (_layerRoot) then {
	_item79 = createVehicle ["RRP_Wall_G_C_02",[23386.8,18466.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item79;
	_objects pushback _this;
	_objectIDs pushback 79;
	_this setPosWorld [23386.8,18466.1,8.16355];
	_this setVectorDirAndUp [[0.999367,-0.0355672,0],[0,0,1]];
};

private _item80 = objNull;
if (_layerRoot) then {
	_item80 = createVehicle ["RRP_Wall_G_C_01",[23386.7,18446.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item80;
	_objects pushback _this;
	_objectIDs pushback 80;
	_this setPosWorld [23386.7,18446.1,8.19001];
	_this setVectorDirAndUp [[-0.0399177,-0.999203,0],[0,0,1]];
};

private _item81 = objNull;
if (_layerRoot) then {
	_item81 = createVehicle ["RRP_Wall_G_C_01",[23397.6,18485.9,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item81;
	_objects pushback _this;
	_objectIDs pushback 81;
	_this setPosWorld [23397.6,18485.9,8.19001];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item82 = objNull;
if (_layerRoot) then {
	_item82 = createVehicle ["RRP_Wall_G_C_01",[23416.9,18485.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item82;
	_objects pushback _this;
	_objectIDs pushback 82;
	_this setPosWorld [23416.9,18485.6,8.19001];
	_this setVectorDirAndUp [[1,-0.000129147,0],[0,0,1]];
};

private _item83 = objNull;
if (_layerRoot) then {
	_item83 = createVehicle ["RRP_Wall_G_C_03",[23447,18486.8,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item83;
	_objects pushback _this;
	_objectIDs pushback 83;
	_this setPosWorld [23447,18486.8,8.18813];
	_this setVectorDirAndUp [[-0.0262886,0.999654,0],[0,0,1]];
};

private _item84 = objNull;
if (_layerRoot) then {
	_item84 = createVehicle ["RRP_Wall_G_C_02",[23480.4,18487.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item84;
	_objects pushback _this;
	_objectIDs pushback 84;
	_this setPosWorld [23480.4,18487.6,8.16355];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item85 = objNull;
if (_layerRoot) then {
	_item85 = createVehicle ["RRP_Wall_G_C_01",[23511.1,18478.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item85;
	_objects pushback _this;
	_objectIDs pushback 85;
	_this setPosWorld [23511.1,18478.3,8.19001];
	_this setVectorDirAndUp [[-0.999953,-0.00967963,0],[0,0,1]];
};

private _item87 = objNull;
if (_layerRoot) then {
	_item87 = createVehicle ["RRP_Wall_G_C_01",[23520.9,18488.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item87;
	_objects pushback _this;
	_objectIDs pushback 87;
	_this setPosWorld [23520.9,18488.1,8.19001];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item88 = objNull;
if (_layerRoot) then {
	_item88 = createVehicle ["RRP_Wall_G_C_03",[23521.9,18457.9,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item88;
	_objects pushback _this;
	_objectIDs pushback 88;
	_this setPosWorld [23521.9,18457.9,8.18813];
	_this setVectorDirAndUp [[-0.999996,0.00277758,0],[0,0,1]];
};

private _item89 = objNull;
if (_layerRoot) then {
	_item89 = createVehicle ["RRP_Wall_G_C_03",[23521.5,18397.4,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item89;
	_objects pushback _this;
	_objectIDs pushback 89;
	_this setPosWorld [23521.5,18397.4,8.18813];
	_this setVectorDirAndUp [[-0.999965,0.00842181,0],[0,0,1]];
};

private _item90 = objNull;
if (_layerRoot) then {
	_item90 = createVehicle ["RRP_Wall_G_C_03",[23521,18337.5,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item90;
	_objects pushback _this;
	_objectIDs pushback 90;
	_this setPosWorld [23521,18337.5,8.18813];
	_this setVectorDirAndUp [[-0.999985,0.00553416,0],[0,0,1]];
};

private _item91 = objNull;
if (_layerRoot) then {
	_item91 = createVehicle ["RRP_Wall_G_C_01",[23510.8,18356.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item91;
	_objects pushback _this;
	_objectIDs pushback 91;
	_this setPosWorld [23510.8,18356.7,8.19001];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item92 = objNull;
if (_layerRoot) then {
	_item92 = createVehicle ["RRP_Wall_G_C_01",[23467.3,18426.9,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item92;
	_objects pushback _this;
	_objectIDs pushback 92;
	_this setPosWorld [23467.3,18426.9,8.19001];
	_this setVectorDirAndUp [[-0.0108648,-0.999941,0],[0,0,1]];
};

private _item93 = objNull;
if (_layerRoot) then {
	_item93 = createVehicle ["RRP_Wall_G_C_01",[23449.7,18427,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item93;
	_objects pushback _this;
	_objectIDs pushback 93;
	_this setPosWorld [23449.7,18427,8.19001];
	_this setVectorDirAndUp [[-0.999945,0.0104731,0],[0,0,1]];
};

private _item94 = objNull;
if (_layerRoot) then {
	_item94 = createVehicle ["RRP_Wall_G_C_01",[23459.5,18417.2,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item94;
	_objects pushback _this;
	_objectIDs pushback 94;
	_this setPosWorld [23459.5,18417.2,8.19001];
	_this setVectorDirAndUp [[0.0141875,-0.999899,0],[0,0,1]];
};

private _item95 = objNull;
if (_layerRoot) then {
	_item95 = createVehicle ["RRP_Wall_G_C_01",[23459.8,18426.9,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item95;
	_objects pushback _this;
	_objectIDs pushback 95;
	_this setPosWorld [23459.8,18426.9,8.19001];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item96 = objNull;
if (_layerRoot) then {
	_item96 = createVehicle ["RRP_Wall_G_C_01",[23521.1,18425.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item96;
	_objects pushback _this;
	_objectIDs pushback 96;
	_this setPosWorld [23521.1,18425.8,8.19001];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item97 = objNull;
if (_layerRoot) then {
	_item97 = createVehicle ["RRP_Wall_G_C_01",[23521,18386.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item97;
	_objects pushback _this;
	_objectIDs pushback 97;
	_this setPosWorld [23521,18386.8,8.19001];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item100 = objNull;
if (_layerRoot) then {
	_item100 = createVehicle ["RRP_Wall_G_C_03",[23536.8,18466,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item100;
	_objects pushback _this;
	_objectIDs pushback 100;
	_this setPosWorld [23536.8,18466,8.18813];
	_this setVectorDirAndUp [[-0.999997,-0.00249384,0],[0,0,1]];
};

private _item102 = objNull;
if (_layerRoot) then {
	_item102 = createVehicle ["RRP_Wall_G_C_03",[23506.8,18496.1,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item102;
	_objects pushback _this;
	_objectIDs pushback 102;
	_this setPosWorld [23506.8,18496.1,8.18813];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item103 = objNull;
if (_layerRoot) then {
	_item103 = createVehicle ["RRP_Wall_G_C_01",[23537.4,18470.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item103;
	_objects pushback _this;
	_objectIDs pushback 103;
	_this setPosWorld [23537.4,18470.7,8.19001];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item104 = objNull;
if (_layerRoot) then {
	_item104 = createVehicle ["RRP_Wall_G_C_03",[23537,18405.7,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item104;
	_objects pushback _this;
	_objectIDs pushback 104;
	_this setPosWorld [23537,18405.7,8.18813];
	_this setVectorDirAndUp [[-0.999994,-0.00354526,0],[0,0,1]];
};

private _item105 = objNull;
if (_layerRoot) then {
	_item105 = createVehicle ["RRP_Wall_G_C_01",[23526.3,18357,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item105;
	_objects pushback _this;
	_objectIDs pushback 105;
	_this setPosWorld [23526.3,18357,8.19001];
	_this setVectorDirAndUp [[0.0127983,-0.999918,0],[0,0,1]];
};

private _item106 = objNull;
if (_layerRoot) then {
	_item106 = createVehicle ["RRP_Wall_G_C_03",[23536.3,18327.2,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item106;
	_objects pushback _this;
	_objectIDs pushback 106;
	_this setPosWorld [23536.3,18327.2,8.18813];
	_this setVectorDirAndUp [[-0.999928,0.0120017,0],[0,0,1]];
};

private _item107 = objNull;
if (_layerRoot) then {
	_item107 = createVehicle ["RRP_Wall_G_C_03",[23479.2,18346.4,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item107;
	_objects pushback _this;
	_objectIDs pushback 107;
	_this setPosWorld [23479.2,18346.4,8.18813];
	_this setVectorDirAndUp [[-0.0151546,-0.999885,0],[0,0,1]];
};

private _item108 = objNull;
if (_layerRoot) then {
	_item108 = createVehicle ["RRP_Wall_G_C_03",[23505.6,18297.9,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item108;
	_objects pushback _this;
	_objectIDs pushback 108;
	_this setPosWorld [23505.6,18297.9,8.18813];
	_this setVectorDirAndUp [[0.0203747,0.999792,0],[0,0,1]];
};

private _item109 = objNull;
if (_layerRoot) then {
	_item109 = createVehicle ["RRP_Wall_G_C_03",[23477.7,18328.7,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item109;
	_objects pushback _this;
	_objectIDs pushback 109;
	_this setPosWorld [23477.7,18328.7,8.18813];
	_this setVectorDirAndUp [[-0.0210998,-0.999777,0],[0,0,1]];
};

private _item111 = objNull;
if (_layerRoot) then {
	_item111 = createVehicle ["RRP_Wall_G_C_03",[23446,18299.4,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item111;
	_objects pushback _this;
	_objectIDs pushback 111;
	_this setPosWorld [23446,18299.4,8.18813];
	_this setVectorDirAndUp [[0.0310703,0.999517,0],[0,0,1]];
};

private _item112 = objNull;
if (_layerRoot) then {
	_item112 = createVehicle ["RRP_Wall_G_C_03",[23458.8,18319.7,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item112;
	_objects pushback _this;
	_objectIDs pushback 112;
	_this setPosWorld [23458.8,18319.7,8.18813];
	_this setVectorDirAndUp [[-0.0442071,-0.999022,0],[0,0,1]];
};

private _item113 = objNull;
if (_layerRoot) then {
	_item113 = createVehicle ["RRP_Wall_G_C_01",[23494.6,18308.5,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item113;
	_objects pushback _this;
	_objectIDs pushback 113;
	_this setPosWorld [23494.6,18308.5,8.19001];
	_this setVectorDirAndUp [[-0.99992,0.0126697,0],[0,0,1]];
};

private _item114 = objNull;
if (_layerRoot) then {
	_item114 = createVehicle ["RRP_Wall_G_C_01",[23499.8,18308.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item114;
	_objects pushback _this;
	_objectIDs pushback 114;
	_this setPosWorld [23499.8,18308.7,8.19001];
	_this setVectorDirAndUp [[-0.0048712,-0.999988,0],[0,0,1]];
};

private _item115 = objNull;
if (_layerRoot) then {
	_item115 = createVehicle ["RRP_Wall_G_C_03",[23385.9,18301.9,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item115;
	_objects pushback _this;
	_objectIDs pushback 115;
	_this setPosWorld [23385.9,18301.9,8.18813];
	_this setVectorDirAndUp [[0.0539822,0.998542,0],[0,0,1]];
};

private _item116 = objNull;
if (_layerRoot) then {
	_item116 = createVehicle ["RRP_Wall_G_C_03",[23446.6,18495.8,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item116;
	_objects pushback _this;
	_objectIDs pushback 116;
	_this setPosWorld [23446.6,18495.8,8.18813];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item117 = objNull;
if (_layerRoot) then {
	_item117 = createVehicle ["RRP_Wall_G_C_01",[23408.4,18496,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item117;
	_objects pushback _this;
	_objectIDs pushback 117;
	_this setPosWorld [23408.4,18496,6.47652];
	_this setVectorDirAndUp [[-0.999935,0.0113733,0],[0,0,1]];
};

private _item118 = objNull;
if (_layerRoot) then {
	_item118 = createVehicle ["RRP_Wall_G_C_03",[23357.6,18333.8,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item118;
	_objects pushback _this;
	_objectIDs pushback 118;
	_this setPosWorld [23357.6,18333.8,8.18813];
	_this setVectorDirAndUp [[0.998827,-0.0484118,0],[0,0,1]];
};

private _item119 = objNull;
if (_layerRoot) then {
	_item119 = createVehicle ["RRP_Wall_G_C_01",[23372,18330.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item119;
	_objects pushback _this;
	_objectIDs pushback 119;
	_this setPosWorld [23372,18330.3,8.19001];
	_this setVectorDirAndUp [[-0.997883,0.0650409,0],[0,0,1]];
};

private _item120 = objNull;
if (_layerRoot) then {
	_item120 = createVehicle ["RRP_Wall_G_C_02",[23414.7,18330.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item120;
	_objects pushback _this;
	_objectIDs pushback 120;
	_this setPosWorld [23414.7,18330.3,8.16355];
	_this setVectorDirAndUp [[-0.0471175,-0.998889,0],[0,0,1]];
};

private _item121 = objNull;
if (_layerRoot) then {
	_item121 = createVehicle ["RRP_Wall_G_C_01",[23395.1,18328.9,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item121;
	_objects pushback _this;
	_objectIDs pushback 121;
	_this setPosWorld [23395.1,18328.9,8.19001];
	_this setVectorDirAndUp [[0.998059,-0.0622827,0],[0,0,1]];
};

private _item122 = objNull;
if (_layerRoot) then {
	_item122 = createVehicle ["RRP_Wall_G_C_01",[23382,18312.4,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item122;
	_objects pushback _this;
	_objectIDs pushback 122;
	_this setPosWorld [23382,18312.4,8.19001];
	_this setVectorDirAndUp [[0.997123,-0.0757979,0],[0,0,1]];
};

private _item123 = objNull;
if (_layerRoot) then {
	_item123 = createVehicle ["RRP_Wall_G_C_01",[23405.6,18310.9,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item123;
	_objects pushback _this;
	_objectIDs pushback 123;
	_this setPosWorld [23405.6,18310.9,8.19001];
	_this setVectorDirAndUp [[-0.996446,0.0842302,0],[0,0,1]];
};

private _item124 = objNull;
if (_layerRoot) then {
	_item124 = createVehicle ["RRP_Wall_G_C_01",[23419.1,18319.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item124;
	_objects pushback _this;
	_objectIDs pushback 124;
	_this setPosWorld [23419.1,18319.6,8.19001];
	_this setVectorDirAndUp [[0.996005,-0.089299,0],[0,0,1]];
};

private _item125 = objNull;
if (_layerRoot) then {
	_item125 = createVehicle ["RRP_Wall_G_C_02",[23448.1,18310,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item125;
	_objects pushback _this;
	_objectIDs pushback 125;
	_this setPosWorld [23448.1,18310,8.16355];
	_this setVectorDirAndUp [[0.0339241,0.999424,0],[0,0,1]];
};

private _item126 = objNull;
if (_layerRoot) then {
	_item126 = createVehicle ["RRP_Wall_G_C_01",[23469.5,18329.2,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item126;
	_objects pushback _this;
	_objectIDs pushback 126;
	_this setPosWorld [23469.5,18329.2,8.19001];
	_this setVectorDirAndUp [[0.998618,-0.0525588,0],[0,0,1]];
};

private _item127 = objNull;
if (_layerRoot) then {
	_item127 = createVehicle ["RRP_Wall_G_C_03",[23368.6,18444.1,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item127;
	_objects pushback _this;
	_objectIDs pushback 127;
	_this setPosWorld [23368.6,18444.1,8.18813];
	_this setVectorDirAndUp [[-0.998836,0.0482348,0],[0,0,1]];
};

private _item129 = objNull;
if (_layerRoot) then {
	_item129 = createVehicle ["RRP_Wall_G_C_03",[23387.1,18505.9,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item129;
	_objects pushback _this;
	_objectIDs pushback 129;
	_this setPosWorld [23387.1,18505.9,8.18813];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item130 = objNull;
if (_layerRoot) then {
	_item130 = createVehicle ["RRP_Wall_G_C_03",[23447.4,18505.8,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item130;
	_objects pushback _this;
	_objectIDs pushback 130;
	_this setPosWorld [23447.4,18505.8,8.18813];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item131 = objNull;
if (_layerRoot) then {
	_item131 = createVehicle ["RRP_Wall_G_C_03",[23507.7,18505.8,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item131;
	_objects pushback _this;
	_objectIDs pushback 131;
	_this setPosWorld [23507.7,18505.8,8.18813];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item132 = objNull;
if (_layerRoot) then {
	_item132 = createVehicle ["RRP_Wall_G_C_02",[23538.7,18505.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item132;
	_objects pushback _this;
	_objectIDs pushback 132;
	_this setPosWorld [23538.7,18505.8,8.16355];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item133 = objNull;
if (_layerRoot) then {
	_item133 = createVehicle ["RRP_Wall_G_C_03",[23558.1,18475.7,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item133;
	_objects pushback _this;
	_objectIDs pushback 133;
	_this setPosWorld [23558.1,18475.7,8.18813];
	_this setVectorDirAndUp [[0.999938,-0.0110919,0],[0,0,1]];
};

private _item134 = objNull;
if (_layerRoot) then {
	_item134 = createVehicle ["RRP_Wall_G_C_03",[23557.7,18416.2,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item134;
	_objects pushback _this;
	_objectIDs pushback 134;
	_this setPosWorld [23557.7,18416.2,8.18813];
	_this setVectorDirAndUp [[0.999993,-0.00371364,0],[0,0,1]];
};

private _item135 = objNull;
if (_layerRoot) then {
	_item135 = createVehicle ["RRP_Wall_G_C_03",[23557.5,18360,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item135;
	_objects pushback _this;
	_objectIDs pushback 135;
	_this setPosWorld [23557.5,18360,8.18813];
	_this setVectorDirAndUp [[0.999982,-0.0060078,0],[0,0,1]];
};

private _item136 = objNull;
if (_layerRoot) then {
	_item136 = createVehicle ["RRP_Wall_G_C_03",[23556.8,18317.6,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item136;
	_objects pushback _this;
	_objectIDs pushback 136;
	_this setPosWorld [23556.8,18317.6,8.18813];
	_this setVectorDirAndUp [[0.999637,-0.0269549,0],[0,0,1]];
};

private _item137 = objNull;
if (_layerRoot) then {
	_item137 = createVehicle ["RRP_Wall_G_C_03",[23526,18288.4,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item137;
	_objects pushback _this;
	_objectIDs pushback 137;
	_this setPosWorld [23526,18288.4,8.18813];
	_this setVectorDirAndUp [[-0.0212595,-0.999774,0],[0,0,1]];
};

private _item138 = objNull;
if (_layerRoot) then {
	_item138 = createVehicle ["RRP_Wall_G_C_03",[23355.8,18476.1,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item138;
	_objects pushback _this;
	_objectIDs pushback 138;
	_this setPosWorld [23355.8,18476.1,8.18813];
	_this setVectorDirAndUp [[-0.998929,0.0462672,0],[0,0,1]];
};

private _item139 = objNull;
if (_layerRoot) then {
	_item139 = createVehicle ["RRP_Wall_G_C_03",[23353.1,18416,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item139;
	_objects pushback _this;
	_objectIDs pushback 139;
	_this setPosWorld [23353.1,18416,8.18813];
	_this setVectorDirAndUp [[-0.999216,0.0396015,0],[0,0,1]];
};

private _item140 = objNull;
if (_layerRoot) then {
	_item140 = createVehicle ["RRP_Wall_G_C_03",[23350.2,18356,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item140;
	_objects pushback _this;
	_objectIDs pushback 140;
	_this setPosWorld [23350.2,18356,8.18813];
	_this setVectorDirAndUp [[-0.998249,0.0591472,0],[0,0,1]];
};

private _item141 = objNull;
if (_layerRoot) then {
	_item141 = createVehicle ["RRP_Wall_G_C_01",[23372.6,18486.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item141;
	_objects pushback _this;
	_objectIDs pushback 141;
	_this setPosWorld [23372.6,18486.3,8.19001];
	_this setVectorDirAndUp [[-0.0265651,-0.999647,0],[0,0,1]];
};

private _item142 = objNull;
if (_layerRoot) then {
	_item142 = createVehicle ["RRP_Wall_G_C_01",[23372.3,18496.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item142;
	_objects pushback _this;
	_objectIDs pushback 142;
	_this setPosWorld [23372.3,18496.1,8.19001];
	_this setVectorDirAndUp [[-0.999949,0.0101202,0],[0,0,1]];
};

private _item143 = objNull;
if (_layerRoot) then {
	_item143 = createVehicle ["RRP_Wall_G_C_03",[23466.3,18290,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item143;
	_objects pushback _this;
	_objectIDs pushback 143;
	_this setPosWorld [23466.3,18290,8.18813];
	_this setVectorDirAndUp [[-0.033001,-0.999455,0],[0,0,1]];
};

private _item144 = objNull;
if (_layerRoot) then {
	_item144 = createVehicle ["RRP_Wall_G_C_03",[23406.3,18292.5,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item144;
	_objects pushback _this;
	_objectIDs pushback 144;
	_this setPosWorld [23406.3,18292.5,8.18813];
	_this setVectorDirAndUp [[-0.0467527,-0.998906,0],[0,0,1]];
};

private _item146 = objNull;
if (_layerRoot) then {
	_item146 = createVehicle ["RRP_Wall_G_C_02",[23335.2,18311.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item146;
	_objects pushback _this;
	_objectIDs pushback 146;
	_this setPosWorld [23335.2,18311.3,8.16355];
	_this setVectorDirAndUp [[0.751435,-0.659807,0],[0,0,1]];
};

private _item147 = objNull;
if (_layerRoot) then {
	_item147 = createVehicle ["RRP_Wall_G_C_02",[23361.2,18280.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item147;
	_objects pushback _this;
	_objectIDs pushback 147;
	_this setPosWorld [23361.2,18280.6,8.16355];
	_this setVectorDirAndUp [[0.659659,-0.751565,0],[0,0,1]];
};

private _item148 = objNull;
if (_layerRoot) then {
	_item148 = createVehicle ["Land_Graffiti_01_F",[23357,18303.3,1.98933],[],0,"CAN_COLLIDE"];
	_this = _item148;
	_objects pushback _this;
	_objectIDs pushback 148;
	_this setPosWorld [23357,18303.3,5.16757];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item154 = objNull;
if (_layerRoot) then {
	_item154 = createVehicle ["Land_AncientHead_01_F",[23351.5,18299.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item154;
	_objects pushback _this;
	_objectIDs pushback 154;
	_this setPosWorld [23351.5,18299.7,7.08429];
	_this setVectorDirAndUp [[0.7617,0.64793,0],[0,0,1]];
};

private _item155 = objNull;
if (_layerRoot) then {
	_item155 = createVehicle ["Land_AncientHead_01_F",[23332.8,18301.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item155;
	_objects pushback _this;
	_objectIDs pushback 155;
	_this setPosWorld [23332.8,18301.3,7.08429];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item156 = objNull;
if (_layerRoot) then {
	_item156 = createVehicle ["Land_AncientHead_01_F",[23353.8,18279.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item156;
	_objects pushback _this;
	_objectIDs pushback 156;
	_this setPosWorld [23353.8,18279.3,7.08429];
	_this setVectorDirAndUp [[0.990394,0.138275,0],[0,0,1]];
};

private _item159 = objNull;
if (_layerRoot) then {
	_item159 = createVehicle ["Land_MolonLabe_F",[23463.5,18436.9,0],[],0,"CAN_COLLIDE"];
	_this = _item159;
	_objects pushback _this;
	_objectIDs pushback 159;
	_this setPosWorld [23463.5,18436.9,3.57282];
	_this setVectorDirAndUp [[0.769683,-0.638426,0],[0,0,1]];
};

private _item160 = objNull;
if (_layerRoot) then {
	_item160 = createVehicle ["Land_StoneTanoa_01_F",[23341.5,18290.4,0],[],0,"CAN_COLLIDE"];
	_this = _item160;
	_objects pushback _this;
	_objectIDs pushback 160;
	_this setPosWorld [23341.5,18290.4,3.93026];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item161 = objNull;
if (_layerRoot) then {
	_item161 = createVehicle ["Land_AncientStatue_01_F",[23341.5,18295.1,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item161;
	_objects pushback _this;
	_objectIDs pushback 161;
	_this setPosWorld [23341.5,18295.1,5.154];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item162 = objNull;
if (_layerRoot) then {
	_item162 = createVehicle ["Land_AncientStatue_02_F",[23345.7,18289.4,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item162;
	_objects pushback _this;
	_objectIDs pushback 162;
	_this setPosWorld [23345.7,18289.4,5.19555];
	_this setVectorDirAndUp [[0.99795,0.0640038,0],[0,0,1]];
};

private _item163 = objNull;
if (_layerRoot) then {
	_item163 = createVehicle ["Land_HumanSkeleton_F",[23340.9,18290.7,0.622361],[],0,"CAN_COLLIDE"];
	_this = _item163;
	_objects pushback _this;
	_objectIDs pushback 163;
	_this setPosWorld [23340.9,18290.7,4.05426];
	_this setVectorDirAndUp [[0,1,0],[-0.000845728,0,1]];
};

private _item164 = objNull;
if (_layerRoot) then {
	_item164 = createVehicle ["Land_HumanSkeleton_F",[23341.7,18290,0.623015],[],0,"CAN_COLLIDE"];
	_this = _item164;
	_objects pushback _this;
	_objectIDs pushback 164;
	_this setPosWorld [23341.7,18290,4.05491];
	_this setVectorDirAndUp [[0.961022,-0.276473,-0.000528383],[0.000690285,0.000488281,1]];
};

private _item165 = objNull;
if (_layerRoot) then {
	_item165 = createVehicle ["Land_HumanSkull_F",[23341.8,18291.3,0.654775],[],0,"CAN_COLLIDE"];
	_this = _item165;
	_objects pushback _this;
	_objectIDs pushback 165;
	_this setPosWorld [23341.8,18291.2,3.9662];
	_this setVectorDirAndUp [[0,0.911904,0.410405],[-0.0637252,-0.40957,0.91005]];
};

private _item167 = objNull;
if (_layerRoot) then {
	_item167 = createVehicle ["Land_HumanSkeleton_F",[23440,18442.5,0],[],0,"CAN_COLLIDE"];
	_this = _item167;
	_objects pushback _this;
	_objectIDs pushback 167;
	_this setPosWorld [23440,18442.5,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item168 = objNull;
if (_layerRoot) then {
	_item168 = createVehicle ["Land_HumanSkeleton_F",[23446.8,18437.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item168;
	_objects pushback _this;
	_objectIDs pushback 168;
	_this setPosWorld [23446.8,18437.1,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item169 = objNull;
if (_layerRoot) then {
	_item169 = createVehicle ["Land_HumanSkeleton_F",[23483.7,18407,0],[],0,"CAN_COLLIDE"];
	_this = _item169;
	_objects pushback _this;
	_objectIDs pushback 169;
	_this setPosWorld [23483.7,18407,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item170 = objNull;
if (_layerRoot) then {
	_item170 = createVehicle ["Land_HumanSkeleton_F",[23433.1,18407,7.15256e-007],[],0,"CAN_COLLIDE"];
	_this = _item170;
	_objects pushback _this;
	_objectIDs pushback 170;
	_this setPosWorld [23433.1,18407,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item171 = objNull;
if (_layerRoot) then {
	_item171 = createVehicle ["Land_HumanSkeleton_F",[23416.5,18422.5,7.15256e-007],[],0,"CAN_COLLIDE"];
	_this = _item171;
	_objects pushback _this;
	_objectIDs pushback 171;
	_this setPosWorld [23416.5,18422.5,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item172 = objNull;
if (_layerRoot) then {
	_item172 = createVehicle ["Land_HumanSkeleton_F",[23406.6,18442.9,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item172;
	_objects pushback _this;
	_objectIDs pushback 172;
	_this setPosWorld [23406.6,18442.9,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item173 = objNull;
if (_layerRoot) then {
	_item173 = createVehicle ["Land_HumanSkeleton_F",[23396.5,18472.4,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item173;
	_objects pushback _this;
	_objectIDs pushback 173;
	_this setPosWorld [23396.5,18472.4,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item174 = objNull;
if (_layerRoot) then {
	_item174 = createVehicle ["Land_HumanSkeleton_F",[23507.8,18387.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item174;
	_objects pushback _this;
	_objectIDs pushback 174;
	_this setPosWorld [23507.8,18387.7,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item175 = objNull;
if (_layerRoot) then {
	_item175 = createVehicle ["Land_HumanSkeleton_F",[23503.9,18443.9,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item175;
	_objects pushback _this;
	_objectIDs pushback 175;
	_this setPosWorld [23503.9,18443.9,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item176 = objNull;
if (_layerRoot) then {
	_item176 = createVehicle ["Land_HumanSkeleton_F",[23493.6,18423.4,1.66893e-006],[],0,"CAN_COLLIDE"];
	_this = _item176;
	_objects pushback _this;
	_objectIDs pushback 176;
	_this setPosWorld [23493.6,18423.4,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item177 = objNull;
if (_layerRoot) then {
	_item177 = createVehicle ["Land_HumanSkeleton_F",[23412.9,18501.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item177;
	_objects pushback _this;
	_objectIDs pushback 177;
	_this setPosWorld [23412.9,18501.8,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item178 = objNull;
if (_layerRoot) then {
	_item178 = createVehicle ["Land_HumanSkeleton_F",[23542.5,18501,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item178;
	_objects pushback _this;
	_objectIDs pushback 178;
	_this setPosWorld [23542.5,18501,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item179 = objNull;
if (_layerRoot) then {
	_item179 = createVehicle ["Land_HumanSkeleton_F",[23536.6,18369.2,-7.15256e-007],[],0,"CAN_COLLIDE"];
	_this = _item179;
	_objects pushback _this;
	_objectIDs pushback 179;
	_this setPosWorld [23536.6,18369.2,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item180 = objNull;
if (_layerRoot) then {
	_item180 = createVehicle ["Land_HumanSkeleton_F",[23537.9,18292.4,0],[],0,"CAN_COLLIDE"];
	_this = _item180;
	_objects pushback _this;
	_objectIDs pushback 180;
	_this setPosWorld [23537.9,18292.4,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item181 = objNull;
if (_layerRoot) then {
	_item181 = createVehicle ["Land_HumanSkeleton_F",[23525.1,18471.5,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item181;
	_objects pushback _this;
	_objectIDs pushback 181;
	_this setPosWorld [23525.1,18471.5,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item182 = objNull;
if (_layerRoot) then {
	_item182 = createVehicle ["Land_HumanSkeleton_F",[23504.4,18488.4,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item182;
	_objects pushback _this;
	_objectIDs pushback 182;
	_this setPosWorld [23504.4,18488.4,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item183 = objNull;
if (_layerRoot) then {
	_item183 = createVehicle ["Land_HumanSkeleton_F",[23454.5,18469.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item183;
	_objects pushback _this;
	_objectIDs pushback 183;
	_this setPosWorld [23454.5,18469.3,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item184 = objNull;
if (_layerRoot) then {
	_item184 = createVehicle ["Land_HumanSkeleton_F",[23432.2,18386,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item184;
	_objects pushback _this;
	_objectIDs pushback 184;
	_this setPosWorld [23432.2,18386,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item185 = objNull;
if (_layerRoot) then {
	_item185 = createVehicle ["Land_HumanSkeleton_F",[23448.3,18411.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item185;
	_objects pushback _this;
	_objectIDs pushback 185;
	_this setPosWorld [23448.3,18411.7,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item192 = objNull;
if (_layerRoot) then {
	_item192 = createVehicle ["Land_HumanSkeleton_F",[23365.3,18322.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item192;
	_objects pushback _this;
	_objectIDs pushback 192;
	_this setPosWorld [23365.3,18322.3,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item193 = objNull;
if (_layerRoot) then {
	_item193 = createVehicle ["Land_HumanSkeleton_F",[23451.2,18353.1,0],[],0,"CAN_COLLIDE"];
	_this = _item193;
	_objects pushback _this;
	_objectIDs pushback 193;
	_this setPosWorld [23451.2,18353.1,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item194 = objNull;
if (_layerRoot) then {
	_item194 = createVehicle ["Land_HumanSkeleton_F",[23469.6,18389,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item194;
	_objects pushback _this;
	_objectIDs pushback 194;
	_this setPosWorld [23469.6,18389,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item195 = objNull;
if (_layerRoot) then {
	_item195 = createVehicle ["Land_HumanSkeleton_F",[23421.4,18443.4,0],[],0,"CAN_COLLIDE"];
	_this = _item195;
	_objects pushback _this;
	_objectIDs pushback 195;
	_this setPosWorld [23421.4,18443.4,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item196 = objNull;
if (_layerRoot) then {
	_item196 = createVehicle ["Land_HumanSkeleton_F",[23376.3,18475.2,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item196;
	_objects pushback _this;
	_objectIDs pushback 196;
	_this setPosWorld [23376.3,18475.2,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item197 = objNull;
if (_layerRoot) then {
	_item197 = createVehicle ["Land_HumanSkeleton_F",[23396.3,18498,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item197;
	_objects pushback _this;
	_objectIDs pushback 197;
	_this setPosWorld [23396.3,18498,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item198 = objNull;
if (_layerRoot) then {
	_item198 = createVehicle ["Land_HumanSkeleton_F",[23516.7,18483.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item198;
	_objects pushback _this;
	_objectIDs pushback 198;
	_this setPosWorld [23516.7,18483.6,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item199 = objNull;
if (_layerRoot) then {
	_item199 = createVehicle ["Land_HumanSkeleton_F",[23545,18461.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item199;
	_objects pushback _this;
	_objectIDs pushback 199;
	_this setPosWorld [23545,18461.7,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item200 = objNull;
if (_layerRoot) then {
	_item200 = createVehicle ["Land_HumanSkeleton_F",[23525.6,18420.8,0],[],0,"CAN_COLLIDE"];
	_this = _item200;
	_objects pushback _this;
	_objectIDs pushback 200;
	_this setPosWorld [23525.6,18420.8,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item201 = objNull;
if (_layerRoot) then {
	_item201 = createVehicle ["Land_HumanSkeleton_F",[23528.3,18349.2,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item201;
	_objects pushback _this;
	_objectIDs pushback 201;
	_this setPosWorld [23528.3,18349.2,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item202 = objNull;
if (_layerRoot) then {
	_item202 = createVehicle ["Land_HumanSkeleton_F",[23551.6,18294,0],[],0,"CAN_COLLIDE"];
	_this = _item202;
	_objects pushback _this;
	_objectIDs pushback 202;
	_this setPosWorld [23551.6,18294,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item203 = objNull;
if (_layerRoot) then {
	_item203 = createVehicle ["Land_HumanSkeleton_F",[23419.9,18356.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item203;
	_objects pushback _this;
	_objectIDs pushback 203;
	_this setPosWorld [23419.9,18356.6,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item204 = objNull;
if (_layerRoot) then {
	_item204 = createVehicle ["Land_HumanSkeleton_F",[23383,18406.2,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item204;
	_objects pushback _this;
	_objectIDs pushback 204;
	_this setPosWorld [23383,18406.2,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item205 = objNull;
if (_layerRoot) then {
	_item205 = createVehicle ["Land_HumanSkeleton_F",[23421.6,18493,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item205;
	_objects pushback _this;
	_objectIDs pushback 205;
	_this setPosWorld [23421.6,18493,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item206 = objNull;
if (_layerRoot) then {
	_item206 = createVehicle ["Land_HumanSkeleton_F",[23438.4,18483.2,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item206;
	_objects pushback _this;
	_objectIDs pushback 206;
	_this setPosWorld [23438.4,18483.2,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item207 = objNull;
if (_layerRoot) then {
	_item207 = createVehicle ["Land_HumanSkeleton_F",[23475.1,18501.3,0],[],0,"CAN_COLLIDE"];
	_this = _item207;
	_objects pushback _this;
	_objectIDs pushback 207;
	_this setPosWorld [23475.1,18501.3,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item208 = objNull;
if (_layerRoot) then {
	_item208 = createVehicle ["Land_HumanSkeleton_F",[23362.3,18380.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item208;
	_objects pushback _this;
	_objectIDs pushback 208;
	_this setPosWorld [23362.3,18380.6,3.4319];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
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

private _item189 = objNull;
if (_layerRoot) then {
	_item189 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleEffectsSmoke_F",[23341.6,18290.7,0],[],0,"CAN_COLLIDE"];
	_this = _item189;
	_logics pushback _this;
	_logicIDs pushback 189;
	_this setPosWorld [23341.6,18290.7,3.17814];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this setVariable ['ColorRed',0.7,true];;
	_this setVariable ['ColorGreen',0.1,true];;
	_this setVariable ['ColorBlue',0.4,true];;
	_this setVariable ['ColorAlpha',0.5,true];;
	_this setVariable ['Timeout',0,true];;
	_this setVariable ['EffectSize',5,true];;
	_this setVariable ['ParticleDensity',10,true];;
	_this setVariable ['ParticleLifeTime',30,true];;
	_this setVariable ['ParticleSize',1,true];;
	_this setVariable ['Expansion',1,true];;
	_this setVariable ['ParticleSpeed',1,true];;
	_this setVariable ['ParticleLifting',1,true];;
	_this setVariable ['WindEffect',1,true];;
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
if !(isNull _item189) then {_item189 setvariable ["BIS_fnc_initModules_activate",true];};


///////////////////////////////////////////////////////////////////////////////////////////
[[_objects,_groups,_triggers,_waypoints,_logics,_markers],[_objectIDs,_groupIDs,_triggerIDs,_waypointIDs,_logicIDs,_markerIDs]]
