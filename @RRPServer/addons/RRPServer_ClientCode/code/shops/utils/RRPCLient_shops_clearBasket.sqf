/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

switch (_this) do {
    case ("cloth"): {
        RRPClothingBasket = [];
        call RRPClient_system_updateBasket;
    };

    case ("items"): {
        RRPWeaponBasket = [];
        call RRPClient_weapon_updateBasket;
    };
};
