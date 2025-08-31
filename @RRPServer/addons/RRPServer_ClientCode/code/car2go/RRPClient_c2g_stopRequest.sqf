
['Вы собираетесь прекратить аренду машины. Проверьте ее на наличие повреждений, стоит ли она на дороге и в разрешенной зоне. Учтите, если какое-то из этих условий не выполнено, на вас будет наложен штраф или вы получите предупреждения. Это действия нельзя отменить. Продолжить?', "Прекратить", "Продолжить"] call RRPClient_tablet_showConfirm;
waitUntil {!isNil "RRPClientTabletConfirmResult"};
if (RRPClientTabletConfirmResult) then {
	[] call RRPClient_c2g_stop
};
