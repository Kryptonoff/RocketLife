#define F(NAME,TARGET) class NAME { \
	allowedTargets = TARGET; \
};
#define ANYONE 0
#define CLIENT 1
#define SERVER 2
#define HC HC_Life

#define S(FNC) F(FNC,SERVER)
#define C(FNC) F(FNC,CLIENT)
#define A(FNC) F(FNC,ANYONE)
#define H(FNC) F(FNC,HC)

class CfgRemoteExec {
	class Functions {
		mode = 2;
		jip = 1;

		/* Server only */
		S(RRPServer_adac_vehicleAdacRecolor)

		/* Only client */
		A(RRPClient_system_broadcast)
		A(RRPClient_system_animSync)

	};
	
	class Commands {
		mode = 1;
		jip = 1;
		F(setFace,ANYONE)
		F(playActionNow,ANYONE)
		F(switchMove,ANYONE)
		F(setVelocity,ANYONE)
		F(say3D,ANYONE)
		F(removeAllActions,ANYONE)
		F(lockInventory,ANYONE)
		F(addAction,ANYONE)
	};
};
