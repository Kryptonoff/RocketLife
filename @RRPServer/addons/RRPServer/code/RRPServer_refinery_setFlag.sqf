/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/
params [
  ["_var", "", [""]],
  ["_license", "", [""]]
];

private ["_flags","_banners","_texture"];

(switch (_var) do {
    case ("ref1"): {[[flag_ref_1_1,flag_ref_1_2,flag_ref_1_3,flag_ref_1_4],[banner_ref1_1,banner_ref1_2]]};
    case ("ref2"): {[[flag_ref_2_1,flag_ref_2_2,flag_ref_2_3,flag_ref_2_4],[banner_ref2_1,banner_ref2_2]]};
    case ("ref3"): {[[flag_ref_3_1,flag_ref_3_2,flag_ref_3_3,flag_ref_3_4],[banner_ref3_1,banner_ref3_2]]};
    case ("ref4"): {[[flag_ref_4_1,flag_ref_4_2,flag_ref_4_3,flag_ref_4_4],[banner_ref4_1,banner_ref4_2]]};
}) params ["_flags","_banners"];

{
	private _name = configName _x;
	if (_license isEqualTo _name) exitWith {
        _texture = getText(_x >> "flagTexture");
    }
}foreach ("true" configClasses (missionConfigFile >> "CfgGroups" >> "PremiumGroups"));


{_x setObjectTextureGlobal [0, _texture]} forEach _banners;
{_x setFlagTexture _texture} forEach _flags;
