params [
  ["_UID", "", [""]],
  ["_netID", "", [""]]
];

try {
  if (_UID isEqualTo "") throw "bad param UID";
  if (_netID isEqualTo"") throw "bad param netID";

  private _obj = objectFromNetId _netID;
  if (isNull _obj) throw "object null";

  private _varObj = _obj getVariable ["rrpobj_gift_infolist",[]];
  if (_varObj isEqualTo []) throw "bad variable in object!";
  _varObj params ["_id", "_indexPosition"];

  (format["getGift:%1",_id] call RRPServer_DB_selectSingle) params ["_typeGift","_gift"];
  if (_typeGift isEqualTo "prem_cloth") then 
  {
    _i = format ["getSecretShopItem:%1:%2",_UID,_gift] call RRPServer_DB_selectSingleField;
    _i call RRPServer_util_debugConsole;
    if (_i isNotEqualTo "") then 
    {
      [_typeGift,_gift,true] remoteExecCall ["RRPClient_drops_sortingGifts",remoteExecutedOwner];
      throw "Уже есть этот предмет";
    };
  };
  
  deleteVehicle _obj;
  private _ignorePos = profileNamespace getVariable ["pnsvar_gifts_drop_ignore_pos",[]];
  _ignorePos pushBack _indexPosition;
  profileNamespace setVariable ["pnsvar_gifts_drop_ignore_pos",_ignorePos];
  saveProfileNamespace;
  
  [format ["PARAMS: %1 %2 %3", _typeGift,_gift,(_typeGift in ["car",
    "rc",
    "money",
    "vip1",
    "vip2",
    "vip3",
    "vip4",
    "prem_cloth"])],"dropDrop"] call RRPServer_system_logIt;


  format ["activateGift:%1:%2",_UID,_id] call RRPServer_DB_fireAndForget;
  [format ["SUCCESS: %1 activated gift", _UID],"dropDrop"] call RRPServer_system_logIt;

  if (_typeGift isEqualTo "" OR {!(_typeGift in [
    "car",
    "rc",
    "money",
    "vip1",
    "vip2",
    "vip3",
    "vip4",
    "prem_cloth"
  ])}) throw (format ["bad type, id:",_id]);
  [format ["SUCCESS: %1 get gift", _UID],"dropDrop"] call RRPServer_system_logIt;

  call {
    if (_typeGift isEqualTo "car") exitWith {
      [ 
        "__SERVER__",  
        [ 
          _UID,  
          [ 
            _gift
          ] 
        ] 
      ] call RRPServer_rewards_addRewardsRequest;
    };  
    if (_typeGift isEqualTo "rc") exitWith {
      [ 
        "__SERVER__",  
        [ 
          _UID,  
          [ 
            ["Points",parseNumber(_gift)] 
          ] 
        ] 
      ] call RRPServer_rewards_addRewardsRequest;

    };  
    if (_typeGift isEqualTo "money") exitWith {
      [ 
        "__SERVER__",  
        [ 
          _UID,  
          [ 
            ["RRPAtm",parseNumber(_gift)] 
          ] 
        ] 
      ] call RRPServer_rewards_addRewardsRequest;
    };  
    if (_typeGift isEqualTo "vip1") exitWith {
      [ 
        "__SERVER__",  
        [ 
          _UID,  
          [ 
            ["vip1",parseNumber(_gift)] 
          ] 
        ] 
      ] call RRPServer_rewards_addRewardsRequest;
    };  
    if (_typeGift isEqualTo "vip2") exitWith {
      [ 
        "__SERVER__",  
        [ 
          _UID,  
          [ 
            ["vip2",parseNumber(_gift)] 
          ] 
        ] 
      ] call RRPServer_rewards_addRewardsRequest;
    };  
    if (_typeGift isEqualTo "vip3") exitWith {
      [ 
        "__SERVER__",  
        [ 
          _UID,  
          [ 
            ["vip3",parseNumber(_gift)] 
          ] 
        ] 
      ] call RRPServer_rewards_addRewardsRequest;
    };  
    if (_typeGift isEqualTo "vip4") exitWith {
      [ 
        "__SERVER__",  
        [ 
          _UID,  
          [ 
            ["vip4",parseNumber(_gift)] 
          ] 
        ] 
      ] call RRPServer_rewards_addRewardsRequest;
    };
    if (_typeGift isEqualTo "prem_cloth") exitWith {
      format ["addSecretShopItems:%1:%2",_UID,_gift] call RRPServer_DB_insertSingle;
    };
    ""
  };
  [_typeGift,_gift] remoteExecCall ["RRPClient_drops_sortingGifts",remoteExecutedOwner];
} catch {
  [format ["ERROR: %1 | ",_exception,_UID],"dropDrop"] call RRPServer_system_logIt;
};
