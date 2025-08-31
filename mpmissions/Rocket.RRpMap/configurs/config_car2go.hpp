class CfgCar2GO 
{
	price = 30; //цена за минуту
	fine_distance = 500; //штраф за то что бросил в поле
	fine_damage = 3000; //штраф за урон автомобилю x10 за уничтожение
	fine_notRoad = 800; //штраф за парковку не на дороге

	class Cars {
		class ver_lasik{
			price = 50;		
		};
		class ver_samokat {
			price = 150;
		};
		class RRPVehicle_civ_segway {
			price = 250;
		};
	};
};
