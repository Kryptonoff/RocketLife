/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "шмотки";
player forceAddUniform selectRandom getArray(missionConfigFile >> "party_meat" >> "uniforms");
player addHeadgear selectRandom getArray(missionConfigFile >> "party_meat" >> "headgear");
player addGoggles selectRandom getArray(missionConfigFile >> "party_meat" >> "goggles");
player addVest selectRandom getArray(missionConfigFile >> "party_meat" >> "vests");
player addBackpack selectRandom getArray(missionConfigFile >> "party_meat" >> "backpacks");

comment "пушки";
private ["_weapon","_weaponInfo","_category","_magazines","_muzzles","_optics","_pointers","_bipods"];
_weapon = selectRandom getArray(missionConfigFile >> "party_meat" >> "randomWeapon");
_weaponInfo = [_weapon] call RRPClient_util_itemDetails;
_category = _weaponInfo # 5;
_magazines = _weaponInfo # 7;
_muzzles = _weaponInfo # 8;
_optics = _weaponInfo # 9;
_pointers = _weaponInfo # 10;
_bipods = _weaponInfo # 11;

player addWeapon _weapon;
switch (_category) do {
    case ("Handgun"): {
        private _magazine = (selectRandom _magazines);
        player addHandgunItem _magazine;
        player addHandgunItem (selectRandom _optics);
        for "_i" from 1 to 10 do {player addItem _magazine;};
    };

    case ("Launcher"): {
        _magazines = (selectRandom _magazines);
        player addHandgunItem _magazines;
        for "_i" from 1 to 2 do {player addItem _magazines;};
    };

    default {
        private _magazine = (selectRandom _magazines);
        player addPrimaryWeaponItem _magazine;
        if ([15] call RRPClient_farm_util_randomizer) then {
            player addPrimaryWeaponItem (selectRandom _muzzles);
        };
        player addPrimaryWeaponItem (selectRandom _pointers);
        player addPrimaryWeaponItem (selectRandom _bipods);
        player addPrimaryWeaponItem (selectRandom _optics);
        for "_i" from 1 to 8 do {player addItem _magazine;};
    };
};

comment "хуйня";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "Itemwatch";


comment "Бинтики";
for "_i" from 1 to 4 do {player addItem "extitem_bandage";};
