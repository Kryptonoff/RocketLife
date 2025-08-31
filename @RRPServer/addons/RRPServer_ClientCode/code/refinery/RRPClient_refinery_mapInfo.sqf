/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/

params [
 ["_refControl", objNull, [objNull]]
];
if (isNull _refControl) exitWith {};

[_refControl getVariable ["ref_gang_name", ""],_refControl getVariable ["ref_item", ""]];

private ["_status","_control","_ret","_text","_weapon"];
_status = switch (_refControl getVariable ["ref_status", "Captured"]) do {
    case ("SValve"): {"Захват крана #1..."};
    case ("Machine"): {"Захват крана #2..."};
    case ("RValve"): {"Захват крана #3..."};
    case ("Captured"): {
        if ((_refControl getVariable ["ref_license", ""]) isEqualTo "") then {"Не захвачена"} else {format ["Под контролем «%1»",(_refControl getVariable ["ref_gang_name", ""])]}
    };
};
_control = switch (_refControl getVariable ["ref_item", ""]) do {
    case ("RRP_Cocaine"): {"Кокаином"};
    case ("RRP_Cigarette"): {"Табаком"};
    case ("RRP_Heroin"): {"Маком"};
    case ("RRP_Hemp"): {"Каннабисом"};
};
_text = format ["Захвативший лабораторию получит:<br/>Переработка: - 30%1 времени<br/>Продажа: + 30%1 к цене<br/><br/>А так же каждую бурю в хранилище лаборатории будет добавлятся +100 ресурса","%"];

_weapon = switch (true) do {
    case (_refControl isEqualTo ref1_control): {
        ["srifle_LRR_F",4]
    };

    case (_refControl isEqualTo ref2_control): {
        ["srifle_DMR_05_blk_F",3]
    };

    case (_refControl isEqualTo ref3_control): {
        ["LMG_Zafir_F",2]
    };

    case (_refControl isEqualTo ref4_control): {
        ["launch_RPG32_F",2]
    };
};

_weapon = format ["%1<br/>Количество: %2 шт",([_weapon # 0] call RRPClient_util_itemDetails) # 3,_weapon # 1];

_ret =format ["%1<br/>Контроль над: %2<br/><br/>%3<br/><br/>Эксклюзивное оружие<br/>%4",_status,_control,_text,_weapon];

_ret
