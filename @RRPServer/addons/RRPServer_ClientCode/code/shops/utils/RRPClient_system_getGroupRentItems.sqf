private _itemsList = [];
{
    _x params ["_class","_groupID"];
    if (((player getVariable ["groupID",-1]) isEqualTo _groupID) AND {_this isEqualTo _groupID}) then 
    {
        {
            _x pushBack "groupsItems";
            _itemsList pushBack _x;
        } forEach (getArray(missionConfigFile >> "secret_shop_items" >> _class >> "items"));
    };
} forEach groupRentItemsList;

_itemsList
