
if (enableTags AND !(player getVariable ["RRPVariablePartyMeatActive",false])) then
{
  if (diag_tickTime - RRPClientLastDrawTag >= 0.01) then
  {
    RRPClientLastDrawTag = diag_tickTime;
    private ["_drawRadius","_nearPlayers","_scale"];
    _drawRadius = 15;
    _nearPlayers = ((cameraOn nearEntities[['Man'], _drawRadius]) - [cameraOn, vehicle cameraOn]);
    if (_nearPlayers isNotEqualTo []) then {
      {
        _c = profileNamespace getVariable ["PRNS_TagsColors",[1, 0, 0.27, 1]];
        _distanceForPlayer = player distance2D _x;
        _pos = _x modelToWorldVisual (_x selectionPosition "head");
        _scale = 1 + (( 0.7 /_drawRadius) * _distanceForPlayer);

        if (_x getVariable ["tf_isSpeaking",false] && {!life_inwarzone} && {!(isObjectHidden _x)}) then
        {
          _wave = format["\rimas_agent\assets\soundwave\soundwave%1.paa",floor(random(10))];
          drawIcon3D [_wave,[1,1,1,((_c select 3 + 0.35) -((1 / _drawRadius) * _distanceForPlayer))],[(_pos select 0),(_pos select 1),((_pos select 2) + 0.6)],1/_scale,1/_scale,0,"",2,0.038/_scale,"RobotoCondensedBold","center",true];
        };

        _idx = [(getPlayerUID _x),life_ids] call RRPClient_system_index;
        if (
            (_idx isNotEqualTo -1) OR
            { (_x in (units group player)) } OR
            { (_x in (RRPClientGroupInfo call RRPClient_groups_getMembers)) }
        ) then {
        private _playerTag = _x getVariable ["playerTags",[]];
        _playerTag params [
          ["_icon", "", [""]],
          ["_rank", "", [""]],
          ["_title", "", [""]],
          ["_oraganization", "", [""]]
        ];
        _type = if (_idx isNotEqualTo -1) then {(life_ids select _idx) param [2,-1]}else{3};

        if !(_playerTag isEqualTo []) then
        {
            private ["_distanceForPlayer","_name","_pos","_c"];
            _icon = if !(_icon isEqualTo "default") then {getText (missionConfigFile >> "playerTags" >> "icons" >> _icon >> "icon")} else {""};
            _title = if !(_title isEqualTo "default") then {getText (missionConfigFile >> "playerTags" >> "Title" >> _title >> "title")} else {""};
            _name = switch(_type) do
            {
              case 1: {_x call getNickName};
              case 2: {_x call getFullName};
              default {_x call getNickFullName};
            };
            _c = profileNamespace getVariable ["PRNS_TagsColors",[1, 0, 0.27, 1]];
            _distanceForPlayer = player distance2D _x;
            _pos = _x modelToWorldVisual (_x selectionPosition "head");
            _scale = 1 + (( 0.7 /_drawRadius) * _distanceForPlayer);
            if (_distanceForPlayer < 7) then {
              drawIcon3D [_icon,[1,1,1,((_c select 3 + 0.35) -( (1 / _drawRadius) * _distanceForPlayer))],[(_pos select 0),(_pos select 1),((_pos select 2) + 0.6)],1/_scale,1/_scale,0,
              if (_oraganization isNotEqualTo "" && {_type isNotEqualTo 1}) then {(format ["%1 %2",([(format ["«%1» ",_rank]),_rank] select (_rank isEqualTo "")),_oraganization])} else {""},
              2,0.038/_scale,"RobotoCondensedBold","center",true];
            };
            drawIcon3D ["",[_c select 0,_c select 1,_c select 2, ((_c select 3 + 0.35) - (( 1/_drawRadius) * _distanceForPlayer))],[(_pos select 0),(_pos select 1),((_pos select 2) + 0.55)],1.2/_scale,1.2/_scale,0,(([(format ["«%1» ",_title]),_title] select (_title isEqualTo "")) + _name),2,0.05/_scale,"RobotoCondensedBold","center",true];
          };
        };

        /* if (_x getVariable ["RRPVariablePartyMeatActive",false]) then {
            _distanceForPlayer = player distance2D _x;
            _pos = _x modelToWorldVisual (_x selectionPosition "head");
            _scale = 1 + (( 0.7 /_drawRadius) * _distanceForPlayer);
            if (_distanceForPlayer < 7 AND _x getVariable ["RRPVariablePartyMeatRespawn",false]) then {
              drawIcon3D ["",[1,1,1,((_c select 3 + 0.35) -( (1 / _drawRadius) * _distanceForPlayer))],[(_pos select 0),(_pos select 1),((_pos select 2) + 0.6)],1/_scale,1/_scale,0,
            };
        } */

      } forEach _nearPlayers;
    };
  };
};
