/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    License: cc by-nc-nd
*/

params [
  ["_mode","",[""]],
  ["_switch",0,[0,false]]
];


if (_switch isEqualType false) then {_switch = parseNumber _switch};

private _text = "";
switch (_mode) do
{
    case "tags"  : {
      enableTags = [true,false] select (_switch isEqualTo 0);
      profileNamespace setVariable ["RRPSetting_enableTags",enableTags];
    };
    case "grass" : {
      enableGrass = [true,false] select (_switch isEqualTo 0);
      setterrainGrid ([50,25] select enableGrass);
      profileNamespace setVariable ["RRPSetting_enableGrass",enableGrass];
      ["tree",1] call RRPClient_ach_gateway;
    };
    case "sound" : {
      enableSoundAmbient = [true,false] select (_switch isEqualTo 0);
      enableEnvironment [true, enableSoundAmbient];
      profileNamespace setVariable ["RRPSetting_enableSoundAmbient",enableSoundAmbient];
    };
    // TODO
    case "music": {
      if (_switch isEqualTo 1) then
      {
        call FT_fnc_musicInitialize;
      } else {
        playMusic "";
        if (!isNil "MusicLoop") then {[MusicLoop] call RRPClient_system_thread_removeTask};
      };
      life_music = [true,false] select (_switch isEqualTo 0);
      ["life_music", str (parseNumber life_music)] call RRPClient_reg_write;
    };
    case "HUD": {
      if (_switch isEqualTo 1) then
      {
        true call RRPClient_hud_show;
      } else {
        false call RRPClient_hud_show;
      };
      enableHUD = [true,false] select (_switch isEqualTo 0);
      profileNamespace setVariable ["RRPSetting_HUD",enableHUD];
    };
    case "OpenApp":
    {
      openApp = [true,false] select (_switch isEqualTo 0);
      profileNamespace setVariable ["RRPSetting_OpenApp",openApp];
    };
    case "SaveBinds":
    {
      life_saveBind = [true,false] select (_switch isEqualTo 0);
      ["life_saveBind", str (parseNumber life_saveBind)] call RRPClient_reg_write;
    };
    case "ShowHotkeys":
    {
      life_showWeaponHud = [true,false] select (_switch isEqualTo 0);
      [life_showWeaponHud] call RRPClient_hotkeys_hudWeaponHide;
      ["life_showWeaponHud", str (parseNumber life_showWeaponHud)] call RRPClient_reg_write;
    };
    case "ShowCaseTimer":
    {
      life_showCaseTimer = [true,false] select (_switch isEqualTo 0);
      ((uiNamespace getVariable ["playerHUD",displayNull]) displayCtrl 23100) ctrlShow life_showCaseTimer;
      ["life_showCaseTimer", str (parseNumber life_showCaseTimer)] call RRPClient_reg_write;
    };
    case "WelcomeScreen":
    {
      life_welcomeScreen = [true,false] select (_switch isEqualTo 0);
      ["life_welcomeScreen", str (parseNumber life_welcomeScreen)] call RRPClient_reg_write;
    };
    case "stream":
    {
      life_streamerMode = [true,false] select (_switch isEqualTo 0);
      ["life_streamerMode", str (parseNumber life_streamerMode)] call RRPClient_reg_write;
    };
};
saveProfileNamespace;
