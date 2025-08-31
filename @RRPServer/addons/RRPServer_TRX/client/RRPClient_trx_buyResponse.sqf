
params ["_item"];
secretShop pushBackUnique _item;
["TRX Store","Доступ к купленному товару выдан!"] call toastSuccess;