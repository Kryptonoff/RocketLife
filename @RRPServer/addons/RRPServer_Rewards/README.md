# Rewards

```cpp
RRPServer_rewards_addKitRequest
Добавить предварительно настроенный кит, настраивать в class RewardKits конфиге

// от имени сервера
["__SERVER__", [uid, kitName]] call RRPServer_rewards_addKitRequest;
```

```cpp
RRPServer_addRewardRequest
Выдать предметы
/*
    Points = RCredits
    RRPAtm = деньги
    vip1,vip2, vip3, vip4, vip5 = випка, одна выданная випка = 1 день, брать можно на 1 день
*/

// от имени сервера
[
	"__SERVER__", 
	[
		"76561198055124016", // uid
        // массив с предметами
		[
			["Points",1000], // в таком формате можно указать количество предметов для выдачи
            "Item"          // в таком виде добавиться только один предмет
		]
	]
] call RRPServer_rewards_addRewardsRequest;
```
