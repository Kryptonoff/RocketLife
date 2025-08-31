/*
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/
params ['_display', '_xPos', '_yPos','_ctrlposition','_PriceScale','_rotation','_pos','_y'];
if (isActiveRotation) then {
  _pos = getMousePosition;
  _PriceScale = 360/1000;
  _y = (_pos select 1);
  rotationn = round((_y * _PriceScale) * 1000);

  if (_y > 1) then {
    _y = (_pos select 1) - (floor(_pos select 1))
  };

  if ( abs(ClickEveryDegree - rotationn) >= 1) then {
    playSound 'click'; ClickEveryDegree = rotationn
  };

  if !(isNull (uiNamespace getVariable ["ctrlArrow",displayNull])) then {
      uiNamespace getVariable ["ctrlArrow",displayNull] ctrlSetAngle [rotationn, 0.5, 0.5];
    };
};
