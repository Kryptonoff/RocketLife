
0 spawn {
  waitUntil {!isNil "CurrentSeasson"};
  switch (CurrentSeasson) do 
  {
    case "Christmas": 
    {
      "Christmas Seasson spawned" call RRPServer_util_debugConsole;
      [] spawn RRPServer_ambient_ny23;
    };
  };
};

true