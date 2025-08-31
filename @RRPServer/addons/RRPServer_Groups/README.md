# Organizations

Struct hash map of groups 

client `RRPClientGroupInfo`

server `ServerGroupInfo_%1` where %1 is GroupID variable on player

Map:
```golang
"name":     string
"leader":   string uid
"deputys":  array uids
"slots":  int 
"premialVar": string // ("none" for non premial groups) 
"ranks":  array [[1, "rank",[/* Permission Array */]]] 
"tfar":   array [50,50]
"bank":   int 
"ally":   array // unused
"members": array [[uid, name]] 
"markers": array 
"polys": array 
"massage_day": array 
"side": string
"payed": bool
```

### Functions

```
RRPClient_groups_util_getRankName 
Получить название актуального ранга
Вызов только на стороне клиента

_rank = call RRPClient_groups_util_getRankName;
```

```
RRPClient_groups_util_permCheck
Проверить есть ли разрешение на выполнение действия
Вызов только на стороне клиента
Возвращает bool если разрешение есть

"withdraw" call RRPClient_groups_util_permCheck
```

```
RRPClient_groups_util_getPlayerName
Вернуть имя игрока, полезно если пользователь организации оффлайн
Вызывать где угодно
Возвращает строку с именем
Требует в аргументы HashMap данных организации и UID необходимого пользователя

[RRPClientGroupInfo, _uid] call RRPClient_groups_util_getPlayerName
```

```
RRPClient_groups_util_count_players
Посчитать количество онлайн игроков организации.

GroupID call RRPClient_groups_util_count_players
```