/*
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/

if ((count RRPClientMinerVehList > 0)) then {
        {
            private ["_isMiner","_drawRadius","_pos","_distanceForVeh","_scale","_icon"];
            _isMiner = (typeOf _x in getArray(missionConfigFile >> "CfgFarm" >> "minerVehicleList"));
            _drawRadius = 50;
            _pos = _x modelToWorldVisual [0,0,0];
            _distanceForVeh = player distance2D _x;
            _scale = 1 + (( 0.7 /_drawRadius) * _distanceForVeh);

            _icon = if (_isMiner) then {
                switch (round(_x getVariable ["pressure", 1])) do {
                      case (1): {"\RRP_icons\miner\bar1.paa"};
                      case (2): {"\RRP_icons\miner\bar2.paa"};
                      case (3): {"\RRP_icons\miner\bar3.paa"};
                      case (4): {"\RRP_icons\miner\bar4.paa"};
                      case (0): {""};
                      default  {""};
                  }
            } else {""};

             drawIcon3D [
              _icon,
              [1,1,1,((1 + 0.35) - ((1 / _drawRadius) * _distanceForVeh))],
              [(_pos select 0),(_pos select 1),((_pos select 2) + 2.05)],
              1/_scale,
              1/_scale,
              0,
              format["Заполненность: %1/%2 слотов",(_x getVariable ["Trunk",[[],0]] select 1),getNumber(missionConfigFile >> "LifeCfgVehicles" >> typeOf _x >> "vItemSpace")],
              2,
              0.038/_scale,
              "RobotoCondensedBold",
              "center",
              true
           ];

           if (_isMiner) then {
               drawIcon3D [
                "",
                [1,1,1,((1 + 0.35) - ((1 / _drawRadius) * _distanceForVeh))],
                [(_pos select 0),(_pos select 1),((_pos select 2) + 1.85)],
                1/_scale,
                1/_scale,
                0,
                format ["%1%2", round((fuel _x) * 100), "%" ],
                2,
                0.033/_scale,
                "RobotoCondensedBold",
                "center",
                true
             ];
           };
        } forEach RRPClientMinerVehList;
};
