RRPClientGroupInfo = createHashMap;
RRPClientGroupAlly = [];

RRPClientSalaryHandler = -1;
RRPClientGroupWaitingResponse = false;
RRPClientGroupLevel = 1;
RRPClientGroupsCurrentSlide = 0;

RRPClientGroupMapIconRenderArray = [];
RRPClientGroupMapIconPreviewArray = [];
RRPClientAllMarkerIcons = getArray (missionConfigFile >> "CfgGroups" >> "Icons");
//onKeyUp
RRPClientLastMapDown = 0;
RRPClientMapPolyMode = false;
RRPClientGroupMapLineCompleated = false;
RRPClientGroupMapLineRenderArray = [];
RRPClientLineLastRenderPos = [0,0,0];
RRPClientMapKeyUpEH = -1;
RRPClientMapPositionClick = [0,0];

RRPClientMapDrawColors =
[
	["Красный",[221/255, 38/255, 38/255, 1]],
	["Синий",[63/255, 212/255, 252/255, 1]],
	["Желтый",[255/255, 180/255, 24/255, 1]],
	["Зеленый",[160/255, 223/255, 59/255, 1]],
	["Серый",[111/255, 113/255, 122/255, 1]],
	["Белый",[1, 1, 1, 1]],
	["Оранжевый",[255/255,153/255,0/255,1]]
];

call RRPClient_groups_salaryHandler;