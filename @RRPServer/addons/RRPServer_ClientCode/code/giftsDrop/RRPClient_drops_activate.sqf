/*
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

[getPlayerUID player, netId _this] remoteExecCall ["RRPServer_drops_activateGift", 2];
["InfoTitleOnly",["Открываем подарок..."]] call SmartClient_gui_toaster_addTemplateToast;
// playMusic "NYIntro";
