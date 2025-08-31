/*--------------------------------------------------------------------------
    Author:		Maverick Applications
    Website:	https://maverick-applications.com

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

if !("ItemGPS" in assignedItems player) exitWith {["Вам необходим GPS"] call toastError};
createDialog "MAV_guiNavigation";
