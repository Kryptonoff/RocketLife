
if (count RRPClientGroupInfo isEqualTo 0) exitWith {false};
if ((RRPClientGroupInfo get "premialVar") isNotEqualTo "none") exitWith {true};
false