class CfgPatches
{
	class rimas_agent
	{
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"a3_characters_f",
			"a3_characters_f_beta",
			"a3_characters_f_epa",
			"a3_characters_f_epb",
			"a3_characters_f_epc",
			"a3_characters_f_gamma",
			"a3_data_f",
			"a3_weapons_f",
			"A3_Weapons_F_Ammoboxes",
			"a3_weapons_f_beta",
			"a3_weapons_f_bootcamp",
			"a3_weapons_f_epa",
			"a3_weapons_f_epb",
			"a3_weapons_f_epc",
			"a3_weapons_f_gamma",
			"a3_rocks_f",
			"a3_anims_f",
			"a3_weapons_f_mark",
			"a3_weapons_f_exp",
			"a3_map_altis_scenes",
			"a3_map_vr_scenes",
			"a3_map_stratis_scenes",
			"A3_Ui_F",
			"A3_Map_Stratis",
			"A3_Map_Tanoabuka",
			"A3_Map_Altis",
			"A3_Map_VR",
			"A3_Map_Enoch",
			"A3_Map_Malden",
			"RRp_Map",
			"A3_Functions_F",
			"A3_UiFonts_F",
			"a3_3den",
			"A3_Ui_F_Data"
		};
		units[]=
		{
			"RRPObject_CCTV",
			"RRPObject_LapTop_CCTV",
			"Animal_Goat_Black",
			"Animal_Goat_Dirty",
			"Animal_Goat_White",
			"Animal_Goat_Old",
			"Animal_Goat_Spotted",
			"Animal_Hen_White",
			"Animal_Rooster_Brown",
			"Animal_Rooster_White",
			"Animal_Rooster_Gold",
			"Animal_Sheep_Beige",
			"Animal_Sheep_White",
			"Animal_Sheep_Brown",
			"Animal_Sheep_Spotted",
			"Animal_Sheep_Tricolor"
		};
		weapons[]={};
		magazines[]={};
		ammo[]={};
		worlds[]={};
	};
};
#include "binds.hpp"

class OfficialServersArma
{
	url="http://rimasrp.life/servers.txt";
	updateInterval="24 * 60";
	listDirectory="OfficialServersCache";
	listFileName="AtlasServers.json";
	tmpListFileName="tmp_asr.json";
};
class CfgDifficultyPresets
{
	class Veteran;
	defaultPreset="RRP Regular";
	class RRPRegular: Veteran
	{
		BleedingRate=0.005;
		displayName="Veteran RRP";
		class Options
		{
			reducedDamage=0;
			groupIndicators=0;
			friendlyTags=0;
			enemyTags=0;
			detectedMines=1;
			commands=0;
			waypoints=0;
			weaponInfo=1;
			stanceIndicator=2;
			staminaBar=0;
			weaponCrosshair=0;
			visionAid=0;
			thirdPersonView=1;
			cameraShake=1;
			scoreTable=0;
			deathMessages=0;
			vonID=0;
			squadRadar=0;
			mapContent=0;
			autoReport=0;
			multipleSaves=0;
		};
	};
};
class CfgFunctions
{
	class rimas_agent
	{
		class Bootstrap
		{
			file="rimas_agent\bootstrap";
			class preInit
			{
				preInit=1;
			};
			class postInit
			{
				postInit=1;
			};
			class preStart
			{
				preStart=1;
			};
		};
	};
	class KK
	{
		tag = "KK";
		class AlienInvasion
		{
			file = "\rimas_agent\code\AlienInvasion";
			class createAlien {};
			class simulateAlien {};
			class gameOver {};
			class gameLoop {};
			class initAlienInvasion {};
			class showAlienSprite {};
			class playCatchEffect {};
			class playFailEffect {};
			class updateScore {};
			class setUserInterface {};
			class exitGameCleanup {};
			class onKeyDown {};
			class playTrack {};
			class animateLid {};
			class deanimateLid {};
			class screenLoaded {};
		};
	};
	class A3
	{
		tag="BIS";
		project="arma3";
		class Misc
		{
			delete progressLoadingScreen;
		};
		class BecauseArma
		{
			file="\rimas_agent\bootstrap";
			class progressLoadingScreen
			{
			};
		};
		class GUI
		{
			class groupIndicator
			{
				file="\rimas_agent\overwrites\fn_groupindicator.sqf";
				description="Display group indicator.";
			};
			class getGroupSideColor
			{
				file="\rimas_agent\overwrites\fn_getGroupSideColor.sqf";
				description="Return color side group";
			};
		};
	};
};
class CfgSounds
{
	class pressButtonKeyPad
	{
		sound[]=
		{
			"rimas_agent\sounds\pressButtonKeyPad",
			1,
			1,
			5
		};
		titles[]={};
	};
	class Sound_GasMaskBreathing01
	{
		name="Gas Mask Breathing";
		sound[]=
		{
			"\a3\sounds_f\characters\human-sfx\diver-breath-1.wss",
			0.25,
			1
		};
		titles[]={};
	};
	class Sound_GasMaskBreathing02
	{
		name="Gas Mask Breathing";
		sound[]=
		{
			"\a3\sounds_f\characters\human-sfx\diver-breath-3.wss",
			0.25,
			1
		};
		titles[]={};
	};
};
class CfgLifeColors
{
	class WaypointColors
	{
		displayName="Метки";
		variable="PRNS_WaypointColor";
		defaultColors[]={0.5,0.5,0.5,0.85000002};
	};
	class MarkerTeam
	{
		displayName="Маркер членов тусовки";
		variable="PRNS_ColorNotPlayerDraw";
		defaultColors[]=
		{
			"8/255",
			"107/255",
			"115/255",
			0.85000002
		};
	};
	class PRNS_ColorGroupPlayers
	{
		displayName="Маркер членов организации";
		variable="PRNS_ColorGroupPlayers";
		defaultColors[]=
		{
			"8/255",
			"107/255",
			"115/255",
			0.85000002
		};
	};
	class MyMarker
	{
		displayName="Ваш маркер";
		variable="PRNS_ColorPlayerDraw";
		defaultColors[]=
		{
			"52/255",
			"199/255",
			"13/255",
			0.85000002
		};
	};
	class GpsVehicle
	{
		displayName="Маркер техники с GPS";
		variable="PRNS_ColorVehGPS";
		defaultColors[]={0.85000002,0.85000002,0,0.85000002};
	};
	class TagsAndNames
	{
		displayName="Имена и теги";
		variable="PRNS_TagsColors";
		defaultColors[]={1,0,0.27000001,1};
	};
};
class CfgMods
{
	class RRP
	{
		armaVersion="196";
	};
};
class CfgVideoOptions
{
	class Visibility
	{
		minValue=5;
		maxValue=40000;
	};
	class ObjectsVisibility
	{
		minValue=5;
		maxValue=30000;
	};
	class ShadowsVisibility
	{
		minValue=5;
		maxValue=3000;
	};
	class TextureQuality
	{
		class VeryLower2
		{
			text="Супер низкие";
			mipBias=13;
			vramNeeded=0;
		};
	};
	class ObjectsQuality
	{
		class VeryLow2
		{
			text="Ниже некуда";
			value=100000;
		};
	};
	class TerrainQuality
	{
		class Verylowlow
		{
			text="Ниже некуда";
			terrainGrid=100;
		};
	};
	class PPBloom
	{
		minValue=0;
		maxValue=3;
	};
	class PPDOF
	{
		minValue=0;
		maxValue=5;
	};
	class PPRotBlur
	{
		minValue=0;
		maxValue=2;
	};
	class PPRadialBlur
	{
		minValue=0;
		maxValue=2;
	};
	class PPSharpen
	{
		minValue=0;
		maxValue=4;
	};
	class PPBrightness
	{
		minValue=0;
		maxValue=2;
	};
	class PPContrast
	{
		minValue=0;
		maxValue=2;
	};
	class PPSaturation
	{
		minValue=0;
		maxValue=2;
	};
	class PPColorPresets
	{
		class Altis
		{
			text="Altis";
			brightness=1.01;
			contrast=1.08;
			saturation=1.1;
		};
		class Tanoa
		{
			text="Tanoa";
			brightness=1.02;
			contrast=1.03;
			saturation=0.94999999;
		};
	};
};
class CfgToasts
{
	class InfoEmpty
	{
		template="%1";
		color[]={0.24699999,0.83099997,0.98799998,1};
	};
	class InfoTitleOnly
	{
		template="<t size='22' font='RobotoCondensedBold'>%1</t>";
		color[]={0.24699999,0.83099997,0.98799998,1};
	};
	class InfoTitleAndText
	{
		template="<t size='22' font='RobotoCondensedBold'>%1</t><br/><t color='#ff979ba1' size='19' font='RobotoCondensed'>%2</t>";
		color[]={0.24699999,0.83099997,0.98799998,1};
	};
	class SuccessEmpty
	{
		template="%1";
		color[]={0.62699997,0.87400001,0.23100001,1};
	};
	class SuccessTitleOnly
	{
		template="<t size='22' font='RobotoCondensedBold'>%1</t>";
		color[]={0.62699997,0.87400001,0.23100001,1};
	};
	class SuccessTitleAndText
	{
		template="<t size='22' font='RobotoCondensedBold'>%1</t><br/><t color='#ff979ba1' size='19' font='RobotoCondensed'>%2</t>";
		color[]={0.62699997,0.87400001,0.23100001,1};
	};
	class ErrorEmpty
	{
		template="%1";
		color[]={0.77999997,0.149,0.31799999,1};
	};
	class ErrorTitleOnly
	{
		template="<t size='22' font='RobotoCondensedBold'>%1</t>";
		color[]={0.77999997,0.149,0.31799999,1};
	};
	class ErrorTitleAndText
	{
		template="<t size='22' font='RobotoCondensedBold'>%1</t><br/><t color='#ff979ba1' size='19' font='RobotoCondensed'>%2</t>";
		color[]={0.77999997,0.149,0.31799999,1};
	};
	class WarningEmpty
	{
		template="%1";
		color[]={0.87099999,0.796,0.227,1};
	};
	class WarningTitleOnly
	{
		template="<t size='22' font='RobotoCondensedBold'>%1</t>";
		color[]={0.87099999,0.796,0.227,1};
	};
	class WarningTitleAndText
	{
		template="<t size='22' font='RobotoCondensedBold'>%1</t><br/><t color='#ff979ba1' size='19' font='RobotoCondensed'>%2</t>";
		color[]={0.87099999,0.796,0.227,1};
	};
};
class CfgMovesBasic
{
	class ManActions
	{
		GestureExileSuicide01="";
		GestureExileSuicide02="";
		GestureExileSuicideCancel01="";
		GestureExileRussianRoulette01="";
	};
	class Actions
	{
		class NoActions: ManActions
		{
			GestureExileSuicide01[]=
			{
				"GestureExileSuicide01",
				"Gesture"
			};
			GestureExileSuicide02[]=
			{
				"GestureExileSuicide02",
				"Gesture"
			};
			GestureExileSuicideCancel01[]=
			{
				"GestureExileSuicideCancel01",
				"Gesture"
			};
			GestureExileRussianRoulette01[]=
			{
				"GestureExileRussianRoulette01",
				"Gesture"
			};
		};
	};
};
class CfgMovesMaleSdr: CfgMovesBasic
{
	class States
	{
		class CutSceneAnimationBaseSit;
		class AmovPercMstpSnonWnonDnon;
		class HubSittingChairA_idle1;
		class AmovPercMstpSrasWlnrDnon;
		class AmovPercMstpSrasWpstDnon;
		class Exile_Acts_Suicide01: AmovPercMstpSrasWpstDnon
		{
			looped=0;
			file="\rimas_agent\assets\anims\Exile_Suicide01";
			terminal=0;
			speed=0.14354099;
			showHandGun=1;
			head="headNo";
			forceAim=1;
			ConnectTo[]=
			{
				"DeadState",
				1
			};
			InterpolateTo[]={};
		};
		class Exile_Acts_Suicide02: AmovPercMstpSrasWpstDnon
		{
			looped=0;
			file="\rimas_agent\assets\anims\Exile_Suicide02";
			terminal=0;
			speed=0.124481;
			showHandGun=1;
			head="headNo";
			forceAim=1;
			ConnectTo[]=
			{
				"DeadState",
				1
			};
			InterpolateTo[]={};
		};
		class Exile_Acts_Suicide03: Exile_Acts_Suicide01
		{
			terminal=1;
			ragdoll=1;
		};
		class Exile_Acts_Suicide04: Exile_Acts_Suicide02
		{
			terminal=1;
			ragdoll=1;
		};
		class Exile_RouletteSitting01: CutSceneAnimationBaseSit
		{
			collisionShape="A3\anims_f\Data\Geom\Sdr\geom_empty.p3d";
			head="headDefault";
			ragdoll=1;
			terminal=0;
			affectedByFatigue="false";
			canPullTrigger=0;
			canReload=0;
			disableWeapons=1;
			disableWeaponsLong=1;
			enableBinocular=0;
			enableMissile=0;
			enableOptics=0;
			showHandGun=1;
			showItemInHand=0;
			showItemInRightHand=0;
			showWeaponAim=0;
			actions="Acts_SittingTiedHands_actions";
			file="\A3\Anims_F_EPA\data\Anim\sdr\cts\HubCleaned\SittingChair\HubSittingChairA_idle1";
			VariantsPlayer[]=
			{
				"Exile_RouletteSitting01_Animation01",
				0.2
			};
			VariantsAI[]=
			{
				"Exile_RouletteSitting01_Animation01",
				0.2
			};
			VariantAfter[]={20,20,20};
			InterpolateTo[]=
			{
				"Exile_RouletteSitting01_Animation01",
				0.001,
				"DeadState",
				0.0099999998
			};
		};
		class Exile_RouletteSitting01_Animation01: Exile_RouletteSitting01
		{
			equivalentTo="Exile_RouletteSitting01";
			speed=-25;
			VariantsPlayer[]={};
			VariantsAI[]={};
			interpolationSpeed=0.2;
			InterpolateTo[]=
			{
				"Exile_RouletteSitting01",
				0.001,
				"DeadState",
				0.0099999998
			};
		};
	};
};	
class CfgGesturesMale 
{
	skeletonName = "OFP2_ManSkeleton";
	
	class Default;
	class ManActions {};
	class Actions 
	{
		class NoActions 
		{
			turnSpeed = 0;
			upDegree = 0;
			limitFast = 1;
			useFastMove = 0;
		};
	};

	// Action Animation Configs
	class States
	{
		class GestureExileSuicide01: Default
		{
			file="\rimas_agent\assets\anims\Exile_Suicide01.rtm";
			looped=0;
			speed=0.14354099;
			mask="rightHand";
			headBobStrength=0.2;
			headBobMode=2;
			disableWeapons=1;
			rightHandIKBeg=1;
			rightHandIKEnd=1;
			leftHandIKBeg=1;
			leftHandIKEnd=1;
		};
		class GestureExileSuicide02: Default
		{
			file="\rimas_agent\assets\anims\Exile_Suicide02.rtm";
			looped=0;
			speed=0.124481;
			mask="rightHand";
			headBobStrength=0.2;
			headBobMode=2;
			disableWeapons=1;
			rightHandIKBeg=1;
			rightHandIKEnd=1;
			leftHandIKBeg=1;
			leftHandIKEnd=1;
		};
		class GestureExileRussianRoulette01: Default
		{
			file="\rimas_agent\assets\anims\Exile_RussianRoulette01.rtm";
			looped=0;
			speed=0.30000001;
			mask="upperTorsoSelfShoot";
			headBobStrength=0.2;
			headBobMode=2;
			disableWeapons=1;
			disableWeaponsLong=1;
			rightHandIKBeg=0;
			rightHandIKEnd=0;
			leftHandIKBeg=0;
			leftHandIKEnd=0;
			rightHandIKCurve[]={};
			showItemInRightHand=0;
			showHandGun=1;
			weaponLowered=0;
			canPullTrigger=1;
			forceAim=1;
			enableOptics="false";
			showWeaponAim="false";
		};
		class GestureExileSuicideCancel01: Default
		{
			file="\A3\anims_f\Data\Anim\Sdr\gst\GestureHi";
			looped=0;
			speed=1;
			mask="rightHand";
			headBobStrength=0.2;
			headBobMode=2;
			disableWeapons=1;
			rightHandIKBeg=1;
			rightHandIKEnd=1;
			leftHandIKBeg=1;
			leftHandIKEnd=1;
		};
	
		// FISTS
        class dsr_Gst_Civ_WeapNon_Idle_Combat_Pose : Default {
            file = "rimas_agent\anims\fighting\dsr_Gst_Civ_WeapNon_Idle_Combat_Pose.rtm";
            looped = 1;
            speed = 0.0;
			duty = 0.0;
			aimingBody = "aimingUpDefault";
			mask = "upperTorsoRPG";
			leftHandIKBeg = 0;//false;
			leftHandIKCurve[] = {1};
			leftHandIKEnd = 0;//false;
			rightHandIKBeg = 0;//false;
			rightHandIKCurve[] = {1};
			rightHandIKEnd = 0;//false;
			weaponIK = 0;
			enableOptics = 0;//false;
			showWeaponAim = 0;//false;
			disableWeapons = 1;//true;
			disableWeaponsLong = 1;//true;
			canPullTrigger = 0;
			interpolationSpeed = 2.0;
			variantsPlayer[] = {};
			variantsAI[] = {};
			InterpolateTo[] = {};
			interpolateFrom[] = {};
			soundOverride = "rifle_to_handgun";
			soundEnabled = 1;
			showHandGun = 0;
			showItemInRightHand = 0;
		};
        class dsr_Gst_Civ_WeapNon_HandsUp_Combat_Pose : Default {
            file = "rimas_agent\anims\fighting\dsr_Gst_Civ_WeapNon_HandsUp_Combat_Pose.rtm";
            looped = 0;
            speed = 1.25;
			duty = 0.0;
			aimingBody = "aimingUpDefault";
			mask = "upperTorsoRPG";
			leftHandIKBeg = 0;//false;
			leftHandIKCurve[] = {1};
			leftHandIKEnd = 0;//false;
			rightHandIKBeg = 0;//false;
			rightHandIKCurve[] = {1};
			rightHandIKEnd = 0;//false;
			weaponIK = 0;
			enableOptics = 0;//false;
			showWeaponAim = 0;//false;
			disableWeapons = 1;//true;
			disableWeaponsLong = 1;//true;
			canPullTrigger = 0;
			variantsPlayer[] = {};
			variantsAI[] = {};
			soundOverride = "rifle_to_handgun";
			soundEnabled = 1;
			showHandGun = 0;
			showItemInRightHand = 0;
		};
        class dsr_Gst_Civ_WeapNon_HandsDown_Combat_Pose : Default {
            file = "rimas_agent\anims\fighting\dsr_Gst_Civ_WeapNon_HandsDown_Combat_Pose.rtm";
            looped = 0;
            speed = 2.142857142857143;
			duty = 0.0;
			aimingBody = "aimingUpDefault";
			mask = "upperTorsoRPG";
			leftHandIKBeg = 0;//false;
			leftHandIKCurve[] = {1};
			leftHandIKEnd = 0;//false;
			rightHandIKBeg = 0;//false;
			rightHandIKCurve[] = {1};
			rightHandIKEnd = 0;//false;
			weaponIK = 0;
			enableOptics = 0;//false;
			showWeaponAim = 0;//false;
			disableWeapons = 1;//true;
			disableWeaponsLong = 1;//true;
			canPullTrigger = 0;
			soundOverride = "rifle_to_handgun";
			soundEnabled = 1;
			showHandGun = 0;
			showItemInRightHand = 0;
		};
		class dsr_Gst_Civ_WeapNon_Punch_HLeft_Hook : Default {
			file = "rimas_agent\anims\fighting\dsr_Gst_Civ_WeapNon_Punch_HLeft_Hook.rtm";
			looped = 0;
			speed = 2.307692307692308;
			duty = 0.0;
			aimingBody = "aimingUpDefault";
			mask = "upperTorsoRPG";
			leftHandIKBeg = 0;//false;
			leftHandIKCurve[] = {1};
			leftHandIKEnd = 0;//false;
			rightHandIKBeg = 0;//false;
			rightHandIKCurve[] = {1};
			rightHandIKEnd = 0;//false;
			weaponIK = 0;
			enableOptics = 0;//false;
			showWeaponAim = 0;//false;
			disableWeapons = 1;//true;
			disableWeaponsLong = 1;//true;
			canPullTrigger = 0;
			InterpolateTo[] = {};
			interpolateFrom[] = {};
			soundOverride = "rifle_to_handgun";
		};
		class dsr_Gst_Civ_WeapNon_Punch_HRight_Curve : Default {
			file = "rimas_agent\anims\fighting\dsr_Gst_Civ_WeapNon_Punch_HRight_Curve.rtm";
			looped = 0;
			speed = 2.142857142857143;
			duty = 0.0;
			aimingBody = "aimingUpDefault";
			mask = "upperTorsoRPG";
			leftHandIKBeg = 0;//false;
			leftHandIKCurve[] = {1};
			leftHandIKEnd = 0;//false;
			rightHandIKBeg = 0;//false;
			rightHandIKCurve[] = {1};
			rightHandIKEnd = 0;//false;
			weaponIK = 0;
			enableOptics = 0;//false;
			showWeaponAim = 0;//false;
			disableWeapons = 1;//true;
			disableWeaponsLong = 1;//true;
			canPullTrigger = 0;
			soundOverride = "rifle_to_handgun";
		};
	};
	

	class BlendAnims
	{
		BodyFullReal[] = {"head",1,"neck1",1,"neck",1,"weapon",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine1",1,"Spine2",1,"Spine3",1,"Spine",1,"Pelvis",1,"LeftLeg",1,"LeftLegRoll",1,"LeftUpLeg",1,"LeftUpLegRoll",1,"LeftFoot",1,"LeftToeBase",1,"RightLeg",1,"RightLegRoll",1,"RightUpLeg",1,"RightUpLegRoll",1,"RightFoot",1,"RightToeBase",1};
		BodyFullRealRPG[] = {"head",1,"neck1",1,"neck",1,"launcher",1,"weapon",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine1",1,"Spine2",1,"Spine3",1,"Spine",1,"Pelvis",1,"LeftLeg",1,"LeftLegRoll",1,"LeftUpLeg",1,"LeftUpLegRoll",1,"LeftFoot",1,"LeftToeBase",1,"RightLeg",1,"RightLegRoll",1,"RightUpLeg",1,"RightUpLegRoll",1,"RightFoot",1,"RightToeBase",1};
		BodyFull[] = {"head",1,"neck1",1,"neck",1,"weapon",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"Spine1",1,"Spine2",1,"Spine3",1,"Spine",1,"Pelvis",1,"LeftLeg",1,"LeftLegRoll",1,"LeftUpLeg",1,"LeftUpLegRoll",1,"LeftFoot",1,"LeftToeBase",1,"RightLeg",1,"RightLegRoll",1,"RightUpLeg",1,"RightUpLegRoll",1,"RightFoot",1,"RightToeBase",1};
		BodyHalf[] = {"head",0.01,"neck1",0.01,"neck",0.01,"weapon",0.01,"LeftShoulder",0.01,"LeftArm",0.01,"LeftArmRoll",0.01,"LeftForeArm",0.01,"LeftForeArmRoll",0.01,"LeftHand",0.01,"LeftHandRing",0.01,"LeftHandPinky1",0.01,"LeftHandPinky2",0.01,"LeftHandPinky3",0.01,"LeftHandRing1",0.01,"LeftHandRing2",0.01,"LeftHandRing3",0.01,"LeftHandMiddle1",0.01,"LeftHandMiddle2",0.01,"LeftHandMiddle3",0.01,"LeftHandIndex1",0.01,"LeftHandIndex2",0.01,"LeftHandIndex3",0.01,"LeftHandThumb1",0.01,"LeftHandThumb2",0.01,"LeftHandThumb3",0.01,"Spine1",0.01,"Spine2",0.01,"Spine3",0.01,"Spine",0.01,"Pelvis",0.01,"LeftLeg",0.01,"LeftLegRoll",0.01,"LeftUpLeg",0.01,"LeftUpLegRoll",0.01,"LeftFoot",0.01,"LeftToeBase",0.01,"RightLeg",0.01,"RightLegRoll",0.01,"RightUpLeg",0.01,"RightUpLegRoll",0.01,"RightFoot",0.01,"RightToeBase",0.01};
		handsWeapon2[] = {"head",1,"neck1",1,"neck",1,"launcher",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine",1,"Spine1",1,"Spine2",1,"Spine3",1};
		handsWeapon[] = {"head",1,"neck1",1,"neck",1,"weapon",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine",1,"Spine1",1,"Spine2",1,"Spine3",1,"pelvis","MaskStart"};
		upperTorsoRPG[] = {"head",1,"neck1",1,"neck",1,"weapon",1,"launcher",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine",1,"Spine1",1,"Spine2",1,"Spine3",1};
	};
};
class CfgInventoryGlobalVariable
{
	maxSoldierLoad=1300;
};
class Attributes;
class RscStandardDisplay;
class RscProgress;
class RscStructuredText;
class RscPicture;
class RscButton;
class RscShortcutButton;
class RscButtonMenu;
class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscText;
class RscVignette;
class RscDisplayGetReady;
class RscActiveText;
class RscListBox;
class RscListNBox;
class RscCombo;
class RscXListBox;
class RscHTML;
class RscPictureKeepAspect;
class RscActivePicture;
class RscMapControl;
class RscControlsGroupNoScrollbars;
class RscControlsGroupNoHScrollbars;
class RscFrame;
class RscTitle;
class CA_Title;
class RscDebugConsole;
class RscTrafficLight;
class RscFeedback;
class RscMessageBox;
class RscControlsGroup;
class RscTextCheckbox;
class RscDisplayInventory_DLCTemplate;
class RscEdit;
class RscCheckBox;
class RscIGProgress;
class RscHitZones;
class RscIGUIText;
class RscIGUIValue;
class RscOpticsValue;
class RscOpticsText;
class Scrollbar;
class RscIGUIShortcutButton;
class RscActivePictureKeepAspect;
class RscTree;
class RscXSliderH;
class RscObject;
class ctrlMenu;
class ctrlStaticPicture;
class RscButtonMenuSteam;
class RscButtonTextOnly;
class ctrlDefault;
class ctrlDefaultText;
class ctrlDefaultButton;
class ctrlStatic;
class ctrlStaticBackground;
class ctrlStaticTitle;
class ctrlStaticFooter;
class ctrlStaticPictureTile;
class ctrlStaticBackgroundDisableTiles;
class ctrlButton;
class ctrlEdit;
class ctrlEditMulti;
class ctrlListbox;
class ctrlStructuredText;
class ctrlXSliderV;
class ctrlXSliderH;
class ctrlControlsGroup;
class RRPDialogCCTV
{
	idd=20500;
	onLoad="uiNamespace setVariable ['RRPDialogCCTV', _this select 0];(_this call RRPClient_CCTV_onLoad) lbSetCurSel 0";
	onUnload="uiNamespace setVariable ['RRPDialogCCTV', displayNull];_this call RRPClient_CCTV_onUnLoad";
	hideControls[]=
	{
		"CentrPic"
	};
	class controlsBackground
	{
		class Tablet: RscPicture
		{
			idc=-1;
			text="\exile_assets\assets\tablet.paa";
			x="0.268049 * safezoneW + safezoneX";
			y="0.104097 * safezoneH + safezoneY";
			w="0.463902 * safezoneW";
			h="0.802804 * safezoneH";
		};
	};
	class controls
	{
		class CentrPic: RscPicture
		{
			idc=20499;
			text="";
			x="0.316533 * safezoneW + safezoneX";
			y="0.368032 * safezoneH + safezoneY";
			w="0.36649 * safezoneW";
			h="0.339923 * safezoneH";
			onLoad="[_this,'selcamera'] call RRPClient_CCTV_loadInfo";
		};
		class OuMa: RscPicture
		{
			idc=20492;
			style=48;
			text="";
			x="0.316533 * safezoneW + safezoneX";
			y="0.368032 * safezoneH + safezoneY";
			w="0.36649 * safezoneW";
			h="0.339923 * safezoneH";
		};
		class MainCaptureArea: RscListBox
		{
			idc=20498;
			colorBackground[]={0,0,0,0};
			x="0 * safezoneW + safezoneX";
			y="0 * safezoneH + safezoneY";
			w="1 * safezoneW";
			h="1 * safezoneH";
			onMouseMoving="_this call RRPClient_CCTV_onMouseMoving";
			onMouseButtonDown="_this call RRPClient_CCTV_onMouseButtonDown";
			onMouseButtonUp="_this call RRPClient_CCTV_onMouseButtonUp";
			onMouseZChanged="_this call RRPClient_CCTV_onMouseZChanged";
			onLoad="['RRPDialogCCTV','MainCaptureArea'] call RRPClient_gui_util_mouseControl_buildLimits;RRPClientDisplayResetFocus = true";
			class CaptureArea
			{
				x="0.316533 * safezoneW + safezoneX";
				y="0.368032 * safezoneH + safezoneY";
				w="0.36649 * safezoneW";
				h="0.339923 * safezoneH";
			};
		};
		class ComboMiddleCameraSelect: RscCombo
		{
			idc=20497;
			x="0.391756 * safezoneW + safezoneX";
			y="0.313046 * safezoneH + safezoneY";
			w="0.159789 * safezoneW";
			h="0.0219946 * safezoneH";
			onLBSelChanged="_this call RRPClient_CCTV_onCameraDropDownChanged";
			onMouseButtonClick="_this call RRPClient_CCTV_onLoad";
		};
		class StyleTime: RscStructuredText
		{
			idc=20496;
			x="0.6243 * safezoneW + safezoneX";
			y="0.313057 * safezoneH + safezoneY";
			w="0.0566992 * safezoneW";
			h="0.0439893 * safezoneH";
			onLoad="[_this,'time'] call RRPClient_CCTV_loadInfo";
		};
		class StyleDate: RscStructuredText
		{
			idc=20495;
			x="0.556699 * safezoneW + safezoneX";
			y="0.313046 * safezoneH + safezoneY";
			w="0.0670081 * safezoneW";
			h="0.0439893 * safezoneH";
			onLoad="[_this,'date'] call RRPClient_CCTV_loadInfo";
		};
		class StyleUserInfoText: RscStructuredText
		{
			idc=20494;
			x="0.315606 * safezoneW + safezoneX";
			y="0.313057 * safezoneH + safezoneY";
			w="0.0721626 * safezoneW";
			h="0.0439893 * safezoneH";
			onLoad="[_this,'player'] call RRPClient_CCTV_loadInfo";
		};
		class selectedCamera: RscText
		{
			idc=20493;
			text="Камера не выбрана";
			shadow=1;
			x="0.391756 * safezoneW + safezoneX";
			y="0.335041 * safezoneH + safezoneY";
			w="0.159789 * safezoneW";
			h="0.0219946 * safezoneH";
		};
		class NoSignal: RscPicture
		{
			show=0;
			enable=0;
			idc=20492;
			text="";
			x="0.316533 * safezoneW + safezoneX";
			y="0.368032 * safezoneH + safezoneY";
			w="0.36649 * safezoneW";
			h="0.339923 * safezoneH";
		};
	};
};
class RRPDisplayGuiMessage
{
	idd=-1;
	onLoad="uinameSpace setVariable ['RRPDisplayGuiMessage',_this#0]";
	class controlsBackground
	{
		class tiles: ctrlStaticBackgroundDisableTiles
		{
		};
		class background: ctrlStaticBackground
		{
			idc=1;
			x="( ((getResolution select 2) * 0.5 * pixelW))-(0.5*(130*(pixelW * pixelGrid *  0.50)))";
			y="( ((getResolution select 3) * 0.5 * pixelH))-(0.5*(160*(pixelH * pixelGrid *  0.50)))";
			w="130*(pixelW * pixelGrid *  0.50)";
			h="160*(pixelH * pixelGrid *  0.50)";
		};
		class title: ctrlStaticTitle
		{
			idc=2;
			x="( ((getResolution select 2) * 0.5 * pixelW))-(0.5*(130*(pixelW * pixelGrid *  0.50)))";
			y="( ((getResolution select 3) * 0.5 * pixelH))-(0.5*(160*(pixelH * pixelGrid *  0.50)))";
			w="130*(pixelW * pixelGrid *  0.50)";
			h="5*(pixelH * pixelGrid *  0.50)";
		};
		class footer: ctrlStaticFooter
		{
			idc=3;
			x="( ((getResolution select 2) * 0.5 * pixelW))-(0.5*(130*(pixelW * pixelGrid *  0.50)))";
			y="( ((getResolution select 3) * 0.5 * pixelH))-(0.5*(160*(pixelH * pixelGrid *  0.50))) + 160*(pixelH * pixelGrid *  0.50) - 7*(pixelH * pixelGrid *  0.50)";
			w="130*(pixelW * pixelGrid *  0.50)";
			h="7*(pixelH * pixelGrid *  0.50)";
		};
	};
	class controls
	{
		class textContainer: ctrlControlsGroup
		{
			idc=4;
			x="( ((getResolution select 2) * 0.5 * pixelW))-(0.5*(130*(pixelW * pixelGrid *  0.50))) + 2*(pixelW * pixelGrid *  0.50)";
			y="( ((getResolution select 3) * 0.5 * pixelH))-(0.5*(160*(pixelH * pixelGrid *  0.50))) +  5*(pixelH * pixelGrid *  0.50) + 4*(pixelH * pixelGrid *  0.50)";
			w="130*(pixelW * pixelGrid *  0.50) - 4*(pixelW * pixelGrid *  0.50)";
			h="160*(pixelH * pixelGrid *  0.50) -  5*(pixelH * pixelGrid *  0.50) - 7*(pixelH * pixelGrid *  0.50) - 4*(pixelH * pixelGrid *  0.50)";
			class controls
			{
				class text: ctrlStructuredText
				{
					idc=5;
					size="5*(pixelH * pixelGrid *  0.50)";
					x=0;
					y=0;
					w="130*(pixelW * pixelGrid *  0.50) - 4*(pixelW * pixelGrid *  0.50)";
					h="160*(pixelH * pixelGrid *  0.50) -  5*(pixelH * pixelGrid *  0.50) - 7*(pixelH * pixelGrid *  0.50) - 4*(pixelH * pixelGrid *  0.50)";
				};
			};
		};
		class buttonL: ctrlButton
		{
			idc=6;
			x="( ((getResolution select 2) * 0.5 * pixelW))-(0.5*(130*(pixelW * pixelGrid *  0.50))) + 130*(pixelW * pixelGrid *  0.50) - (( 5*6)*2)*(pixelW * pixelGrid *  0.50) - 2*(pixelW * pixelGrid *  0.50)";
			y="( ((getResolution select 3) * 0.5 * pixelH))-(0.5*(160*(pixelH * pixelGrid *  0.50))) + 160*(pixelH * pixelGrid *  0.50) -  5*(pixelH * pixelGrid *  0.50) - 1*(pixelH * pixelGrid *  0.50)";
			w="( 5*6)*(pixelW * pixelGrid *  0.50)";
			h="5*(pixelH * pixelGrid *  0.50)";
		};
		class buttonR: buttonL
		{
			idc=7;
			x="( ((getResolution select 2) * 0.5 * pixelW))-(0.5*(130*(pixelW * pixelGrid *  0.50))) + 130*(pixelW * pixelGrid *  0.50) - ( 5*6)*(pixelW * pixelGrid *  0.50) - 1*(pixelW * pixelGrid *  0.50)";
		};
	};
};
class RscTitlesText
{
	fontBasic="FordAntenna";
	sizeExBasic="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontDown="FordAntenna";
	sizeExDown="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	offsetDown="(((profilenamespace getvariable [""IGUI_GRID_CHAT_Y"",(safezoneY + safezoneH - 10.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))]) + 3 * (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)) - 0.5)";
};
class RscChatListDefault
{
	shadow=0;
	shadowPlayer=0;
	shadowColor[]={0,0,0,0.5};
	x="1.2 * (((safezoneW / safezoneH) min 1.2) / 40) + (SafezoneX)";
	y="17.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY) + 0.7*(safezoneH -(((safezoneW / safezoneH) min 1.2) / 1.2))";
	w="(18.5 * (((safezoneW / safezoneH) min 1.2) / 40)) + 0.45*(safezoneW - ((safezoneW / safezoneH) min 1.2))";
	h="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	font="ALSHaussHairline";
	size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	rows="((5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))+ 0.3*(safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))) / (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	colorBackground[]={0,0,0,0.10000001};
	colorGlobalChannel[]=
	{
		"0.606*1.4",
		"0.606*1.4",
		"0.606*1.4",
		1
	};
	colorGlobalChannelPlayerBackground[]=
	{
		"0.606*1.4",
		"0.606*1.4",
		"0.606*1.4",
		0.5
	};
	colorGlobalChannelPlayerText[]={0,0,0,1};
	colorSideChannel[]=
	{
		"0.196*1.4",
		"0.592*1.4",
		"0.706*1.4",
		1
	};
	colorSideChannelPlayerBackground[]=
	{
		"0.196*1.4",
		"0.592*1.4",
		"0.706*1.4",
		0.5
	};
	colorSideChannelPlayerText[]={0,0,0,1};
	colorCommandChannel[]=
	{
		"0.8275*1.4",
		"0.8196*1.4",
		"0.1961*1.4",
		1
	};
	colorCommandChannelPlayerBackground[]=
	{
		"0.8275*1.4",
		"0.8196*1.4",
		"0.1961*1.4",
		0.5
	};
	colorCommandChannelPlayerText[]={0,0,0,1};
	colorGroupChannel[]={0.70899999,0.972,0.384,1};
	colorGroupChannelPlayerBackground[]={0.70899999,0.972,0.384,0.5};
	colorGroupChannelPlayerText[]={0,0,0,1};
	colorVehicleChannel[]=
	{
		"0.863*1.4",
		"0.584*1.4",
		"0.0*1.4",
		1
	};
	colorVehicleChannelPlayerBackground[]=
	{
		"0.863*1.4",
		"0.584*1.4",
		"0.0*1.4",
		0.5
	};
	colorVehicleChannelPlayerText[]={0,0,0,1};
	colorDirectChannel[]={1,1,1,1};
	colorDirectChannelPlayerBackground[]={1,1,1,0.5};
	colorDirectChannelPlayerText[]={0,0,0,1};
	colorPlayerChannel[]={0.80000001,0.69999999,1,1};
	colorPlayerChannelPlayerBackground[]={0.80000001,0.69999999,1,0.5};
	colorPlayerChannelPlayerText[]={0,0,0,1};
	colorMessage[]={1,1,1,1};
	colorMessageProtocol[]={1,1,1,1};
};
class CfgLoadingScreen
{
	templates[]=
	{
		{
			"Уважайте себя и других!"
		}
	};
};
class CfgMissions
{
	class Cutscenes
	{
		class RRPIntroRRpMap
		{
			directory="rimas_agent\intro\RimasIntro.RRpMap";
		};
	};
};
class CfgMarkerClasses
{
	class HuntingMarkers
	{
		displayName="Hunt Markers";
	};
	class ItsPlayer
	{
		displayName="Player Icon";
	};
};
class CfgLocationTypes
{
	class Name;
	class GangLoc: Name
	{
		color[]={0,0,0,0};
		drawStyle="name";
		font="PuristaMedium";
		name="Gangs Locations";
		textSize=0.050000001;
		size=15;
	};
};
class CfgWorlds
{
	class CAWorld;
	demoWorld="RRpMap";
	initWorld="RRpMap";
	class Altis;
	class RRpMap: Altis
	{
		pictureMap="\rimas_agent\texture\loading\pictureMap_ca.paa";
		cutscenes[]=
		{
			"RRPIntroRRpMap"
		};
		loadingTexts[]=
		{
			"Внимательно изучите все правила!",
			"Настоятельно рекомендуем записывать игровой процесс",
			"Наш сайт: http://rocket-rp.fun"
		};
	};
};
class CfgMarkers
{
	class HuntingMarkers
	{
		scope=2;
		name="Hunt Zone";
		icon="\rimas_agent\assets\russian_roulette_ca.paa";
		color[]={1,1,1,1};
		size=32;
		shadow=0;
		markerClass="HuntingMarkers";
		showEditorMarkerColor=0;
	};
	class ItsPlayer
	{
		scope=0;
		name="Player Marker";
		icon="\A3\ui_f\data\map\VehicleIcons\iconman_ca.paa";
		color[]={1,1,1,1};
		size=32;
		shadow=0;
		markerClass="ItsPlayer";
		showEditorMarkerColor=0;
	};
};
class CfgTasks
{
	class Animal_Rooster
	{
		name="Rooster Main Task";
		fsm="\rimas_agent\fsm\Animal_Rooster.fsm";
		condition="\A3\animals_f\Data\scripts\createSingleTask.sqf";
		description="";
		destination="";
		resources[]={};
	};
	class Animal_Hen
	{
		name="Hen Main Task";
		fsm="\rimas_agent\fsm\Animal_Hen.fsm";
		condition="\A3\animals_f\Data\scripts\createSingleTask.sqf";
		description="";
		destination="";
		resources[]={};
	};
	class Animal_Goat
	{
		name="Goat Main Task";
		fsm="\rimas_agent\fsm\Animal_Goat.fsm";
		condition="\A3\animals_f\Data\scripts\createSingleTask.sqf";
		description="";
		destination="";
		resources[]={};
	};
	class Animal_Sheep
	{
		name="Sheep Main Task";
		fsm="\rimas_agent\fsm\Animal_Sheep.fsm";
		condition="\A3\animals_f\Data\scripts\createSingleTask.sqf";
		description="";
		destination="";
		resources[]={};
	};
};
class CfgVehicles
{
	
	class WeaponHolder;
	class GroundWeaponHolder: WeaponHolder
	{
		model = "\A3\Structures_F_Heli\Items\Luggage\PlasticCase_01_small_F.p3d";
		author="$STR_A3_Bohemia_Interactive";
		mapSize=5.1799998;
		_generalMacro="GroundWeaponHolder";
		scope=1;
	};
	class B_AAA_System_01_F;
	class B_AAA_System_01_F_INDEP: B_AAA_System_01_F
	{
		side=2;
		faction="BLU_F";
		crew="B_UAV_AI";
		typicalCargo[]=
		{
			"B_UAV_AI"
		};
	};
	class NonStrategic;
	class RRPObject_CCTV: NonStrategic
	{
		author="Not me";
		mapSize=1;
		armor=10000;
		cost=1000;
		scope=2;
		model="exile_assets\model\Exile_Construction_BaseCamera.p3d";
		displayName="Base Camera";
		destrType="DestructNo";
		hiddenSelections[]={};
		hiddenSelectionsTextures[]={};
		class AnimationSources
		{
			class ExileCctvPitch
			{
				source="user";
				initPhase=0;
				animPeriod=1;
				sound="";
			};
			class ExileCctvYaw
			{
				source="user";
				initPhase=0;
				animPeriod=1;
				sound="";
			};
		};
		class Eventhandlers
		{
			init="[_this select 0,'lpt_cctv',1] call CAU_animate_fnc_add";
		};
	};
	class Land_ChairWood_F;
	class RussianRouletteChair: Land_ChairWood_F
	{
		scope=2;
		author="Nobody";
		destrType="DestructNo";
		displayName="Russian Roulette Chair";
	};
	class Land_Laptop_03_olive_F;
	class RRPObject_LapTop_CCTV: Land_Laptop_03_olive_F
	{
		scope=2;
		displayName="Терминал наблюдения";
		destrType="DestructNo";
		class UserActions
		{
			class Take
			{
				available=1;
				displayNameDefault="<img image='\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa' size='2' shadow='true' />";
				condition="true";
				displayName="<img image='\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa' size='1' shadow='true' /> Терминал наблюдения";
				onlyForPlayer=1;
				position="Supply";
				priority=6;
				radius=2;
				showWindow=1;
				statement="[this] call RRPClient_CCTV_show";
			};
		};
	};
	class Animal_Base_F;
	class Animal_Abstract: Animal_Base_F
	{
		scope=1;
		author="Rimas Role Play";
		hiddenSelectionsTextures[]={};
		hiddenSelectionMaterials[]={};
		class EventHandlers
		{
			init="";
		};
		class RRP
		{
			variations[]={};
			fleeMove="";
			idleMove="";
			gutItems="";
			dangerSounds[]={};
			deathSounds[]={};
			idleSounds[]={};
		};
	};
	class Animal_Goat_Abstract: Animal_Abstract
	{
		scope=1;
		displayName="Goat";
		model="\A3\animals_f_beta\Goat\Goat_F.p3d";
		hasGeometry=1;
		moves="CfgMovesGoat_F";
		hiddenSelections[]=
		{
			"camo"
		};
		agentTasks[]=
		{
			"Animal_Goat"
		};
		class Wounds
		{
			tex[]={};
			mat[]=
			{
				"a3\animals_f_beta\Goat\data\goat.rvmat",
				"a3\animals_f_beta\Goat\data\W1_goat.rvmat",
				"a3\animals_f_beta\Goat\data\W2_goat.rvmat"
			};
		};
		class RRP
		{
			variations[]=
			{
				"Animal_Goat_Black",
				"Animal_Goat_Dirty",
				"Animal_Goat_White",
				"Animal_Goat_Old",
				"Animal_Goat_Spotted"
			};
			fleeMove="Goat_Run";
			idleMove="Goat_Idle_Stop";
			idleSounds[]=
			{
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep1.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep2.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep3.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep4.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep5.wss",
					100,
					4
				}
			};
			dangerSounds[]=
			{
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep1.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep2.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep3.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep4.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep5.wss",
					100,
					4
				}
			};
			deathSounds[]=
			{
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep1.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep2.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep3.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep4.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep5.wss",
					100,
					4
				}
			};
			gutItems="goatraw";
			bestPlaces="hills * (1 - trees) * (1 - forest)";
		};
	};
	class Animal_Goat_Black: Animal_Goat_Abstract
	{
		scope=2;
		displayName="Goat (Black)";
		hiddenSelectionsTextures[]=
		{
			"a3\animals_f_beta\Goat\Data\black_goat_co.paa"
		};
		hiddenSelectionMaterials[]=
		{
			"a3\animals_f_beta\goat\data\goat_black.rvmat"
		};
	};
	class Animal_Goat_Dirty: Animal_Goat_Abstract
	{
		scope=2;
		displayName="Goat (Dirty)";
		hiddenSelectionsTextures[]=
		{
			"a3\animals_f_beta\Goat\Data\dirt_goat_co.paa"
		};
		hiddenSelectionMaterials[]=
		{
			"a3\animals_f_beta\goat\data\goat_dirt.rvmat"
		};
	};
	class Animal_Goat_White: Animal_Goat_Abstract
	{
		scope=2;
		displayName="Goat (White)";
		hiddenSelectionsTextures[]=
		{
			"a3\animals_f_beta\Goat\Data\goat_co.paa"
		};
		hiddenSelectionMaterials[]=
		{
			"a3\animals_f_beta\goat\data\goat_white.rvmat"
		};
	};
	class Animal_Goat_Old: Animal_Goat_Abstract
	{
		scope=2;
		displayName="Goat (Old)";
		hiddenSelectionsTextures[]=
		{
			"a3\animals_f_beta\Goat\Data\old_goat_co.paa"
		};
		hiddenSelectionMaterials[]=
		{
			"a3\animals_f_beta\goat\data\goat_old.rvmat"
		};
	};
	class Animal_Goat_Spotted: Animal_Goat_Abstract
	{
		scope=2;
		displayName="Goat (Spotted)";
		hiddenSelectionsTextures[]=
		{
			"a3\animals_f_beta\Goat\Data\white_goat_co.paa"
		};
		hiddenSelectionMaterials[]=
		{
			"a3\animals_f_beta\goat\data\goat_white.rvmat"
		};
	};
	class Animal_Hen_Abstract: Animal_Abstract
	{
		scope=1;
		displayName="Hen";
		model="\A3\animals_f_beta\chicken\Hen_F.p3d";
		hasGeometry=1;
		moves="CfgMovesHen_F";
		hiddenSelections[]=
		{
			"camo"
		};
		agentTasks[]=
		{
			"Animal_Hen"
		};
		class Wounds
		{
			tex[]={};
			mat[]=
			{
				"a3\animals_f_beta\Chicken\data\cock_white.rvmat",
				"a3\animals_f_beta\Chicken\data\W1_cock.rvmat",
				"a3\animals_f_beta\Chicken\data\W2_cock.rvmat"
			};
		};
		class RRP
		{
			variations[]=
			{
				"Animal_Hen_White"
			};
			fleeMove="Hen_Run";
			idleMove="Hen_Idle_Stop";
			idleSounds[]=
			{
				
				{
					"a3\sounds_f\environment\animals\hen1.wss",
					100,
					4
				},
				
				{
					"a3\sounds_f\environment\animals\hen2.wss",
					100,
					4
				},
				
				{
					"a3\sounds_f\environment\animals\hen3.wss",
					100,
					4
				}
			};
			dangerSounds[]=
			{
				
				{
					"a3\sounds_f\environment\animals\hen1.wss",
					100,
					4
				},
				
				{
					"a3\sounds_f\environment\animals\hen2.wss",
					100,
					4
				},
				
				{
					"a3\sounds_f\environment\animals\hen3.wss",
					100,
					4
				}
			};
			deathSounds[]=
			{
				
				{
					"a3\sounds_f\environment\animals\hen1.wss",
					100,
					4
				},
				
				{
					"a3\sounds_f\environment\animals\hen2.wss",
					100,
					4
				},
				
				{
					"a3\sounds_f\environment\animals\hen3.wss",
					100,
					4
				}
			};
			gutItems="henraw";
			bestPlaces="houses * (1 - sea)";
		};
	};
	class Animal_Hen_White: Animal_Hen_Abstract
	{
		scope=2;
		displayName="Hen (White)";
		hiddenSelectionsTextures[]=
		{
			"a3\animals_f_beta\Chicken\data\hen_co.paa"
		};
		hiddenSelectionMaterials[]=
		{
			"a3\animals_f_beta\Chicken\data\hen.rvmat"
		};
	};
	class Animal_Rooster_Abstract: Animal_Abstract
	{
		scope=1;
		displayName="Rooster";
		model="\A3\animals_f_beta\chicken\Cock_F.p3d";
		hasGeometry=1;
		moves="CfgMovesCock_F";
		hiddenSelections[]=
		{
			"camo"
		};
		agentTasks[]=
		{
			"Animal_Rooster"
		};
		class Wounds
		{
			tex[]={};
			mat[]=
			{
				"a3\animals_f_beta\Chicken\data\hen.rvmat",
				"a3\animals_f_beta\Chicken\data\W1_hen.rvmat",
				"a3\animals_f_beta\Chicken\data\W2_hen.rvmat"
			};
		};
		class RRP
		{
			variations[]=
			{
				"Animal_Rooster_Gold",
				"Animal_Rooster_Brown",
				"Animal_Rooster_White"
			};
			fleeMove="Cock_Run";
			idleMove="Cock_Idle_Stop";
			idleSounds[]=
			{
				
				{
					"a3\sounds_f\environment\animals\hen1.wss",
					100,
					4
				},
				
				{
					"a3\sounds_f\environment\animals\hen2.wss",
					100,
					4
				},
				
				{
					"a3\sounds_f\environment\animals\hen3.wss",
					100,
					4
				}
			};
			dangerSounds[]=
			{
				
				{
					"a3\sounds_f\environment\animals\hen1.wss",
					100,
					4
				},
				
				{
					"a3\sounds_f\environment\animals\hen2.wss",
					100,
					4
				},
				
				{
					"a3\sounds_f\environment\animals\hen3.wss",
					100,
					4
				}
			};
			deathSounds[]=
			{
				
				{
					"a3\sounds_f\environment\animals\hen1.wss",
					100,
					4
				},
				
				{
					"a3\sounds_f\environment\animals\hen2.wss",
					100,
					4
				},
				
				{
					"a3\sounds_f\environment\animals\hen3.wss",
					100,
					4
				}
			};
			gutItems="roosterraw";
			bestPlaces="houses * (1 - sea)";
		};
	};
	class Animal_Rooster_Brown: Animal_Rooster_Abstract
	{
		scope=2;
		displayName="Rooster (Brown)";
		hiddenSelectionsTextures[]=
		{
			"a3\animals_f_beta\Chicken\data\brown_rooster_CO.paa"
		};
		hiddenSelectionMaterials[]=
		{
			"a3\animals_f_beta\Chicken\data\cock_brown.rvmat"
		};
	};
	class Animal_Rooster_White: Animal_Rooster_Abstract
	{
		scope=2;
		displayName="Rooster (White)";
		hiddenSelectionsTextures[]=
		{
			"a3\animals_f_beta\Chicken\data\white_rooster_CO.paa"
		};
		hiddenSelectionMaterials[]=
		{
			"a3\animals_f_beta\Chicken\data\cock_white.rvmat"
		};
	};
	class Animal_Rooster_Gold: Animal_Rooster_Abstract
	{
		scope=2;
		displayName="Rooster (Gold)";
		hiddenSelectionsTextures[]=
		{
			"a3\animals_f_beta\Chicken\data\kohout_co.paa"
		};
		hiddenSelectionMaterials[]=
		{
			"a3\animals_f_beta\Chicken\data\cock_brown.rvmat"
		};
	};
	class Animal_Sheep_Abstract: Animal_Abstract
	{
		scope=1;
		displayName="Sheep";
		model="\A3\animals_f_beta\Sheep\Sheep_F.p3d";
		hasGeometry=1;
		moves="CfgMovesSheep_F";
		hiddenSelections[]=
		{
			"camo"
		};
		agentTasks[]=
		{
			"Animal_Sheep"
		};
		class Wounds
		{
			tex[]={};
			mat[]=
			{
				"A3\animals_f_beta\sheep\data\sheep.rvmat",
				"A3\animals_f_beta\sheep\data\W1_sheep.rvmat",
				"A3\animals_f_beta\sheep\data\W2_sheep.rvmat"
			};
		};
		class RRP
		{
			variations[]=
			{
				"Animal_Sheep_Beige",
				"Animal_Sheep_White",
				"Animal_Sheep_Brown",
				"Animal_Sheep_Spotted",
				"Animal_Sheep_Tricolor"
			};
			fleeMove="Sheep_Run";
			idleMove="Sheep_Idle_Stop";
			idleSounds[]=
			{
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep1.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep2.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep3.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep4.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep5.wss",
					100,
					4
				}
			};
			dangerSounds[]=
			{
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep1.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep2.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep3.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep4.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep5.wss",
					100,
					4
				}
			};
			deathSounds[]=
			{
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep1.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep2.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep3.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep4.wss",
					100,
					4
				},
				
				{
					"a3\animals_f_beta\Sheep\Data\sound\sheep5.wss",
					100,
					4
				}
			};
			gutItems="sheepraw";
			bestPlaces="meadow * (1 - hills) * (1 - sea) * (1 - trees) * (1 - forest) * (1 - houses)";
		};
	};
	class Animal_Sheep_Beige: Animal_Sheep_Abstract
	{
		scope=2;
		displayName="Sheep (Beige)";
		hiddenSelectionsTextures[]=
		{
			"a3\animals_f_beta\Sheep\Data\sheep_co.paa"
		};
	};
	class Animal_Sheep_White: Animal_Sheep_Abstract
	{
		scope=2;
		displayName="Sheep (White)";
		hiddenSelectionsTextures[]=
		{
			"a3\animals_f_beta\Sheep\Data\white_sheep_co.paa"
		};
	};
	class Animal_Sheep_Brown: Animal_Sheep_Abstract
	{
		scope=2;
		displayName="Sheep (Brown)";
		hiddenSelectionsTextures[]=
		{
			"a3\animals_f_beta\Sheep\Data\brown_sheep_co.paa"
		};
	};
	class Animal_Sheep_Spotted: Animal_Sheep_Abstract
	{
		scope=2;
		displayName="Sheep (Spotted)";
		hiddenSelectionsTextures[]=
		{
			"a3\animals_f_beta\Sheep\Data\blackwhite_sheep_co.paa"
		};
	};
	class Animal_Sheep_Tricolor: Animal_Sheep_Abstract
	{
		scope=2;
		displayName="Sheep (Tricolor)";
		hiddenSelectionsTextures[]=
		{
			"a3\animals_f_beta\Sheep\Data\tricolor_sheep_co.paa"
		};
	};
};
class CfgMagazines
{
	class Default;
	class CA_Magazine: Default
	{
		strSwitchWeaponTo="";
	};
	class VehicleMagazine: CA_Magazine
	{
	};
	class CA_LauncherMagazine: CA_Magazine
	{
	};
	class testmag: CA_Magazine
	{
		scope=2;
		displayName="Default paint";
		picture="\A3\Weapons_F\Data\placeholder_co.paa";
		ammo="B_Test_Caseless";
		count=1;
		initSpeed=1;
		tracersEvery=0;
		lastRoundsTracer=0;
	};
	class default_paint: testmag
	{
		tracersEvery=999999;
		lastRoundsTracer=0;
		displayName="Default paint";
		effectsFire="RH_RifleSmokeTrail";
	};
};
class RscInGameUI
{
	class RscHint
	{
		idd=301;
		movingEnable=0;
		controls[]=
		{
			"Background",
			"Hint"
		};
		class Background: RscText
		{
			idc=101;
			style=128;
			x="((safezoneX + safezoneW) -   (12 *    (   ((safezoneW / safezoneH) min 1.2) / 40)) - 1 *    (   ((safezoneW / safezoneH) min 1.2) / 40))";
			y="(safezoneY + 6 *    (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
			w="(12 *    (   ((safezoneW / safezoneH) min 1.2) / 40))";
			h="(8 *    (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
			text="";
			colorBackground[]=
			{
				"19/255",
				"22/255",
				"27/255",
				0.80000001
			};
			shadow=1;
		};
		class Hint: RscStructuredText
		{
			idc=102;
			x="((safezoneX + safezoneW) -   (12 *    (   ((safezoneW / safezoneH) min 1.2) / 40)) - 1 *    (   ((safezoneW / safezoneH) min 1.2) / 40)) + 0.4*     (   ((safezoneW / safezoneH) min 1.2) / 40)";
			y="(safezoneY + 6 *    (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)) + 0.3*     (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="(12 *    (   ((safezoneW / safezoneH) min 1.2) / 40)) - 0.8*     (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="(8 *    (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)) - 0.8*     (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			style=16;
			shadow=1;
			size="(   (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			class Attributes: Attributes
			{
			};
		};
	};
};
class RscToast: RscControlsGroupNoScrollbars
{
	idc=-1;
	x=0;
	y=0;
	w="240 * pixelW";
	h="60 * pixelH";
	fade=1;
	class controls
	{
		class Background: RscText
		{
			idc=100;
			x=0;
			y=0;
			w="240 * pixelW";
			h="60 * pixelH";
			colorBackground[]={0.25999999,0.23999999,0.31,1};
		};
		class Stripe: RscText
		{
			idc=101;
			x=0;
			y=0;
			w="5 * pixelW";
			h="60 * pixelH";
			colorBackground[]=
			{
				"199/255",
				"38/255",
				"81/255",
				1
			};
		};
		class Text: RscStructuredText
		{
			idc=102;
			text="<t size='22' font='RobotoCondensedBold'>Title!</t><br/><t color='#ff979ba1' size='19' font='RobotoCondensed'>Second message</t>";
			x="10 * pixelW";
			y=0;
			w="(240 - 10) * pixelW";
			h="60 * pixelH";
			size="1 * pixelH";
			shadow=0;
			colorBackground[]={0,0,0,0};
			class Attributes
			{
				shadow=0;
			};
		};
	};
};
class RscBaguette: RscControlsGroupNoScrollbars
{
	idc=-1;
	x="safezoneX + safezoneW * 0.5 - ((60 + 5 + 400) * 0.5) * pixelW";
	y="safezoneY + 60 * pixelH";
	w="(60 + 5 + 400) * pixelW";
	h="60 * pixelH";
	class controls
	{
		class TextGroup: RscControlsGroupNoScrollbars
		{
			idc=5001;
			x="(60 + 5) * pixelW";
			y=0;
			w="400 * pixelW";
			h="60 * pixelH";
			fade=0;
			class controls
			{
				class TextBackground: RscText
				{
					idc=-1;
					x=0;
					y=0;
					w="400 * pixelW";
					h="60 * pixelH";
					colorBackground[]=
					{
						"19/255",
						"22/255",
						"27/255",
						0.80000001
					};
				};
				class Text: RscText
				{
					idc=5002;
					x="5 * pixelW";
					y=0;
					w="(400 - 5) * pixelW";
					h="60 * pixelH";
					colorText[]={1,1,1,1};
					font="PuristaBold";
					sizeEx="29 * pixelH";
					shadow=0;
				};
			};
		};
		class IconGroup: RscControlsGroupNoScrollbars
		{
			idc=5000;
			x=0;
			y=0;
			w="60 * pixelW";
			h="60 * pixelH";
			fade=0;
			class controls
			{
				class IconBackground: RscText
				{
					idc=-1;
					x=0;
					y=0;
					w="60 * pixelW";
					h="60 * pixelH";
					colorBackground[]=
					{
						"19/255",
						"22/255",
						"27/255",
						0.80000001
					};
				};
				class Icon: RscPictureKeepAspect
				{
					idc=5003;
					text="";
					x=0;
					y=0;
					w="60 * pixelW";
					h="60 * pixelH";
				};
			};
		};
	};
};
class RRP_background;
class RRP_title;
class RRP_RscStructuredText;
class RRP_RscEdit;
class RRP_RscCombo;
class RRP_btn_noLine;
class RRP_RscXSliderH;
class RscMapCreateMenu: RscControlsGroupNoScrollbars
{
	onLoad="uiNamespace setVariable ['RscMapCreateMenu', _this select 0]";
	onUnload="uiNamespace setVariable ['RscMapCreateMenu', controlNull]";
	x=0;
	y=0;
	w="21.5 * (0.025)";
	h="13.5 * (0.04)";
	class controls
	{
		class DialogBackground: RRP_background
		{
			idc=-1;
			x="0 * (0.025) + (0)";
			y="1.1 * (0.04) + (0)";
			w="21.5 * (0.025)";
			h="9.9 * (0.04)";
		};
		class DialogCaption: RRP_title
		{
			idc=-1;
			text="Добавить маркер";
			x="0 * (0.025) + (0)";
			y="0 * (0.04) + (0)";
			w="21.5 * (0.025)";
			h="1 * (0.04)";
		};
		class NameLabel: RRP_RscStructuredText
		{
			idc=-1;
			text="Имя:";
			x="0.5 * (0.025) + (0)";
			y="1.5 * (0.04) + (0)";
			w="5.5 * (0.025)";
			h="1.5 * (0.04)";
		};
		class NameInput: RRP_RscEdit
		{
			idc=4000;
			x="6.5 * (0.025) + (0)";
			y="1.5 * (0.04) + (0)";
			w="14.5 * (0.025)";
			h="1.5 * (0.04)";
			autocomplete="";
			font="EtelkaMonospacePro";
			style=16;
			sizeEx="1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ColorLabel: RRP_RscStructuredText
		{
			idc=-1;
			text="Цвет:";
			x="0.5 * (0.025) + (0)";
			y="3.5 * (0.04) + (0)";
			w="5.5 * (0.025)";
			h="1 * (0.04)";
		};
		class ColorDropDown: RRP_RscCombo
		{
			idc=4002;
			x="6.5 * (0.025) + (0)";
			y="3.5 * (0.04) + (0)";
			w="14.5 * (0.025)";
			h="1 * (0.04)";
			onLBSelChanged="_this call RRPClient_groups_markerAddMenu_event_onColorLbSelectionChanged;";
		};
		class IconLabel: RRP_RscStructuredText
		{
			idc=-1;
			text="Иконка:";
			x="0.5 * (0.025) + (0)";
			y="5 * (0.04) + (0)";
			w="5.5 * (0.025)";
			h="1 * (0.04)";
		};
		class IconDropDown: RRP_RscCombo
		{
			idc=4001;
			x="6.5 * (0.025) + (0)";
			y="5 * (0.04) + (0)";
			w="14.5 * (0.025)";
			h="1 * (0.04)";
			onLBSelChanged="_this call RRPClient_groups_markerAddMenu_event_onIconLbSelectionChanged;";
		};
		class CancelButton: RRP_btn_noLine
		{
			idc=-1;
			x="14 * (0.025) + (0)";
			y="9.5 * (0.04) + (0)";
			w="7 * (0.025)";
			h="1 * (0.04)";
			text="ОТМЕНА";
			onButtonClick="call RRPClient_groups_markerAddMenu_event_onUnload;";
		};
		class AddButton: RRP_btn_noLine
		{
			idc=-1;
			text="ДОБАВИТЬ";
			x="6.5 * (0.025) + (0)";
			y="9.5 * (0.04) + (0)";
			w="7 * (0.025)";
			h="1 * (0.04)";
			onButtonClick="call RRPClient_groups_markerAddMenu_event_onAddButtonClick;";
		};
		class IconSizeLabel: RRP_RscStructuredText
		{
			idc=-1;
			text="Размер иконки:";
			x="0.5 * (0.025) + (0)";
			y="6.5 * (0.04) + (0)";
			w="5.5 * (0.025)";
			h="1 * (0.04)";
		};
		class TextSizeLabel: RRP_RscStructuredText
		{
			idc=-1;
			text="Размер текста:";
			x="0.5 * (0.025) + (0)";
			y="8 * (0.04) + (0)";
			w="5.5 * (0.025)";
			h="1 * (0.04)";
		};
		class IconSizeSlider: RRP_RscXSliderH
		{
			idc=4004;
			x="6.5 * (0.025) + (0)";
			y="6.5 * (0.04) + (0)";
			w="14.5 * (0.025)";
			h="1 * (0.04)";
			sliderPosition=30;
			sliderRange[]={1,50};
			onSliderPosChanged="_this call RRPClient_groups_markerAddMenu_event_onIconResize; false";
			color[]=
			{
				"63/255",
				"212/255",
				"252/255",
				1
			};
			colorActive[]=
			{
				"63/255",
				"212/255",
				"252/255",
				1
			};
		};
		class TextSizeSlider: RRP_RscXSliderH
		{
			idc=4005;
			x="6.5 * (0.025) + (0)";
			y="8 * (0.04) + (0)";
			w="14.5 * (0.025)";
			h="1 * (0.04)";
			sliderPosition=0.059999999;
			sliderRange[]={0.005,0.2};
			onSliderPosChanged="call RRPClient_groups_markerAddMenu_event_onTextResize; false";
			color[]=
			{
				"63/255",
				"212/255",
				"252/255",
				1
			};
			colorActive[]=
			{
				"63/255",
				"212/255",
				"252/255",
				1
			};
		};
	};
};
class RscMapCreatePoly: RscControlsGroupNoScrollbars
{
	onLoad="uiNamespace setVariable ['RscMapCreatePoly', _this select 0]";
	onUnload="uiNamespace setVariable ['RscMapCreatePoly', controlNull]";
	x="0 * (0.025) + (0)";
	y="0 * (0.04) + (0)";
	w="15 * (0.025)";
	h="7.5 * (0.04)";
	class controls
	{
		class DialogCaption: RRP_title
		{
			idc=-1;
			text="Добавить линию";
			x="0 * (0.025) + (0)";
			y="0 * (0.04) + (0)";
			w="15 * (0.025)";
			h="1 * (0.04)";
		};
		class DialogBackground: RRP_background
		{
			idc=-1;
			x="0 * (0.025) + (0)";
			y="1.2 * (0.04) + (0)";
			w="15 * (0.025)";
			h="6 * (0.04)";
		};
		class ColorLabel: RRP_RscStructuredText
		{
			idc=-1;
			text="Цвет:";
			x="0 * (0.025) + (0)";
			y="1.5 * (0.04) + (0)";
			w="3.5 * (0.025)";
			h="1 * (0.04)";
		};
		class ColorDropDown: RRP_RscCombo
		{
			idc=4000;
			x="3.5 * (0.025) + (0)";
			y="1.5 * (0.04) + (0)";
			w="11 * (0.025)";
			h="1 * (0.04)";
		};
		class LinkedLabel: RRP_RscStructuredText
		{
			idc=-1;
			text="Связана:";
			x="0 * (0.025) + (0)";
			y="3 * (0.04) + (0)";
			w="3.5 * (0.025)";
			h="1 * (0.04)";
		};
		class LinkedStatus: RRP_RscStructuredText
		{
			idc=4001;
			x="3.5 * (0.025) + (0)";
			y="3 * (0.04) + (0)";
			w="11 * (0.025)";
			h="1 * (0.04)";
		};
		class AddButton: RRP_btn_noLine
		{
			idc=4002;
			text="ДОБАВИТЬ";
			x="0.5 * (0.025) + (0)";
			y="6 * (0.04) + (0)";
			w="5 * (0.025)";
			h="1 * (0.04)";
			onButtonClick="call RRPClient_groups_polyAddMenu_event_onAddButtonClick;";
		};
		class CancelButton: RRP_btn_noLine
		{
			idc=-1;
			x="9.5 * (0.025) + (0)";
			y="6 * (0.04) + (0)";
			w="5 * (0.025)";
			h="1 * (0.04)";
			text="ОТМЕНА";
			onButtonClick="call RRPClient_groups_polyAddMenu_event_onUnload;";
		};
		class LinesStatus: RscProgress
		{
			idc=4003;
			x="3.5 * (0.025) + (0)";
			y="4.5 * (0.04) + (0)";
			w="11 * (0.025)";
			h="1 * (0.04)";
			colorBar[]={0,0.77999997,0.93000001,0.60000002};
		};
		class LinesLabel: RRP_RscStructuredText
		{
			idc=4004;
			text="Линии:";
			x="0 * (0.025) + (0)";
			y="4.5 * (0.04) + (0)";
			w="3.5 * (0.025)";
			h="1 * (0.04)";
		};
	};
};
class RscTitles
{
	class RscGasMask
	{
		idd=24000;
		duration=999999;
		fadein=1;
		fadeout=1;
		class controls
		{
			class Overlay: RscPicture
			{
				idc=-1;
				x="safezoneX";
				y="safezoneY";
				w="safezoneW";
				h="safezoneH";
				text="\rimas_agent\assets\Exile_GasMask_ca.paa";
			};
		};
	};
	class RscGroupIndicator
	{
		class Controls
		{
			class MiniMap: RscMapControl
			{
				idcMarkerColor=1090;
				idcMarkerIcon=1091;
				onDraw="_this call SmartClient_gui_map_event_onDraw;";
			};
		};
	};
	class RscToastArea
	{
		idd=24034;
		onLoad="uiNamespace setVariable ['RscToastArea', _this select 0];";
		onUnload="uiNamespace setVariable ['RscToastArea', displayNull]";
		duration=999999;
		class controls
		{
		};
	};
	class RscBaguetteArea
	{
		idd=24037;
		duration=9.9999998e+010;
		fadein=0;
		fadeout=0;
		movingEnable=0;
		onLoad="uiNamespace setVariable ['RscBaguetteArea', _this select 0];";
		onUnload="uiNamespace setVariable ['RscBaguetteArea', displayNull]";
		class controls
		{
			class Baguette: RscControlsGroupNoScrollbars
			{
				idc=-1;
				x="-560 / safezoneX * pixelW";
				y="safezoneY + 40 * pixelH";
				w="(60 + 5 + 400) * pixelW";
				h="300 * pixelH";
				class controls
				{
					class TextGroup: RscControlsGroupNoScrollbars
					{
						idc=25000;
						x="50 * pixelW";
						y=0;
						w="365 * pixelW";
						h="60 * pixelH";
						fade=1;
						class controls
						{
							class TextBackground: RscText
							{
								idc=25001;
								x=0;
								y=0;
								w="365 * pixelW";
								h="45 * pixelH";
								colorBackground[]={0.22,0.2,0.23,1};
							};
							class Text: RscText
							{
								idc=25002;
								x="5 * pixelW";
								y=0;
								w="(360 - 5) * pixelW";
								h="45 * pixelH";
								colorText[]={1,1,1,1};
								font="RobotoCondensedBold";
								sizeEx="29 * pixelH";
								shadow=0;
							};
						};
					};
					class SubtextGroup: RscControlsGroupNoScrollbars
					{
						idc=25006;
						x=0;
						y="(45 + 5) * pixelH";
						w="415 * pixelW";
						h="320 * pixelH";
						fade=1;
						class controls
						{
							class Background: RscText
							{
								idc=25007;
								x=0;
								y=0;
								w="520 * pixelW";
								h="120 * pixelH";
								colorBackground[]={0.22,0.2,0.23,1};
							};
							class Stripe: RscText
							{
								idc=25008;
								x=0;
								y=0;
								w="5 * pixelW";
								h="60 * pixelH";
								colorBackground[]=
								{
									"199/255",
									"38/255",
									"81/255",
									1
								};
							};
							class SubText: RscStructuredText
							{
								idc=25009;
								text="<t size='22' font='RobotoCondensedBold'>Title!</t><br/><t color='#ff979ba1' size='19' font='RobotoCondensed'>Second message</t>";
								x="10 * pixelW";
								y=0;
								w="410 * pixelW";
								h="60 * pixelH";
								size="1 * pixelH";
								shadow=0;
								colorBackground[]={0,0,0,0};
								class Attributes
								{
									shadow=0;
								};
							};
						};
					};
					class IconGroup: RscControlsGroupNoScrollbars
					{
						idc=25003;
						x=0;
						y=0;
						w="45 * pixelW";
						h="45 * pixelH";
						fade=1;
						class controls
						{
							class IconBackground: RscText
							{
								idc=25004;
								x=0;
								y=0;
								w="45 * pixelW";
								h="45 * pixelH";
								colorBackground[]={0.22,0.2,0.23,1};
							};
							class Icon: RscPictureKeepAspect
							{
								idc=25005;
								text="\rimas_agent\assets\icon_mod.paa";
								x=0;
								y=0;
								w="45 * pixelW";
								h="45 * pixelH";
							};
						};
					};
				};
			};
		};
	};
	class RscBaguetteExtArea
	{
		idd=24036;
		duration=9.9999998e+010;
		fadein=0;
		fadeout=0;
		movingEnable=0;
		onLoad="uiNamespace setVariable ['RscBaguetteExtArea', _this select 0];";
		onUnload="uiNamespace setVariable ['RscBaguetteExtArea', displayNull]";
		class controls
		{
			class Baguette: RscControlsGroupNoScrollbars
			{
				idc=-1;
				x="safezoneX + 10 * pixelW";
				y="safezoneY + 10 * pixelH";
				w="(60 + 5 + 400) * pixelW";
				h="300 * pixelH";
				class controls
				{
					class TextGroup: RscControlsGroupNoScrollbars
					{
						idc=25000;
						x="50 * pixelW";
						y=0;
						w="365 * pixelW";
						h="60 * pixelH";
						fade=1;
						class controls
						{
							class TextBackground: RscText
							{
								idc=25001;
								x=0;
								y=0;
								w="365 * pixelW";
								h="45 * pixelH";
								colorBackground[]={0.25999999,0.23999999,0.31,1};
							};
							class Text: RscText
							{
								idc=25002;
								x="5 * pixelW";
								y=0;
								w="(360 - 5) * pixelW";
								h="45 * pixelH";
								colorText[]={1,1,1,1};
								font="RobotoCondensedBold";
								sizeEx="29 * pixelH";
								shadow=0;
							};
						};
					};
					class SubtextGroup: RscControlsGroupNoScrollbars
					{
						idc=25006;
						x=0;
						y="(45 + 5) * pixelH";
						w="415 * pixelW";
						h="320 * pixelH";
						fade=1;
						class controls
						{
							class Background: RscText
							{
								idc=25007;
								x=0;
								y=0;
								w="520 * pixelW";
								h="120 * pixelH";
								colorBackground[]={0.25999999,0.23999999,0.31,1};
							};
							class Stripe: RscText
							{
								idc=25008;
								x=0;
								y=0;
								w="5 * pixelW";
								h="60 * pixelH";
								colorBackground[]=
								{
									"199/255",
									"38/255",
									"81/255",
									1
								};
							};
							class SubText: RscStructuredText
							{
								idc=25009;
								text="<t color='#ff979ba1' size='19' font='RobotoCondensed'>Second message</t>";
								x="10 * pixelW";
								y=0;
								w="410 * pixelW";
								h="60 * pixelH";
								size="1 * pixelH";
								shadow=0;
								colorBackground[]={0,0,0,0};
								class Attributes
								{
									shadow=0;
								};
							};
						};
					};
					class IconGroup: RscControlsGroupNoScrollbars
					{
						idc=25003;
						x=0;
						y=0;
						w="45 * pixelW";
						h="45 * pixelH";
						fade=1;
						class controls
						{
							class IconBackground: RscText
							{
								idc=25004;
								x=0;
								y=0;
								w="45 * pixelW";
								h="45 * pixelH";
								colorBackground[]={0.25999999,0.23999999,0.31,1};
							};
							class Icon: RscPictureKeepAspect
							{
								idc=25005;
								text="\rimas_agent\assets\icon_mod.paa";
								x=0;
								y=0;
								w="45 * pixelW";
								h="45 * pixelH";
							};
						};
					};
				};
			};
		};
	};
};
class RscCustomInfoMiniMap
{
	class controls
	{
		class MiniMap: RscControlsGroupNoScrollbars
		{
			class Controls
			{
				class CA_MiniMap: RscMapControl
				{
					idcMarkerColor=1090;
					idcMarkerIcon=1091;
					onDraw="_this call SmartClient_gui_map_event_onDraw;";
				};
			};
		};
	};
};
class RscMiniMap
{
	class controlsBackground
	{
		class MiniMap: RscControlsGroupNoScrollbars
		{
			class Controls
			{
				class CA_MiniMap: RscMapControl
				{
					idcMarkerColor=1090;
					idcMarkerIcon=1091;
					onDraw="_this call SmartClient_gui_map_event_onDraw;";
				};
			};
		};
	};
};
class RscDisplayMainMap
{
	class controlsBackground
	{
		delete Map;
		class CA_Map: RscMapControl
		{
			idcMarkerColor=1090;
			idcMarkerIcon=1091;
			onDraw="_this call SmartClient_gui_map_event_onDraw; _this call SmartClient_gui_toaster_thread; _this call RRPClient_zones_drawMap";
			onMouseButtonUp="_this call SmartClient_gui_map_event_onMouseButtonUp";
			onMouseButtonDown="_this call SmartClient_gui_map_event_onMouseButtonDown;_this call fnc_MouseButtonDown;";
		};
	};
	class controls
	{
		delete DiaryIndex;
		delete DiaryAdd;
		delete DiarySort;
		delete DiaryFilter;
		delete Diary;
		class MarkerMenu: RscMapCreateMenu
		{
			show=0;
		};
		class PolyMenu: RscMapCreatePoly
		{
			show=0;
		};
	};
	class objects
	{
		delete Watch;
		delete GPS;
		delete WalkieTalkie;
	};
};
class CfgActions
{
	class None;
	class OpenBag: None
	{
		show=0;
	};
	class ListRightVehicleDisplay: None
	{
		show=0;
	};
	class ListLeftVehicleDisplay: None
	{
		show=0;
	};
	class ListPrevRightVehicleDisplay: None
	{
		show=0;
	};
	class ListPrevLeftVehicleDisplay: None
	{
		show=0;
	};
	class CloseRightVehicleDisplay: None
	{
		show=0;
	};
	class CloseLeftVehicleDisplay: None
	{
		show=0;
	};
	class NextModeRightVehicleDisplay: None
	{
		show=0;
	};
	class NextModeLeftVehicleDisplay: None
	{
		show=0;
	};
	class TakeBag: None
	{
		show=0;
	};
	class TakeItem: None
	{
		show=0;
	};
	class TakeWeapon: None
	{
		show=0;
	};
	class TakeMagazine: None
	{
		show=0;
	};
	class TakeItemFromBody: None
	{
		show=0;
	};
	class TakeWeaponFromBody: None
	{
		show=0;
	};
	class TakeBackpackFromBody: None
	{
		show=0;
	};
	class TakeMine: None
	{
		show=0;
	};
};
class CfgInGameUI
{
	class Cursor
	{
		customMark="\rimas_agent\assets\logo\customMark_ca.paa";
		customMarkColor[]={0.91000003,0.91000003,0.91000003,0.55000001};
	};
	class Actions
	{
		align="0x00 + 0x08";
		shadow=0;
		x="(safeZoneX + safeZoneW * 0.5)";
		y="(safeZoneY + safeZoneH * 0.6)";
		w="300 * pixelW";
		font="PuristaMedium";
		size="18 * pixelH";
		rows="5*SafeZoneH";
		arrowWidth=0.015;
		arrowHeight=0.02;
		iconArrowUp="\A3\ui_f\data\igui\cfg\actions\arrow_up_gs.paa";
		iconArrowDown="\A3\ui_f\data\igui\cfg\actions\arrow_down_gs.paa";
		background="\A3\ui_f\data\igui\cfg\imageCornerElement_ca.paa";
		underlineSelected=0;
		colorBackground[]=
		{
			"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])",
			"(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])",
			"(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])",
			"(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"
		};
		colorText[]=
		{
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"
		};
		colorSelect[]=
		{
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"
		};
		colorBackgroundSelected[]=
		{
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",
			0.60000002
		};
	};
	class DefaultAction
	{
		font="PuristaMedium";
		size="18 * pixelH";
		colorText[]=
		{
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"
		};
		shadow=2;
		showHint=0;
		showNext=0;
		showLine=0;
		relativeToCursor=1;
		offsetX=0;
		offsetY=0.045000002;
		hotspotX=0;
		hotspotY=0;
		textTipFade=0.40000001;
		textTipDelay=0.40000001;
	};
	class CommandBar
	{
		left=-1;
		top=-1;
		show=0;
	};
};
class RscDisplayInventory
{
	scriptName="RscDisplayInventory";
	scriptPath="IGUI";
	onLoad="[""onLoad"",_this,""RscDisplayInventory"",'IGUI'] call  (uinamespace getvariable 'BIS_fnc_initDisplay')";
	onUnload="[""onUnload"",_this,""RscDisplayInventory"",'IGUI'] call  (uinamespace getvariable 'BIS_fnc_initDisplay')";
	idd=602;
	enableSimulation=1;
	class Colors
	{
		dragValidBgr[]=
		{
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",
			0.5
		};
		dragInvalidBgr[]=
		{
			"(profilenamespace getvariable ['IGUI_ERROR_RGB_R',0.8])",
			"(profilenamespace getvariable ['IGUI_ERROR_RGB_G',0.0])",
			"(profilenamespace getvariable ['IGUI_ERROR_RGB_B',0.0])",
			0.5
		};
		dragValidBar[]=
		{
			"(profilenamespace getvariable ['IGUI_WARNING_RGB_R',0.8])",
			"(profilenamespace getvariable ['IGUI_WARNING_RGB_G',0.5])",
			"(profilenamespace getvariable ['IGUI_WARNING_RGB_B',0.0])",
			0.5
		};
		dragInvalidBar[]=
		{
			"(profilenamespace getvariable ['IGUI_ERROR_RGB_R',0.8])",
			"(profilenamespace getvariable ['IGUI_ERROR_RGB_G',0.0])",
			"(profilenamespace getvariable ['IGUI_ERROR_RGB_B',0.0])",
			0.5
		};
		progressBar[]=
		{
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",
			1
		};
		progressBarBgr[]=
		{
			"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])",
			"(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])",
			"(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])",
			0.75
		};
		highlight[]=
		{
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",
			0.5
		};
	};
	class controlsBackground
	{
	};
	class controls
	{
		delete Background;
		delete Title;
		delete ButtonOK;
		delete ButtonCancel;
		class CA_ContainerBackground: RscText
		{
			idc=1001;
			x="1 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="12 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="23 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[]={0.050000001,0.050000001,0.050000001,0.69999999};
		};
		class CA_PlayerBackground: RscText
		{
			idc=1002;
			x="14.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="24.4 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="22 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[]={0.050000001,0.050000001,0.050000001,0.69999999};
		};
		class TitleBackground: RscText
		{
			idc=1020;
			x="14.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="24.4 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[]={0.1,0.1,0.1,1};
		};
		class PlayersName: RscText
		{
			idc=111;
			text="$STR_DIARY_PLAYER_NAME";
			x="15.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="19.8 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class RankBackground: RscText
		{
			idc=1014;
			x="15.1 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="1.25 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="0.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="0.6 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[]={1,1,1,0.2};
		};
		class RankPicture: RscPicture
		{
			idc=1203;
			text="\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";
			x="15.1 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="1.25 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="0.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="0.6 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ButtonBack: RscActiveText
		{
			idc=2;
			style=48;
			color[]={1,1,1,0.69999999};
			text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
			x="38 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="1 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={1,1,1,0.69999999};
			colorActive[]={1,1,1,1};
			tooltip="$STR_DISP_CLOSE";
		};
		class BackgroundSlotPrimary: RscPicture
		{
			idc=1242;
			x="26.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="6 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="11.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="3 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotPrimaryMuzzle: BackgroundSlotPrimary
		{
			idc=1243;
			x="26.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="9.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="1.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotPrimaryUnderBarrel: BackgroundSlotPrimary
		{
			idc=1200;
			x="28.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="9.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="1.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotPrimaryFlashlight: BackgroundSlotPrimary
		{
			idc=1244;
			x="30.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="9.2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="1.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotPrimaryOptics: BackgroundSlotPrimary
		{
			idc=1245;
			x="32.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="9.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="1.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotPrimaryMagazineGL: BackgroundSlotPrimary
		{
			idc=1267;
			x="34.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="9.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="1.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotPrimaryMagazine: BackgroundSlotPrimary
		{
			idc=1246;
			x="36.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="9.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="1.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotSecondary: BackgroundSlotPrimary
		{
			idc=1247;
			x="26.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="11.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="11.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="3 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotSecondaryMuzzle: BackgroundSlotPrimary
		{
			idc=1248;
			x="26.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="14.6 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotSecondaryUnderBarrel: BackgroundSlotPrimary
		{
			idc=1266;
			x="29 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="14.6 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotSecondaryFlashlight: BackgroundSlotPrimary
		{
			idc=1249;
			x="31.4 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="14.6 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotSecondaryOptics: BackgroundSlotPrimary
		{
			idc=1250;
			x="33.8 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="14.6 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotSecondaryMagazine: BackgroundSlotPrimary
		{
			idc=1251;
			x="36.2 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="14.6 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotHandgun: BackgroundSlotPrimary
		{
			idc=1252;
			x="26.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="17 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="11.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="3 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotHandgunMuzzle: BackgroundSlotPrimary
		{
			idc=1253;
			x="26.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="20.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotHandgunUnderBarrel: BackgroundSlotPrimary
		{
			idc=1268;
			x="29 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="20.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotHandgunFlashlight: BackgroundSlotPrimary
		{
			idc=1254;
			x="31.4 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="20.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotHandgunOptics: BackgroundSlotPrimary
		{
			idc=1255;
			x="33.8 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="20.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotHandgunMagazine: BackgroundSlotPrimary
		{
			idc=1256;
			x="36.2 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="20.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotHeadgear: BackgroundSlotPrimary
		{
			idc=1257;
			x="26.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="2.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2.9 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotGoggles: BackgroundSlotPrimary
		{
			idc=1258;
			x="29.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="2.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2.9 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotHMD: BackgroundSlotPrimary
		{
			idc=1259;
			x="32.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="2.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2.9 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotBinoculars: BackgroundSlotPrimary
		{
			idc=1260;
			x="35.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="2.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2.9 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotMap: BackgroundSlotPrimary
		{
			idc=1261;
			x="15.1 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="20.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.12 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotGPS: BackgroundSlotPrimary
		{
			idc=1262;
			x="17.32 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="20.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.12 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotCompass: BackgroundSlotPrimary
		{
			idc=1263;
			x="21.76 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="20.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.12 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotRadio: BackgroundSlotPrimary
		{
			idc=1264;
			x="19.54 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="20.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.12 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackgroundSlotWatch: BackgroundSlotPrimary
		{
			idc=1265;
			x="23.98 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="20.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.12 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ExternalContainerBackground: RscPicture
		{
			colorText[]={1,1,1,0.1};
			idc=1240;
			x="1.5 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="3.7 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="11 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="18.4 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class PlayerContainerBackground: ExternalContainerBackground
		{
			idc=1241;
			x="15.1 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="6 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="11 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="14 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class GroundTab: RscActiveText
		{
			idc=6321;
			colorBackgroundSelected[]={1,1,1,1};
			colorFocused[]={1,1,1,0};
			soundDoubleClick[]=
			{
				"",
				0.1,
				1
			};
			color[]={1,1,1,1};
			colorBackground[]={0,0,0,1};
			x="1.5 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="1.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="5.5 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class SoldierTab: GroundTab
		{
			idc=6401;
			x="7 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="1.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="5.5 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class GroundContainer: RscListBox
		{
			class DLCTemplate: RscDisplayInventory_DLCTemplate
			{
				class Controls;
			};
			idc=632;
			sizeEx="0.8 *    (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx2="0.8 *    (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			rowHeight="2 *    (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			canDrag=1;
			colorText[]={1,1,1,1};
			colorBackground[]={0,0,0,0};
			itemBackground[]={1,1,1,0.1};
			itemSpacing=0.001;
			x="1.5 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="3.7 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="11 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="18.4 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class SoldierContainer: GroundContainer
		{
			idc=640;
		};
		class GroundFilter: RscCombo
		{
			idc=6554;
			x="1.5 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="2.6 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="11 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class GroundLoad: RscProgress
		{
			idc=6307;
			texture="";
			textureExt="";
			colorBar[]={0.89999998,0.89999998,0.89999998,0.89999998};
			colorExtBar[]={1,1,1,1};
			colorFrame[]={1,1,1,1};
			x="1.5 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="22.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="11 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class SlotPrimary: GroundTab
		{
			class DLCTemplate: RscDisplayInventory_DLCTemplate
			{
				class Controls;
			};
			idc=610;
			style="0x30 + 0x800";
			color[]={1,1,1,1};
			colorBackground[]={1,1,1,0.1};
			colorBackgroundSelected[]={1,1,1,0.1};
			colorFocused[]={0,0,0,0};
			canDrag=1;
			x="26.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="6 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="11.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="3 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
			onMouseButtonDblClick="_this call RRPClient_system_itemUse";
		};
		class SlotPrimaryMuzzle: SlotPrimary
		{
			idc=620;
			x="26.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="9.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="1.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotPrimaryUnderBarrel: SlotPrimary
		{
			idc=641;
			x="28.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="9.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="1.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotPrimaryFlashlight: SlotPrimary
		{
			idc=622;
			x="30.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="9.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="1.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotPrimaryOptics: SlotPrimary
		{
			idc=621;
			x="32.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="9.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="1.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotPrimaryMagazineGL: SlotPrimary
		{
			idc=644;
			x="34.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="9.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="1.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotPrimaryMagazine: SlotPrimary
		{
			idc=623;
			x="36.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="9.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="1.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotSecondary: SlotPrimary
		{
			idc=611;
			x="26.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="11.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="11.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="3 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotSecondaryMuzzle: SlotPrimary
		{
			idc=624;
			x="26.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="14.6 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotSecondaryUnderBarrel: SlotPrimary
		{
			idc=642;
			x="29 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="14.59 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotSecondaryFlashlight: SlotPrimary
		{
			idc=626;
			x="31.4 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="14.6 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotSecondaryOptics: SlotPrimary
		{
			idc=625;
			x="33.8 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="14.6 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotSecondaryMagazine: SlotPrimary
		{
			idc=627;
			x="36.2 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="14.6 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotHandgun: SlotPrimary
		{
			idc=612;
			x="26.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="17 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="11.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="3 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotHandgunMuzzle: SlotPrimary
		{
			idc=628;
			x="26.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="20.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotHandgunUnderBarrel: SlotPrimary
		{
			idc=643;
			x="29 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="20.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotHandgunFlashlight: SlotPrimary
		{
			idc=630;
			x="31.4 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="20.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotHandgunOptics: SlotPrimary
		{
			idc=629;
			x="33.8 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="20.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotHandgunMagazine: SlotPrimary
		{
			idc=631;
			x="36.2 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="20.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotHeadgear: SlotPrimary
		{
			idc=6240;
			x="26.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="2.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2.9 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotGoggles: SlotPrimary
		{
			idc=6216;
			x="29.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="2.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2.9 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotHMD: SlotPrimary
		{
			idc=6217;
			x="32.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="2.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2.9 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotBinoculars: SlotPrimary
		{
			idc=6238;
			x="35.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="2.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2.9 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2.9 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotMap: SlotPrimary
		{
			idc=6211;
			x="15.16 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="20.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotGPS: SlotPrimary
		{
			idc=6215;
			x="17.38 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="20.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotCompass: SlotPrimary
		{
			idc=6212;
			x="21.82 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="20.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotRadio: SlotPrimary
		{
			idc=6214;
			x="19.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="20.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class SlotWatch: SlotPrimary
		{
			idc=6213;
			x="24.04 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="20.1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="2 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class UniformTab: GroundTab
		{
			idc=6332;
			x="15.1 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="2.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="3.5 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="3 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[]={1,1,1,0.5};
		};
		class UniformSlot: SlotPrimary
		{
			idc=6331;
			x="15.35 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="2.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="3 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class UniformLoad: GroundLoad
		{
			idc=6304;
			x="15.1 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="5.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="3.5 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="0.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class UniformContainer: GroundContainer
		{
			idc=633;
			x="15.1 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="6 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="11 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="14 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onLBDblClick="_this call RRPClient_system_itemUse";
		};
		class VestTab: UniformTab
		{
			idc=6382;
			x="18.85 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="2.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="3.5 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="3 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class VestSlot: SlotPrimary
		{
			idc=6381;
			x="19.1 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="2.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="3 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class VestLoad: GroundLoad
		{
			idc=6305;
			x="18.85 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="5.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="3.5 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="0.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class VestContainer: UniformContainer
		{
			idc=638;
			onLBDblClick="_this call RRPClient_system_itemUse";
		};
		class BackpackTab: UniformTab
		{
			idc=6192;
			x="22.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="2.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="3.5 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="3 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackpackSlot: SlotPrimary
		{
			idc=6191;
			x="22.85 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="2.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="3 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="3 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[]={0,0,0,0.5};
		};
		class BackpackLoad: GroundLoad
		{
			idc=6306;
			x="22.6 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="5.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="3.5 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="0.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class BackpackContainer: UniformContainer
		{
			idc=619;
			onLBDblClick="_this call RRPClient_system_itemUse";
		};
		class TotalLoad: GroundLoad
		{
			idc=6308;
			x="15.1 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="22.5 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="23.4 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ContainerMarker: GroundTab
		{
			idc=6325;
			x="0 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="24 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="1 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class GroundMarker: ContainerMarker
		{
			idc=6385;
			x="1.5 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="24 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="1 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class SoldierMarker: ContainerMarker
		{
			idc=6405;
			x="3 *      (   ((safezoneW / safezoneH) min 1.2) / 40) +   (safezoneX + (safezoneW -      ((safezoneW / safezoneH) min 1.2))/2)";
			y="24 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +   (safezoneY + (safezoneH -      (   ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="1 *      (   ((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 *      (   (   ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayStart: RscStandardDisplay
{
	idd=104;
	class controlsBackground
	{
		class Black: RscText
		{
			colorBackground[]={0,0,0,1};
			x="safezoneXAbs";
			y="safezoneY";
			w="safezoneWAbs";
			h="safezoneH";
		};
		delete Map;
		delete CA_Vignette;
		delete Noise;
	};
	class controls
	{
		delete Text;
		delete Progress;
		delete Progress2;
		class LoadingStart: RscControlsGroup
		{
			class controls
			{
				class Logo: RscPictureKeepAspect
				{
					text="\rimas_agent\assets\logo.paa";
					x="0.33375 * safezoneW";
					y="0.29 * safezoneH";
					w="0.3325 * safezoneW";
					h="0.39375 * safezoneH";
					onLoad="";
				};
			};
		};
	};
};
class CfgCloudlets
{
	class Default;
	class WaterSplashAir;
	class WaterSplashEXT: WaterSplashAir
	{
		circleVelocity[]={0,0,10};
		moveVelocity[]={0,0,10};
		MoveVelocityVar[]={"0","3","8"};
		size[]={1,16};
	};
	class Snow_Close: Default
	{
		destroyOnWaterSurface=1;
		destroyOnWaterSurfaceOffset=0;
		onSurface=0;
		keepOnSurface=0;
		surfaceOffset=0;
		bounceOnSurface=-1;
		bounceOnSurfaceVar=0;
		postEffects="";
		particleEffects="";
		blockAIVisibility=0;
		emissiveColor[]=
		{
			{2,2,2,0}
		};
		particleType="Billboard";
		particleShape="\rimas_agent\assets\snow\Snow";
		particleFSFrameCount=1;
		particleFSIndex=0;
		particleFSLoop=0;
		particleFSNtieth=3;
		circleRadius=5;
		circleVelocity[]={0,0,0};
		angle=0;
		angleVar=360;
		animationSpeedCoef=1;
		animationSpeed[]={1};
		animationName="";
		color[]=
		{
			{2,2,2,0},
			{2,2,2,2},
			{2,2,2,2},
			{2,2,2,2},
			{2,2,2,2},
			{2,2,2,2},
			{2,2,2,2},
			{2,2,2,0}
		};
		colorCoef[]={1,1,1,1};
		colorVar[]={0,0,0,0};
		interval=0.0099999998;
		lifeTime=6;
		lifeTimeVar=1;
		timerPeriod=30;
		onTimerScript="";
		beforeDestroyScript="";
		moveVelocity[]={0,0,-0.30000001};
		moveVelocityVar[]={0,0,0.1};
		moveVelocityVarConst[]={0,0,0};
		position[]={0,0,0};
		positionVar[]={5,5,0};
		positionVarConst[]={0,0,0};
		rotationVelocity=2;
		rotationVelocityVar=2;
		size[]={1};
		sizeCoef=1;
		sizeVar=0.5;
		weight=1;
		volume=0.75;
		rubbing=0.050000001;
		randomDirectionIntensity=0;
		randomDirectionIntensityVar=0;
		randomDirectionPeriod=0;
		randomDirectionPeriodVar=0;
	};
	class Snow_Near: Snow_Close
	{
		particleFSIndex=0;
		positionVar[]={6,6,0};
		lifeTime=7;
	};
	class Snow_Far: Snow_Close
	{
		particleFSIndex=2;
		positionVar[]={7,7,0};
		lifeTime=8;
	};
	class RH_RifleSmokeTrail: Default
	{
		interval=0.0049999999;
		circleRadius=0;
		circleVelocity[]={0,0,0};
		particleShape="\A3\data_f\ParticleEffects\Universal\Refract";
		particleFSNtieth=1;
		particleFSIndex=0;
		particleFSFrameCount=1;
		particleFSLoop=0;
		angleVar=0.5;
		animationName="";
		particleType="Billboard";
		timerPeriod=1.1;
		lifeTime=2.5;
		moveVelocity[]=
		{
			"-0.15*directionX",
			"-0.15*directionY",
			"-0.15*directionZ"
		};
		rotationVelocity=1;
		weight=0.050000001;
		volume=0.5;
		rubbing=0.1;
		size[]={0.30000001,0.5};
		color[]=
		{
			{1,0,0,0.69999999}
		};
		colorCoef[]={1,0,0,1};
		animationSpeed[]={2,1};
		randomDirectionPeriod=0.1;
		randomDirectionIntensity=0.079999998;
		onTimerScript="";
		beforeDestroyScript="";
		destroyOnWaterSurface=1;
		blockAIVisibility=0;
		sizeCoef=0.1;
		animationSpeedCoef=1;
		position[]=
		{
			"positionX",
			"positionY",
			"positionZ"
		};
		lifeTimeVar=0;
		positionVar[]={0,0,0};
		MoveVelocityVar[]={0.029999999,0.029999999,0.029999999};
		rotationVelocityVar=20;
		sizeVar=0;
		colorVar[]={0,0,0,0};
		randomDirectionPeriodVar=0;
		randomDirectionIntensityVar=0;
	};
};
class ComplexEffect
{
	class RH_RifleSmokeTrail
	{
		simulation="particles";
		type="RH_RifleSmokeTrail";
		position[]={0,0,0};
		intensity=1;
		interval=1;
		lifeTime=0.050000001;
	};
};
class CfgAmmo
{
	class BulletBase;
	class B_Test_Caseless: BulletBase
	{
		hit=0;
		indirectHit=0;
		indirectHitRange=0;
		cartridge="FxCartridge_65_caseless";
		visibleFire=5;
		audibleFire=8;
		cost=1.2;
		airLock=1;
		typicalSpeed=820;
		caliber=0;
		TimeToLive=0;
		model="\A3\Weapons_f\Data\bullettracer\tracer_red";
		tracerScale=1;
		tracerStartTime=0.050000001;
		tracerEndTime=1;
		airFriction=-0.00095999998;
		class CamShakeFire
		{
			power=0;
			duration=0;
			frequency=0;
			distance=0;
		};
		class CamShakePlayerFire
		{
			power=0;
			duration=0;
			frequency=0;
			distance=0;
		};
	};
};
class Mode_SemiAuto;
class SlotInfo;
class CfgWeapons
{
	class Pistol;
	class Pistol_Base_F: Pistol
	{
		class GunParticles;
		class WeaponSlotsInfo;
	};
	class rrp_spray: Pistol_Base_F
	{
		class GunParticles: GunParticles
		{
			class SecondEffect
			{
				positionName="Nabojnicestart";
				directionName="Nabojniceend";
				effectName="RH_RifleSmokeTrail";
			};
		};
		scope=2;
		author="Cake";
		displayName="Spray Can";
		picture="\rimas_agent\assets\graffiti\data\icon.paa";
		descriptionShort="Spray Can";
		model="\rimas_agent\assets\graffiti\spray.p3d";
		magazines[]=
		{
			"default_paint"
		};
		modes[]=
		{
			"Single"
		};
		cursor="EmptyCursor";
		cursorAim="EmptyCursor";
		caseless[]=
		{
			"",
			1,
			1,
			1
		};
		soundBullet[]=
		{
			"caseless",
			1
		};
		class Single: Mode_SemiAuto
		{
			sounds[]=
			{
				"StandardSound"
			};
			class StandardSound
			{
				weaponSoundEffect="";
				soundBegin[]=
				{
					"begin1",
					0
				};
				begin1[]=
				{
					"rimas_agent\sounds\spray.ogg",
					1,
					1,
					1200
				};
			};
			reloadTime=0.075000003;
			recoil="recoil_single_Test_rifle_01";
			recoilProne="recoil_single_prone_Test_rifle_01";
			dispersion=0.001;
			minRange=2;
			minRangeProbab=0.30000001;
			midRange=250;
			midRangeProbab=0.69999999;
			maxRange=400;
			maxRangeProbab=0.050000001;
		};
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: SlotInfo
			{
				linkProxy="\A3\data_f\proxies\weapon_slots\MUZZLE";
				compatibleItems[]={};
			};
			holsterScale=0;
			mass=77;
			class CowsSlot
			{
			};
		};
	};
};
