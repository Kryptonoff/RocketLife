#ifndef COMMON_DEFINES
#define COMMON_DEFINES

#define MAX_LIVES 3
#define UFO_DESCEND_TIME 11
#define UFO_RAMP_TIME 2.4


// ----- hideAlienSprite

#define OLD_SPRITE_FADE_TIME 0

// ----- setUserInterface

#define DIK_LEFT 203
#define DIK_RIGHT 205
#define DIK_A 30 
#define DIK_D 32
#define DIK_SPACE 57
#define DIK_RETURN 28
#define DIK_NUMPADENTER 156

// ----- gameLoop

#define SIMULATION_FRAME_TIME 0.2
#define MAX_ESCALATION_TIME 300

// ----- updateScore

#define ESCALATION_SCORE1 5
#define ESCALATION_SCORE2 10
#define ESCALATION_SCORE3 30
#define ESCALATION_SCORE4 60

// ----- playCachEffect

#define ZAP_EFFECT_TIME 0.1

// ----- getter, setter and indexes for UI

#define UIGetVal(INDEX) (AlienInvasion getVariable "UI" select INDEX)
#define UISetVal(INDEX, VAL) (AlienInvasion getVariable "UI" set [INDEX, VAL])

#define UIInterfaceSize 0
#define UIGameDisplay 1
#define UIGontrolsGroup 2
#define UICatcherScoreCtrl 3
#define UICatcherLivesCtrl 4
#define UIBGCtrl 5
#define UIUFOCtrl 6
#define UIUFORampCtrl 7
#define UICatcherCtrl 8
#define UIZapEffectCtrl 9
#define UIFailEffectCtrl 10 
#define UIGameOverCtrl 11
#define UICatcherScoreNumber1Ctrl 12
#define UICatcherScoreNumber2Ctrl 13
#define UICatcherScoreNumber3Ctrl 14
#define UICatcherLivesNumber1Ctrl 15
#define UICatcherLivesNumber2Ctrl 16

// ----- getter, setter and indexes for Simulation

#define SIMGetVal(INDEX) (AlienInvasion getVariable "Simulation" select INDEX)
#define SIMSetVal(INDEX, VAL) (AlienInvasion getVariable "Simulation" set [INDEX, VAL])

#define SIMRunning 0
#define SIMSimulationTime 2
#define SIMMaxAliens 4
#define SIMStartTime 5


// ----- getter, setter and indexes for Catcher

#define CatcherGetVal(INDEX) (AlienInvasion getVariable "Catcher" select INDEX)
#define CatcherSetVal(INDEX, VAL) (AlienInvasion getVariable "Catcher" set [INDEX, VAL])

#endif