/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

class CfgCCTV
{
    //Объявляем ноутбук c которым будет взаимодействие (переменная объекта class RRPObject_LapTop_CCTV)
    class cctv_laptop_police
    {
        //Назовем панель управления
        displayName = "Терминал наблюдения #1";
        //Требования к использованию терминала камеры
        condition = "('cop' call RRPClient_groups_getSideLevel) > 0 || (call life_adminlevel) > 0";
        //Перечисляем камеры (переменная объекта камеры  class RRPObject_CCTV)
        class cameras 
        {
            class cctv_cam_police_1
            {
                displayName = "Площадь Кавала";
                condition = "('cop' call RRPClient_groups_getSideLevel) > 0 || (call life_adminlevel) > 0";
            };
            class cctv_cam_police_3: cctv_cam_police_1
            {
                displayName = "Площадь Кавала (Гараж)";
            };
            class cctv_cam_police_2: cctv_cam_police_1
            {
                displayName = "Центральная больница";
            };
            class cctv_cam_police_4: cctv_cam_police_1
            {
                displayName = "Тюрьма Блок";
            };
            class cctv_cam_police_5: cctv_cam_police_1
            {
                displayName = "Тюрьма Площадь";
            };
            class cctv_cam_police_6: cctv_cam_police_1
            {
                displayName = "Нац. Резерв - Дорога";
            };
            class cctv_cam_police_7: cctv_cam_police_1
            {
                displayName = "Нац. Резерв - Антенна";
            };
            class cctv_cam_police_8: cctv_cam_police_1
            {
                displayName = "ПД - Парковка";
            };
            class cctv_cam_police_9: cctv_cam_police_1
            {
                displayName = "ПД - Двор";
            };
            class cctv_cam_police_10: cctv_cam_police_1
            {
                displayName = "ПД - Двор 2";
            };
            class cctv_cam_police_11: cctv_cam_police_1
            {
                displayName = "ПД - Въезд парковка";
            };
            class cctv_cam_police_12: cctv_cam_police_1
            {
                displayName = "ПД - Въезд";
            };
        };
    };
	class cctv_laptop_police_1:cctv_laptop_police{};
	class cctv_laptop_police_2:cctv_laptop_police{}; 
	class cctv_laptop_police_3:cctv_laptop_police{}; 
};
