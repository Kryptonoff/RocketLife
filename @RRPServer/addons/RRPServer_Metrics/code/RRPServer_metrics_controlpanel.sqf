params[['_mode', 'auth', ['']], ['_data', [], [[]]]];
if (_mode isEqualTo '') exitWith {};
private _sender = allPlayers select {
    (owner _x) isEqualTo remoteExecutedOwner
};
if (_sender isEqualTo[]) exitWith {};
_sender = _sender select 0;
private _senderUID = getPlayerUID _sender;
private _isAdmin = (admin remoteExecutedOwner) > 0;
if (!_isAdmin) exitWith {};
private _fnc_controlPanelUI = {
    private _display = findDisplay 49;
    ctrlDelete(_display getVariable['idleText', controlNull]);
    if (isNull _display) exitWith {};
    private _display = findDisplay 49;
    private _scaleFactorCtrlH = (getResolution select 1) / 1080;
    private _scaleFactorCtrlW = (getResolution select 0) / 1920;
    _scaleFactorCtrlH = _scaleFactorCtrlH * 1;
    _scaleFactorCtrlW = _scaleFactorCtrlW * 1;
    private _pW = parseNumber(((pixelW * 5) * _scaleFactorCtrlW) toFixed 3);
    private _pH = parseNumber(((pixelH * 5) * _scaleFactorCtrlH) toFixed 3);
    private _scaleFactorText = 1 / (getResolution select 5);
    private _txtSizeXH = 1.3 * _scaleFactorText;
    private _fontXH = "PuristaBold";
    private _txtSizeNumeric = 0.85 * _scaleFactorText;
    private _txtSizeH = 0.75 * _scaleFactorText;
    private _fontH = "PuristaBold";
    private _txtSizeM = 0.65 * _scaleFactorText;
    private _fontM = "PuristaMedium";
    private _txtSizeS = 0.55 * _scaleFactorText;
    private _fontS = "PuristaLight";
    private _txtSizeXS = 0.45 * _scaleFactorText;
    private _hO = 0.5;
    private _wO = 0;
    private _backgroundColor = [(profilenamespace getvariable['GUI_BCG_RGB_R', 0]), (profilenamespace getvariable['GUI_BCG_RGB_G', 1]), (profilenamespace getvariable['GUI_BCG_RGB_B', 1]), (profilenamespace getvariable['GUI_BCG_RGB_A', 0.8])];
    _backgroundColor params['_bR', '_bG', '_bB', '_bA'];
    private _title = _display ctrlCreate['RscStructuredText', -1];
    _title ctrlSetPosition[0.79 * safezoneW + safezoneX, 0.10 * safezoneH + safezoneY, 0.20 * safezoneW, 5 * _pH];
    _title ctrlSetStructuredText(parseText format["<t size='%1' font='%2'>Diagnostic Control Panel</t>", _txtSizeM * 0.8, _fontM]);
    _title ctrlSetBackgroundColor _backgroundColor;
    _title ctrlSetTextColor[1, 1, 1, 1];
    _title ctrlCommit 0;
    private _mainGroup = _display ctrlCreate['RscControlsGroupNoHScrollbars', -1];
    _mainGroup ctrlSetPosition[0.79 * safezoneW + safezoneX, (0.10 * safezoneH + safezoneY) + (5 * _pH), 0.20 * safezoneW, (0.845 * safezoneH) - (5 * _pH)];
    _mainGroup ctrlCommit 0;
    (ctrlPosition _mainGroup) params['_mX', '_mY', '_mW', '_mH'];
    private _fnc_makeButton = {
        params['_group', '_position', '_text', '_function', ['_call', false]];
        private _ctrl = [_group, -1, _position, format[' %1', toUpper _text], _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0.8]] call RRPClient_gui_util_makeStructuredText;
        _ctrl ctrlEnable true;
        _ctrl setVariable['function', _function];
        _ctrl setVariable['titleText', _text];
        _ctrl setVariable['call', _call];
        _ctrl ctrlAddEventHandler['mouseEnter', {
            params['_ctrl'];
            _ctrl ctrlSetBackgroundColor[1, 1, 1, 0.8];
            (_ctrl getVariable["format", []]) params["_size", "_color", "_align", "_font", "_shadow"];
            _ctrl ctrlSetStructuredText(parseText format["<t shadow='%6' font='%5' align='%4' size='%2' color='%3'>%1</t>", ctrlText _ctrl, _size, "#000000", _align, _font, _shadow]);
        }];
        _ctrl ctrlAddEventHandler['mouseExit', {
            params['_ctrl'];
            _ctrl ctrlSetBackgroundColor[0, 0, 0, 0.8];
            (_ctrl getVariable["format", []]) params["_size", "_color", "_align", "_font", "_shadow"];
            _ctrl ctrlSetStructuredText(parseText format["<t shadow='%6' font='%5' align='%4' size='%2' color='%3'>%1</t>", ctrlText _ctrl, _size, "#FFFFFF", _align, _font, _shadow]);
        }];
        _ctrl ctrlAddEventHandler['MouseButtonDown', {
            params['_ctrl'];
            private _call = _ctrl getVariable['call', false];
            playSound 'readoutClick';
            private _function = {
                params['_ctrl'];
                private _display = findDisplay 49;
                private _scaleFactorCtrlH = (getResolution select 1) / 1080;
                private _scaleFactorCtrlW = (getResolution select 0) / 1920;
                _scaleFactorCtrlH = _scaleFactorCtrlH * 1;
                _scaleFactorCtrlW = _scaleFactorCtrlW * 1;
                private _pW = parseNumber(((pixelW * 5) * _scaleFactorCtrlW) toFixed 3);
                private _pH = parseNumber(((pixelH * 5) * _scaleFactorCtrlH) toFixed 3);
                private _scaleFactorText = 1 / (getResolution select 5);
                private _txtSizeXH = 1.3 * _scaleFactorText;
                private _fontXH = "PuristaBold";
                private _txtSizeNumeric = 0.85 * _scaleFactorText;
                private _txtSizeH = 0.75 * _scaleFactorText;
                private _fontH = "PuristaBold";
                private _txtSizeM = 0.65 * _scaleFactorText;
                private _fontM = "PuristaMedium";
                private _txtSizeS = 0.55 * _scaleFactorText;
                private _fontS = "PuristaLight";
                private _txtSizeXS = 0.45 * _scaleFactorText;
                private _hO = 0;
                private _wO = 0;
                private _backgroundColor = [(profilenamespace getvariable['GUI_BCG_RGB_R', 0]), (profilenamespace getvariable['GUI_BCG_RGB_G', 1]), (profilenamespace getvariable['GUI_BCG_RGB_B', 1]), (profilenamespace getvariable['GUI_BCG_RGB_A', 0.8])];
                private _fnc_makeButton = _display getVariable['Var_fnc_makeButton', {}];
                private _fnc_createSecondaryGroup = 
                {
                    params['_width', '_height'];
                    private _title = _ctrl getVariable['titleText', ''];
                    ctrlDelete(_display getVariable['secondaryGroup', controlNull]);
                    private _secondaryGroup = _display ctrlCreate['RscControlsGroupNoHScrollbars', -1];
                    _secondaryGroup ctrlSetPosition[(0.79 - _width - 0.005) * safezoneW + safezoneX, 0.10 * safezoneH + safezoneY, _width * safezoneW, _height * safezoneH];
                    _secondaryGroup ctrlCommit 0;
                    (ctrlPosition _secondaryGroup) params['_gX', '_gY', '_gW', '_gH'];
                    _display setVariable['secondaryGroup', _secondaryGroup];
                    private _titleCtrl = [_secondaryGroup, -1, [0, 0, _gW - (8 * _pW), 5 * _pH], format[' %1', toUpper _title], _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", _backgroundColor] call RRPClient_gui_util_makeStructuredText;
                    [_titleCtrl, _secondaryGroup] call RRPClient_gui_util_extendedUI;
                    private _closeBut = [_secondaryGroup, -1, [_gW - (8 * _pW), 0, 8 * _pW, 5 * _pH], "[X]", _fontS, _txtSizeM * 0.8, "center", "#FFFFFF", "0", _backgroundColor] call RRPClient_gui_util_makeStructuredText;
                    _closeBut ctrlEnable true;
                    _closeBut ctrlAddEventHandler['MouseButtonDown', {
                        params['_ctrl'];
                        private _group = ctrlParentControlsGroup _ctrl;
                        playSound "readoutClick";
                        _group spawn {
                            ctrlDelete _this
                        };
                    }];
                    private _activeGroup = _display ctrlCreate['RscControlsGroupNoHScrollbars', -1, _secondaryGroup];
                    _activeGroup ctrlSetPosition[0, 5 * _pH, _gW, _gH - (5 * _pH)];
                    _activeGroup ctrlCommit 0;
                    (ctrlPosition _activeGroup) params['_gX', '_gY', '_gW', '_gH'];
                    _activeGroup
                };
                call(_ctrl getVariable['function', {}]);
            };
            if (_call) then {
                _ctrl call _function
            } else {
                _ctrl spawn _function
            };
        }];
        _hO = _hO + 5.5;
        _ctrl
    };
    _display setVariable['Var_fnc_makeButton', _fnc_makeButton];
    [_mainGroup, [_wO * _pW, _hO * _pH, _mW, 5 * _pH], 'Installed Products', 
    {
        private _activeGroup = [0.29, 0.835] call _fnc_createSecondaryGroup;
        (ctrlPosition _activeGroup) params['_gX', '_gY', '_gW', '_gH'];
        ['products'] remoteExecCall['RRPServer_metrics_controlpanel', 2];
        waitUntil {
            !((_display getVariable['modsInfo', []]) isEqualTo[]) OR isNull _display
        };
        private _modsinfo = _display getVariable['modsInfo', []];
        private _boxSize = 21; {
            _x params['_modname', '_modversion', '_allowed', '_latestVersion', '_updateDate', '_updateDescription'];
            private _color = [0.3, 0.3, 0.3, 0.2];
            [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW, _boxSize * _pH], '', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0.8]] call RRPClient_gui_util_makeStructuredText;
            [_activeGroup, -1, [(_wO + 2) * _pW, (_hO + 3) * _pH, _gW, _boxSize * _pH], format['%1', _modname], _fontM, _txtSizeM * 0.8, "left", "#FFFFFF", "1", [0, 0, 0, 0]] call RRPClient_gui_util_makeStructuredText;
            [_activeGroup, -1, [_wO * _pW, _hO * _pH, 1 * _pW, _boxSize * _pH], '', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "1", [1, 1, 0, 1]] call RRPClient_gui_util_makeStructuredText;
            if (_allowed) then {
                private _versionColor =
                    if (_modversion isEqualTo _latestVersion) then {
                        "#FFFFFF"
                    } else {
                        "#FFC618"
                    };
                    [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW - (2 * _pW), _boxSize * _pH], format['Current Version: %1<br/>Latest Version: %2', _modversion, _latestVersion], _fontS, _txtSizeM * 0.8, "right", _versionColor, "0", [0, 0, 0, 0]] call RRPClient_gui_util_makeStructuredText;
                [_activeGroup, -1, [(_wO + 2) * _pW, (_hO + _boxSize - 10) * _pH, _gW - (4 * _pW), 10 * _pH], format['Last update: %1<br/>%2', _updateDate, _updateDescription], _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0]] call RRPClient_gui_util_makeStructuredText;
            } else {
                [_activeGroup, -1, [(_wO + 2) * _pW, (_hO + _boxSize - 10) * _pH, _gW - (4 * _pW), 10 * _pH], format['Error 100<br/>Addon is not permitted'], _fontS, _txtSizeM * 0.8, "left", "#FF0000", "0", [0, 0, 0, 0]] call RRPClient_gui_util_makeStructuredText;
            };
            _hO = _hO + 1 + _boxSize;
        }
        forEach _modsinfo;
    }] call _fnc_makeButton;
    [_mainGroup, [_wO * _pW, _hO * _pH, _mW, 5 * _pH], 'Player Statistics', {
        private _activeGroup = [0.29, 0.835] call _fnc_createSecondaryGroup;
        (ctrlPosition _activeGroup) params['_gX', '_gY', '_gW', '_gH'];
        ['players'] remoteExecCall['RRPServer_metrics_controlpanel', 2];
        waitUntil {
            !((_display getVariable['connectionLog', []]) isEqualTo[]) OR isNull _display
        };
        private _connectionLog = _display getVariable['connectionLog', []];
        private _uniqueVisitors = _display getVariable['uniqueVisitors', 0];
        private _playersPeak = _display getVariable['playersPeak', 0];
        private _totalConnections = count(_connectionLog select {
            _x select 2
        });
        private _boxSize = 5;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW - (12 * _pW), _boxSize * _pH], ' Total Connections', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0.8]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_gW - (12 * _pW), _hO * _pH, 12 * _pW, _boxSize * _pH], str _totalConnections, _fontS, _txtSizeM * 0.8, "center", "#FFFFFF", "0", [0.2, 0.2, 0.2, 1]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, 1 * _pW, _boxSize * _pH], '', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "1", [1, 1, 0, 1]] call RRPClient_gui_util_makeStructuredText;
        _hO = _hO + _boxSize + 0.5;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW - (12 * _pW), _boxSize * _pH], ' Unique Visitors', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0.8]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_gW - (12 * _pW), _hO * _pH, 12 * _pW, _boxSize * _pH], str _uniqueVisitors, _fontS, _txtSizeM * 0.8, "center", "#FFFFFF", "0", [0.2, 0.2, 0.2, 1]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, 1 * _pW, _boxSize * _pH], '', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "1", [1, 1, 0, 1]] call RRPClient_gui_util_makeStructuredText;
        _hO = _hO + _boxSize + 0.5;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW - (12 * _pW), _boxSize * _pH], ' Players Peak', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0.8]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_gW - (12 * _pW), _hO * _pH, 12 * _pW, _boxSize * _pH], str _playersPeak, _fontS, _txtSizeM * 0.8, "center", "#FFFFFF", "0", [0.2, 0.2, 0.2, 1]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, 1 * _pW, _boxSize * _pH], '', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "1", [1, 1, 0, 1]] call RRPClient_gui_util_makeStructuredText;
        _hO = _hO + _boxSize + 0.5;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW, _boxSize * _pH], ' Connection Logs', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0.8]] call RRPClient_gui_util_makeStructuredText;
        _hO = _hO + _boxSize;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW, _gH - (_hO * _pH)], '', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0.7]] call RRPClient_gui_util_makeStructuredText;
        private _activityList = [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW, _gH - (_hO * _pH) - (_boxSize * _pH)], _fontM, _txtSizeM, [0, 0, 0, 0.8]] call RRPClient_gui_util_makeList;
        _display setVariable['activityList', _activityList];
        reverse _connectionLog; {
            _x params['_name', '_uid', '_type', '_time', ['_data', []]];
            private _color =
                if (_type) then {
                    "#(argb,8,8,3)color(0,1,0,1)"
                } else {
                    "#(argb,8,8,3)color(1,0,0,1)"
                };
            _activityList lbAdd format['%1: %2 (%3)', _time, _name, _uid];
            _activityList lbSetPicture[lbSize _activityList - 1, _color];
            if !(_data isEqualTo[]) then {
                _data params['_variables', '_loadout', '_position', '_mapgrid'];
                _activityList lbSetTextRight[lbSize _activityList - 1, "[?]"];
                _activityList lbSetTooltip[lbSize _activityList - 1, format['Variables:\n%1\nLoadout:\n%2\nPosition: %3 (%4)', _variables, _loadout, _position, _mapgrid]];
                _activityList lbSetData[lbSize _activityList - 1, str _data];
            };
        }
        forEach _connectionLog;
        private _copyGear = [_activeGroup, -1, [_wO * _pW, _gH - (_boxSize * _pH), _gW / 2, _boxSize * _pH], 'COPY GEAR', "true;", _fontM, _txtSizeM] call RRPClient_gui_util_makeSimpleButton;
        private _goto = [_activeGroup, -1, [_wO * _pW + _gW / 2, _gH - (_boxSize * _pH), _gW / 2, _boxSize * _pH], 'GOTO POSITION', "true;", _fontM, _txtSizeM] call RRPClient_gui_util_makeSimpleButton;
        _copyGear ctrlAddEventHandler['ButtonClick', {
            params['_ctrl'];
            playSound "readoutClick";
            private _display = ctrlParent _ctrl;
            private _activityList = _display getVariable['activityList', controlNull];
            private _data = call compile(_activityList lbData(lbCurSel _activityList));
            if (isNil {
                    _data
                }) exitWith {};
            _data params['', '_loadout'];
            player setUnitLoadout _loadout;
            true
        }];
        _goto ctrlAddEventHandler['ButtonClick', {
            params['_ctrl'];
            playSound "readoutClick";
            private _display = ctrlParent _ctrl;
            private _activityList = _display getVariable['activityList', controlNull];
            private _data = call compile(_activityList lbData(lbCurSel _activityList));
            if (isNil {
                    _data
                }) exitWith {};
            _data params['', '', '_position'];
            player setPos _position;
            true
        }];
    }] call _fnc_makeButton;
    [_mainGroup, [_wO * _pW, _hO * _pH, _mW, 5 * _pH], 'Server Health', {
        private _activeGroup = [0.50, 0.6] call _fnc_createSecondaryGroup;
        (ctrlPosition _activeGroup) params['_gX', '_gY', '_gW', '_gH'];
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW, _gH], '', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0.8]] call RRPClient_gui_util_makeStructuredText;
        ['serverhealth'] remoteExecCall['RRPServer_metrics_controlpanel', 2];
        waitUntil {
            !((_display getVariable['CPSTimeline', []]) isEqualTo[]) OR isNull _display
        };
        private _boxSize = 5;
        private _timeLine = _display getVariable['CPSTimeline', []];
        private _firstMile = _timeLine select 0;
        private _lastMile = _timeLine select(count _timeLine - 1);
        private _milesCount = count _timeline;
        _firstMile params['', '_timeMin'];
        _lastMile params['', '_timeMax'];
        private _graphH = 28;
        private _graphW = _gW - (8 * _pW);
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW, _boxSize * _pH], '(CPS) Statistics', _fontS, _txtSizeM * 0.8, "center", "#FFFFFF", "0", [0, 0, 0, 0]] call RRPClient_gui_util_makeStructuredText;
        _hO = _hO + _boxSize + 2;
        _hO = _hO + 1;
        _hO = _hO + 5;
        private _CPSAxis = [_activeGroup, -1, [_wO * _pW, _hO * _pH, 8 * _pW, _graphH * _pH], format['50<br/>40<br/>30<br/>20<br/>10<br/>0'], _fontS, _txtSizeM * 0.8, "center", "#FFFFFF", "0", [0, 0, 0, 0]] call RRPClient_gui_util_makeStructuredText;
        _wO = _wO + 8;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, 0.5 * _pW, (_graphH + (_graphH / 5)) * _pH], '', _fontS, _txtSizeM * 0.8, "left", "#9E9E9E", "0", [1, 1, 1, 1]] call RRPClient_gui_util_makeStructuredText;
        _wO = _wO + 0.5;
        private _graphField = _display ctrlCreate['RscControlsGroupNoHScrollbars', -1, _activeGroup];
        _graphField ctrlSetPosition[_wO * _pW, ctrlPosition _CPSAxis select 1, _gW - (_wO * _pW) - (2 * _pW), _graphH * _pH];
        _graphField ctrlCommit 0;
        (ctrlPosition _graphField) params['_dX', '_dY', '_dW', '_dH'];
        _hO = _hO + _graphH;
        [_activeGroup, -1, [0, _hO * _pH, _gW - (2 * _pW), 0.5 * _pH], '', _fontS, _txtSizeM * 0.8, "left", "#9E9E9E", "0", [1, 1, 1, 1]] call RRPClient_gui_util_makeStructuredText;
        _hO = _hO + 0.5;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _dW, (_graphH / 5) * _pH], format['%1', round _timeMin], _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _dW, (_graphH / 5) * _pH], format['%1', round((_timeMin + _timeMax) / 2)], _fontS, _txtSizeM * 0.8, "center", "#FFFFFF", "0", [0, 0, 0, 0]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _dW, (_graphH / 5) * _pH], format['%1', round _timeMax], _fontS, _txtSizeM * 0.8, "right", "#FFFFFF", "0", [0, 0, 0, 0]] call RRPClient_gui_util_makeStructuredText;
        _hO = _hO + (_graphH / 5);
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _dW, _graphH * _pH], 'Time (seconds)', _fontS, _txtSizeM * 0.8, "center", "#FFFFFF", "0", [0, 0, 0, 0]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_wO * _pW, (_boxSize + 2 + 1) * _pH, _dW, _graphH * _pH], 'CPS', _fontS, _txtSizeM * 0.8, "center", "#FFFFFF", "0", [0, 0, 0, 0]] call RRPClient_gui_util_makeStructuredText;
        _hO = _hO + _boxSize + 2;
        private _mileWidth = _dW / _milesCount;
        private _yScale = _dH / 50;
        private _xScale = _dW / (_timeMax - _timeMin); {
            _x params['_cps', '_time'];
            private _yP = (0 + ((50 - _cps) * _yScale)) min(_dH * 0.95);
            private _xP = (_dW - ((_timeMax - _time) * _xScale)) max 0;
            private _mile = [_graphField, -1, [_xP, _yP, _mileWidth * 1.1, _yScale], '', _fontS, _txtSizeM * 0.8, "center", "#FFFFFF", "0", [0, 1, 0, 1]] call RRPClient_gui_util_makeStructuredText;
            _mile ctrlEnable true;
            _mile ctrlSetTooltip format['%1 CPS (%2)', _cps, _time];
        }
        forEach _timeLine;
        _wO = 0;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW, _boxSize * _pH], ' Active Server Threads', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0.8]] call RRPClient_gui_util_makeStructuredText;
        _hO = _hO + _boxSize;
        private _scripts = _display getVariable['activeScripts', []];
        private _scriptList = [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW, _gH - (_hO * _pH)], _fontM, _txtSizeM, [0, 0, 0, 0.8]] call RRPClient_gui_util_makeList; 
        {
            _x params['_scriptname', '_filename', '_running', '_line'];
            private _textRight =
                if (_running) then {
                    "Active"
                } else {
                    "Suspended"
                };
            _scriptList lbAdd format['Line %1: %2 (%3)', _line, _scriptname, _filename];
            _scriptList lbSetTextRight[lbSize _scriptList - 1, '   ' + _textRight];
            _scriptList lbSetTooltip[lbSize _scriptList - 1, str _x];
        }
        forEach _scripts;
        ctrlSetFocus _graphField;
    }] call _fnc_makeButton;
    [_mainGroup, [_wO * _pW, _hO * _pH, _mW, 5 * _pH], 'Maintenance', {
        private _activeGroup = [0.2, 0.3] call _fnc_createSecondaryGroup;
        (ctrlPosition _activeGroup) params['_gX', '_gY', '_gW', '_gH'];
        [_activeGroup, [_wO * _pW, _hO * _pH, _gW, 5 * _pH], 'Lock Server', {
            serverCommand "#lock"
        }, true] call _fnc_makeButton;
        [_activeGroup, [_wO * _pW, _hO * _pH, _gW, 5 * _pH], 'Unlock Server', {
            serverCommand "#unlock"
        }, true] call _fnc_makeButton;
        [_activeGroup, [_wO * _pW, _hO * _pH, _gW, 5 * _pH], 'Shutdown Server', {
            serverCommand "#shutdown"
        }, true] call _fnc_makeButton;
    }, true] call _fnc_makeButton;
    [_mainGroup, [_wO * _pW, _hO * _pH, _mW, 5 * _pH], 'Objects', {
        private _activeGroup = [0.25, 0.835] call _fnc_createSecondaryGroup;
        (ctrlPosition _activeGroup) params['_gX', '_gY', '_gW', '_gH'];
        private _boxSize = 5;
        private _npcs = (allMissionObjects "CAManBase") select {
            !isPlayer _x
        };
        private _animals = allMissionObjects "Animal";
        private _vehicles = vehicles select {
            (_x isKindOf "Air") OR(_x isKindOf "LandVehicle") OR(_x isKindOf "Ship")
        };
        private _static = vehicles select {
            !(_x isKindOf "Air") OR!(_x isKindOf "LandVehicle") OR!(_x isKindOf "Ship") OR!(_x isKindOf "Building")
        };
        private _buildings = (allMissionObjects "Building") select {
            !(_x isKindOf "Ruins_F")
        };
        private _ruins = allMissionObjects "Ruins_F";
        private _trash = (allMissionObjects "GroundWeaponHolder") + (allMissionObjects "GroundWeaponHolderSimulated");
        private _totalCount = count _npcs + count _animals + count _vehicles + count _static + count _buildings + count _ruins + count _trash;
        private _allMissionObjects = allMissionObjects "All";
        private _everythingElse = count _allMissionObjects - _totalCount;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW - (12 * _pW), _boxSize * _pH], ' Players groups', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0.8]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_gW - (12 * _pW), _hO * _pH, 12 * _pW, _boxSize * _pH], str(count allGroups), _fontS, _txtSizeM * 0.8, "center", "#FFFFFF", "0", [0.2, 0.2, 0.2, 1]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, 1 * _pW, _boxSize * _pH], '', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "1", [1, 1, 0, 1]] call RRPClient_gui_util_makeStructuredText;
        _hO = _hO + _boxSize + 0.5;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW - (12 * _pW), _boxSize * _pH], ' NPC Units', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0.8]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_gW - (12 * _pW), _hO * _pH, 12 * _pW, _boxSize * _pH], str(count _npcs), _fontS, _txtSizeM * 0.8, "center", "#FFFFFF", "0", [0.2, 0.2, 0.2, 1]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, 1 * _pW, _boxSize * _pH], '', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "1", [1, 1, 0, 1]] call RRPClient_gui_util_makeStructuredText;
        _hO = _hO + _boxSize + 0.5;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW - (12 * _pW), _boxSize * _pH], ' Animals', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0.8]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_gW - (12 * _pW), _hO * _pH, 12 * _pW, _boxSize * _pH], str(count _animals), _fontS, _txtSizeM * 0.8, "center", "#FFFFFF", "0", [0.2, 0.2, 0.2, 1]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, 1 * _pW, _boxSize * _pH], '', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "1", [1, 1, 0, 1]] call RRPClient_gui_util_makeStructuredText;
        _hO = _hO + _boxSize + 0.5;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW - (12 * _pW), _boxSize * _pH], ' Vehicles', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0.8]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_gW - (12 * _pW), _hO * _pH, 12 * _pW, _boxSize * _pH], str(count _vehicles), _fontS, _txtSizeM * 0.8, "center", "#FFFFFF", "0", [0.2, 0.2, 0.2, 1]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, 1 * _pW, _boxSize * _pH], '', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "1", [1, 1, 0, 1]] call RRPClient_gui_util_makeStructuredText;
        _hO = _hO + _boxSize + 0.5;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW - (12 * _pW), _boxSize * _pH], ' Static objects', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0.8]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_gW - (12 * _pW), _hO * _pH, 12 * _pW, _boxSize * _pH], str(count _static), _fontS, _txtSizeM * 0.8, "center", "#FFFFFF", "0", [0.2, 0.2, 0.2, 1]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, 1 * _pW, _boxSize * _pH], '', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "1", [1, 1, 0, 1]] call RRPClient_gui_util_makeStructuredText;
        _hO = _hO + _boxSize + 0.5;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW - (12 * _pW), _boxSize * _pH], ' Buildings', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0.8]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_gW - (12 * _pW), _hO * _pH, 12 * _pW, _boxSize * _pH], str(count _buildings), _fontS, _txtSizeM * 0.8, "center", "#FFFFFF", "0", [0.2, 0.2, 0.2, 1]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, 1 * _pW, _boxSize * _pH], '', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "1", [1, 1, 0, 1]] call RRPClient_gui_util_makeStructuredText;
        _hO = _hO + _boxSize + 0.5;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW - (12 * _pW), _boxSize * _pH], ' Building Ruins', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0.8]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_gW - (12 * _pW), _hO * _pH, 12 * _pW, _boxSize * _pH], str(count _ruins), _fontS, _txtSizeM * 0.8, "center", "#FFFFFF", "0", [0.2, 0.2, 0.2, 1]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, 1 * _pW, _boxSize * _pH], '', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "1", [1, 1, 0, 1]] call RRPClient_gui_util_makeStructuredText;
        _hO = _hO + _boxSize + 0.5;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW - (12 * _pW), _boxSize * _pH], ' Ground Holders', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0.8]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_gW - (12 * _pW), _hO * _pH, 12 * _pW, _boxSize * _pH], str(count _trash), _fontS, _txtSizeM * 0.8, "center", "#FFFFFF", "0", [0.2, 0.2, 0.2, 1]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, 1 * _pW, _boxSize * _pH], '', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "1", [1, 1, 0, 1]] call RRPClient_gui_util_makeStructuredText;
        _hO = _hO + _boxSize + 0.5;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW - (12 * _pW), _boxSize * _pH], ' Other objects', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0.8]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_gW - (12 * _pW), _hO * _pH, 12 * _pW, _boxSize * _pH], str _everythingElse, _fontS, _txtSizeM * 0.8, "center", "#FFFFFF", "0", [0.2, 0.2, 0.2, 1]] call RRPClient_gui_util_makeStructuredText;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, 1 * _pW, _boxSize * _pH], '', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "1", [1, 1, 0, 1]] call RRPClient_gui_util_makeStructuredText;
        _hO = _hO + _boxSize + 0.5;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW, _boxSize * _pH], ' Objects list (Double click to teleport)', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0.8]] call RRPClient_gui_util_makeStructuredText;
        _hO = _hO + _boxSize;
        [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW, _gH - (_hO * _pH)], '', _fontS, _txtSizeM * 0.8, "left", "#FFFFFF", "0", [0, 0, 0, 0.7]] call RRPClient_gui_util_makeStructuredText;
        private _objectList = [_activeGroup, -1, [_wO * _pW, _hO * _pH, _gW, _gH - (_hO * _pH)], _fontM, _txtSizeM, [0, 0, 0, 0.8]] call RRPClient_gui_util_makeList; 
        {
            _objectList lbAdd(str _x);
            _objectList lbSetData[lbSize _objectList - 1, netId _x];
        }
        forEach _allMissionObjects;
        _objectList ctrlAddEventHandler['LBDblClick', {
            params['_ctrl', '_index'];
            private _netID = _ctrl lbData _index;
            private _object = objectFromNetId _netID;
            if (isNull _object) exitWith {};
            playSound 'readoutClick';
            player setPos(getPos _object);
        }];
    }] call _fnc_makeButton;
    [_mainGroup, [_wO * _pW, _hO * _pH, _mW, 5 * _pH], 'Logout', {
        _display spawn {
            _this closeDisplay 0
        };
        serverCommand "#logout";
    }, true] call _fnc_makeButton;
};
comment "PACKET RECIEVER";
switch (_mode) do {
    case 'log':{
            _data params['_message'];
            private _logs = profileNamespace getVariable['cpLogs', []];
            _logs pushBack format['%1 (%2) %3', name _sender, _senderUID, _message];
            profileNamespace setVariable['cpLogs', _logs];
            saveProfileNamespace;
        };
    case 'auth':{
            private _authList = missionNamespace getVariable['authList', []];
            if !(_senderUID in _authList) then {
                _authList pushBackUnique _senderUID;
                private _logs = profileNamespace getVariable['cpLogs', []];
                _logs pushBack format['%1 (%2) logged in', name _sender, _senderUID];
                profileNamespace setVariable['cpLogs', _logs];
                saveProfileNamespace;
            };
            [
                [_fnc_controlPanelUI], {
                    params['_function'];
                    call _function
                }
            ] remoteExec['spawn', remoteExecutedOwner];
        };
    case 'products':{
            [
                [parsingNamespace getVariable['modsInfo', []]], {
                    params['_modsinfo'];
                    (findDisplay 49) setVariable['modsInfo', _modsinfo];
                }
            ] remoteExec['spawn', remoteExecutedOwner];
        };
    case 'players':{
            [
                [parsingNamespace getVariable['connectionLog', []], parsingNamespace getVariable['uniqueVisitors', []], parsingNamespace getVariable['playersPeak', []]], {
                    params['_connectionLog', '_uniqueVisitors', '_playersPeak'];
                    (findDisplay 49) setVariable['connectionLog', _connectionLog];
                    (findDisplay 49) setVariable['uniqueVisitors', _uniqueVisitors];
                    (findDisplay 49) setVariable['playersPeak', _playersPeak];
                }
            ] remoteExec['spawn', remoteExecutedOwner];
        };
    case 'serverhealth':{
            [
                [parsingNamespace getVariable['CPSTimeline', []], diag_activeSQFScripts], {
                    params['_timeline', '_scripts'];
                    (findDisplay 49) setVariable['CPSTimeline', _timeline];
                    (findDisplay 49) setVariable['activeScripts', _scripts];
                }
            ] remoteExec['spawn', remoteExecutedOwner];
        };
};