params [
    ["_idDoc",-1,[-1]]
];

{
    if (_x # 0 isEqualTo _idDoc) exitWith {
        life_documentsData deleteAt _forEachIndex;
    };
} forEach life_documentsData;
