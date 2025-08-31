# Cases

## RRPServer_case_add
Чтобы добавить кейс игроку

```sqf
[
    uid,         // Целевой игрок
    "caseType",     // Тип кейса
    30              // Срок годности истечет через столько то дней
] call RRPServer_case_add;
```

[
    getPlayerUID player,         
    "caseType",     
    30              
] call RRPServer_fnc_case;