## KeyPad

`RRPClient_keyPad_openMenu` - открыть окно с вводом кода

### Вызывать только внутри spawn, потому что внутри есть waitUntil

Пример кода 
```sqf
[object] spawn {
    _houseObject = _this;
    _input = 6 call RRPClient_keyPad_openMenu;
    if (_input isEqualTo "") throw "Вы не ввели код!";
    _realCode = _houseObject getVariable ["PinCode",""];
}
```

TODO: Нужно дописать хитскан. Диалог `RRPDialogScanKeypad` под него готов, нужна кодовая часть. 