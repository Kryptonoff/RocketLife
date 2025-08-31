params [
    ["_difficult",1]
];
("hud_lockpick" call BIS_fnc_rscLayer) cutRsc ["hud_default", "plain"];
("hud_lockpick" call BIS_fnc_rscLayer) cutRsc ["hud_lockpick", "plain"];
private _display = uiNamespace getVariable ["hud_lockpick", displayNull];
if (isNull _display) exitWith {};
_display setVariable ["difficult",_difficult];


pizza_lockpick_sweet_spot = (random 360) - 180;
pizza_lockpick_unstable_duration = 0;
pizza_lockpick_rotate_lock = false;
pizza_lockpick_rotate_pick = 0;
pizza_lockpick_picked = nil;

private _lock_pick_picture = _display displayCtrl 1001;
private _controls_list = _display displayCtrl 1003;

_lock_pick_picture ctrlSetText "\rimas_agent\assets\lockpick\lock_pick_broken.paa";
_lock_pick_picture ctrlSetText "\rimas_agent\assets\lockpick\lock_pick.paa";

{
    _controls_list lbAdd (format ["[ %2 ] %1", _x select 0, _x select 1])
} forEach [
    ["Провернуть замок", "W"],
    ["Повернуть по часовой стрелке", "D"],
    ["Повернуть против часовой стрелки", "A"],
    ["Уровень сложности", _difficult]
];

private _effect_handle = ppEffectCreate ["DynamicBlur", 0];
_effect_handle ppEffectAdjust [2.5];
_effect_handle ppEffectEnable true;
_effect_handle ppEffectCommit 0;

["hud_lockpick", "onEachFrame", {
    private _display = uiNamespace getVariable ["hud_lockpick", displayNull];
    if (isNull _display) exitWith {};
    private _lock_inner_picture = _display displayCtrl 1000;
    private _lock_pick_picture = _display displayCtrl 1001;
    private _lock_pick_proxy = _display displayCtrl 1002;
    if (!isNil "pizza_lockpick_picked") exitWith {
        _lock_pick_picture ctrlSetText (["\rimas_agent\assets\lockpick\lock_pick_broken.paa", "\rimas_agent\assets\lockpick\lock_pick.paa"] select pizza_lockpick_picked);

        ["hud_lockpick", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;

        if (pizza_lockpick_picked) then {
            [player, "vehicleUnlocked"] remoteExecCall ["say3D",-2];
        } else {
            private _sound = selectRandom ["a3\missions_f_oldman\data\sound\light_switch\light_switch_01.wss", "a3\missions_f_oldman\data\sound\light_switch\light_switch_02.wss", "a3\missions_f_oldman\data\sound\light_switch\light_switch_03.wss"];
            playSound3D [_sound, player, false, getPosASL player, 4, 1, 20];
        };
    };

    private _rotation_speed = 1.9;
    private _rotation_amount = 90;
    private _lockpick_difficult = 8 / (_display getVariable ["difficult",1]);
    private _lockpick_shake_amount = 0.6;
    private _lockpick_max_unstable_duration = 0.4;
    private _delta = diag_deltaTime;
    call {
        private _lock_current_angle = ((ctrlAngle _lock_inner_picture) select 0) % 360;
        private _next_lock_angle_difference = -(_rotation_amount * (_delta / _rotation_speed));
        if (pizza_lockpick_rotate_lock) then {
            _next_lock_angle_difference = abs _next_lock_angle_difference
        };
        private _next_lock_angle = _lock_current_angle + _next_lock_angle_difference;

        private _pick_current_angle = ((ctrlAngle _lock_pick_proxy) select 0) % 360;
        private _sweet_spot_padding = [pizza_lockpick_sweet_spot - (_lockpick_difficult / 2), pizza_lockpick_sweet_spot + (_lockpick_difficult / 2)];

        private _distance_to_sweet_spot = (abs (_pick_current_angle - (_sweet_spot_padding select 0))) min (abs (_pick_current_angle - (_sweet_spot_padding select 1)));
        if ((_pick_current_angle >= (_sweet_spot_padding select 0)) && (_pick_current_angle <= (_sweet_spot_padding select 1))) then {
            _distance_to_sweet_spot = 0
        };
        private _max_lock_roation_percentage = abs (1 - (_distance_to_sweet_spot / 180));
        private _max_lock_roation = 90 * _max_lock_roation_percentage;
        _next_lock_angle = (_next_lock_angle max 0) min _max_lock_roation;

        _lock_inner_picture ctrlSetAngle [_next_lock_angle, 0.5, 0.5];

        private _offset_radius = 0.01;
        private _pick_offset_x = _offset_radius * (cos (_next_lock_angle + 90));
        private _pick_offset_y = _offset_radius * (sin (_next_lock_angle + 90));

        (ctrlPosition _lock_pick_picture) params ["_", "_", "_pick_pos_w", "_pick_pos_h"];
        (ctrlPosition _lock_inner_picture) params ["_lock_pos_x", "_lock_pos_y", "_lock_pos_w", "_lock_pos_h"];
        _lock_pick_picture ctrlSetPositionX ((_lock_pos_x + (_lock_pos_w / 2) - (_pick_pos_w / 1.975)) + _pick_offset_x);
        _lock_pick_picture ctrlSetPositionY ((_lock_pos_y + (_lock_pos_h / 2) - (_pick_pos_h / 2.050)) + _pick_offset_y);
        _lock_pick_picture ctrlCommit 0;

        if (_next_lock_angle isEqualTo 90) exitWith {
            pizza_lockpick_picked = true
        };

        private _pick_unstable_angle = if (_max_lock_roation_percentage isEqualTo 1) then {
            1000
        } else {
            _max_lock_roation * 0.6666
        };

        if (_next_lock_angle > _pick_unstable_angle) then {
            _lock_pick_picture ctrlSetAngle [_pick_current_angle + ((random (_lockpick_shake_amount * 2)) - _lockpick_shake_amount), 0.5, 0.4875];
            if (pizza_lockpick_rotate_lock) then {
                pizza_lockpick_unstable_duration = pizza_lockpick_unstable_duration + _delta

            };

            if (pizza_lockpick_unstable_duration >= _lockpick_max_unstable_duration) exitWith {
                pizza_lockpick_picked = false
            };
        } else {
            _lock_pick_picture ctrlSetAngle [_pick_current_angle, 0.5, 0.4875];
            pizza_lockpick_unstable_duration = 0;
        };
    };

    call {
        if !(pizza_lockpick_rotate_lock) then {
            if !(pizza_lockpick_rotate_pick isEqualTo 0) then {
                private _pick_current_angle = ((ctrlAngle _lock_pick_picture) select 0) % 360;
                pizza_angle = _pick_current_angle;
                private _next_angle_difference = -(_rotation_amount * (_delta / _rotation_speed));
                if (pizza_lockpick_rotate_pick isEqualTo 2) then {
                    _next_angle_difference = abs _next_angle_difference
                };
                private _next_angle = _pick_current_angle + _next_angle_difference;
                _next_angle = (_next_angle min 180) max -180;

                _lock_pick_picture ctrlSetAngle [_next_angle, 0.5, 0.4875];
                _lock_pick_proxy ctrlSetAngle [_next_angle, 0.5, 0.5];
            };
        };
    };
}] call BIS_fnc_addStackedEventHandler;

_display displayAddEventHandler ["Unload", {
    pizza_lockpick_sweet_spot = nil;
    pizza_lockpick_unstable_duration = nil;
    pizza_lockpick_rotate_lock = nil;
    pizza_lockpick_rotate_pick = nil;

    ["hud_lockpick", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
}];

waitUntil {
    if (animationState player isNotEqualTo "AG_anim_lockpick") then {
        player playActionNow "AG_anim_lockpick";
    };
    (isNull _display) || (!isNil "pizza_lockpick_picked")
};
if (!isNull _display) then {
    uiSleep 1;
    ("hud_lockpick" call BIS_fnc_rscLayer) cutRsc ["hud_default", "plain"]
};
private _return = missionNamespace getVariable ["pizza_lockpick_picked", false];
pizza_lockpick_picked = nil;

_effect_handle ppEffectEnable false;
ppEffectDestroy _effect_handle;

_return;