/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/

params [
    ["_mode","",[""]],
    ["_amount",1,[1]]
];
private _lvl = call life_donator;

_amount = switch (_mode) do {
    case "illegalNalog":
    {
        switch (_lvl) do {
            case (1): {6};
            case (2): {5};
            case (3): {4};
            case (4): {2};
            case (5): {0};
            default {_amount}
        };
    };
    case ("virtualWeight"): {
        switch (_lvl) do {
            case (1): {_amount + 15};
            case (2): {_amount + 25};
            case (3): {_amount + 35};
            case (4): {_amount + 50};
            case (5): {_amount + 70};
            default {_amount}
        };
    };

    case ("skillXP"): {
        round(switch (_lvl) do {
            case 1: {_amount * 1.25};
            case 2: {_amount * 1.50};
            case 3: {_amount * 1.75};
            case 4: {_amount * 2};
            case 5: {_amount * 2.5};
            default {_amount};
        });
    };

    case ("priceSell"): {
        round(switch (_lvl) do {
            case 1: {(_amount - (_amount * 0.15))};
            case 2: {(_amount - (_amount * 0.25))};
            case 3: {(_amount - (_amount * 0.30))};
            case 4: {(_amount - (_amount * 0.40))};
            case 5: {(_amount - (_amount * 0.60))};
            default {_amount};
        });
    };

    case ("priceUp"): {
        round(switch (_lvl) do {
            case 1: {(_amount + (_amount* 0.05))};
            case 2: {(_amount + (_amount* 0.07))};
            case 3: {(_amount + (_amount* 0.1))};
            case 4: {(_amount + (_amount* 0.15))};
            case 5: {(_amount + (_amount* 0.25))};
            default {_amount};
        });
    };

    case ("saveTimeAction"): {
        round(switch (_lvl) do {
            case 1: {_amount * 0.85};
            case 2: {_amount * 0.75};
            case 3: {_amount * 0.65};
            case 4: {_amount * 0.55};
            case 5: {_amount * 0.4};
            default {_amount};
        })
    };

    case ("garageLimit"): {
        (switch (_lvl) do
        {
        	case 1: {_amount + 6};
        	case 2: {_amount + 12};
        	case 3: {_amount + 18};
        	case 4: {_amount + 25};
        	case 5: {_amount + 35};
        	default {_amount};
        });
    };

    case ("houseLimit"): {
        (switch (_lvl) do
        {
        	case 1: {_amount + 1};
        	case 2: {_amount + 2};
        	case 3: {_amount + 3};
        	case 4: {_amount + 4};
        	case 5: {_amount + 5};
        	default {_amount};
        });
    };

    case ("buffout"): {
        (switch (_lvl) do
        {
            case 1: {5};
            case 2: {6};
            case 3: {7};
            case 4: {8};
            case 5: {10};
            default {_amount};
        });
    };

    case ("illegalNalog"): {
        (switch (_lvl) do
        {
            case 1: {6};
            case 2: {5};
            case 3: {4};
            case 4: {2};
            case 5: {0};
            default {_amount};
        });
    };
    //расход воды и еды на 20% ниже на вип 4 и на 50% на вип5
    case "foodWaterEffect": {
        (switch (_lvl) do
        {
            case 1: {_amount};
            case 2: {_amount};
            case 3: {_amount};
            case 4: {_amount * 0.8};
            case 5: {_amount * 0.5};
            default {_amount};
        });
    };

    case "otherBuffoutEffects" : {
        (switch (_lvl) do
        {
            case 1: {_amount * 1.10};
            case 2: {_amount * 1.15};
            case 3: {_amount * 1.20};
            case 4: {_amount * 1.35};
            case 5: {_amount * 1.5};
            default {_amount};
        });
    };

    case "amountItemsGather" : {
        (switch (_lvl) do
        {
            case 1: {_amount};
            case 2: {_amount};
            case 3: {_amount};
            case 4: {_amount * 2};
            case 5: {_amount * 3};
            default {_amount};
        });
    };

    case "atmComission" : {
        (switch (_lvl) do
        {
            case 1: {16};
            case 2: {12};
            case 3: {8};
            case 4: {5};
            case 5: {0};
            default {_amount};
        });
    };


};


_amount
