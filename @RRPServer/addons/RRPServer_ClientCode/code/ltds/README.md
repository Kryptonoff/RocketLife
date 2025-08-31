# LTDS

Получить локальный ID в переменной
```sqf
    RRPClientLTDsData
     0: ID
     1: Name
     2: Bank
```

Структура глобальной переменной `ltdData_%1`
```sqf
_dataCompany = missionNamespace getVariable [format["ltdData_%1",_id],[]];
_dataCompany params ["_owner","_name","_bank","_members"];
```

## Магазины
Переменные на объект
```sqf
ltdID - int // id в базе данных
ltdName - string // Имя магазина
ltdOwner - int // id компании арендатора
ltdActive - bool // true - открыт, false - нет
ltdLevel - int // уровень магазина, в зависимости от уровня множится количество слотов
ltdRentEnd - time-array // дата окончания аренды
ltdDiscount - int // процент скидки на товары
ltdDiscountEnd - time-array // дата окончания скидки
ltdMode - bool // true - активна реализация товаров, false - только хозяин наполняет магазин
ltdBlacklist - array // массив id компаний которые не могут взаимодействовать с магазином
ltdItems - HashMap // предметы в магазине
    "id_item" // int 
    [
        item_classname, // класс предмета
        price,          // цена
        count,           // сколько осталась
        tax,             // комиссия при поставке на реализацию
        selled_by,       // компания которая продает
        trash,           // в мусоре?
        last_buy_at      // последняя покупка в этом стаке
    ]
```


## АЗС