/*
0 spawn {
    disableSerialization;
    waitUntil {
        !isNull(findDisplay 46)
    };
    private _fnc_newsFeed = {
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
        private _wO = 0;
        private _hO = 0;
        private _newsData = RRPPublicNews;
        private _backgroundColor = [(profilenamespace getvariable['GUI_BCG_RGB_R', 0]), (profilenamespace getvariable['GUI_BCG_RGB_G', 1]), (profilenamespace getvariable['GUI_BCG_RGB_B', 1]), (profilenamespace getvariable['GUI_BCG_RGB_A', 0.8])];
        _backgroundColor params['_bR', '_bG', '_bB', '_bA'];
        private _textColor = [(profilenamespace getvariable['IGUI_TEXT_RGB_R', 0]), (profilenamespace getvariable['IGUI_TEXT_RGB_G', 1]), (profilenamespace getvariable['IGUI_TEXT_RGB_B', 1]), (profilenamespace getvariable['IGUI_TEXT_RGB_A', 0.8])];
        _textColor params['_tR', '_tG', '_tB', '_tA'];
        private _fnc_createLink = {
            private _ctrl = [_mainGroup, -1, [_wO * _pW, _hO * _pH, _mW, _totalH * _pH], '', _fontS, _txtSizeS * 0.9, 'left', "#8A8A8A", '0', [0, 0, 0, 0]] call RRPClient_gui_util_makeStructuredText;
            _ctrl setVariable['NFLink', _link];
            _ctrl ctrlEnable true;
            _ctrl ctrlAddEventHandler['MouseEnter', {
                params['_ctrl'];
                _ctrl ctrlSetBackgroundColor[1, 1, 1, 0.1];
            }];
            _ctrl ctrlAddEventHandler['MouseExit', {
                params['_ctrl'];
                _ctrl ctrlSetBackgroundColor[0, 0, 0, 0];
            }];
            _ctrl ctrlAddEventHandler['MouseButtonDown', {
                params['_ctrl'];
                playSound 'readoutClick';
                private _link = _ctrl getVariable['NFLink', ''];
                _link spawn {
                    [parseText format["<t>Нажмите <a href='%1'>сюда</a> чтобы перейти по ссылке</t>", _this], "Внешняя ссылка", false, true] call BIS_fnc_guiMessage;
                };
            }];
            _ctrl
        };
        private _fnc_generateNews = {
            params['_title', '_date', '_link', '_icon', '_text'];
            private _innerWO = 0;
            private _innerHO = _hO;
            private _textH = 10;
            private _totalH = 19;
            [_mainGroup, -1, [_innerWO * _pW, _innerHO * _pH, _mW, _totalH * _pH], '', _fontM, _txtSizeM * 0.9, 'left', "#FFFF00", '1', [0.03, 0.03, 0.03, 0.9]] call RRPClient_gui_util_makeStructuredText;
            [_mainGroup, -1, [_innerWO * _pW, (_innerHO + 6) * _pH, 13 * _pW, (_totalH - 12) * _pH], _icon, true, false, [1, 1, 0, 1]] call RRPClient_gui_util_makeStaticPicture;
            _innerWO = _innerWO + 12;
            [_mainGroup, -1, [_innerWO * _pW, _innerHO * _pH, _mW - ((_innerWO + 2) * _pW), 5 * _pH], _title, _fontM, _txtSizeM * 0.9, 'left', "#FFFF00", '1', [0, 0, 0, 0]] call RRPClient_gui_util_makeStructuredText;
            _innerHO = _innerHO + 5;
            [_mainGroup, -1, [_innerWO * _pW, _innerHO * _pH, _mW - ((_innerWO + 4) * _pW), _textH * _pH], _text, _fontM, _txtSizeS * 0.9, 'left', "#FFFFFF", '1', [0, 0, 0, 0]] call RRPClient_gui_util_makeStructuredText;
            _innerHO = _innerHO + _textH - 1;
            [_mainGroup, -1, [_innerWO * _pW, _innerHO * _pH, _mW - ((_innerWO + 4) * _pW), 4 * _pH], _date, _fontS, _txtSizeS * 0.9, 'left', "#8A8A8A", '0', [0, 0, 0, 0]] call RRPClient_gui_util_makeStructuredText;
            private _linkCtrl = call _fnc_createLink;
            _hO = _hO + _totalH + 0.5;
        };
        private _title = _display ctrlCreate['RscText', -1];
        _title ctrlSetPosition[0.71 * safezoneW + safezoneX, 0.10 * safezoneH + safezoneY, 0.28 * safezoneW, 5 * _pH];
        _title ctrlSetText 'Новости Rocket Life';
        _title ctrlSetBackgroundColor _backgroundColor;
        _title ctrlSetTextColor _textColor;
        _title ctrlSetFont _fontM;
        _title ctrlCommit 0;
        private _mainGroup = _display ctrlCreate['RscControlsGroupNoHScrollbars', -1];
        _mainGroup ctrlSetPosition[0.71 * safezoneW + safezoneX, (0.10 * safezoneH + safezoneY) + (5 * _pH), 0.28 * safezoneW, (0.845 * safezoneH) - (5 * _pH)];
        _mainGroup ctrlCommit 0;
        (ctrlPosition _mainGroup) params['_mX', '_mY', '_mW', '_mH']; 
        {
            _x call _fnc_generateNews;
        }
        forEach RRPPublicNews;
    };
    while {
        true
    }
    do {
        waitUntil {
            !isNull(findDisplay 49)
        };
        call _fnc_newsFeed;
        waitUntil {
            isNull(findDisplay 49)
        };
    };
};
*/

0 spawn {
	waitUntil {!isNull(findDisplay 49)};
	if (serverCommandAvailable "#logout") then {
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
		private _text = format["<t size='%1' font='%2' align='center'>Loading control panel</t>", _txtSizeM * 0.8, _fontM];
		private _title = _display ctrlCreate['RRP_RscStructuredText', -1];
		_title ctrlSetPosition[0.79 * safezoneW + safezoneX, 0.10 * safezoneH + safezoneY, 0.20 * safezoneW, 16 * _pH];
		_title ctrlSetStructuredText(parseText _text);
		_title ctrlSetBackgroundColor[0, 0, 0, 0.75];
		_title ctrlSetTextColor[1, 1, 1, 1];
		_title ctrlCommit 0;
		_display setVariable['idleText', _title];
		['auth'] remoteExecCall['RRPServer_metrics_controlpanel', 2];
	};
	waitUntil {isNull(findDisplay 49) };
};