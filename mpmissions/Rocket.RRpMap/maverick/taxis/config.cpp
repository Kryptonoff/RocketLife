/*--------------------------------------------------------------------------
    Author:		Maverick Applications
    Website:	https://maverick-applications.com

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

#define true 1
#define false 0

class maverick_taxis_cfg
{
	class pricing
	{
		pricePerKilometre 					= 25; // Dollars
		basePrice							= 50; // Price at which billing starts, required to call a taxi
		moneyHandVariable					= "RRPClientCashMoney";
		moneyBankVariable					= "RRPClientAtmMoney";
		paymentSource						= "BOTH";
		fullRefundOnDriverAbort				= true;
	};
	class keybindings
	{
		keyCode								= 20; // Keycodes can be found at https://community.bistudio.com/wiki/DIK_KeyCodes
		reqShift							= true;
		reqAlt								= false;
		reqCtrl								= false;
	};
	class general
	{
		automaticNavigation 				= true; // Automatically starts Navigator once the user has to go to a specific point
	};
	class drivers
	{
		condition 							= "license_taxi";
	};

	class localization
	{
		// Localization
		msgMainInfoNoTaxiCalled	=			"<t size='2'>У вас нет активного вызова!</t><br/><t>Нажмите 'Вызвать такси', что бы свободные таксисты увидели Ваш вызов!</t><br/><br/><t font='RobotoCondensedBold'>Available Taxi Drivers: %1</t>";
		msgMainInfoNoTaxiYet =				"<t size='2'>Такси было заказано!</t><br/><t>Водитель такси еще не принял вызов. Вы будете уведомлены, как только он сделает это!</t><br/><br/><t font='RobotoCondensedBold'>Available Taxi Drivers: %1</t>";
		msgTaxiCalled = 					"Запрос такси был сделан!";
		msgTaxiCancelled = 					"Ваш заказ такси был отменен!";
		msgTaxiFareCancelled =				"Вы отменили тариф";
		msgTaxiCancelConfirm =				"Водитель такси уже направляется к Вам, вы уверены, что хотите отклонить заказ?";
		msgTaxiCancelHeader	=				"Отменить вызов";
		msgTaxiCancelButtonConfirm =		"Да";
		msgTaxiCancelButtonCancel =			"Нет";
		msgTaxiCancelDriverConfirm =		"Вы уверены, что хотите отменить тариф? Если вам уже заплатили, деньги будут возвращены клиенту.";
		msgTaxiMeterInfoText = 				"<t>Общее расстояние</t><t align='right' font='RobotoCondensedBold'>%1</t><br/><t>Время истекло</t><t align='right' font='RobotoCondensedBold'>%2</t><br/><t>Стоимость (%3$/km)</t><t align='right' font='RobotoCondensedBold'>%4</t>";
		msgTaxiMeterStatusTextActive = 		"<t align='right' font='RobotoCondensedBold'>АКТИВНЫЙ</t>";
		msgTaxiMeterStatusTextInactive = 	"<t align='right' font='RobotoCondensedBold'>НЕАКТИВНЫЙ</t>";
		masTaxiInfoPleaseWait =				"<t size='2'>%1 едет к Вам!</t><br/>Пожалуйста, ждите таксиста в этом месте. Сейчас он %2 км.</t>";
		msgTaxiFareCancelledAsCustomer =	"Ваш водитель такси отменил тариф";
		masTaxiFareCancelledAsDriver =		"Ваш клиент отменил тариф";
		msgTaxiCallAccepted =				"Водитель такси в пути";
		msgTaxiDriverNotAvailable =			"Вы не отвечаете требованием, что бы работать таксистом.";
		msgTaxiDestinationUpdated =			"Пункт назначения обновлен.";
		msgTaxiNoRoadNearFound =			"Нет ни одного участка дороги поблизости!";
		msgTaxiCannotCallWhileDriver =		"Вы не можете позвонить в такси, будучи таксистом!";
		msgTaxiCannotDriveWhileCalling =	"Вы не можете раотать таксистом и вызывать себя!";
		msgTaxiSpamClickPrevention =		"Не так быстро!";
		msgTaxiAlreadyInFare =				"Вы уже приняли тариф!";
		msgCallTaxi =						"Вызвать такси";
		msgBaseNotAffordable =				"У Вас недостаточно денег, чтобы вызвать такси!";
		msgPaidCustomer =					"Вы добрались до места назначения.<br/>Сумма платежа: %1$";
		msgNotFullyPaidCustomer =			"Вы добрались до места назначения. Вы не можете позволить себе общую сумму в %1$, в место этого %2$ (за исключением базой оплаты) были оплачены!";
		msgPaidDriver =						"Вы добрались до места назначения.<br/>Ваш клиент заплатил вам <t color='#43a047'>%1$</t>.";
		msgNotFullyPaidDriver =				"Вы добрались до места назначения. Ваш клиент не мог выплатить вам полную сумму <t color='#43a047'>%1$</t>, instead <t color='#43a047'>%2$</t> (excluding base fee) have been transferred to you.";
		msgPayCustomer =					"Вы добрались до места назначения.<br/>Общий платеж, который должен быть произведен %1$.";
		msgPayDriver =						"Вы добрались до места назначения.<br/>Вашему клиенту было предложено заплатить %1$.";
		msgTotalPayment =					"Всего к оплате: %1$";
		msgTaximeterPositionSaved =			"Положение таксометра сохранено.";
		msgTaximeterPositionReset =			"Сброс положения таксометра";
		msgTaxiPressSpaceSaveSettings = 	"Нажмите [ПРОБЕЛ], чтобы сохранить";
		msgNowOnDuty =						"Ожидайте, Вы получите уведомление, как только придет вызов такси.";
		msgNowOffDuty =						"Вы сейчас не работаете";
		msgTaxiMenuActiveCalls =			"Просмотр активных вызовов";
		msgTaxiNewCallCreated = 			"Был создан новый вызов такси";
		msgTaxiBillingPayment =				"Полная оплата на расстоянии";
		msgTaxiBillingDriverMissingP =		"Сумма, недоступная клиенту";
		msgTaxiBillingBasePrice =			"База цен";
		msgTaxiBillingCustomerMissingP =	"Сумма недоступна!";
		msgTaxiCurrentFareInformation =		"Текущая информация о тарифах";
		msgTaxiBillingCancelled =			"Отмена тарифа";

		// Tasks
		msgTaskDriverPickupDescription =	"Заберите пассажира в этом месте.";
		msgTaskDriverPickupDescriptionS =	"Подобрать";
		msgTaskDriverPickupHUD =			"Подобрать";

		msgTaskCustomerDriverDescription =	"Сядьте в таски";
		msgTaskCustomerDriverDescriptionS =	"Сесть";
		msgTaskCustomerDriverHUD =			"Сесть";

		msgTaskDriverGoToDescription =		"Заказчик";
		msgTaskDriverGoToDescriptionS =		"Место назначения";
		msgTaskDriverGoToDriverHUD =		"Двигайтесь сюда";

		#define dialogCallTaxiTitle			"Римас Такси"
		#define dialogCancelTaxi			"Отменить запрос"
		#define dialogClose					"Закрыть"
		#define dialogTaxiMeter				"Таксометр"
		#define dialogTaxiFareList			"Доступные вызовы"
		#define dialogTaxiGoOnDuty			"На работу"
		#define dialogTaxiGoOffDuty			"Уйти с работы"
		#define dialogTaxiAcceptCall		"Забрать вызов"
		#define dialogTaxiCancelCall		"Отменить вызов"
		#define dialogMenuCustomer			"Вызвать такси"
		#define dialogMenuDriver			"Работать водителем"
		#define dialogMenuSettings			"Настройки"
		#define dialogDestination			"Пункт назначения"
		#define dialogHowToDestination		"Кликните дважды на карту, чтобы установить пункт назначения. Если водитель взял Ваш заказ, он получит новый пункт назначения"
		#define dialogStatusTitle			"Стату"
		#define dialogStatusMarkedDest		"Пункт назначения выбран"
		#define dialogStatusCreatedCall		"Вызов создан"
		#define dialogStatusDriverFound		"Водитель принял ваш заказ"
		#define dialogStatusPickedUp		"Get Picked Up"
		#define dialogSettingsCustomizePos	"Позиция таксометра"
		#define dialogSettingsCustomize		"Customize"
		#define dialogSettingsReset			"Сбросить"
		#define dialogDragMe				"Тяни меня"
		#define dialogFareSummaryTitle		"Fare Summary"
		#define dialogSummaryClosePromt		"Shift+T закрыть"
		#define dialogAvaibleDrivers		"Доступные водители"
	};
};

#include "gui\taxi_gui_master.cpp"

