[] spawn {
    progress = 0.5;
    addMissionEventHandler
    [
    "Draw3D",
        {
            for "_i" from 0 to progress*360 do
            {
                drawIcon3D ["A3\ui_f\data\map\VehicleIcons\iconexplosiveat_ca.paa", [1,1,0,1], (AGLToASL positionCameraToWorld [0 + 1000* sin (_i),0+ 1000* cos (_i),50000] ) ,1,1,360,"",0, 0.1,"EtelkaMonospacePro"]
            }
        }
    ];
}
