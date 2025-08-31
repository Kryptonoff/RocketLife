if ({player distance (_x select 0) <= 30} count array_resource_info > 0) then 
{
	   {
		        _LocalItemPos = getPos (_x select 0);
				if (player distance _LocalItemPos <= 15) then
				
				{
					drawIcon3D 
					[
						"",
						[1,1,1,0.8],
						[(_LocalItemPos select 0),(_LocalItemPos select 1),2],
						0,
						0,
						0,
						(_x select 1),
						2,
						0.05,
						"PuristaMedium"
					];
				};
		} forEach array_resource_info;
};