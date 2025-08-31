 private ["_shop", "_type", "_items"]; 
 _shop = param [0, "", [""]]; 
 _type = param [1, "", [""]]; 
 
  _bundleItems = { 
    private _res = []; 
    { 
      _bundle = _x; 
      if (isClass(missionConfigFile >> "secret_shop_items_groups" >> _bundle)) then  
      { 

        { 
 
          _category = _x; 
          if (isClass(missionConfigFile >> "secret_shop_items" >> _category)) then { 
            if (getText(missionConfigFile >> "secret_shop_items" >> _category >> "shop") isEqualTo _shop &&  
                {(getText(missionConfigFile >> "secret_shop_items" >> _category >> "type") isEqualTo _type)}) then  
            { 
              { 
                _item = _x; 
                _res pushBack _item; 
              } forEach getArray(missionConfigFile >> "secret_shop_items" >> _category >> "items"); 
            }; 
          }; 
           
        } forEach (getArray(missionConfigFile >> "secret_shop_items_groups" >> _bundle >> "items")); 
 
      }; 
    } forEach secretShop; 
    _res 
  }; 
 
 _items = []; 
 { 
  if (isClass(missionConfigFile >> "secret_shop_items" >> _x)) then { 
   if (getText(missionConfigFile >> "secret_shop_items" >> _x >> "shop") isEqualTo _shop && (getText(missionConfigFile >> "secret_shop_items" >> _x >> "type") isEqualTo _type)) then { 
    { 
     _items pushBack _x 
    } forEach getArray(missionConfigFile >> "secret_shop_items" >> _x >> "items"); 
   }; 
  } else { 
   _b = call _bundleItems; 
   if (_b isNotEqualTo []) then { 
     _items = _items + _b; 
   }; 
  }; 
 } forEach secretShop; 
 
 _items 
