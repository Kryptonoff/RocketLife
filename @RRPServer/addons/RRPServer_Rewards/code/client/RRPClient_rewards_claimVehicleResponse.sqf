
private ["_responseCode"];
_responseCode = _this select 0;
RRPClientPlayerRewards = _this select 1;
if (_responseCode isEqualTo 0) then
{
	["Тайник","Отлично! Ваша техника теперь доступна в гараже!"] call toastSuccess;
	call RRPClient_gui_rewardsDialog_updateListBox;
}
else 
{
	["Тайник", format["Что то не так... Код ошибки '%1' сообщите о ней администратору!",_responseCode]] call toastError;
};
