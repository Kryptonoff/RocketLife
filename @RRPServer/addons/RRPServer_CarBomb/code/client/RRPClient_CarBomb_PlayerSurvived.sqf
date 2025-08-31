_varData =
[
    3
];
CarBambVehicle setVariable ['CarBomb', _varData, true];
CarBombCountDownTimer cutText ["", "PLAIN"];
BombIsActivated = false;
player setVariable ["BombCarVictim",0,true];
terminate CarBombCountdownThread;
[
    "hell","","","",false,
    [
        [
            "Выжил!",
            [
                format ["Поздравляем, %1!",player call getFullName],
                format ["Ты можешь забрать свою **%1** в тайнике!",getText(configOf CarBambVehicle >> "displayName")]
            ] joinString "\n",
            "",
            "00FF3E",false,"","",[],[]
        ]
    ]
]call sendDs;
_msg = Format["Поздравляем! Вы выжили и теперь эта машина доступна в вашем тайнике!"];
["InfoTitleAndText", ["Бомба деактивирована!", _msg]] call SmartClient_gui_toaster_addTemplateToast;
[
	"__SERVER__", 
	[
		getPlayerUID player, 
		[
			typeOf CarBambVehicle
		]
	]
] remoteExecCall ["RRPServer_rewards_addRewardsRequest",2];
[500,"выживание"] call addXP;
