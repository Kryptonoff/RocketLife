/*
  Project: Rimas Role Play
  Author: FairyTale5571
  License: CC BY-ND
*/

{
    private _trigger = createTrigger["EmptyDetector", getPosWorld _x, false];
    _trigger setTriggerArea[0.477, 0.491, getDir _x, true, 1.5];
    _trigger setTriggerActivation["ANYPLAYER", "PRESENT", true];
    _trigger setTriggerStatements["(player in thislist AND isNull objectParent player)", "[player,nearestObject[player,""init_studio_metal_detector""]] spawn RRPClient_md_mdetecttrigger;", ""];
}
forEach detectorsTriggers;
