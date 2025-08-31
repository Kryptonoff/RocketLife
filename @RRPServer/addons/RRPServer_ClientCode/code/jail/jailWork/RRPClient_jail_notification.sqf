if !(isNil "Jail_work_toilet") then {
    private ["_pos","_text"];
    _pos = Jail_work_toilet modelToWorldVisual [0,0,0];
    _text = "Туалет";
    drawIcon3D [
     "a3\ui_f\data\map\mapcontrol\waypoint_ca.paa",
     [1,1,1,1],
     [(_pos select 0),(_pos select 1),((_pos select 2) + 0.6)],
     1,
     1,
     0,
     _text,
     2,
     0.038,
     "RobotoCondensedBold",
     "center",
     true
  ];
};

if !(isNil "diving_point") then {
    private ["_pos","_text"];
    _pos = diving_point modelToWorldVisual [0,0,0];
    _text = "Иследуйте это место";
    drawIcon3D [
     "a3\ui_f\data\map\mapcontrol\waypoint_ca.paa",
     [1,1,1,1],
     [(_pos select 0),(_pos select 1),((_pos select 2) + 0.6)],
     1,
     1,
     0,
     _text,
     2,
     0.038,
     "RobotoCondensedBold",
     "center",
     true
  ];
};
