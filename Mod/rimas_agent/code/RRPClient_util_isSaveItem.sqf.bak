private ["_ret","_notSavedItemsList"];
_notSavedItemsList = getArray(missionConfigFile >> "limitedItensSetting" >> "not_saved_items");

_ret = switch (typeName _this) do {
    case ("STRING"): {
        if !(_this in _notSavedItemsList) then {_this} else {""};
    };

    case ("ARRAY"): {
        _ret = [];
        {
            if !(_x in _notSavedItemsList) then {_ret pushBack _x};
        } forEach _this;
        _ret
    };

    default {_this};
};

_ret
