/*
	Author(s):
	Arrra (original)
	----
	Сontacts:
	SteamID: 76561198090549826
	Discord: merkava#9745
	Mail: dotanchik123@gmail.com
	----
	License:
	cc by-nc-nd
	----
	Description:
*/
private ['_MaskLits','_Goggles','_result'];

_MaskLits = getArray(missionConfigFile >> 'LifeCfgSettings' >> 'illegalMaskList');
_Goggles  = goggles player;

//_result = if (_Goggles in _MaskLits) then {true} else {false};
_result = if (_Goggles in _MaskLits) then {true} else {true};
if !(_result) then {
	["WarningTitleAndText", ["Warning", 'Для начала этого действия вы должны быть в маске, ее можно преобрести в столице бандитов.']] call SmartClient_gui_toaster_addTemplateToast;
};

_result
