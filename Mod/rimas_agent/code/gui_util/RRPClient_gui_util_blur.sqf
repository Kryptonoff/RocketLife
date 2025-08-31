/*
	Project: Rimas Role Play
*/

if (_this) then
{
	PostProcessingBackgroundBlur ppEffectAdjust [2];
	PostProcessingBackgroundBlur ppEffectEnable true;
	PostProcessingBackgroundBlur ppEffectCommit 1;
}
else 
{
	PostProcessingBackgroundBlur ppEffectAdjust [0];
	PostProcessingBackgroundBlur ppEffectCommit 0;
	PostProcessingBackgroundBlur ppEffectEnable false;
};
true