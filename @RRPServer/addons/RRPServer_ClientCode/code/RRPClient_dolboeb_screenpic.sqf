

#define CHECK(q,w,e) \
	((missionNamespace getVariable ["MSN_CP_CP_1",false] isEqualTo q) && \
	{(missionNamespace getVariable ["MSN_CP_CP_2",false] isEqualTo w)} && \
	{(missionNamespace getVariable ["MSN_CP_CP_3",false] isEqualTo e)})

#define SETTEXTURE(x)  																	\
	{																					\
		_object = missionNamespace getVariable [_x,objNull]; 							\
		if !(isNull _object) then 														\
		{ 																				\
			_object setObjectTextureGlobal [0,_pathToTexture + x + ".paa"];				\
	} 																					\
	}forEach ["flattv_1","flattv_2","flattv_3","flattv_4","flattv_5","flattv_6","flattv_7"]


_pathToTexture = "\banner\KPP\";
switch (true) do
{
	case (CHECK(true,true,true)): {SETTEXTURE("111")};
	case (CHECK(false,false,false)): {SETTEXTURE("000")};
	case (CHECK(true,false,false)): {SETTEXTURE("100")};
	case (CHECK(false,true,false)): {SETTEXTURE("010")};
	case (CHECK(false,false,true)): {SETTEXTURE("001")};
	case (CHECK(true,true,false)): {SETTEXTURE("110")};
	case (CHECK(false,true,true)): {SETTEXTURE("011")};
	case (CHECK(true,false,true)): {SETTEXTURE("101")};
};

true
